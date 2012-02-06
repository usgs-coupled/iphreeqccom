Dim iphreeqc, sInput

Set iphreeqc = CreateObject("IPhreeqcCOM.Object")
iphreeqc.LoadDatabase("phreeqc.dat")
iphreeqc.OutputStringOn = True

sInput = ""
sInput = sInput & "SOLUTION 1 Pure water     " & vbNewLine
sInput = sInput & "EQUILIBRIUM_PHASES 1      " & vbNewLine
sInput = sInput & "    Calcite 0 10          " & vbNewLine

If (iphreeqc.RunString(sInput) = 0) Then
    WScript.Echo(iphreeqc.GetOutputString())
End If
