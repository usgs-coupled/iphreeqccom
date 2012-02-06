Dim iphreeqc
Set iphreeqc = CreateObject("IPhreeqcCOM.Object")
iphreeqc.LoadDatabase("phreeqc.dat")
iphreeqc.SelectedOutputFileOn = True

If (iphreeqc.RunFile("ex2") = 0) Then
    WScript.Echo("See " & iphreeqc.SelectedOutputFileName & ".")
End If
