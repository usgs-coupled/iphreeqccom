[System.IO.Directory]::SetCurrentDirectory("$(Get-Location)")
$iphreeqc = New-Object -ComObject IPhreeqcCOM.Object
$iphreeqc.LoadDatabase("phreeqc.dat") | Out-Null
$iphreeqc.OutputStringOn = $true

$in = ""
$in += "SOLUTION 1 Pure water     `n"
$in += "EQUILIBRIUM_PHASES 1      `n"
$in += "    Calcite 0 10          `n"

if ($iphreeqc.RunString($in) -eq 0) {
    Write-Host $iphreeqc.GetOutputString()
}
