[System.IO.Directory]::SetCurrentDirectory($PSScriptRoot)
$iphreeqc = New-Object -ComObject IPhreeqcCOM.Object
if ($iphreeqc.LoadDatabase("phreeqc.dat") -eq 0) {
    Write-Host "database ok"
} else {
    Write-Host "database contains errors"
}
