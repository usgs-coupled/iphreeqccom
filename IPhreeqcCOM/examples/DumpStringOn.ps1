[System.IO.Directory]::SetCurrentDirectory($PSScriptRoot)
$iphreeqc = New-Object -ComObject IPhreeqcCOM.Object
$iphreeqc.LoadDatabase("phreeqc.dat") | Out-Null
$iphreeqc.DumpStringOn = $true

$in = ""
$in += "SOLUTION 1 Pure water     `n"
$in += "EQUILIBRIUM_PHASES 1      `n"
$in += "    Calcite 0 10          `n"
$in += "SAVE solution 1           `n"
$in += "SAVE equilibrium_phases 1 `n"
$in += "DUMP                      `n"
$in += "    -solution 1           `n"
$in += "    -equilibrium_phases  1`n"

if ($iphreeqc.RunString($in) -ne 0) {
    Write-Host $iphreeqc.GetErrorString()
}
$dump = $iphreeqc.GetDumpString()
Write-Host $dump
