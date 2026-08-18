---
date: 2026-06-05
client: Danieli
project: Assessment Logistica
attendees: [Davide Vinelli, Massimiliano Mazzucato, Gabriele Colombo]
themes: [pianificazione-logistica, zucchetti-integrazioni, skill-matrix-competenze, safety-compliance]
related_meetings: []
---

## Sintesi

Meeting interno AWM di revisione della presentazione assessment logistica per Danieli, prima della presentazione a Paola Riva. Massi ha ripreso la struttura dal vecchio assessment (Mazzucchetti), adattandola alla realtà Danieli. Davide ha guidato un'analisi critica delle slide AS-IS e TO-BE, spingendo a rendere più impattante la narrazione dei gap (soprattutto su allocazione e imprevisti) e a rendere i titoli "parlanti". Deciso di puntare alla presentazione in week 25 (~15-19 giugno 2026).

## Argomenti trattati

### AS-IS Logistica — criticità emerse

- **No dimensionamento formale**: le squadre sono fisse, definite a inizio anno, non calcolate su volumi/produttività. Per Danieli non è percepito come problema urgente (recuperano il giorno dopo), ma Davide vuole comunque inserire una slide dedicata come leva per la Paola Riva.
- **Allocazione mnemonica**: la riallocazione giornaliera dei "gioli" (operatori jolly) avviene a mente o al massimo su Excel. Non c'è una logica strutturata per prioritizzare su aree con minor polivalenza.
- **Sabati come buffer**: l'allocazione non ottimale genera ritardi coperti con sabati lavorativi a rotazione → extra costi straordinari concreti e quantificabili.
- **Ordini "urgenti" sistematici**: in realtà si tratta di ordini di manutenzione ricorrenti con priorità contrattuale, non veri imprevisti. Massi propone di chiamarli esplicitamente "ordini di manutenzione" anziché urgenti, per evidenziare la sistematicità e il valore di uno strumento di supporto.
- **Operatori sul palmare**: ricevono righe di prelievo dal WMS (SAP); il codice indica l'area, ma la conoscenza è largamente empirica (ogni operatore è "abituato" alla sua zona).
- **Gestione assenze**: oggi le richieste arrivano in AVM come pending, vengono approvate in Zucchetti Dipendenti, e la conferma torna in Workflow. Vogliono migrare questo flusso sulla app People.
- **Safety/certificazioni**: usano Safety Solution (non più WinSpeed — da correggere nella presentazione); rimane da chiarire la componente "Mail HS" che sembra un software legacy da eliminare dalla mappa.

### TO-BE — obiettivi e struttura proposta

Davide ha suggerito di riordinare i punti di miglioramento così:
1. Gestione frammentata (allocazione/dimensionamento)
2. Reazione agli imprevisti (ordini urgenti + assenze)
3. Compliance safety
4. Dimensionamento (come punto secondario/leva, non priorità principale)

Obiettivi operativi concordati:
- Dimensionamento automatico delle risorse a partire dal fabbisogno SAP (righe prelievo → organico)
- Strumento integrato per allocazione e riallocazione (non mnemonica)
- Skill Matrix digitalizzata, dinamica, usabile in fase di allocazione — identificata da Gabri come punto cardine
- Gestione reattiva degli imprevisti (trigger: ordini urgenti + assenze improvvise, separate come due input distinti)
- Integrazione Safety Solution per compliance certificazioni

### Integrazioni

- Tutto Zucchetti (confermato — aveva circolato l'idea di dismettere Zucchetti ma non se ne è fatto nulla)
- SAP come WMS (fonte fabbisogno per dimensionamento)
- Safety Solution per compliance/sorveglianza sanitaria
- App People per gestione richieste ferie/assenze (futuro)
- Da chiarire: integrazione con SAP — Comifar citato come unico precedente di integrazione AWM con WMS, da usare come riferimento tecnico

### Presentazione e qualità del lavoro

Davide ha introdotto come tema aziendale la necessità di passare a **titoli parlanti** nelle slide (non "AS-IS Gestione Risorse" ma "Allocazione genera X ore di straordinari / settimana"). Ha citato feedback esterni sul fatto che i titoli attuali dei deck AWM sono generici e non comunicano impatto. Proposto come esercizio interno da fare su questa presentazione come test.

## Decisioni prese

- Presentazione a Paola Riva in week 25 (~15-19 giugno 2026); Massi fissa data lunedì 8 giugno quando vede Paola
- Business case per ora bypassato (dati insufficienti)
- Gantt da accorciare rispetto al template generico (35 settimane): molte integrazioni già attive, scope ridotto
- Safety Solution rimane nel 2B come integrazione; WinSpeed e "Mail HS" eliminati dalla mappa AS-IS
- Separare il trigger riallocazione in due blocchi: (1) fabbisogno imprevisto/ordini urgenti, (2) assenza improvvisa

## Action item

| Owner | Cosa | Scadenza | Note |
|-------|------|----------|------|
| Massi | Correggere presentazione con feedback di questa sessione | Prima della presentazione | Vedi sezione argomenti trattati per dettagli puntuali |
| Massi | Preparare Gantt aggiornato (non generico) | ~10 giugno 2026 (metà settimana) | Davide lo rivede prima della presentazione |
| Massi | Fissare data presentazione con Paola Riva | Lunedì 8 giugno 2026 | Target: week 25 |
| Massi | Meeting Carpenteria (assessment) | Lunedì 8 giugno 2026 | Valutare se portare anche il secondo Massimiliano |
| Davide | Rivedere il Gantt quando Massi lo manda | Dopo ~10 giugno 2026 | |
| Davide | Scrivere a Sante e Giovanni | ASAP | Capire se passare da Pucciarelli per la quotazione |
| Gabri | Recuperare e studiare integrazione Comifar (SAP/WMS) | Prima della presentazione | Unico precedente AWM di integrazione con WMS |

## Criticità individuate

- L'allocazione mnemonica è il gap operativo centrale: nessuno strumento, nessuna logica strutturata → ore perse + extra costi straordinari
- Skill Matrix su carta/Excel non è usabile in real-time per le decisioni di allocazione (problema di strumento, non di processo)
- Il flusso assenze (AVM → Zucchetti → Workflow) va verificato e aggiornato nella presentazione per riflettere il piano People app
- Integrazione SAP non ancora definita tecnicamente: da chiarire il pattern (API diretta vs estrazione)

## Prossimi passi

- Lunedì 8 giugno: meeting Carpenteria con Massi (+ eventuale secondo Massimiliano)
- Metà settimana (circa 10 giugno): Massi porta Gantt aggiornato
- Week 25 (~15-19 giugno): presentazione assessment logistica a Paola Riva
