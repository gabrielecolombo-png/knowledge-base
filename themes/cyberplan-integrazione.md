---
name: cyberplan-integrazione
description: Integrazione VMS-Cyberplan in sostituzione di Diana; timing del flusso integrativo rispetto al go-live SAP/Cyberplan (1 gennaio 2027)
metadata:
  type: project
---

# Cyberplan integrazione

## Sintesi corrente

Cyberplan è il sistema di schedulazione avanzata a cui AWM si integra, finora per due clienti: Danieli (sostituirà Diana/One World al go-live SAP, 1 gennaio 2027) e SALF (implementato da EY come partner). Il pattern architetturale di base: due flussi separati inviati da Cyberplan — flusso macchine (calendari per macchina specifica → mappa su task in AVM) e flusso gruppi/CDL (calendari con numerosità di macchine da attivare → mappa su CDL in AVM), unificati lato AWM in un loader unico che discrimina i record in base alla presenza del codice macchina (per gestire il concetto di Horizon Cyberplan, che può far cambiare modalità a uno stesso CDL nel tempo). In Danieli il tema principale aperto è il timing rispetto al go-live SAP. In SALF il tema principale è invece un pattern di customizzazione diverso: alcuni centri di lavoro hanno macchine utilizzabili in parallelo e una risorsa alternativa (robot vs carrello manuale) la cui scelta è decisa post-schedulazione via script, non come vincolo Cyberplan; la soluzione individuata è concatenare questa informazione nel codice del centro di lavoro esportato, mappato lato AWM tramite pattern→layout, restando così dentro la logica del loader standard con sola configurazione aggiuntiva.

## Meeting collegati

- 2026-08-20 [Danieli] Allineamento roadmap AWM — primo affioramento del tema nell'archivio; discusso il timing (ottobre/novembre vs. dopo il live); confermato switch-off netto Diana→SAP (da verificare nel progetto SAP — Paola non ne era certa); piano B: partire solo con flusso calendario; decisione rinviata alla call con Cyberplan di settembre — [meetings/danieli/2026-08-20-allineamento-roadmap-awm.md]
- 2026-08-24 [interno] Cyberplan integrazione standard — analisi tecnica approfondita del concetto di Horizon (FCS/FCP, configurazione per istanza vs CDL); identificato il problema strutturale dei due flussi separati con l'Horizon per CDL; decisione: loader unificato con discriminante codice-macchina vs. numerosità; risolti anche i problemi di autenticazione API (rinomina utenti post-migrazione tenant) — [meetings/interno/2026-08-24-cyberplan-integrazione-standard.md]
- 2026-09-16 [SALF] Check integrazione dati Cyberplan-AWM (standard vs custom) — secondo cliente Cyberplan (via EY come implementation partner); introduce il caso di centri di lavoro con macchine in parallelo (campo custom "numero risorse") e l'alternativa robot/carrello manuale decisa post-schedulazione via script; soluzione: concatenare l'info nel codice del centro di lavoro esportato, mappato lato AWM su pattern→layout, restando dentro il loader standard con sola configurazione aggiuntiva; target go-live Live 1 (MRP+FCP) a metà novembre 2026, integrazione da avere pronta prima — [meetings/salf/2026-09-16-check-integrazione-cyberplan-awm.md]

## Osservazioni aperte

- Diana muore con One World → SAP: switch-off netto senza fase di affiancamento (Paola ha indicato questa modalità ma non ne è certa — Gabriele è preoccupato, ha visto switch-off netti causare problemi in precedenza). Da verificare nel piano di progetto SAP.
- Il precedente di doversi schiantare con flussi integrativi costruiti su sistemi non ancora live è già accaduto internamente in AWM (citato da Gabriele nel meeting) — da tenere presente come rischio documentato nella decisione di timing.
- Piano B discusso ma non deciso: partire solo con il flusso calendario (più stabile, modello dati difficilmente cambia) e aggiungere il flusso operazioni dopo che Cyberplan si è stabilizzato post-live.
- Precedente comunicazione con Cyberplan (maggio-giugno 2026): loro stessi hanno detto di essere "abbastanza stabili" e hanno suggerito di risentirsi a settembre per schedulare l'attività.
- Il loader unificato richiede un flag interno per distinguere il comportamento "task" (numerosità applicata a ogni task del CDL) vs. "gruppo" (numerosità = quanti task attivare in ordine di layout). Logica decisa in linea di massima il 24-08 ma non ancora implementata — da verificare nel dettaglio tecnico con Emilio.
- Vincolo configurativo da formalizzare per i clienti: il numero di task per CDL in AVM deve corrispondere al numero di macchine del gruppo Cyberplan corrispondente. Se Cyberplan configura un gruppo con 5 presse e AVM ha 3 task per quel CDL, la logica di attivazione "primi N" produce risultati errati. Non c'è ancora un meccanismo di validazione automatica.
- Matteo Belullo è il contatto esterno che sta testando le API. Gabriele gli risponderà il 24-08 su auth+endpoint.
- SALF (2026-09-16): nessun ambiente di test Cyberplan dedicato lato cliente (solo l'ERP ne ha uno) — i test dell'integrazione si appoggeranno a export/script provvisori forniti da EY.
- SALF (2026-09-16): non è del tutto confermato se la soluzione di concatenazione codice-centro-di-lavoro sia condivisa anche da Marco Mior (Cyberplan) oltre che da EY e AWM — da verificare quando arriva l'export di esempio (atteso 17/09).
