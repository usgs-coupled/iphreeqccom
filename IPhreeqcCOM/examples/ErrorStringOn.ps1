try {
    [System.IO.Directory]::SetCurrentDirectory($PSScriptRoot)
    $iphreeqc = New-Object -ComObject IPhreeqcCOM.Object
    $iphreeqc.ErrorStringOn = $true
    $iphreeqc.RunFile("ex1") | Out-Null
}
catch {
    Write-Host $iphreeqc.GetErrorString()
}
