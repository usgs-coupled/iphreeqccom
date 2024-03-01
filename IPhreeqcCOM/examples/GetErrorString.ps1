try {
    [System.IO.Directory]::SetCurrentDirectory("$(Get-Location)")
    $iphreeqc = New-Object -ComObject IPhreeqcCOM.Object
    $iphreeqc.RunFile("ex1") | Out-Null
}
catch {
    Write-Host $iphreeqc.GetErrorString()
}
