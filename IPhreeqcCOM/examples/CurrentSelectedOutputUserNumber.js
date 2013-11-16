var iphreeqc = new ActiveXObject("IPhreeqcCOM.Object");
iphreeqc.LoadDatabase("phreeqc.dat");
iphreeqc.RunFile("multi_punch");

var fso = new ActiveXObject("Scripting.FileSystemObject");

var nums = iphreeqc.GetNthSelectedOutputUserNumberList().toArray();
for (var i in nums) {
    var ts = fso.CreateTextFile("sel_out." + nums[i] + ".out", true);
    
    iphreeqc.CurrentSelectedOutputUserNumber = nums[i];
    var arr = iphreeqc.GetSelectedOutputArray().toArray();
    for (var i = 0; i < iphreeqc.RowCount; ++i) {
        for (var j = 0; j < iphreeqc.ColumnCount; ++j) {
            // Note: JScript doesn't support multi-dimensional arrays
            ts.Write(arr[i + j*iphreeqc.RowCount] + ",");
        }
        ts.WriteLine();
    }
    ts.Close()    
}
