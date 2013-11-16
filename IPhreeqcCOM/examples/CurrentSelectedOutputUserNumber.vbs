Dim iphreeqc, fso, num, nums, arr

Set iphreeqc = CreateObject("IPhreeqcCOM.Object")
iphreeqc.LoadDatabase("phreeqc.dat")
iphreeqc.RunFile("multi_punch")

Set fso = CreateObject("Scripting.FileSystemObject")

nums = iphreeqc.GetNthSelectedOutputUserNumberList()

For Each num in nums
    Set ts = fso.CreateTextFile("sel_out." & CStr(num) & ".out", True)
    
    iphreeqc.CurrentSelectedOutputUserNumber = num
    arr = iphreeqc.GetSelectedOutputArray()    
    For i = LBound(arr, 1) To UBound(arr, 1)
        For j = LBound(arr, 2) To UBound(arr, 2)
            ts.Write(CStr(arr(i, j)) & ",")
        Next
        ts.WriteLine()
    Next  
    ts.Close()
Next
