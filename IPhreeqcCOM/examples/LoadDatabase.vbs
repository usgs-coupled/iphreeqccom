Dim iphreeqc
Set iphreeqc = CreateObject("IPhreeqcCOM.Object")
If (iphreeqc.LoadDatabase("phreeqc.dat") = 0) Then
    WScript.Echo("database ok")
Else
    WScript.Echo("database contains errors")
End If
