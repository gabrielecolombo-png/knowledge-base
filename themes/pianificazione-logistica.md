---
name: pianificazione-logistica
description: Gestione della pianificazione operativa in contesti logistica/magazzino: dimensionamento risorse, allocazione operatori, riallocazione in caso di imprevisti
metadata:
  type: project
---

# Pianificazione logistica

## Sintesi corrente

Nei clienti manifatturieri con operazioni di magazzino/logistica, il processo di pianificazione delle risorse è tipicamente manuale e frammentato: il dimensionamento avviene una volta all'anno in modo empirico (squadra fissa), l'allocazione giornaliera è mnemonica, e la riallocazione in caso di imprevisti o ordini urgenti viene gestita a mente o su Excel. Il risultato è l'utilizzo dei sabati lavorativi come buffer, con costi extra da straordinari. Il valore di AWM in questo contesto è fornire uno strumento integrato che legga il fabbisogno dal WMS (SAP) e supporti dimensionamento, allocazione e reazione agli imprevisti.

## Meeting collegati

- 2026-06-05 [Danieli] Assessment Logistica (review interna) — primo assessment su logistica: emerge il pattern allocazione mnemonica + sabati come buffer, ordini di manutenzione sistematici erroneamente classificati come urgenti, assenza di dimensionamento formale — [meetings/danieli/2026-06-05-assessment-logistica.md]
- 2026-08-20 [Danieli] Allineamento roadmap AWM — confermata la sequenza di adozione per reparto; assessment montaggi da calendarizzare a settembre (seconda settimana); carpenteria va avanti, logistica ancora ferma per mancanza di carico; adoption montaggi stimata marzo 2027 post-SAP — [meetings/danieli/2026-08-20-allineamento-roadmap-awm.md]

## Osservazioni aperte

- Per Danieli il dimensionamento non è percepito come tema critico (recuperano il giorno dopo); Davide vuole comunque inserirlo come leva nella presentazione per stimolare riflessione in Paola Riva — da verificare se questa è una tendenza comune o specifica di Danieli
- Il WMS di Danieli è SAP: l'integrazione tecnica non è ancora definita (API diretta vs estrazione); Comifar è l'unico precedente AWM con WMS — da consolidare il pattern tecnico quando Gabri analizza quella integrazione
- Montaggio Danieli: reparto "centro uomo" (non schedulazione macchine), il capo montaggio è convinto ma l'adoption è condizionata al go-live SAP (1 gennaio 2027) — adoption AWM stimata marzo 2027, stesso pattern visto per l'officina (assessment settembre → primo uso gennaio → vera adoption marzo)
- Logistica Danieli ancora ferma: non ha un carico di fatto, finché SAP non porta il WMS il valore AWM è limitato — non si sblocca prima del go-live SAP
