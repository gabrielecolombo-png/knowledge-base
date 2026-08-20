---
date: 2026-08-20
client: danieli
project: AWM VMS — allineamento generale
attendees: [Gabriele Colombo, Paola Riva, Filippo Flaborea, Mattia Canever (CdG Danieli — parziale)]
themes: [gestione-ferie-assenze, pianificazione-logistica, cyberplan-integrazione, zucchetti-integrazioni, safety-compliance]
related_meetings: [meetings/danieli/2026-06-05-assessment-logistica.md]
---

## Sintesi

Meeting di allineamento multi-tema su AWM in Danieli. Partecipazione a sorpresa di Mattia (controllo di gestione) che ha aperto un bisogno nuovo: usare le ferie già tracciate in VMS per fare forecast di budget, anziché stime storiche Zucchetti. Confermato che l'assessment del reparto montaggi andrà calendarizzato a settembre, con adoption realistica a marzo 2027 dopo il go-live SAP. Discusso il timing dell'integrazione Cyberplan (obiettivo: VMS live il 1 gennaio 2027). Per i corsi safety, concordata la soluzione con assenze "fittizie" in VMS. Su AWM People / Z Connect il nodo è sbloccare Z Connect lato Danieli.

## Argomenti trattati

### 1. Dati ferie VMS per controllo di gestione (Mattia Canever, CdG)
Il CdG Danieli fa il budget annuale delle ore produttive per reparto calcolando ferie, assenteismo e straordinari: usa percentuali storiche da Zucchetti (consuntivo disponibile dal 16 del mese successivo). Il problema è il forecast: quando il budget viene fatto ad aprile, VMS ha già le ferie programmate per l'estate con buona precisione — ma il CdG non le usa. Quest'anno i capi reparto machining/gears hanno direttamente fornito le turnistiche per i mesi estivi (già depurate dalla componente ferie): Mattia vorrebbe ricavare da queste le ore di ferie concesse per reparto/macchina. Proposta di Gabriele: abilitare un'utenza VMS a Mattia e sentirsi direttamente per capire come estrarre il dato. Il DVH (data warehouse AWM) sarebbe la soluzione ideale ma non è ancora attivo in Danieli.

### 2. Assessment reparto montaggi
Il montaggio è il prossimo reparto candidato all'adozione AWM. Caratteristiche: reparto "centro uomo" con monte ore mensile (non alimentato da Diana né da Cyberplan). Obiettivi discussi: visibilità sul rispetto del monte ore, dimensionamento persone, tracciamento assenze mensili per spiegare lo scostamento ore. Il capo del montaggio è convinto. Blocco attuale: SAP go-live a gennaio 2027, l'adoption AWM per i montaggi è realistica a marzo 2027 (stesso intervallo visto per l'officina: assessment a settembre, primo utilizzo a gennaio, vera adoption a marzo). Stato altri reparti: carpenteria va avanti (riflessioni sull'importazione del carico); logistica ferma perché non ha ancora un carico. Gabriele manda proposte per una mezza giornata di assessment dalla seconda settimana di settembre (dopo il 3).

### 3. Integrazione Cyberplan
Cyberplan sostituirà Diana (alimentata da One World) come sistema di schedulazione quando partirà SAP (1 gennaio 2027). L'integrazione VMS-Cyberplan è strutturata in due flussi distinti: (a) flusso calendario (dati di base, strutturalmente più stabile), (b) flusso operazioni/piano macchine (work order per macchina, più soggetto a variazioni pre-live). La preoccupazione di Gabriele: costruire i flussi integrativi su un sistema non ancora live espone al rischio di doverli rifare più volte (è già accaduto in passato). La posizione di Paola: il rischio è reale, meglio verificare a settembre con Cyberplan se la configurazione è stabile. Decisione: call con Cyberplan a settembre per valutare il feeling; poi si decide se partire a ottobre-novembre. Piano B discusso: partire solo con il flusso calendario (più sicuro) lasciando il flusso operazioni a dopo la stabilizzazione. Su Diana: Paola indica che lo switch sarà netto (Diana muore quando si spegne One World e si accende SAP), ma non ne è certa — da verificare nel progetto SAP.

### 4. AWM People / Z Connect
AWM People embeddato in Z Connect richiede che Z Connect sia attivo. Danieli non ha Z Connect (motivo storico: abilitava la timbratura da telefonino, che non era voluta). Alternativa: AWM People come applicativo standalone. 150 utenti già inclusi nella licenza; proposta di partire con ~20 utenti pilota. Paola chiede un piano chiaro su tempi e attività (non vuole gestire la catena Pucciarelli-referente tecnico-AWM in modo frammentato). Gabriele si fa carico di sentire Davide (lunedì) per sbloccare la situazione e capire i tempi tecnici di attivazione Z Connect.

### 5. Integrazione corsi/visite mediche in VMS (safety)
Il problema: i corsi di formazione e le visite mediche bloccano la disponibilità degli operatori ma VMS non ne è a conoscenza — il sistema può pianificare qualcuno che in realtà è a un corso. Safety Solution (Zucchetti) non invia a VMS le indisponibilità per corsi: non esiste questo flusso integrativo. Due soluzioni possibili discusse:
- **Assenze fittizie in VMS** (preferita, già applicata da AWM ad altri clienti): safety inserisce in VMS un'assenza di tipo "formazione" o "visita medica" che non conta per l'assenteismo — l'optimizer non pianifica la persona in quelle fasce. Safety inserisce l'assenza come "pianificata", il capo turno la conferma: il corso è confermato solo con doppia approvazione.
- **Modulo corsi VMS** (alternativa più organica ma overkill per ora): permette di gestire classi e pianificare i corsi strutturalmente.
Decisione: si procede con le assenze fittizie. Test operativo tra Gabriele e Filippo la settimana del 25 agosto (martedì pomeriggio). Poi Paola presenta la soluzione ai colleghi safety.

### 6. Certificati safety — logiche di import
Tema collegato: VMS importa il record corso da Zucchetti solo quando il certificato è presente in Zucchetti Safety Solution. Il problema è che l'ente certificatore terzo (es. per carrellisti, lavori elettrici, defibrillatore) impiega fino a 60 giorni per emettere il certificato — quindi può esserci un gap tra "corso fatto" e "certificato archiviato in Safety". Da verificare se VMS importa solo i record con certificato già archiviato o anche quelli in attesa. Il rischio reale: in passato Danieli ha perso la traccia di un batch di certificati e ha dovuto rifare tutti i corsi (costo enorme + esposizione legale). L'idea di portare il PDF del certificato in VMS è tecnicamente proibitiva (ordini di grandezza di complessità rispetto al solo record). Alternativa valutata: aggiungere un flag booleano nel flusso Zucchetti→VMS per indicare se il certificato è fisicamente archiviato (richiede customizzazione del transformer, non solo dell'estrattore — più complesso del precedente custom sulle assenze). Gabriele approfondisce le logiche di import prima di decidere.

### 7. Minor: UI "not expected" e timbrature
Filippo ha notato che dal pannello "not expected" cliccando su una riga si apre la tab Orari (non Cronologia Accessi). Logica confermata: da "not expected" si vuole vedere rapidamente la pianificazione per capire dove la persona lascia scoperto, da Accessi si vedono i delta. Nessuna modifica al comportamento da fare.

## Decisioni prese

- Assessment montaggi: Gabriele manda proposte per seconda settimana settembre; adoption stimata marzo 2027.
- Cyberplan: nessuna decisione sul timing adesso; call con Cyberplan a settembre per valutare stabilità configurazione.
- AWM People: Gabriele parla con Davide lunedì 24/08 per sbloccare Z Connect.
- Corsi safety: si va con assenze fittizie in VMS; test con Filippo martedì 25/08 (pomeriggio).
- Certificati: Gabriele verifica le logiche di import prima di quotare eventuale customizzazione flag.

## Action item

| Owner | Cosa | Scadenza | Note |
|-------|------|----------|------|
| Gabriele | Scrivere a Mattia Canever (CdG) e sentirsi direttamente per estrazioni ferie da VMS | 2026-08-20 | Eventualmente abilitare utenza VMS a Mattia |
| Gabriele | Mandare proposte a Paola per assessment montaggi a settembre | Prossimi giorni | Seconda settimana di settembre, dopo il 3 |
| Gabriele | Sentire Davide per sbloccare Z Connect in Danieli | 2026-08-25 (lunedì) | Davide in ferie giovedì-venerdì 21-22/08 |
| Gabriele | Test assenze fittizie in VMS con Filippo | 2026-08-26 (martedì) | Solo pomeriggio (Gabriele non disponibile mattina) |
| Gabriele | Verificare logiche di import certificati safety da Zucchetti | TBD | Capire se VMS distingue "record con certificato" da "record senza certificato ancora" |
| Gabriele / Paola | Call con Cyberplan a settembre per decidere timing integrazione | Settembre 2026 | Prima di decidere ottobre vs novembre per start integrazione |

## Criticità individuate

- **Logiche import certificati safety**: non è chiaro se VMS importa da Zucchetti solo i record con certificato già archiviato o anche quelli in attesa di emissione da ente terzo — se importa solo i certificati archiviati, si perde la visibilità sul gap "corso fatto, certificato pendente". Rischio concreto già materializzato in passato (Danieli ha perso un batch di certificati).
- **Switch-off Diana→SAP**: Paola indica che sarà netto (no affiancamento), ma non ne è certa. Se confermato, VMS deve essere pronto il 1 gennaio — zero margine. Da verificare nel progetto SAP.
- **Z Connect bloccato**: senza Z Connect, AWM People non può essere embeddato. La catena di sblocco (AWM → Davide → referente tecnico Zucchetti → Danieli) è lenta; Paola ha già atteso risposta da Davide senza riceverne.

## Prossimi passi

- Gabriele si sente con Mattia Canever (CdG) separatamente per estrazioni ferie.
- Gabriele manda proposte date per assessment montaggi (seconda settimana settembre).
- Gabriele parla con Davide lunedì 25 per Z Connect.
- Test assenze fittizie VMS con Filippo martedì 26/08 pomeriggio.
- Call con Cyberplan a settembre.
- Gabriele approfondisce logiche import certificati.

## Note di elaborazione

- "Coin" (o simile, difficile dalla trascrizione) menzionato da Filippo in relazione a un precedente incontro sui certificati safety (19 giugno) — identità non chiara nemmeno a Gabriele.
- Le logiche di import dei certificati safety da Zucchetti descritte nel meeting non sono state comprese correttamente: la descrizione nella sezione "Argomenti trattati §6" e nelle criticità riflette quanto emerge dalla trascrizione, ma Gabriele ha segnalato che la realtà tecnica è diversa — da chiarire con lui prima di aggiornare i file.
- La nota d'inizio indica che il microfono era solo di Gabriele Colombo: le parole degli altri partecipanti sono riportate come le ha percepite la trascrizione automatica e potrebbero contenere distorsioni.
