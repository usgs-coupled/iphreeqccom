$strDB = Get-Content -Path .\phreeqc.dat -Raw
$iphreeqc = New-Object -ComObject IPhreeqcCOM.Object
if ($iphreeqc.LoadDatabaseString($strDB) -eq 0) {
    Write-Host "database ok"
} else {
    Write-Host "database contains errors"
}
