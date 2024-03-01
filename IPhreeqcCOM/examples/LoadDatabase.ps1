[System.IO.Directory]::SetCurrentDirectory("$(Get-Location)")
$iphreeqc = New-Object -ComObject IPhreeqcCOM.Object
if ($iphreeqc.LoadDatabase("phreeqc.dat") -eq 0) {
    Write-Host "database ok"
} else {
    Write-Host "database contains errors"
}
