[System.IO.Directory]::SetCurrentDirectory($PSScriptRoot)
$iphreeqc = New-Object -ComObject IPhreeqcCOM.Object
$iphreeqc.LoadDatabase("phreeqc.dat") | Out-Null
$iphreeqc.LogStringOn = $true

$in = ""
$in += "SOLUTION 1 Pure water     `n"
$in += "EQUILIBRIUM_PHASES 1      `n"
$in += "    Calcite 0 10          `n"
$in += "KNOBS                     `n"
$in += "    -logfile TRUE         `n"

if ($iphreeqc.RunString($in) -eq 0) {
    Write-Host $iphreeqc.GetLogString()
}
