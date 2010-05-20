Dim iphreeqc
On Error Resume Next
Set iphreeqc = CreateObject("IPhreeqcCOM.Object")
iphreeqc.ErrorFileOn = True
If (iphreeqc.RunFile("ex1") <> 0) Then
    WScript.Echo("See phreeqc.err")
End If
