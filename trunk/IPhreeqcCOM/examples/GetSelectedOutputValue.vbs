Dim iphreeqc, i, j
Set iphreeqc = CreateObject("IPhreeqcCOM.Object")
iphreeqc.LoadDatabase("phreeqc.dat")
iphreeqc.RunFile("ex2")

selout = "selected-output:" & vbNewLine
For i = 0 To iphreeqc.RowCount - 1
    For j = 0 To iphreeqc.ColumnCount - 1
        selout = selout & iphreeqc.GetSelectedOutputValue(i, j) & " "
    Next
    selout = selout & vbNewLine
Next
WScript.Echo(selout)
