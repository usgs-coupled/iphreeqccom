[System.IO.Directory]::SetCurrentDirectory("$(Get-Location)")
$iphreeqc = New-Object -ComObject IPhreeqcCOM.Object
$iphreeqc.LoadDatabase("phreeqc.dat") | Out-Null
$iphreeqc.AccumulateLine("DATABASE wateq4f.dat")
$iphreeqc.AccumulateLine("SOLUTION 1")
$iphreeqc.RunAccumulated() | Out-Null
if ($iphreeqc.GetWarningString().length -ne 0) {
    Write-Host $iphreeqc.GetWarningString()
}
