# Istruzioni operative — AWM Knowledge Base

Queste istruzioni valgono per ogni sessione di Claude Code in questo repository.

## Cosa fare quando ricevi una trascrizione nuova

1. **Salva il grezzo**: copia la trascrizione originale (senza modifiche) in
   `meetings/_raw/yyyy-mm-dd-cliente-titolo-breve.txt`.

2. **Genera la minuta pulita** in `meetings/<cliente>/yyyy-mm-dd-titolo-breve.md`
   usando il template in `templates/meeting.md`. Se il cliente non ha ancora una
   cartella, creala. Compila SEMPRE il frontmatter YAML per intero — è dati
   strutturati che serve per le query successive, non decorazione. Includi la
   sezione "Note di elaborazione" SOLO se hai dovuto fare una scelta incerta
   (vedi template) — la sua sola presenza è il segnale che va verificata, non
   serve altro marcatore. Se presente, aggiungi anche una riga breve nel
   report di fine sessione che rimanda a quella minuta, così il promemoria non
   dipende dal fatto che Gabriele apra ogni singolo file.

3. **Identifica i temi toccati** dal meeting. Un meeting può toccare più temi.
   PRIMA di creare un tema nuovo, leggi `themes/_index.md` per intero e valuta
   se un tema esistente è già abbastanza vicino (vedi "Convenzione naming temi"
   sotto). In caso di dubbio, preferisci sempre riusare/espandere un tema
   esistente piuttosto che crearne uno nuovo leggermente diverso — la
   frammentazione dei temi è il modo più silenzioso in cui questo sistema si
   rompe. Se il tema è nuovo, crealo; se esiste, aggiornalo (vedi sotto
   "Regole di aggiornamento dei file tema" — è la parte più delicata).

### Convenzione naming temi

- Formato: `kebab-case`, sostantivo/ambito + eventuale specifica, MAI verbi o
  frasi. Esempi corretti: `zucchetti-integrazioni`, `gestione-ferie-assenze`,
  `power-bi-reportistica`. Esempi SBAGLIATI: `problemi-con-zucchetti`,
  `come-gestiamo-le-ferie`.
- Massimo 3-4 parole. Se ti serve una sfumatura più specifica di un tema
  esistente, valuta prima se è davvero un tema diverso o solo un dettaglio da
  aggiungere dentro quello esistente (es. non creare
  `zucchetti-integrazioni-turni` se esiste già `zucchetti-integrazioni` — il
  turni ci va dentro come sotto-punto).
  - Regola pratica: se il nome del tema nuovo condivide la prima parola/ambito
    con un tema esistente, è quasi sempre un segnale che dovresti espandere
    quello esistente invece di crearne uno nuovo.
- Il tema è per ARGOMENTO/PROBLEMA RICORRENTE, non per cliente (il cliente è
  già nel frontmatter della minuta) e non per singolo meeting.

4. **Aggiorna `themes/_index.md`** con il nuovo tema se creato, o lascialo
   invariato se hai solo aggiornato un tema esistente.

4bis. **Aggiungi sempre una riga a `meetings/_index.md`** (data, cliente,
   titolo, temi, link) — questo va fatto per OGNI meeting, a differenza di
   `themes/_index.md` che si aggiorna solo quando nasce un tema nuovo.

5. **Controlla i pattern cross-tema**: prima di chiudere, chiediti se quanto
   emerso in questo meeting si collega a un tema DIVERSO da quelli già taggati
   — non ovvio, non solo "stesso cliente" o "stessa persona". Se sì, aggiungi
   una riga in `patterns/log.md` (vedi formato sotto). Se non trovi nulla di
   genuinamente nuovo, NON scrivere nulla — non forzare un pattern per riempire
   il file.

6. **Commit diretto** con messaggio descrittivo (es.
   `meeting: danieli 2026-08-18 kickoff zucchetti + aggiornamento tema integrazioni`).
   Push su GitHub. Non serve chiedere conferma prima del commit — git stesso è
   la rete di sicurezza (revert sempre possibile).

## Regole di aggiornamento dei file tema (`themes/<tema>.md`)

Questa è la parte più importante da fare bene, perché questi file vengono
riletti e ri-editati continuamente nel tempo — un errore silenzioso qui si
accumula.

- **MAI riscrivere un file tema da zero.** Sempre leggere il contenuto esistente
  prima di modificare, e integrare (append/merge), non sostituire.
- Ogni file tema ha questa struttura fissa:

  ```markdown
  # <Nome tema>

  ## Sintesi corrente
  (2-4 frasi che riassumono lo stato attuale della comprensione di questo tema.
  Questa sezione SI aggiorna riscrivendola, ma solo questa — è un riassunto
  vivo, non un log.)

  ## Meeting collegati
  - yyyy-mm-dd [cliente] Titolo — 1 riga su cosa ha aggiunto — [link alla minuta]
  (questa lista si allunga per append, mai si riscrive)

  ## Osservazioni aperte
  - domande o contraddizioni non risolte tra meeting diversi
  ```

- Quando aggiungi una riga a "Meeting collegati", scrivi cosa di NUOVO ha
  aggiunto quel meeting rispetto a quanto già sapevi — non ripetere la sintesi
  del meeting.
- Se un meeting nuovo CONTRADDICE qualcosa scritto in un meeting precedente
  sullo stesso tema, non cancellare la vecchia informazione: annotalo in
  "Osservazioni aperte" con entrambi i riferimenti.

## Formato di `patterns/log.md`

Append-only, mai riscritto. Una voce per pattern notato:

```markdown
## yyyy-mm-dd — <titolo breve del pattern>
Temi collegati: tema-a, tema-b
Meeting che hanno fatto emergere il collegamento: [link], [link]
Osservazione: (2-4 frasi, perché questo collegamento non era ovvio e cosa
implica)
```

## Routine di revisione (manutenzione automatica)

Girare automaticamente ogni notte via Task Scheduler (vedi setup separato),
come sessione indipendente dal processing di una trascrizione. Obiettivo:
correggere quello che si accumula nel tempo, perché nessuno rilegge i file
tema riga per riga come farebbe con una minuta singola.

1. Rileggi tutti i file in `themes/` modificati nelle ultime 24-48 ore.
2. Per ciascuno verifica:
   - la "Sintesi corrente" è ancora coerente con tutte le voci in
     "Meeting collegati", o si è disallineata (es. riassume solo i meeting
     più vecchi, ignora un aggiornamento recente)?
   - ci sono due temi diversi che di fatto parlano della stessa cosa (stessa
     famiglia di problema, nomi diversi) e andrebbero segnalati per merge?
   - ci sono voci in "Osservazioni aperte" risolte da un meeting successivo
     ma mai chiuse?
3. Applica correzioni dirette per errori oggettivi (link rotti, refusi,
   sintesi palesemente disallineata dai fatti sottostanti).
4. NON fondere due file tema in autonomia: se sospetti una duplicazione,
   segnalala nel report (vedi sotto) invece di agire — un merge sbagliato
   perde storia, mentre non fare il merge subito non costa nulla.
5. Aggiorna `themes/_index.md` se necessario (date, nuove voci).
6. **Controlla anche la salute dell'infrastruttura stessa** (non solo i
   contenuti): `scripts/`, `.claude/commands/`, `CLAUDE.md`. Se noti un
   problema oggettivo (es. un path sbagliato, un comando che fallirebbe,
   un'istruzione ambigua che ha causato un comportamento diverso da quanto
   atteso), puoi correggerlo direttamente — ma questo va SEMPRE riportato nel
   report come voce a parte (vedi sotto "Modifiche infrastrutturali"),
   indipendentemente dal fatto che ci sia altro da segnalare sui temi. Una
   correzione silenziosa allo script che lancia la routine stessa è
   esattamente il tipo di cosa che Gabriele deve sempre vedere.
7. Commit e push delle correzioni fatte (stesso principio del processing
   trascrizioni: commit diretto, git è la rete di sicurezza).

## Report di fine sessione

Non fermarti a chiedere conferma durante il lavoro (né nel processing di una
trascrizione né nella routine notturna) — completa tutto quello che puoi fare
con ragionevole sicurezza. Alla fine di OGNI sessione che modifica qualcosa
nel repo, produci sempre un report breve in questo formato:

```
## Report sessione — yyyy-mm-dd HH:mm

### Fatto
- (elenco sintetico di minute create, temi creati/aggiornati, pattern loggati,
  correzioni applicate dalla routine di revisione)

### Da verificare
- (ogni punto in cui hai dovuto scegliere senza certezza: es. a quale tema
  attribuire qualcosa, chi ha detto/deciso cosa se non era chiaro dalla
  trascrizione, se un tema andrebbe fuso con un altro, sintesi di un tema
  che potrebbe essersi disallineata)
- se non c'è nulla di dubbio, scrivi esplicitamente "Nessun punto dubbio
  questa sessione" — non lasciare la sezione vuota senza dirlo
```

Ogni punto in "Da verificare" deve essere concreto e puntare a un file/riga
specifica, non generico — Gabriele deve poter controllare in 10 secondi, non
riaprire tutto il repo per capire a cosa ti riferisci.

Se la routine notturna ha modificato qualcosa fuori dall'ambito standard
(script, `.claude/commands/`, `CLAUDE.md` stesso), aggiungi sempre una
sezione separata:

```
### Modifiche infrastrutturali
- (cosa hai modificato, perché, e cosa sarebbe successo se non l'avessi
  corretto)
```

Questa sezione, se presente, fa scattare l'invio email indipendentemente
da cosa contengano le altre sezioni (vedi "Invio" sotto) — un problema
nell'infrastruttura stessa (es. lo script che lancia la routine) è sempre
degno di nota, anche se i temi sono tutti a posto.

**Invio**: al termine della sessione automatica notturna, invia questo report
via Gmail (connector già configurato) a Gabriele, oggetto
`[Knowledge Base] Report notturno yyyy-mm-dd`, SE ALMENO UNA di queste
condizioni è vera:
- ci sono state trascrizioni processate nelle ultime 24-48h
- la routine ha trovato punti da segnalare in "Da verificare"
- la routine ha fatto modifiche infrastrutturali (vedi sopra)

Se nessuna di queste è vera (nessun meeting nuovo, temi tutti coerenti,
nessuna modifica fuori dai contenuti), NON inviare email — evita notifiche
vuote quando non c'è stato nulla di rilevante. Per le sessioni di processing
trascrizioni lanciate manualmente da Gabriele, il report basta mostrarlo in
chat/output della sessione, non serve invio email (Gabriele è già presente).

## Cosa NON fare

- Non creare ticket Jira, non scrivere su Confluence, non inviare email da qui:
  questo repo è solo per la conoscenza, azioni esterne solo se richieste
  esplicitamente e separatamente.
- Non inventare collegamenti tra temi solo per "riempire" `patterns/log.md`.
  Meglio nessuna voce che una forzata.
- Non modificare `meetings/_raw/` una volta scritto: è l'originale, immutabile.
- Non eliminare storia da nessun file tema per "fare pulizia": se un tema
  sembra obsoleto, aggiungi una nota in "Osservazioni aperte", non cancellare.

## Query utili da supportare

Quando Gabriele chiede cose come "che pattern vedi tra i meeting di Danieli e
Franke sulle ferie?" o "cosa sappiamo su X nel tempo?", usa questo ordine:
1. Leggi `themes/_index.md` per orientarti.
2. Leggi il/i file tema pertinenti — hanno già la sintesi e i link.
3. Solo se serve maggior dettaglio, apri le minute specifiche linkate.
4. Solo in ultima istanza rileggi i raw.

Non serve rileggere tutto il repo ogni volta: gli indici tema esistono
apposta per evitarlo.
