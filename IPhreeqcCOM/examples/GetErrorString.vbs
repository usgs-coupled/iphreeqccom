Dim iphreeqc
On Error Resume Next
Set iphreeqc = CreateObject("IPhreeqcCOM.Object")
If (iphreeqc.RunFile("ex1") <> 0) Then
    WScript.Echo(iphreeqc.GetErrorString())
End If
