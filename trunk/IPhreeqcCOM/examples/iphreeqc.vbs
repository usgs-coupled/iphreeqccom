Dim iphreeqc
Set iphreeqc = CreateObject("IPhreeqcCOM.Object")
iphreeqc.LoadDatabase("phreeqc.dat")
iphreeqc.OutputFileOn = True
If (iphreeqc.RunFile("ex1") = 0) Then
    WScript.Echo("see phreeqc.out")
End If