# nightly-review.ps1
# Lancia Claude Code in modalita' non interattiva sulla knowledge base per
# eseguire la routine di revisione notturna (vedi CLAUDE.md, sezione
# "Routine di revisione"). Pensato per essere schedulato via Task Scheduler
# di Windows, sullo stesso modello dello script di calendar-check OringONE.

$repoPath = "C:\Users\Gabriele Colombo\Desktop\HiveMind\knowledge-base"
$logPath = "$repoPath\.nightly-review.log"

Set-Location $repoPath

$prompt = @"
Esegui la routine di revisione notturna descritta in CLAUDE.md (sezione
"Routine di revisione"). Al termine, se e solo se hai trovato qualcosa da
rivedere o correggere, invia il report via Gmail come descritto nella
sezione "Report di fine sessione". Se non c'e' nulla da revisionare, non
inviare nulla e chiudi.
"@

$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
Add-Content -Path $logPath -Value "--- Avvio routine notturna: $timestamp ---"

# -p esegue in modalita' non interattiva con il prompt fornito
claude -p $prompt --dangerously-skip-permissions *>> $logPath

$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
Add-Content -Path $logPath -Value "--- Fine routine notturna: $timestamp ---"
