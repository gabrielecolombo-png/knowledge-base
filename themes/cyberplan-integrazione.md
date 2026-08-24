---
name: cyberplan-integrazione
description: Integrazione VMS-Cyberplan in sostituzione di Diana; timing del flusso integrativo rispetto al go-live SAP/Cyberplan (1 gennaio 2027)
metadata:
  type: project
---

# Cyberplan integrazione

## Sintesi corrente

Cyberplan è il sistema di schedulazione che sostituirà Diana (alimentata da One World) quando partirà SAP (go-live previsto 1 gennaio 2027 in Danieli). L'integrazione tecnica è strutturata su due flussi separati inviati da Cyberplan: flusso macchine (calendari per macchina specifica → mappa su task in AVM) e flusso gruppi/CDL (calendari con numerosità di macchine da attivare → mappa su CDL in AVM). Il concetto di Horizon di Cyberplan — un orizzonte temporale configurabile per istanza o per singolo CDL — complica questa separazione: oltre l'orizzonte, uno stesso CDL smette di inviare codici macchina e inizia a inviare solo numerosità, rendendo i due flussi separati incompatibili se un CDL cambia modalità nel tempo. L'approccio tecnico deciso (24 agosto) è un loader unificato che discrimina i record in ingresso: se presente il codice macchina → task, se presente solo numerosità → CDL. Cyberplan non modifica nulla dalla sua parte. Il timing dell'implementazione rispetto al go-live SAP (1 gennaio 2027) è ancora in discussione; call con Cyberplan prevista a settembre 2026.

## Meeting collegati

- 2026-08-20 [Danieli] Allineamento roadmap AWM — primo affioramento del tema nell'archivio; discusso il timing (ottobre/novembre vs. dopo il live); confermato switch-off netto Diana→SAP (da verificare nel progetto SAP — Paola non ne era certa); piano B: partire solo con flusso calendario; decisione rinviata alla call con Cyberplan di settembre — [meetings/danieli/2026-08-20-allineamento-roadmap-awm.md]
- 2026-08-24 [interno] Cyberplan integrazione standard — analisi tecnica approfondita del concetto di Horizon (FCS/FCP, configurazione per istanza vs CDL); identificato il problema strutturale dei due flussi separati con l'Horizon per CDL; decisione: loader unificato con discriminante codice-macchina vs. numerosità; risolti anche i problemi di autenticazione API (rinomina utenti post-migrazione tenant) — [meetings/interno/2026-08-24-cyberplan-integrazione-standard.md]

## Osservazioni aperte

- Diana muore con One World → SAP: switch-off netto senza fase di affiancamento (Paola ha indicato questa modalità ma non ne è certa — Gabriele è preoccupato, ha visto switch-off netti causare problemi in precedenza). Da verificare nel piano di progetto SAP.
- Il precedente di doversi schiantare con flussi integrativi costruiti su sistemi non ancora live è già accaduto internamente in AWM (citato da Gabriele nel meeting) — da tenere presente come rischio documentato nella decisione di timing.
- Piano B discusso ma non deciso: partire solo con il flusso calendario (più stabile, modello dati difficilmente cambia) e aggiungere il flusso operazioni dopo che Cyberplan si è stabilizzato post-live.
- Precedente comunicazione con Cyberplan (maggio-giugno 2026): loro stessi hanno detto di essere "abbastanza stabili" e hanno suggerito di risentirsi a settembre per schedulare l'attività.
- Il loader unificato richiede un flag interno per distinguere il comportamento "task" (numerosità applicata a ogni task del CDL) vs. "gruppo" (numerosità = quanti task attivare in ordine di layout). Logica decisa in linea di massima il 24-08 ma non ancora implementata — da verificare nel dettaglio tecnico con Emilio.
- Vincolo configurativo da formalizzare per i clienti: il numero di task per CDL in AVM deve corrispondere al numero di macchine del gruppo Cyberplan corrispondente. Se Cyberplan configura un gruppo con 5 presse e AVM ha 3 task per quel CDL, la logica di attivazione "primi N" produce risultati errati. Non c'è ancora un meccanismo di validazione automatica.
- "Bello" (contatto esterno che sta testando le API): identità non chiara dalla trascrizione del 24-08. Gabriele si riferisce a lui come destinatario della comunicazione su auth+endpoint — da chiarire se è un contatto Cyberplan o di un cliente.
