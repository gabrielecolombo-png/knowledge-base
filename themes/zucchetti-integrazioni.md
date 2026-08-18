---
name: zucchetti-integrazioni
description: Integrazioni tecniche tra la piattaforma AWM e Zucchetti (HR, Workflow, Dipendenti) e i sistemi terzi connessi (SAP, Safety Solution, app People)
metadata:
  type: project
---

# Zucchetti integrazioni

## Sintesi corrente

Zucchetti è la piattaforma HR di riferimento per i clienti AWM: Workflow per le approvazioni, Dipendenti per l'anagrafica e le assenze, con integrazioni già attive in molti clienti. Le integrazioni nuove da costruire variano per cliente ma seguono uno schema ricorrente: anagrafica, assenze/presenze, e — nei contesti logistica — WMS (tipicamente SAP). In alcuni clienti era circolata l'ipotesi di dismettere Zucchetti, ma non si è concretizzata. L'integrazione WMS/SAP è la meno standardizzata e richiede analisi caso per caso (riferimento tecnico: integrazione Comifar).

## Meeting collegati

- 2026-06-05 [Danieli] Assessment Logistica (review interna) — confermato che Danieli usa tutto Zucchetti (aveva considerato di dismettere ma non l'ha fatto); integrazioni da attivare: SAP (WMS), Safety Solution; flusso assenze oggi: AVM pending → approva in Zucchetti Dipendenti → conferma in Workflow; futuro: app People per richieste ferie — [meetings/danieli/2026-06-05-assessment-logistica.md]

## Osservazioni aperte

- L'integrazione SAP per il WMS è l'unica non standardizzata: Comifar è l'unico precedente e usa estrazione Excel (non API diretta). Per Danieli si punta a una connessione SAP nativa, ma il pattern tecnico va ancora definito.
- Il flusso assenze Danieli (AVM → Zucchetti → Workflow) potrebbe cambiare con l'introduzione dell'app People: da tenere aggiornato quando si concretizza.
