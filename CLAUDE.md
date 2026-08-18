# Istruzioni operative — AWM Knowledge Base

Queste istruzioni valgono per ogni sessione di Claude Code in questo repository.

## Cosa fare quando ricevi una trascrizione nuova

1. **Salva il grezzo**: copia la trascrizione originale (senza modifiche) in
   `meetings/_raw/yyyy-mm-dd-cliente-titolo-breve.txt`.

2. **Genera la minuta pulita** in `meetings/<cliente>/yyyy-mm-dd-titolo-breve.md`
   usando il template in `templates/meeting.md`. Se il cliente non ha ancora una
   cartella, creala. Compila SEMPRE il frontmatter YAML per intero — è dati
   strutturati che serve per le query successive, non decorazione.

3. **Identifica i temi toccati** dal meeting (es. `zucchetti-integrazioni`,
   `gestione-ferie-assenze`, `power-bi-reportistica`). Un meeting può toccare
   più temi. Se un tema è nuovo, crealo; se esiste, aggiornalo (vedi sotto
   "Regole di aggiornamento dei file tema" — è la parte più delicata).

4. **Aggiorna `themes/_index.md`** con il nuovo tema se creato, o lascialo
   invariato se hai solo aggiornato un tema esistente.

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
