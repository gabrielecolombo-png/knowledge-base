---
date: 2026-09-16
client: salf
project: Integrazione AWM-Cyberplan per SALF (tramite EY) — verifica standard vs custom
attendees: [Marco Mior (Cyberplan), Filippo Tonutti (Cyberplan), Diana Ongaro (EY), Iris Gelain (EY), Gabriele Colombo (AWM), Alberto Spiller (AWM), Alessio Ballarin (AWM)]
themes: [cyberplan-integrazione]
related_meetings: [meetings/interno/2026-08-24-cyberplan-integrazione-standard.md]
---

## Sintesi

Meeting a tre (Cyberplan, EY, AWM) per verificare se l'integrazione AWM-Cyberplan per il cliente SALF — dove EY sta implementando Cyberplan — rientra nello standard già costruito per Danieli o richiede customizzazioni specifiche. Il caso SALF introduce due complicazioni nuove: centri di lavoro con macchine utilizzabili in parallelo (granularità mancante nello standard) e una risorsa alternativa robot/carrello manuale la cui scelta è decisa dopo la schedulazione. Si è convenuto un approccio che, concatenando le informazioni extra nel codice del centro di lavoro esportato, permette di restare dentro la logica del loader/pattern standard AWM con solo configurazione aggiuntiva, evitando sviluppo custom vero e proprio.

## Argomenti trattati

### 1. Contesto e obiettivo del meeting
EY sta implementando Cyberplan presso SALF. Obiettivo: capire se l'integrazione dati Cyberplan→AWM per questo cliente rientra nel pattern standard (già definito per Danieli, vedi [[cyberplan-integrazione]]) o richiede sviluppo dedicato.

### 2. Modello dati SALF: centri di lavoro con macchine in parallelo
In SALF alcuni centri di lavoro contengono più macchine utilizzabili in parallelo sulla stessa lavorazione. Storicamente l'ERP (IRP) codificava questi casi come centri di lavoro separati (X, Y, XY), ma SALF non ha un MES e pianifica su Excel: il pianificatore e chi gestisce il personale in produzione ignorano di fatto questa codifica ERP. EY ha rimappato il modello a "centro di lavoro con macchine annidate". Per il caso "parallelo", si è scelto di non duplicare la fase/operazione (lo split introdurrebbe un vincolo di schedulazione scorretto in Cyberplan, perché le due macchine non necessariamente partono insieme), ma di passare un **numero di risorse/tool utilizzate** per quella fase — un campo aggiuntivo rispetto allo standard, esplicitamente definito come "custom a progetto" per SALF. Il dato su quante macchine vengono usate in parallelo arriva da un parametro impostato dal pianificatore (soglia di quantità/tempo oltre la quale fa partire le macchine in parallelo), non è calcolato da Cyberplan. In SALF, su 4 centri di lavoro di questo tipo, 3 hanno 2 risorse disponibili.

### 3. Caso robot vs carrello manuale
Alcuni centri di lavoro (es. F2122/F2123) hanno anche una fase legata allo scarico dei prodotti dalla macchina, che può avvenire con un **robot** (più efficiente, ma condiviso tra più linee e limitato: richiede una sola persona di supervisione) oppure con **carrelli manuali** (richiede più persone, 2-3 a seconda della famiglia di prodotto). Quando il robot è impegnato su un'altra linea/famiglia che lo richiede obbligatoriamente, la fase in questione usa il carrello. Questa scelta:
- **non è modellabile come vincolo rigido di schedulazione in Cyberplan**, perché dipende da priorità tra famiglie di prodotto e disponibilità del robot in un dato momento (discusso da EY anche con i colleghi Cyberplan — Giovanni, Emanuele — e Cyberplan stesso, che ha confermato la difficoltà);
- viene invece decisa **dopo** la schedulazione, tramite uno script lato EY basato sulla famiglia di prodotto, non lasciata alla decisione estemporanea dell'operatore.
Si era inizialmente ipotizzato un "campo d'appoggio" separato o addirittura un centro di lavoro/task dedicato per i carrelli, ma si è scartata questa strada per non moltiplicare campi e mappature.

### 4. Soluzione tecnica concordata
L'informazione robot/carrello viene **concatenata nel codice del centro di lavoro** esportato verso AWM (es. "ripartizione188_robot" vs "ripartizione188_carrello"), anziché passare come campo separato. Lato AWM, questo codice concatenato diventa un **pattern**, ciascuno associato a un layout dedicato (layout con robot attivo e carrelli disattivati, oppure layout con carrelli e numero di persone più alto). Questo è concettualmente analogo ai "livellamenti" già usati da AWM per famiglia di prodotto, ma esplode la logica sui pattern. Il vantaggio: la concatenazione si configura lato AWM nel workspace di integrazione/export (modificando il parametro che oggi porta il solo codice del centro di lavoro), quindi rientra nella configurazione del **loader standard**, senza sviluppo ad hoc — "un minimo di lavoro ma niente di che". Lo script di concatenazione verrà scritto lato EY (verosimilmente da Iris Gelain).

### 5. Oggetti scambiati verso AWM
Lista di **operazioni** (fasi) con: centro di lavoro, quantità, data inizio/data fine, ordine, item, famiglia di prodotto, e un parametro con tre valori possibili (robot / carrello / nessuno) — un solo valore per fase, da concatenare col codice del centro di lavoro.

### 6. Timeline SALF e ambiente di test
- **Live 1** (solo MRP + FCP, pianificazione a capacità finita fino al centro di lavoro, senza vincoli di schedulazione complessi): atteso a **metà novembre 2026**, condizionato dalla pulizia dati lato SALF nell'ERP (il nuovo responsabile operation sta spingendo su questo). Anche in questa fase l'informazione a livello di macchina è comunque presente (FCS "gira" senza vincoli attivi), quindi i dati sono già sufficienti per l'integrazione con AWM — non serve aspettare la piena messa a punto della schedulazione vincolata (FCS) per iniziare i test.
- **FCS** (schedulazione a vincoli pieni): richiede la definizione di tutti i vincoli macchina, non ancora esistenti da nessuna parte — tempistica non definita, più lunga.
- Nessun ambiente di test dedicato per Cyberplan lato SALF (solo l'ERP ne ha uno); si può comunque anticipare i test lato EY passando script custom prima che Cyberplan rilasci una eventuale funzionalità standard per questo tipo di caso (Filippo non si sbilancia su tempi, avendo già sbagliato una stima precedente) — comunque SALF richiederà sempre una customizzazione (concatenazione + gestione robot/carrello), quindi non sarà mai un caso "puro standard".
- Deadline di progetto lato AWM (Alberto): push per andare live con l'integrazione e chiudere il progetto entro dicembre 2026 (week 50 massimo). Obiettivo: avere l'integrazione pronta e testata **prima** di metà novembre, così che quando arrivano dati puliti da SALF sia solo questione di mostrare dati già pronti — oggi c'è un paradosso per cui la formazione utenti AWM è già in corso ma senza dati di pianificazione Cyberplan reali.

### 7. Calendari (flusso separato)
Previsto anche uno scambio calendari, distinto dal flusso operazioni. Cyberplan ha già rilasciato (release di luglio/agosto 2026, versione ~113.8/9) una funzionalità che "srotola" il calendario in una tabella di date/ore con parametri, riducendo il lavoro custom lato EY (finora servivano tabelle custom fatte a mano, es. per il cliente Minelli). Diana deve aggiornare la propria versione Cyberplan (attualmente 113.6, con un bug nelle "tendine"/dropdown) per avere accesso al plugin/funzionalità e produrre un export di esempio dei calendari.

## Decisioni prese

- Non si crea una fase/task o un campo d'appoggio separato per i carrelli: l'informazione robot/carrello viene concatenata nel codice del centro di lavoro esportato ad AWM, mappato via pattern → layout lato AWM.
- Il numero di risorse/tool utilizzate per fase resta un campo aggiuntivo rispetto allo standard (custom a progetto per SALF).
- Diana (EY) produce un export di esempio (fasi/operazioni schedulate) con i due campi extra più una colonna già concatenata, da consegnare entro la sera del 17/09/2026.
- Si può anticipare i test dell'integrazione anche prima che Cyberplan rilasci una funzionalità "standard" per questo caso, usando script custom lato EY.
- Obiettivo di business: integrazione pronta e testata prima di metà novembre 2026, chiusura progetto entro la settimana 50 (metà dicembre 2026).

## Action item

| Owner | Cosa | Scadenza | Note |
|-------|------|----------|------|
| Diana Ongaro (EY) | Inviare export di esempio delle fasi/operazioni schedulate con i campi "numero risorse" e "robot/carrello" più una colonna già concatenata | 2026-09-17 (sera) | Da mostrare anche a Daniele (utente AWM/SALF) per validazione visiva |
| Diana Ongaro (EY) | Fornire a Filippo Tonutti e Marco Mior (Cyberplan) un riepilogo sintetico dei campi custom identificati per SALF | Non specificata | Per organizzare eventuale supporto/sviluppo lato Cyberplan |
| Diana Ongaro (EY) | Aggiornare la versione Cyberplan (da 113.6) per risolvere il bug delle tendine e ottenere il plugin/funzionalità calendari | Non specificata | Necessario anche per l'export calendari |
| Diana Ongaro (EY) | Inviare export di esempio dei calendari | Dopo l'aggiornamento versione | — |
| AWM (Alberto Spiller / team) | Analizzare l'export di esempio e verificare se rientra nel loader standard con sola configurazione della mappatura pattern→layout | Non specificata | — |
| AWM / EY | Pianificare un secondo meeting di analisi per definire le tempistiche, una volta ricevuti i campi custom | Non specificata | — |

## Criticità individuate

- La scelta robot/carrello dipende da priorità tra famiglie di prodotto e disponibilità del robot in un dato momento: non modellabile come vincolo rigido di schedulazione in Cyberplan, va gestita post-schedulazione via script — introduce un margine di scostamento tra quanto pianificato e quanto poi eseguito in produzione.
- Nessun ambiente di test Cyberplan dedicato per SALF (solo l'ERP ne ha uno) — i test dell'integrazione dovranno appoggiarsi a dati/script provvisori.
- Il piano di go-live (metà novembre) dipende dalla velocità con cui SALF pulisce i dati nell'ERP/IRP, fuori dal controllo diretto di AWM/EY.
- SALF è ora il secondo caso (dopo Danieli) di integrazione AWM-Cyberplan mappato in [[cyberplan-integrazione]], ma introduce un pattern di customizzazione diverso (concatenazione codice centro di lavoro + robot/carrello) rispetto al problema "Horizon" già affrontato per Danieli — segnale che lo standard AWM-Cyberplan potrebbe dover coprire più varianti di quanto previsto finora.

## Prossimi passi

- Diana invia export fasi/operazioni con campi extra e colonna concatenata entro il 17/09.
- AWM valida la mappatura e la mostra a Daniele (utente AWM/SALF).
- Diana aggiorna Cyberplan e invia export calendari.
- Diana fornisce riepilogo campi custom a Filippo/Marco per organizzare supporto Cyberplan.
- Secondo meeting di analisi per definire tempistiche, una volta chiariti i campi custom.

## Note di elaborazione

- Trascrizione automatica molto rumorosa e con diversi passaggi tecnici sovrapposti/interrotti; alcuni nomi di macchine/fasi (es. "larice 100" / "attrice 100" / "lavatrice 100") restano ambigui — riportati come "ripartizione 188" e con nome macchina non meglio identificato dove il testo non permetteva una lettura affidabile.
- "Roberto" risulta essere il pianificatore SALF che lavora su Cyberplan/Excel (capacità finita), mentre "Daniele" viene descritto da Alberto come "il nostro utente" cioè il referente SALF lato AWM (assegnazione persone su task) — sono presumibilmente due ruoli/persone distinti lato SALF, ma la trascrizione non lo esplicita del tutto chiaramente: da confermare con Gabriele.
- Non è del tutto chiaro se la soluzione "concatenazione nel codice del centro di lavoro" sia già una decisione definitiva e condivisa anche da Marco Mior (Cyberplan), che nella parte finale della call interviene poco sul punto specifico — verificare che non ci siano riserve emerse dopo la registrazione.
