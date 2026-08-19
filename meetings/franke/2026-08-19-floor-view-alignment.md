---
date: 2026-08-19
client: Franke Poland
project: Floor View
attendees: [Gabriele Colombo, Alicja Dębek]
themes: [floor-view]
related_meetings: []
---

## Sintesi

Meeting di allineamento su scope e stato di avanzamento del modulo Floor View. Alicja ricordava che in una demo precedente (tenuta da Elena) fosse stata mostrata la possibilità di navigare dal Floor View verso impostazioni/dipendenti per fare modifiche; Gabriele ha chiarito che Floor View è un monitoring tool puro e non consente azioni di planning. Il meeting ha anche generato una feature request (shortcut dai conflitti verso AWM) e definito il calendario degli incontri fino alla consegna del prototipo a fine settembre.

## Argomenti trattati

- Chiarimento scope Floor View: monitoring only — visualizzazione conflitti con severity, tipo, operatore, posizione, ma nessuna azione di planning eseguibile da questa vista
- Revisione del mockup HTML (inviato da Daniela a fine giugno): confermato come rappresentativo del prodotto finale, con eventuali differenze solo estetiche (font, colori)
- Separazione di responsabilità: per modificare la pianificazione di un operatore la vista corretta è Flex View, non Floor View
- Feature request di Alicja: shortcut/link diretto da un conflitto in Floor View alla pagina AWM dove risolvere il conflitto, per evitare la ricerca manuale della stazione/dipendente
- Stato sviluppo: testing pesante in corso; connessione AWM↔AWS (lettura alerts) in fase di implementazione; pagina di configurazione completata (upload planimetria + overlay task AWM); monitoring view costruita ma non ancora connessa ad AWS
- Cadenza sprint: uno ogni tre settimane — meeting settimanale non aggiunge valore tra uno sprint e l'altro
- Calendario prossimi meeting: 2026-08-25 10:30 (demo progresso), inizio settembre (review), fine settembre (prototipo pronto)

## Decisioni prese

- Floor View rimane monitoring-only: nessuna azione di planning da questa vista, scelta di design consolidata
- Feature request shortcut: Gabriele verifica fattibilità tecnica (dubbia — i link AWM sono generati dinamicamente all'apertura della pagina)
- Prossimo meeting fissato per 2026-08-25 alle 10:30; invito inviato a Alicja e Yaz durante la call

## Action item

| Owner | Cosa | Scadenza | Note |
|-------|------|----------|------|
| Gabriele | Verificare fattibilità shortcut da conflitto Floor View → pagina AWM specifica | TBD | Probabilmente non fattibile per come sono generati i link AWM; chiedere al team tecnico |
| Gabriele | Chiedere a Elena cosa fu effettivamente mostrato nella demo originale | TBD | Alicja ricorda interattività che Gabriele esclude — da chiarire prima del prossimo meeting |
| Alicja | Recuperare email/specifica di Elena con la demo originale per verificare | TBD | Se trova qualcosa lo manda a Gabriele via email |

## Criticità individuate

- Disallineamento di aspettative su Floor View: Alicja e almeno un'altra persona in Franke ricordano una demo di Elena in cui Floor View sembrava interattivo (navigazione verso settings/dipendenti per modifiche). Gabriele è convinto che non sia mai stato mostrato nulla del genere. La questione rimane aperta fino a quando Alicja non recupera la documentazione originale — potrebbe indicare un problema nella comunicazione delle specifiche durante la fase pre-vendita.

## Prossimi passi

- 2026-08-25 10:30: demo del progresso corrente (configurazione + monitoring view in testing)
- Inizio settembre: review avanzamento
- Fine settembre 2026: consegna prototipo per uso diretto

## Note di elaborazione

- "Yaz" e "Yk" menzionati nella call come persone da invitare al meeting di demo — non è chiaro il cognome o il ruolo. "Yk" sembra in ferie. Da identificare in comunicazioni future.
