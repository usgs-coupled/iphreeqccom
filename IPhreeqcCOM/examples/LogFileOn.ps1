[System.IO.Directory]::SetCurrentDirectory($PSScriptRoot)
$iphreeqc = New-Object -ComObject IPhreeqcCOM.Object
$iphreeqc.LoadDatabase("phreeqc.dat") | Out-Null

# turn logging on
$iphreeqc.AccumulateLine("KNOBS; -logfile true")
$iphreeqc.RunAccumulated() | Out-Null

$iphreeqc.LogFileOn = $true
$iphreeqc.RunFile("ex2") | Out-Null
Write-Host "See $($iphreeqc.LogFileName)."
