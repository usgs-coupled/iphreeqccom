Dim iphreeqc
Set iphreeqc = CreateObject("IPhreeqcCOM.Object")
iphreeqc.LoadDatabase("phreeqc.dat")
iphreeqc.SelectedOutputStringOn = True
If (iphreeqc.RunFile("ex2") = 0) Then
    WScript.Echo(iphreeqc.GetSelectedOutputString())
End If

