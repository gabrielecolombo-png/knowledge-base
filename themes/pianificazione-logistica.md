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

## Osservazioni aperte

- Per Danieli il dimensionamento non è percepito come tema critico (recuperano il giorno dopo); Davide vuole comunque inserirlo come leva nella presentazione per stimolare riflessione in Paola Riva — da verificare se questa è una tendenza comune o specifica di Danieli
- Il WMS di Danieli è SAP: l'integrazione tecnica non è ancora definita (API diretta vs estrazione); Comifar è l'unico precedente AWM con WMS — da consolidare il pattern tecnico quando Gabri analizza quella integrazione
