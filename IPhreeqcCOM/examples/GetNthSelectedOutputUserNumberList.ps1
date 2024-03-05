[System.IO.Directory]::SetCurrentDirectory($PSScriptRoot)
$iphreeqc = New-Object -ComObject IPhreeqcCOM.Object
$iphreeqc.LoadDatabase("phreeqc.dat") | Out-Null
$iphreeqc.RunFile("multi_punch") | Out-Null
$str = "Defined selected-output numbers:`n"
$nums = $iphreeqc.GetNthSelectedOutputUserNumberList()
foreach($i in $nums) {
    $str += "$i`n"
}
Write-Host $str
