# dashboard-bi-custom

## Sintesi corrente
Le dashboard BI custom (Power BI su DVH) costruite da Delivery su richiesta cliente stanno diventando una linea di offerta commerciale a sé, non solo un deliverable ad hoc. Il modello in discussione è un pacchetto a soglia (10k on top fino a 10 dashboard, poi incremento di canone) pensato per bilanciare l'effort ricorrente che le dashboard generano sul service desk, con una narrativa verso il cliente centrata sui costi di manutenzione/DVH piuttosto che sull'effort reale di delivery (2-12 giornate). Le dashboard sono considerate anche un asset riusabile/embeddabile a costo marginale quasi nullo, il che rende il catalogo stesso una leva di scalabilità.

## Meeting collegati
- 2026-09-18 [interno] Dashboard BI custom - modello commerciale — ha definito il modello di pricing a pacchetto, la narrativa commerciale, la stima di effort differenziata per complessità/criticità, e discusso due casi concreti (BH, Sediver) — [meetings/interno/2026-09-18-dashboard-bi-custom-commerciale.md](../meetings/interno/2026-09-18-dashboard-bi-custom-commerciale.md)

## Osservazioni aperte
- Alcuni KPI richiesti dai clienti (es. "unexpected", "freestaff" per BH) non esistono come dati nativi in DVH né in AVM, sono calcolati a frontend in VM — punto tecnico da risolvere caso per caso quando emergono richieste simili.
- Non è ancora chiaro con quale cadenza/processo si aggiornerà la soglia di pricing (10k / 10 dashboard) se il volume di richieste cresce più del previsto — da rivedere quando ci sarà un primo storico di vendite.
- Tensione irrisolta tra efficienza di sviluppo AI-assisted e rischio di percezione di minor valore da parte del cliente se lo stile risulta riconoscibile — nessuna linea guida concreta decisa oltre "non dirlo al cliente".
