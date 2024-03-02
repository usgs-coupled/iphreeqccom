[System.IO.Directory]::SetCurrentDirectory($PSScriptRoot)
$iphreeqc = New-Object -ComObject IPhreeqcCOM.Object
$iphreeqc.LoadDatabase("phreeqc.dat") | Out-Null
$iphreeqc.RunFile("multi_punch") | Out-Null

$fso = New-Object -ComObject Scripting.FileSystemObject
$nums = $iphreeqc.GetNthSelectedOutputUserNumberList()
foreach($num in $nums) {
    $ts = $fso.CreateTextFile("sel_out.$num.out", $true)

    $iphreeqc.CurrentSelectedOutputUserNumber = $num
    $arr = $iphreeqc.GetSelectedOutputArray()
    for ($i = 0; $i -lt $iphreeqc.RowCount; ++$i) {
        for ($j = 0; $j -lt $iphreeqc.ColumnCount; ++$j) {
            $ts.Write("$($arr[$i, $j]),")
        }
        $ts.WriteLine()
    }
    $ts.Close()
}
