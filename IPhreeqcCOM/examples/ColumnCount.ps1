[System.IO.Directory]::SetCurrentDirectory($PSScriptRoot)
$iphreeqc = New-Object -ComObject IPhreeqcCOM.Object
$iphreeqc.LoadDatabase("phreeqc.dat") | Out-Null
$iphreeqc.RunFile("ex2") | Out-Null
Write-Host(-join("The current selected-output array contains ", `
    "$($iphreeqc.ColumnCount) columns."))
