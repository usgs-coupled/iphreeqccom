[System.IO.Directory]::SetCurrentDirectory("$(Get-Location)")
$iphreeqc = New-Object -ComObject IPhreeqcCOM.Object
$iphreeqc.LoadDatabase("phreeqc.dat") | Out-Null
$iphreeqc.OutputFileOn = $true
if ($iphreeqc.RunFile("ex1") -eq 0) {
    Write-Host "see $($iphreeqc.OutputFileName) ."
}
