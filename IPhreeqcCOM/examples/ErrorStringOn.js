try {
    var iphreeqc = new ActiveXObject("IPhreeqcCOM.Object");
    iphreeqc.ErrorStringOn = true;
    iphreeqc.RunFile("ex1");
}
catch (e) {
    WScript.Echo(iphreeqc.GetErrorString());
}
