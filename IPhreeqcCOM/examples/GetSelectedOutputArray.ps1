[System.IO.Directory]::SetCurrentDirectory("$(Get-Location)")
$iphreeqc = New-Object -ComObject IPhreeqcCOM.Object
$iphreeqc.LoadDatabase("phreeqc.dat") | Out-Null
$iphreeqc.RunFile("ex2") | Out-Null

$arr = $iphreeqc.GetSelectedOutputArray()
$selout = "selected-output:`n"
foreach($i in 0..$arr.GetUpperBound(0)) {
    foreach($j in 0..$arr.GetUpperBound(1)) {
        $selout += "$($arr[$i, $j]) "
    }
    $selout += "`n"
}
Write-Host $selout
