Sei nel repository awm-knowledge-base. Leggi CLAUDE.md per intero prima di
fare qualsiasi cosa: contiene tutte le regole operative per come processare
trascrizioni, aggiornare i temi, e generare il report di fine sessione.

L'utente ha fornito qui sotto (dopo il comando /process-meeting) cliente,
data e trascrizione, in un formato libero. Estraili tu stesso dal testo
fornito — non chiedere conferma sul formato, deduci cliente e data dal
contenuto se non sono espliciti in cima al messaggio.

Segui esattamente il flusso descritto in CLAUDE.md ("Cosa fare quando
ricevi una trascrizione nuova"):

1. Salva il grezzo in meetings/_raw/
2. Genera la minuta pulita in meetings/<cliente>/ usando templates/meeting.md
3. Identifica i temi toccati, consulta prima themes/_index.md, crea o
   aggiorna i file tema seguendo la convenzione di naming e le regole di
   aggiornamento (mai riscrivere da zero, solo append/merge)
4. Aggiungi la riga in meetings/_index.md
5. Se noti un pattern cross-tema genuino, aggiungilo a patterns/log.md
6. Fai commit diretto e push
7. Alla fine mostrami il report di sessione (sezione "Fatto" e
   "Da verificare")

Input fornito dall'utente:
$ARGUMENTS
