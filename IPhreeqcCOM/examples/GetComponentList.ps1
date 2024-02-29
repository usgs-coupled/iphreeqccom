[System.IO.Directory]::SetCurrentDirectory("$(Get-Location)")
$iphreeqc = New-Object -ComObject IPhreeqcCOM.Object
$iphreeqc.LoadDatabase("phreeqc.dat")
$iphreeqc.RunFile("ex2")
$comps = "components:`n"
$comps += $iphreeqc.GetComponentList()
Write-Host $comps
