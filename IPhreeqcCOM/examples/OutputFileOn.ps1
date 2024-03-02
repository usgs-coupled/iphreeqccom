[System.IO.Directory]::SetCurrentDirectory($PSScriptRoot)
$iphreeqc = New-Object -ComObject IPhreeqcCOM.Object
$iphreeqc.LoadDatabase("phreeqc.dat") | Out-Null
$iphreeqc.OutputFileOn = $true
$iphreeqc.RunFile("ex2") | Out-Null
Write-Host "see $($iphreeqc.OutputFileName)"
