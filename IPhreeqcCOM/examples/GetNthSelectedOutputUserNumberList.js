var iphreeqc = new ActiveXObject("IPhreeqcCOM.Object");
iphreeqc.LoadDatabase("phreeqc.dat");
iphreeqc.RunFile("multi_punch");
var str = "Defined selected-output numbers:\n";
var nums = iphreeqc.GetNthSelectedOutputUserNumberList().toArray();
for (var i in nums) {
    str += nums[i] + "\n";
}
WScript.Echo(str);