# AWM Knowledge Base

Repository per trascrizioni di meeting, minute strutturate, e indici tematici trasversali
sui progetti AWM Suite / Azzurro Digitale (Danieli, Franke, GBFoods, Veneta Cucine, OringONE, ecc.).

## Obiettivo

Non è solo un archivio. Lo scopo è che Claude possa:
1. Trasformare trascrizioni grezze in minute pulite e consultabili.
2. Mantenere indici tematici (`themes/`) che collegano meeting diversi sullo stesso argomento,
   anche tra clienti diversi.
3. Notare pattern non ovvi tra temi apparentemente scollegati (`patterns/log.md`).

## Struttura

```
meetings/<cliente>/yyyy-mm-dd-titolo-breve.md   → minuta pulita, con frontmatter
meetings/_raw/                                   → trascrizioni originali non processate
themes/<tema>.md                                 → indice vivo per argomento, aggiornato incrementalmente
themes/_index.md                                 → elenco di tutti i temi esistenti con link
people/_index.md                                 → chi ha detto/deciso cosa, nel tempo (opzionale, in evoluzione)
patterns/log.md                                  → log cronologico di collegamenti cross-tema notati da Claude
```

## Regole per Claude Code

Vedi `CLAUDE.md` per le istruzioni operative complete (formato minute, regole di
aggiornamento temi, cosa fare e cosa NON fare).

## Stato

Progetto in fase di avvio (solo uso personale). Pensato per essere esteso ad altri
colleghi in futuro — la struttura non deve richiedere refactoring per diventare multi-utente.
