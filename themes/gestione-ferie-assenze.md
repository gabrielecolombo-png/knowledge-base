---
name: gestione-ferie-assenze
description: Uso delle ferie programmate in VMS come dato per forecast di budget (controllo di gestione) e per pianificazione operativa; gap tra dato previsionale VMS e consuntivo Zucchetti
metadata:
  type: project
---

# Gestione ferie assenze

## Sintesi corrente

Questo tema copre due filoni distinti legati alla gestione dati di ferie/assenze. (1) Danieli: il controllo di gestione fa il budget delle ore produttive per reparto usando percentuali storiche da Zucchetti (consuntivo disponibile dal 16 del mese successivo); il punto critico è il forecast, perché VMS ha già le ferie programmate in anticipo con buona precisione ma il CdG non le usa ancora — proposta di estrarle da VMS per alimentare il forecast. (2) Veneta Cucine: integrazione/sync delle assenze tra Winsarp — il sistema presenze di terze parti del cliente — e AWM: un push non ancora completamente attivo, un problema di formato dato (intervallo vs durata) già risolto, e un tema aperto di riconciliazione quando il flusso diventerà bidirezionale. I due filoni condividono la criticità di fondo che il dato ferie/assenze vive in più sistemi che possono disallinearsi.

## Meeting collegati

- 2026-08-20 [Danieli] Allineamento roadmap AWM — emerge la necessità del CdG (Mattia) di usare le ferie VMS nel forecast di budget; metodologia attuale: percentuali storiche Zucchetti; Gabriele si sentirà con Mattia direttamente per capire come estrarre il dato; eventuale abilitazione utenza VMS a Mattia — [meetings/danieli/2026-08-20-allineamento-roadmap-awm.md]
- 2026-09-16 [Veneta Cucine] Integrazione Winsarp: tracciati dati — filone diverso da Danieli (non è forecast di budget ma sync operativa assenze cliente↔AWM): push assenze verso AWM non ancora attivo/verificato, problema storico di formato dato (assenze come intervallo orario invece che durata) già risolto a giugno 2026, proposta di sync a finestra mobile (~-10/+180gg) con refresh frequente, e nodo aperto sulla riconciliazione (holiday key) quando il flusso diventerà bidirezionale — [meetings/veneta-cucine/2026-09-16-integrazione-winsarp-tracciati-dati.md]

## Osservazioni aperte

- Mattia Canever è il referente CdG Danieli per la richiesta di forecast da VMS.
- Il DVH (data warehouse AWM) è la soluzione ideale a lungo termine per dare accesso ai dati analitici a più funzioni aziendali, ma non è ancora attivo in Danieli — da monitorare quando si apre questo workstream.
- Esiste un potenziale disallineamento tra il dato ferie in VMS (programmato, aggiornato man mano) e quello in Zucchetti (consuntivo storico): chi è responsabile della riconciliazione se le due fonti divergono? Tema di governance non ancora discusso.
- Veneta Cucine: Winsarp non sembra mantenere uno storico delle cancellazioni delle richieste di assenza (elimina il record) — rischio contestazioni dipendenti su richieste "sparite"; nessuna soluzione condivisa ancora.
- Da valutare se in futuro i due filoni (forecast Danieli vs sync Veneta Cucine) meritino di essere separati in temi distinti: per ora restano insieme perché entrambi sotto l'ombrello "gestione ferie/assenze", ma l'ambito tecnico è diverso (analytics/forecast vs integrazione dati operativa).
