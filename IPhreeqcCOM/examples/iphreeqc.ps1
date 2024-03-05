[System.IO.Directory]::SetCurrentDirectory($PSScriptRoot)
$iphreeqc = New-Object -ComObject IPhreeqcCOM.Object
$iphreeqc.LoadDatabase("phreeqc.dat")
$iphreeqc.OutputFileOn = $true
$iphreeqc.OutputFileName = "ex1.out"
if ($iphreeqc.RunFile("ex1") -eq 0) {
    Write-Host "see $($iphreeqc.OutputFileName)."
}
# [System.Runtime.InteropServices.Marshal]::ReleaseComObject($iphreeqc)
# [System.GC]::Collect()
# [System.GC]::WaitForPendingFinalizers()
