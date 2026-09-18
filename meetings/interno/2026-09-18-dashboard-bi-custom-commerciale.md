---
date: 2026-09-18
client: interno
project: Dashboard BI custom - modello commerciale
attendees: [Massimiliano Mazzucato, Anna Roncato, Gabriele Colombo, Arianna Azzi, Davide Vinelli, Daniele Duca]
themes: [dashboard-bi-custom]
related_meetings: [meetings/oringone/2026-08-19-ownership-sviluppo-custom.md]
---

## Sintesi

Meeting interno AWM su come monetizzare commercialmente le dashboard BI custom (Power BI su DVH) che Delivery sta già costruendo su richiesta cliente. Discussi: modello di pricing a pacchetto per limitare l'effort ricorrente sul service desk, narrativa commerciale da usare con i clienti, stima dell'effort di sviluppo, il valore della riusabilità/embedding delle dashboard Power BI già costruite, due casi concreti in corso (BH e Sediver), e una tensione emersa su estetica "generata con AI" vs. percezione di valore del cliente. Definita una timeline di vendita e fissato il prossimo incontro (5 ottobre 2026) per raccogliere proposte di dashboard dai consulenti in base alla loro esperienza diretta coi clienti.

## Argomenti trattati

### Modello di pricing
- Tre scenari di vendita: nuovo cliente, cliente esistente senza DVH, cliente esistente con DVH. Nei primi due il costo delle dashboard è già compreso nel pacchetto/canone iniziale; il terzo caso (cliente con DVH già attivo) è quello da prezzare a parte
- Proposta: pacchetto "10k on top" fino a 10 dashboard; oltre la soglia, incremento di canone (non solo extra one-shot), per evitare di traslare un costo ricorrente (effort service desk) in un one-shot puro
- Motivazione dell'incremento di canone oltre soglia: margine già ampio su canone/DVH assorbe i primi 10k, ma serve un freno strutturale a un volume di dashboard non sostenibile per il service desk

### Narrativa commerciale verso il cliente
- Giustificare il canone aggiuntivo con "complessità tecnica aggiunta, costi ricorrenti di manutenzione su service desk e DVH" — non menzionare al cliente che il lavoro di delivery effettivo è di poche giornate
- Va sempre chiarito al cliente che si tratta di dati da DVH, non da AVM: implica un delay tra generazione e disponibilità del dato

### Stima effort di sviluppo
- Media storica: 5-6 giornate per dashboard, ma range reale 2-12 a seconda di complessità
- Proposta: differenziare il pricing su due assi — complessità tecnica e criticità/business-critical per il cliente — invece di appiattire tutto sulla media

### Riusabilità delle dashboard
- Le dashboard sono visual custom Power BI: una volta costruite possono essere copiate/embeddate in un altro ambiente a costo di produzione quasi nullo
- Più cresce il catalogo di dashboard già costruite, più è facile trovarne una riutilizzabile per un nuovo cliente — leva di scalabilità

### Casi concreti in sviluppo
- **BH** (= Nuovo Pignone): 3 dashboard sull'adoption di VM — totale unexpected, freestaff (rispetto al personale pianificato) e tempo di utilizzo. Punto tecnico rilevante: né "unexpected" né "freestaff" esistono come dati nativi in DVH né in AVM, sono calcolati lato frontend in VM — va trovato un modo per ricostruirli nella dashboard
- **Sediver**: dashboard per il pianificatore, mostra per ogni giorno le postazioni vuote o assegnate a personale assente. Nata per risolvere un problema di orientamento del pianificatore ("non sapeva come lavorare"). Vista come candidata a sostituire l'attuale home page del pianificatore in AVM

### Estetica "AI-generated" vs. percezione di valore
- Discussione se le dashboard costruite con l'assistenza di Claude abbiano uno stile riconoscibile e "uniforme" che rischia di far percepire al cliente sofisticato un minor valore/effort rispetto a quanto fatturato
- Non va comunicato ai clienti che una dashboard è stata realizzata con l'aiuto di Claude
- Anna Roncato parzialmente in disaccordo sul dare troppo peso a questo rischio: il fatto che uno stile "sembri Claude" non implica automaticamente un effort minore dietro

## Decisioni prese

- Pricing: pacchetto 10k on top fino a 10 dashboard per il caso "cliente esistente con DVH"; oltre soglia, incremento di canone
- Narrativa commerciale basata su costi ricorrenti di manutenzione (service desk + DVH), senza esporre l'effort reale di delivery
- Da differenziare la stima di effort in modo più granulare (2 vs 12 giornate) invece della sola media
- Le dashboard vanno pensate anche come asset riusabile/catalogo, non solo come deliverable one-off
- Vietato comunicare ai clienti l'uso di Claude nella realizzazione delle dashboard

## Action item

| Owner | Cosa | Scadenza | Note |
|-------|------|----------|------|
| Massimiliano / Daniele | Inserire nel piano U4/2027 le stime di budget/fatturato extra portabile da questa iniziativa | — | Legato a discussione sul forecast di quest'anno vs. prospettiva 2027 |
| Anna, Arianna, Davide, Daniele (consulenti) | Portare al prossimo meeting proposte di dashboard che i clienti potrebbero chiedere, basate sulla propria esperienza diretta coi clienti | 2026-10-05 | Esempio citato: confronto MES vs. commessa eseguita per calcolo marginalità |

## Criticità individuate

- Rischio di cannibalizzazione tra pacchetto flat e costo ricorrente reale: se il tetto di dashboard incluse nei 10k è troppo alto, l'effort sul service desk cresce senza un corrispondente aumento di canone — sollevato esplicitamente da Anna Roncato, Massimiliano concorda concettualmente ma ritiene il margine attuale su canone/DVH sufficiente ad assorbirlo fino alla soglia dei 10
- "Unexpected" e "freestaff" richiesti dal cliente BH non esistono come dati nativi in DVH né in AVM (calcolati a frontend in VM) — va trovata una soluzione per esporli nella dashboard
- Rischio di percezione negativa se il cliente riconosce uno stile "generato con AI" ricorrente tra dashboard di clienti diversi

## Prossimi passi

- Prossimo meeting il 5 ottobre 2026 (pomeriggio, ore 15:00) per raccogliere le proposte di dashboard dai consulenti
- Inclusione delle stime di fatturato extra nel piano U4/2027

## Note di elaborazione

- La trascrizione automatica diarizza solo Anna Roncato e Massimiliano Mazzucato come speaker distinti; i contributi di Gabriele Colombo, Arianna Azzi, Davide Vinelli e Daniele Duca non sono attribuibili singolarmente (verosimilmente microfoni spenti o non diarizzati) — stesso pattern già osservato in [[modello-prodotto-custom]] per il meeting OringONE del 2026-08-19.
- Diversi passaggi della trascrizione sono danneggiati da errori di trascrizione automatica evidenti (es. "F" per "fee"/canone, "diletta" per "delivery", nomi propri incerti come "R G", "Ait Meeting") — interpretati dal contesto dove possibile.
