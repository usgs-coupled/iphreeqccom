Dim iphreeqc, arr, selout, i, j
Set iphreeqc = CreateObject("IPhreeqcCOM.Object")
iphreeqc.LoadDatabase("phreeqc.dat")
iphreeqc.RunFile("ex2")

arr = iphreeqc.GetSelectedOutputArray()
selout = "selected-output:" & vbNewLine
For i = LBound(arr, 1) To UBound(arr, 1)
    For j = LBound(arr, 2) To UBound(arr, 2)
        selout = selout & arr(i, j) & " "
    Next
    selout = selout & vbNewLine
Next
WScript.Echo(selout)

