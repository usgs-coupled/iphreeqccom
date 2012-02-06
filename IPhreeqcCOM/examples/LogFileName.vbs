Dim iphreeqc, sInput

Set iphreeqc = CreateObject("IPhreeqcCOM.Object")
iphreeqc.LoadDatabase("phreeqc.dat")
iphreeqc.LogFileOn = True

sInput = ""
sInput = sInput & "SOLUTION 1 Pure water     " & vbNewLine
sInput = sInput & "EQUILIBRIUM_PHASES 1      " & vbNewLine
sInput = sInput & "    Calcite 0 10          " & vbNewLine
sInput = sInput & "KNOBS                     " & vbNewLine
sInput = sInput & "    -logfile TRUE         " & vbNewLine

If (iphreeqc.RunString(sInput) = 0) Then
    WScript.Echo("See " & iphreeqc.LogFileName & ".")
End If
