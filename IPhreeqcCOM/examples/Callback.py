from win32com.client import DispatchWithEvents

def RunWithCallback():
    class IPhreeqcCOMEvents:
        def __init__(self):
           self.year = 2012
        
        def OnCallback(self, x1, x2, str, value):
            value = -1
            if str == "Year":
                value = self.year
                self.year += 1
            return value

    iphreeqc = DispatchWithEvents("IPhreeqcCOM.Object", IPhreeqcCOMEvents)
    
    iphreeqc.LoadDatabase("phreeqc.dat")
    
    iphreeqc.AccumulateLine("SOLUTION 1-2")
    iphreeqc.AccumulateLine("END")
    iphreeqc.AccumulateLine("EQUILIBRIUM_PHASES 1")
    iphreeqc.AccumulateLine("   CO2(g) -1.5 10")
    iphreeqc.AccumulateLine("EQUILIBRIUM_PHASES 2")
    iphreeqc.AccumulateLine("   Calcite 0   10")
    iphreeqc.AccumulateLine("SELECTED_OUTPUT 1")
    iphreeqc.AccumulateLine("   -reset false")
    iphreeqc.AccumulateLine("USER_PUNCH")
    iphreeqc.AccumulateLine("   -Heading  pH  SR(calcite)  Year")
    iphreeqc.AccumulateLine("   10 PUNCH -LA(\"H+\"), SR(\"calcite\")")
    iphreeqc.AccumulateLine("   20 PUNCH CALLBACK(cell_no, -LA(\"H+\"), \"Year\")")
    iphreeqc.AccumulateLine("END")
    iphreeqc.AccumulateLine("RUN_CELLS")
    iphreeqc.AccumulateLine("   -cells 1-2")
    iphreeqc.AccumulateLine("END")
    
    iphreeqc.SelectedOutputFileOn = True
    
    if iphreeqc.RunAccumulated() == 0:
        print "see " + iphreeqc.SelectedOutputFileName + "."

if __name__ == '__main__':
    RunWithCallback()
