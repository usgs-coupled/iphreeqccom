Dim iphreeqc
Set iphreeqc = CreateObject("IPhreeqcCOM.Object")
iphreeqc.LoadDatabase("phreeqc.dat")
iphreeqc.RunFile("ex2")
WScript.Echo("The current selected-output array contains " & _
    iphreeqc.RowCount & " rows.")
