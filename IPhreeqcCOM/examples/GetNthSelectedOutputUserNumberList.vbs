Dim iphreeqc, num, nums, str
Set iphreeqc = CreateObject("IPhreeqcCOM.Object")
iphreeqc.LoadDatabase("phreeqc.dat")
iphreeqc.RunFile("multi_punch")
str = "Defined selected-output numbers:" & vbNewLine
nums = iphreeqc.GetNthSelectedOutputUserNumberList()
For Each num in nums
    str = str & num & vbNewLine
Next
WScript.Echo(str)
