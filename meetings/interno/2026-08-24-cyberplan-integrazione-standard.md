---
date: 2026-08-24
client: interno
project: Cyberplan integrazione standard
attendees: [Gabriele Colombo, Emilio Bendotti, Alberto Spiller]
themes: [cyberplan-integrazione]
related_meetings: [meetings/danieli/2026-08-20-allineamento-roadmap-awm.md]
---

## Sintesi

Meeting tecnico interno su due argomenti: (1) debug e risoluzione dei problemi di autenticazione/endpoint sulle API Cyberplan per un contatto esterno, e (2) analisi approfondita del concetto di Horizon di Cyberplan e del suo impatto sui flussi di import in AVM. Per il punto 2, la sessione si è conclusa con una decisione tecnica chiara: unificare i due flussi di import (macchine e gruppi/CDL) in un unico loader, con logica di discriminazione basata sulla presenza del codice macchina o della numerosità.

## Argomenti trattati

### 1. Debug autenticazione API Cyberplan (~00:00–00:21)
- Il tenant era stato migrato da "Butrio" a "Cyberplan": gli username erano stati rinominati di conseguenza (formato: `ext_cyberplan_*`) e chi stava testando usava ancora i vecchi
- Il meccanismo di autenticazione corretto è Basic Auth con username e password nel body JSON (non nell'header Authorization)
- Alcuni endpoint (machine_calendars connector) non erano stati abilitati nel tenant — problema legato a una configurazione precedente incompleta da parte di Franco, non revisionata prima delle ferie
- Risoluzione: abilitati gli endpoint, chiarito il meccanismo di auth. Già usato su Franke Poland senza problemi

### 2. Horizon di Cyberplan — analisi e impatto su AVM (~00:21–01:14)

**Cos'è l'Horizon:**
- Setting configurabile a livello di istanza (globale) o per singolo CDL (Centro di Lavoro)
- FCS (Finite Capacity Scheduling): schedulazione a livello di macchina specifica, orizonte ~2 settimane max
- FCP: schedulazione a livello di CDL, potenzialmente a capacità infinita
- Quando un CDL ha un Horizon: entro l'orizzonte, Cyberplan passa i codici macchina specifici; oltre l'orizzonte, passa solo "numero di macchine da attivare" per quel CDL
- Se impostato sia globale che per CDL, vince il valore più specifico (CDL)
- ~10-20% dei clienti Cyberplan usa l'Horizon a livello CDL; secondo Marco di Cyberplan questi rappresentano ~50% dei progetti target per AVM

**Il problema tecnico:**
- AWM gestisce oggi due flussi di import separati: flusso macchine (→ task) e flusso gruppi/CDL (→ CDL con numerosità)
- Con l'Horizon per CDL, uno stesso CDL può cambiare modalità nel tempo (breve termine = macchine specifiche, lungo termine = numerosità), rendendo i due flussi separati incompatibili: il secondo import cancellerebbe i dati scritti dal primo

**Decisione tecnica:**
- Nessuna modifica richiesta a Cyberplan: continueranno a inviare i due flussi separati
- AWM unifica i due flussi in un **loader unico**: dato in ingresso discriminato da presenza/assenza del codice macchina
  - Presenza codice macchina → mappa su task
  - Presenza numerosità (senza macchina specifica) → mappa su CDL
- Cancellazione: logica basata su task/CDL "in scope" dell'import (quelli inclusi nel payload), non cancellazione totale — evita il problema dei flussi sovrapposti

**Logica di attivazione task per i gruppi:**
- CDL omogenei (regola Cyberplan): se non sono indicate macchine specifiche, tutte le macchine del CDL sono equivalenti
- Regola di attivazione: si attivano i primi N task in ordine di layout (N = numerosità indicata da Cyberplan)
- Eccesso di numerosità oltre il numero di task configurati → va sulla numerosità del primo task
- Caso "solo gruppo" (CDL con 1 task in AVM): la numerosità del gruppo aumenta sempre la numerosità di quell'unico task

**Caso misto (Horizon per CDL, breve vs. lungo termine):**
- Breve termine (FCS): arrivano codici macchina specifici → loader mappa su task
- Lungo termine (FCP): arriva solo numerosità → loader mappa su CDL, attiva i primi N task
- Vincolo: lo stesso gruppo Cyberplan non può mappare su CDL diversi in AVM che ragionano in modi incompatibili (uno a macchina, uno a gruppo)

**Caso non gestito (scelta consapevole):** mix tra macchine specifiche e gruppo all'interno dello stesso CDL in periodi diversi dell'anno (scenario ritenuto raro e logicamente non supportato neanche da Cyberplan). Risposta standard: splittare le presse in CDL separati in AVM.

**Saturazione:**
- Cyberplan non passa dati di saturazione → AVM usa quella configurata localmente
- La saturazione è proprietà della macchina/pressa (quanto tempo-operatore richiede), non del carico attuale

## Decisioni prese

- Loader unico per i flussi macchine e gruppi, discriminante = presenza codice macchina vs. numerosità
- Nessuna modifica chiesta a Cyberplan sulla struttura dei flussi
- Flag interno nel loader per distinguere comportamento "task" vs "gruppo" (numerosità)
- Per l'autenticazione: per ora si usa il meccanismo Basic Auth (username/password in JSON body), già validato su Franke Poland; il secondo metodo di auth sarà esposto in futuro

## Action item

| Owner | Cosa | Scadenza | Note |
|-------|------|----------|------|
| Gabriele | Rispondere a "Bello" (contatto esterno) con info auth + conferma endpoint abilitati | 2026-08-24 | Dire che la documentazione era corretta e c'è stato un errore interno; non menzionare il cambio nome utenti |
| Emilio | Aprire ticket per upload machine_calendar che fallisce da Hopscotch | — | Gabriele aprirà ticket figlio di quello esistente |
| Emilio | Implementare loader unificato con flag gruppo/task | — | Alberto da consultare per dettagli Horizon |

## Criticità individuate

- Il tenant era stato configurato in modo incompleto (Franco aveva solo rinominato, non completato la configurazione) e nessuno aveva verificato prima delle ferie di Gabriele — il problema è rimasto latente
- Il meccanismo di cancellazione del loader con due flussi separati è intrinsecamente rotto con l'Horizon per CDL: se il flusso macchine gira dopo il flusso gruppi, sovrascrive e perde dati. Richiede unificazione

## Prossimi passi

- Implementare loader unificato (Emilio, timeline non definita)
- Seconda modalità di autenticazione (OAuth o simile) da esporre in futuro, non prioritaria ora
- La questione del "numero di task in AVM = numerosità macchine in Cyberplan" rimane un vincolo di configurazione da comunicare ai clienti quando si imposta l'integrazione

## Note di elaborazione

- Il contatto esterno a cui Gabriele risponde su auth+endpoint è Matteo Belullo.
