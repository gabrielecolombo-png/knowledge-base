---
date: 2026-09-16
client: veneta-cucine
project: Integrazione dati Winsarp ↔ AWM (anagrafiche, timbrature, assenze)
attendees: [Riccardo Scarpa (Veneta Cucine), Jessica (Veneta Cucine — presente solo nei primi 10 minuti), Gabriele Colombo (AWM), Alessio Ballarin (AWM), Stefano Ghiotto (AWM)]
themes: [zucchetti-integrazioni, gestione-ferie-assenze]
related_meetings: []
---

## Sintesi

Meeting in due parti con Veneta Cucine sull'integrazione dati tra Winsarp — il sistema presenze/HR di terze parti usato dal cliente — e la piattaforma AWM. Prima parte (primi 10 minuti, con Jessica di Veneta Cucine): stato del push delle assenze verso AWM e di un problema di formato dato ormai risolto. Seconda parte (con Riccardo Scarpa di Veneta Cucine): walkthrough dei tracciati JSON per anagrafiche, timbrature e assenze che serviranno per l'integrazione standard, con l'obiettivo di attivarla senza sviluppo dedicato se la struttura rispetta gli standard AWM.

## Argomenti trattati

### 1. Stato push assenze Winsarp → AWM (con Jessica, primi 10 minuti)
Due problemi distinti erano stati identificati in passato: (1) manca ancora il push delle assenze verso AWM; (2) le assenze venivano registrate come intervallo orario (es. 12-13 e 14-15) invece che come durata (es. 4 ore) — questo secondo punto risulta già corretto, in coincidenza con uno switch avvenuto presumibilmente a giugno 2026. Resta da verificare/attivare il push vero e proprio. Proposta discussa: sincronizzazione a finestra temporale mobile (circa -10/+180 giorni) aggiornata molto di frequente (ipotesi ogni 5 minuti), invece di ritrasmettere ogni volta la situazione completa di tutti i dipendenti. Il team si è detto disponibile a liberare risorse su questa priorità.

### 2. Tracciato anagrafiche (Winsarp → AWM)
Riccardo Scarpa condivide un JSON di esempio con i campi attesi:
- **Codice matricola** e **codice fiscale**: il codice fiscale viene usato come chiave univoca lato AWM (non la matricola), perché un'analisi sui dati già presenti a database ha rilevato matricole duplicate.
- Nome, cognome, genere (non obbligatorio), data di nascita.
- Primo giorno di lavoro / ultimo giorno di lavoro: se il rapporto è a tempo indeterminato il campo resta vuoto (caso più frequente); l'attivazione/disattivazione lato AWM guarda la data effettiva (first/last work day), non la tipologia di contratto — utile anche per i casi di pensionamento.
- Centro di costo: sufficiente il solo codice (la descrizione è già mappata lato AWM).
- Plant/stabilimento: rilevante solo per installazioni multiplant; per Veneta Cucine non è strettamente necessario ma può essere valorizzato senza problemi. Nota: le aziende di somministrazione lavoro sono trattate come plant/aziende a sé stanti nella codifica Winsarp.
- Badge (numero cartellino): non obbligatorio ai fini dell'integrazione ma utile per consultazione lato capo turno.
- Email, numero di telefono (dato fondamentale per AWM People).
- Tipologia di contratto (codice + specifica), es. tempo determinato/indeterminato.

### 3. Tracciato timbrature (Winsarp → AWM)
Flusso a log continuo, inviato **a batch ogni 24 ore**. Campi obbligatori: CID (identificativo univoco, consigliato il codice fiscale), timestamp (data+ora, troncatura al minuto — i secondi non servono), direzione (entrata/uscita, "?" se non determinata). Campi opzionali: place (luogo fisico di timbratura, utile per capire dove il dipendente ha timbrato) e stamping code (chiave univoca anti-duplicati; se assente viene comunque generata lato AWM). Eventuali correzioni/aggiustamenti restano di competenza di Winsarp come sistema di riferimento; lato AWM il dato serve per finalità operative (es. gestione "inattesi").

### 4. Tracciato assenze (flusso Winsarp → AWM, solo andata per ora)
Campi: CID (idealmente codice fiscale), holiday key, holiday type (causale, mappata sulle causali AWM), stato (approvata / in attesa / cancellata), referrer (chi ha inserito l'assenza — probabilmente obbligatorio), all day (se true basta la data; se false serve il timestamp completo di inizio/fine, es. per un permesso orario).

**Punto aperto — holiday key**: poiché il flusso sarà bidirezionale (un'assenza potrà nascere sia su Winsarp sia su AWM), serve un modo per riconoscere che due record nati da parti diverse sono la stessa assenza. Decisione provvisoria: attivare per primo il solo flusso Winsarp → AWM lasciando la holiday key vuota; affrontare la generazione/riconciliazione della chiave quando si costruirà il flusso di ritorno AWM → Winsarp.

**Punto aperto — stato "cancellata"**: serve per gestire le modifiche. L'update via holiday key è possibile solo su stato e tipologia; se cambia la data di inizio/fine il vecchio record va cancellato e se ne crea uno nuovo. Emerge il dubbio che Winsarp non mantenga uno storico delle cancellazioni (elimina il record invece di marcarlo cancellato), il che preoccupa lato AWM per possibili contestazioni dei dipendenti su richieste "sparite" senza traccia. Nota distinta: una richiesta "annullata" o "rifiutata" sono casi diversi dalla cancellazione del record.

### 5. Logistica di invio
Veneta Cucine/Winsarp (Riccardo Scarpa) condivide entro la giornata del 16/09 i file di esempio, documentazione di supporto ed endpoint API (questi ultimi "a breve", se pronti in giornata). AWM invierà un proprio JSON di esempio per verificare insieme eventuali casi limite prima dell'attivazione. Da confermare se il payload arriva come JSON nel body della POST o come stream/base64 acquisito in un secondo momento (ipotesi più probabile: JSON nel body).

## Decisioni prese

- Push assenze: si punta ad attivare la sincronizzazione a finestra mobile (~-10/+180 giorni) con refresh frequente, invece dell'invio massivo periodico di tutta l'anagrafica.
- Flusso assenze: si parte con il solo flusso in ingresso Winsarp → AWM, holiday key vuota per ora.
- Se la struttura dei file rispetta lo standard dei connettori AWM, l'integrazione può essere attivata direttamente da Stefano Ghiotto/Alessio Ballarin (AWM) senza passare dallo sviluppo.

## Action item

| Owner | Cosa | Scadenza | Note |
|-------|------|----------|------|
| Veneta Cucine (Riccardo Scarpa) | Inviare file di esempio, documentazione di supporto ed endpoint API per anagrafiche/timbrature/assenze | 2026-09-16 (endpoint "a breve" se non pronti in giornata) | — |
| AWM (Gabriele Colombo) | Inviare JSON di esempio per verifica congiunta di eventuali casi limite | Non specificata | — |
| AWM / Veneta Cucine | Definire come generare/riconciliare la holiday key per il flusso di ritorno AWM → Winsarp | Non specificata | Bloccante solo per il secondo flusso, non per il primo |
| Non specificato | Verificare via mail eventuali azioni di follow-up sul tema push assenze | Non specificata | Menzionato genericamente a fine prima parte del meeting |

## Criticità individuate

- Winsarp non sembra mantenere uno storico/log delle cancellazioni delle richieste di assenza (elimina il record) — rischio di dispute con i dipendenti su richieste "sparite" senza traccia; nessuna soluzione condivisa ancora.
- Riconciliazione della stessa assenza se creata sia su AWM sia su Winsarp, rilevante quando sarà attivo il flusso bidirezionale — vedi anche [[zucchetti-integrazioni]] per un problema di integrazione simile già visto su altri clienti (flusso assenze Danieli AVM→Zucchetti→Workflow).
- Push assenze verso AWM non ancora attivo/verificato al momento del meeting (a differenza del problema di formato dato, già risolto).

## Prossimi passi

- Veneta Cucine/Winsarp invia file di esempio, documentazione ed endpoint (entro il 16/09 o a breve).
- AWM invia JSON di esempio per revisione congiunta dei casi limite.
- Attivazione diretta da Stefano/Alessio se la struttura rientra nello standard.
- Da riprendere in futuro: generazione/riconciliazione della holiday key per il flusso di ritorno assenze.
