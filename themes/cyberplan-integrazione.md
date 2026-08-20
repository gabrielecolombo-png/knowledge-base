---
name: cyberplan-integrazione
description: Integrazione VMS-Cyberplan in sostituzione di Diana; timing del flusso integrativo rispetto al go-live SAP/Cyberplan (1 gennaio 2027)
metadata:
  type: project
---

# Cyberplan integrazione

## Sintesi corrente

Cyberplan è il sistema di schedulazione che sostituirà Diana (alimentata da One World) quando partirà SAP (go-live previsto 1 gennaio 2027 in Danieli). L'integrazione VMS-Cyberplan è strutturata in due flussi distinti: flusso calendario (dati di base, strutturalmente più stabile) e flusso operazioni/piano macchine (work order per macchina, più soggetto a variazioni pre-live). Il timing dell'integrazione è in discussione: AWM vorrebbe partire tra ottobre e novembre per essere pronti al 1 gennaio, ma c'è il rischio di dover rifare i flussi se Cyberplan cambia configurazione prima del live — rischio già materializzato in passato con un sistema analogo. Call con Cyberplan prevista a settembre 2026 per decidere.

## Meeting collegati

- 2026-08-20 [Danieli] Allineamento roadmap AWM — primo affioramento del tema nell'archivio; discusso il timing (ottobre/novembre vs. dopo il live); confermato switch-off netto Diana→SAP (da verificare nel progetto SAP — Paola non ne era certa); piano B: partire solo con flusso calendario; decisione rinviata alla call con Cyberplan di settembre — [meetings/danieli/2026-08-20-allineamento-roadmap-awm.md]

## Osservazioni aperte

- Diana muore con One World → SAP: switch-off netto senza fase di affiancamento (Paola ha indicato questa modalità ma non ne è certa — Gabriele è preoccupato, ha visto switch-off netti causare problemi in precedenza). Da verificare nel piano di progetto SAP.
- Il precedente di doversi schiantare con flussi integrativi costruiti su sistemi non ancora live è già accaduto internamente in AWM (citato da Gabriele nel meeting) — da tenere presente come rischio documentato nella decisione di timing.
- Piano B discusso ma non deciso: partire solo con il flusso calendario (più stabile, modello dati difficilmente cambia) e aggiungere il flusso operazioni dopo che Cyberplan si è stabilizzato post-live.
- Precedente comunicazione con Cyberplan (maggio-giugno 2026): loro stessi hanno detto di essere "abbastanza stabili" e hanno suggerito di risentirsi a settembre per schedulare l'attività.
