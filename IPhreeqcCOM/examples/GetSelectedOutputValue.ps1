[System.IO.Directory]::SetCurrentDirectory("$(Get-Location)")
$iphreeqc = New-Object -ComObject IPhreeqcCOM.Object
$iphreeqc.LoadDatabase("phreeqc.dat") | Out-Null
$iphreeqc.RunFile("ex2") | Out-Null

$selout = "selected-output:`n";
for ($i = 0; $i -lt $iphreeqc.RowCount; ++$i) {
    for ($j = 0; $j -lt $iphreeqc.ColumnCount; ++$j) {
        $selout += "$($iphreeqc.GetSelectedOutputValue($i, $j)) "
    }
    $selout += "`n"
}
Write-Host $selout
