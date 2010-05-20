try {
    var iphreeqc = new ActiveXObject("IPhreeqcCOM.Object");
    iphreeqc.ErrorFileOn = true;
    iphreeqc.RunFile("ex1");
}
catch(e) {
    WScript.Echo("See phreeqc.err");
}
