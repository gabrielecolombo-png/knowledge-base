# Pattern log

Log cronologico (append-only) di collegamenti non ovvi notati tra temi
diversi. Vedi `CLAUDE.md` per il formato e per quando è appropriato scrivere
una nuova voce.

---

## 2026-09-18 — La monetizzazione delle dashboard BI conferma sul campo il modello "scenario B" già scelto per OringONE
Temi collegati: dashboard-bi-custom, modello-prodotto-custom
Meeting che hanno fatto emergere il collegamento: [meetings/interno/2026-09-18-dashboard-bi-custom-commerciale.md], [meetings/oringone/2026-08-19-ownership-sviluppo-custom.md]
Osservazione: Il meeting OringONE del 2026-08-19 aveva già notato in "Osservazioni aperte" che l'approccio B (sviluppo custom in autonomia da Delivery, non da Prodotto) era "già in corso per dashboard BI e integrazioni" come caso a complessità inferiore. Questo meeting mostra cosa succede un mese dopo quando quel modello arriva a un volume che richiede una risposta commerciale strutturata: pricing a pacchetto, narrativa verso il cliente, gestione dell'effort ricorrente sul service desk. Il collegamento non ovvio è che le criticità di scalabilità del modello "scenario B" non emergono prima sul lato tecnico/qualità (il rischio originariamente presidiato da Prodotto), ma sul lato commerciale: quante dashboard un cliente può comprare prima che l'effort ricorrente diventi insostenibile per chi le mantiene. Questo suggerisce che il "perimetro" che Prodotto deve presidiare nello scenario B non è solo tecnico, ma anche di pricing/volume.

## 2026-08-20 — VMS come fonte di dati per il forecast finanziario, non solo per la pianificazione operativa
Temi collegati: gestione-ferie-assenze, zucchetti-integrazioni
Meeting che hanno fatto emergere il collegamento: [meetings/danieli/2026-08-20-allineamento-roadmap-awm.md]
Osservazione: Il controllo di gestione Danieli usa Zucchetti come fonte del consuntivo ferie (disponibile il 16 del mese successivo) e percentuali storiche per il forecast. VMS ha invece le ferie programmate in anticipo, con granularità per reparto e macchina — un dato molto più preciso per il budget. Il collegamento non ovvio è che la qualità dei dati operativi inseriti in VMS (ferie programmazione) ha impatto diretto sulla precisione del forecast finanziario aziendale, non solo sulla pianificazione operativa giornaliera. Questo amplia il "pubblico" di chi dipende dalla qualità dei dati VMS (operations + finance), e suggerisce che il DVH sia infrastruttura prioritaria anche per funzioni aziendali non operative.

## 2026-06-05 — Skill matrix non digitalizzata come causa strutturale dell'allocazione mnemonica
Temi collegati: skill-matrix-competenze, pianificazione-logistica
Meeting che hanno fatto emergere il collegamento: [meetings/danieli/2026-06-05-assessment-logistica.md]
Osservazione: Nel meeting emerge che l'allocazione viene fatta "a mente" e questo sembra un problema di processo/disciplina operativa. In realtà il motivo strutturale è che la skill matrix — che dovrebbe guidare la decisione su chi mandare dove — esiste solo su carta o Excel e non è consultabile in real-time durante la pianificazione giornaliera. Non si tratta di due problemi distinti (competenze da una parte, allocazione dall'altra), ma di una catena causale: finché la skill matrix non è integrata nello strumento di allocazione, la riallocazione rimarrà necessariamente mnemonica indipendentemente da qualsiasi processo ridisegnato. Gabri lo ha identificato come punto cardine: è un'indicazione che chi ha fatto l'assessment ha colto questa dipendenza.
