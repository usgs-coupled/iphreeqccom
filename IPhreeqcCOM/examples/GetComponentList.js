var iphreeqc = new ActiveXObject("IPhreeqcCOM.Object");
iphreeqc.LoadDatabase("phreeqc.dat");
iphreeqc.RunFile("ex2");
var str = "components:\n";
var comps = iphreeqc.GetComponentList().toArray();
for (var i in comps) {
    str += comps[i] + "\n";
}
WScript.Echo(str);