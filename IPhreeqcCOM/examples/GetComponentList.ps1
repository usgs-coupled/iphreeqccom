[System.IO.Directory]::SetCurrentDirectory($PSScriptRoot)
$iphreeqc = New-Object -ComObject IPhreeqcCOM.Object
$iphreeqc.LoadDatabase("phreeqc.dat")
$iphreeqc.RunFile("ex2")
$comps = "components:`n"
$comps += $iphreeqc.GetComponentList()
Write-Host $comps
