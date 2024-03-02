[System.IO.Directory]::SetCurrentDirectory($PSScriptRoot)
$iphreeqc = New-Object -ComObject IPhreeqcCOM.Object
$iphreeqc.LoadDatabase("phreeqc.dat") | Out-Null

$sInput = "SOLUTION 1`n";
$sInput += "temp 25.0`n";
$sInput += "pH   7.0`n";

$iphreeqc.OutputFileOn = $true
$iphreeqc.RunString($sInput) | Out-Null
Write-Host "see $($iphreeqc.OutputFileName)."
