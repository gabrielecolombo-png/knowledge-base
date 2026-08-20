---
name: safety-compliance
description: Gestione della compliance safety per gli operatori: sorveglianza sanitaria, certificazioni, integrazione con Safety Solution
metadata:
  type: project
---

# Safety compliance

## Sintesi corrente

La gestione della compliance safety (sorveglianza sanitaria, certificazioni operative) nei clienti manifatturieri è affidata a software dedicati, tipicamente Safety Solution. In alcuni AS-IS compare ancora WinSpeed (software precedente) o nomi alternativi che in realtà corrispondono a Safety Solution — da verificare caso per caso. L'integrazione con AWM in questi contesti riguarda la visibilità delle certificazioni in fase di allocazione (es. un operatore non può essere assegnato a certe attività se la certificazione è scaduta).

## Meeting collegati

- 2026-06-05 [Danieli] Assessment Logistica (review interna) — confermato Safety Solution (non WinSpeed come compariva in una vecchia versione della presentazione); la compliance è il terzo punto di priorità nel TO-BE Danieli; l'integrazione Safety Solution compare nel 2B ma non nell'AS-IS — [meetings/danieli/2026-06-05-assessment-logistica.md]
- 2026-08-20 [Danieli] Allineamento roadmap AWM — corsi/visite mediche: soluzione concordata è assenze fittizie in VMS (tipo formazione/visita, non contano per assenteismo, bloccano l'optimizer); safety inserisce assenza "pianificata", capo turno conferma; test operativo Gabriele-Filippo martedì 25/08. Certificati: VMS importa da Zucchetti solo i record con certificato archiviato — da verificare se si perde il gap "corso fatto, certificato pendente"; precedente grave: Danieli ha perso un batch di certificati e ha dovuto rifare tutti i corsi — [meetings/danieli/2026-08-20-allineamento-roadmap-awm.md]

## Osservazioni aperte

- In AS-IS Danieli compariva anche "Mail HS" come software: sembra un nome legacy (vecchio sistema che stavano dismettendo) da eliminare dalla mappa — da confermare con Massi se è stato rimosso dalla presentazione finale.
- La compliance safety è citata dai clienti come tema prioritario (Danieli la mette sopra il dimensionamento in ordine di interesse) ma nel TO-BE il beneficio concreto dell'integrazione non è ancora articolato chiaramente — opportunità di rafforzare il business case.
- Logiche import certificati da verificare: VMS importa il record corso solo se il certificato è archiviato in Zucchetti Safety Solution. Ma l'ente certificatore terzo (es. per carrellisti, lavori elettrici) impiega fino a 60 giorni per emettere il certificato. Domanda aperta: VMS vede mai i record in stato "corso fatto, certificato pendente"? Se no, si perde visibilità su questo gap — rischio documentato (Danieli ha già perso un batch).
- Eventuale flag booleano "certificato presente" nel flusso Zucchetti→VMS: richiede customizzazione del transformer (servizio custom + logiche custom), più complesso del precedente custom sulle assenze. Da quotare se la verifica delle logiche di import lo rende necessario.
