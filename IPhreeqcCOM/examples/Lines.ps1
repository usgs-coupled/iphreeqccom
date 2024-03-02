$iphreeqc = New-Object -ComObject IPhreeqcCOM.Object
$iphreeqc.AccumulateLine("SOLUTION 1")
$iphreeqc.AccumulateLine("END")
Write-Host "The accumulated input is:`n$($iphreeqc.Lines)"
