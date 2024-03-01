[System.IO.Directory]::SetCurrentDirectory("$(Get-Location)")
$iphreeqc = New-Object -ComObject IPhreeqcCOM.Object

$iphreeqc.LoadDatabase("phreeqc.dat") | Out-Null
$iphreeqc.SelectedOutputStringOn = $true

if ($iphreeqc.RunFile("ex2") -eq 0) {
    Write-Host $iphreeqc.GetSelectedOutputString()
}
