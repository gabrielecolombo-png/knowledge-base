---
name: gestione-ferie-assenze
description: Uso delle ferie programmate in VMS come dato per forecast di budget (controllo di gestione) e per pianificazione operativa; gap tra dato previsionale VMS e consuntivo Zucchetti
metadata:
  type: project
---

# Gestione ferie assenze

## Sintesi corrente

Il controllo di gestione Danieli fa il budget delle ore produttive per reparto usando percentuali storiche da Zucchetti (consuntivo disponibile dal 16 del mese successivo). Il punto critico è il forecast: quando il budget viene fatto ad aprile, VMS ha già le ferie programmate per l'estate con buona precisione — ma il CdG non le usa. La proposta è estrarre le ferie programmate da VMS (in ore, per reparto/macchina) per alimentare il forecast al posto delle stime storiche, più affidabili per anni con calendari atipici (es. poche festività → più giorni lavorabili → percentuale storica ferie non applicabile). Il dato VMS è già lì: i capi reparto machining/gears hanno fornito al CdG le turnistiche estive già "depurate" dalle ferie concesse, segno che le ferie erano già state inserite e conteggiate in VMS.

## Meeting collegati

- 2026-08-20 [Danieli] Allineamento roadmap AWM — emerge la necessità del CdG (Mattia) di usare le ferie VMS nel forecast di budget; metodologia attuale: percentuali storiche Zucchetti; Gabriele si sentirà con Mattia direttamente per capire come estrarre il dato; eventuale abilitazione utenza VMS a Mattia — [meetings/danieli/2026-08-20-allineamento-roadmap-awm.md]

## Osservazioni aperte

- Mattia Canever è il referente CdG Danieli per questa richiesta.
- Il DVH (data warehouse AWM) è la soluzione ideale a lungo termine per dare accesso ai dati analitici a più funzioni aziendali, ma non è ancora attivo in Danieli — da monitorare quando si apre questo workstream.
- Esiste un potenziale disallineamento tra il dato ferie in VMS (programmato, aggiornato man mano) e quello in Zucchetti (consuntivo storico): chi è responsabile della riconciliazione se le due fonti divergono? Tema di governance non ancora discusso.
