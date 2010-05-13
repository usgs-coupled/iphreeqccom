// JScript source code
var IPhreeqc = new ActiveXObject("IPhreeqcCOM.Object");
IPhreeqc.LoadDatabase("phreeqc.dat");
IPhreeqc.RunFile("ex2");
var str = "";
var comps = IPhreeqc.GetComponentList().toArray();
for (var i in comps)
{
    str += comps[i] + "\n";
}
WScript.Echo(str);