---
date: 2026-08-19
client: oringone
project: P01_OringONE
attendees: [Giovanni Conz, Emilio Bendotti, Gabriele Colombo]
themes: [modello-prodotto-custom]
related_meetings: []
---

## Sintesi
Meeting strategico interno AVM per decidere l'ownership dello sviluppo custom per il progetto OringONE. Si discutono due scenari — A (tutto passa da Prodotto) e B (Delivery/partner sviluppano custom in autonomia, Prodotto presidia solo il perimetro) — e si converge su B come direzione strategica, usando OringONE come sperimentazione. Carlo D'Avanzo viene identificato come figura tattica: compensa l'immatirità architetturale attuale grazie alle sue competenze tecniche, agendo de facto come "consulente di delivery del futuro". Azzurro (partner esterno) viene escluso dall'ownership del custom.

## Argomenti trattati

**Scenario A — centralismo su Prodotto**
Delivery raccoglie le specifiche delle customizzazioni, Prodotto le supervisiona, pettina e inserisce nella pipeline unica verso tech. Le cose di prodotto seguono il percorso standard (design sprint, divergenza, convergenza). Pro: più garanzie di coerenza. Contro: collo di bottiglia su Prodotto, lentezza, Prodotto deve ragionare su domini che non sempre conosce. Carlo D'Avanzo in questo schema varrebbe come capacity aggiuntiva del team tech.

**Scenario B — autonomia di Delivery/partner sul custom**
Prodotto presidia il perimetro e i check (iniziale sul perimetro, finale sulla qualità prima dell'integrazione), ma non sviluppa le customizzazioni. Delivery o partner le sviluppano in autonomia usando un harness/infrastruttura abilitante. Pro: scalabile, capacità aggiuntiva, non intasa Prodotto. Contro: richiede un'architettura tecnica matura (harness di sviluppo, standard di qualità, validazione), che oggi non c'è. Carlo D'Avanzo in questo schema vale come "consulente di delivery avanzato" che compensa l'immatirità strutturale con competenza tecnica propria.

**Decisione di direzione**
Consenso su B come scenario a cui tendere. OringONE diventa la sperimentazione pratica. La logica: la dicotomia prodotto/custom che era totale ("o prendi il prodotto o prendi il progetto") diventa un modello ibrido, abilitato dall'AI, che rende le customizzazioni sostenibili senza cannibalizzare il team di prodotto.

**Perimetro custom OringONE**
Giovanni ha chiarito la semplicità del problema core: sequenziazione ordini per data di consegna invece che data di ricezione (sort by date, non algoritmo complesso). In più: schermata delta materiale (giacenze vs ordini aperti). Gabriele ha espresso scetticismo sulla semplicità reale del perimetro — si intuisce che mancano specifiche scritte dettagliate e un'analisi diretta col cliente.

**Ferrari**
Accennato brevemente: altro cliente con esigenza simile (modulo timesheet, già sviluppato in passato ma con architettura problematica). Probabile prossimo progetto dello stesso tipo. Nessuna decisione presa.

## Decisioni prese
- Esternalizzazione ad Azzurro: esclusa
- Direzione strategica: scenario B, Delivery/partner sviluppano custom in autonomia con check di Prodotto
- Carlo D'Avanzo: coinvolto nel progetto OringONE come figura tecnica ibrida (ruolo consulente di delivery avanzato)
- Team di progetto: Giovanni Conz + Gabriele Colombo + Carlo D'Avanzo; altri profili (Alberto, Stefano) da valutare per raccolta specifiche
- Team tech: piccolo effort necessario per costruire l'harness e abilitare i servizi per Carlo D'Avanzo

## Action item
| Owner | Cosa | Scadenza | Note |
|-------|------|----------|------|
| Giovanni Conz | Coinvolgere Carlo D'Avanzo sul progetto (briefing al rientro) | settimana del 26/08/2026 | |
| Giovanni Conz + Gabriele Colombo | Deep dive sulle specifiche OringONE | settimana del 26/08/2026 | "accendere la luce" sul perimetro reale |
| Team Delivery | Valutare chi affiancare a Gabriele (Alberto? Stefano?) | da definire | per raccolta specifiche, non solo parte tech |
| Emilio Bendotti | Quantificare effort tech per harness/abilitazione servizi | da definire | Elena coordinerà cosa spostare |
| Gabriele Colombo | Monitorare sviluppi Ferrari (Vinelli) | da definire | possibile prossimo progetto simile |

## Criticità individuate
- Il perimetro custom OringONE non è ancora ben definito — specifiche scritte incomplete, nessuno tranne Giovanni è stato dal cliente. Rischio di scoprire complessità nascoste.
- L'architettura tecnica per abilitare lo sviluppo custom autonomo non esiste ancora — Carlo D'Avanzo è una soluzione tattica che maschera questa immatirità strutturale.
- Ferrari apre un secondo fronte potenzialmente simile ma non pianificato: modulo timesheet con architettura legacy problematica.

## Prossimi passi
- Giovanni + Gabriele: sessione di approfondimento specifiche OringONE entro fine agosto 2026
- Giovanni: briefing a Carlo D'Avanzo al rientro
- Team delivery: identificare secondo consulente per affiancamento raccolta specifiche
- Team tech: stimare effort harness

## Note di elaborazione
- Alice e Ele erano presenti al meeting ma con microfono spento: i loro eventuali contributi risultano attribuiti a Gabriele o Giovanni nella trascrizione automatica. Non è possibile ricostruire cosa abbiano detto con certezza.
- Il perimetro del custom OringONE è descritto con sicurezza da Giovanni (sort by date + delta giacenze) ma con scetticismo da Gabriele — non è chiaro se ci sia un documento di specifiche già redatto o solo una comprensione verbale di Giovanni dalla visita cliente. Da confermare nel deep dive della settimana del 26/08.
