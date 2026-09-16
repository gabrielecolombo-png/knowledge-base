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
- 2026-08-20 [Danieli] Allineamento roadmap AWM — AWM People/Z Connect: il blocco è che Danieli non ha Z Connect attivo (motivo storico: abilitava la timbratura da telefonino); 150 utenti inclusi in licenza, proposta 20 utenti pilota; Gabriele sblocca con Davide la settimana del 25/08; alternativa: AWM People standalone senza Z Connect — [meetings/danieli/2026-08-20-allineamento-roadmap-awm.md]
- 2026-09-16 [Veneta Cucine] Integrazione Winsarp: tracciati dati — walkthrough dei tracciati JSON standard per anagrafiche (chiave = codice fiscale, non matricola, per via di duplicati), timbrature (batch 24h, campi obbligatori CID/timestamp/direzione) e assenze (flusso solo in ingresso per ora, holiday key lasciata vuota in attesa del flusso di ritorno); obiettivo attivare senza sviluppo se la struttura rientra nello standard dei connettori. Confermato: Winsarp è un sistema terzo, non un modulo Zucchetti — vedi Osservazioni aperte per come questo incide sulla classificazione del tema — [meetings/veneta-cucine/2026-09-16-integrazione-winsarp-tracciati-dati.md]

## Osservazioni aperte

- L'integrazione SAP per il WMS è l'unica non standardizzata: Comifar è l'unico precedente e usa estrazione Excel (non API diretta). Per Danieli si punta a una connessione SAP nativa, ma il pattern tecnico va ancora definito.
- Il flusso assenze Danieli (AVM → Zucchetti → Workflow) potrebbe cambiare con l'introduzione dell'app People: da tenere aggiornato quando si concretizza.
- Z Connect in Danieli: Paola indica che in passato non fu adottata perché abilitava la timbratura da telefonino (indesiderata). Da verificare se è possibile adottarla con questa funzione disabilitata — Gabriele non lo sa, bisogna sentire il referente tecnico Zucchetti (Pucciarelli). La catena di sblocco è lenta: Davide non ha ancora risposto a Paola nonostante solleciti.
- Veneta Cucine (2026-09-16): confermato da Gabriele che Winsarp è un sistema di terze parti, non un modulo Zucchetti. È comunque taggato in questo tema perché il pattern di integrazione (connettori standard AWM per anagrafiche/timbrature/assenze) è lo stesso già visto per i clienti Zucchetti — di fatto questo tema copre più in generale "integrazioni AWM ↔ sistemi HR/presenze esterni", non solo Zucchetti in senso stretto. Se in futuro si accumulano altri clienti con sistemi terzi non-Zucchetti, valutare se rinominare il tema per riflettere questo scope più ampio.
- Veneta Cucine (2026-09-16): stesso problema di riconciliazione già osservato concettualmente nel flusso assenze Danieli — quando un'assenza può nascere sia lato cliente sia lato AWM, serve una chiave condivisa (holiday key) per riconoscerla come lo stesso record; per Veneta Cucine la soluzione è ancora da definire (si parte solo con il flusso in un verso).
