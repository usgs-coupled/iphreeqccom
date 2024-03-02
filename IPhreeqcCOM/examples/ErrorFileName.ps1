try {
    [System.IO.Directory]::SetCurrentDirectory($PSScriptRoot)
    $iphreeqc = New-Object -ComObject IPhreeqcCOM.Object
    $iphreeqc.ErrorFileOn = $true
    $iphreeqc.RunFile("ex1")
}
catch {
    Write-Host "See $($iphreeqc.ErrorFileName)."
}
