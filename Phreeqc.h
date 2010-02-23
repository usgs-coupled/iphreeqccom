// Phreeqc.h : Declaration of the CPhreeqc

#pragma once
#include "resource.h"       // main symbols

#include "PhreeqcCOM.h"


#if defined(_WIN32_WCE) && !defined(_CE_DCOM) && !defined(_CE_ALLOW_SINGLE_THREADED_OBJECTS_IN_MTA)
#error "Single-threaded COM objects are not properly supported on Windows CE platform, such as the Windows Mobile platforms that do not include full DCOM support. Define _CE_ALLOW_SINGLE_THREADED_OBJECTS_IN_MTA to force ATL to support creating single-thread COM object's and allow use of it's single-threaded COM object implementations. The threading model in your rgs file was set to 'Free' as that is the only threading model supported in non DCOM Windows CE platforms."
#endif



// CPhreeqc

class ATL_NO_VTABLE CPhreeqc :
	public CComObjectRootEx<CComSingleThreadModel>,
	public CComCoClass<CPhreeqc, &CLSID_Phreeqc>,
	public ISupportErrorInfo,
	public IDispatchImpl<IPhreeqc, &IID_IPhreeqc, &LIBID_PhreeqcCOM, /*wMajor =*/ 1, /*wMinor =*/ 0>
{
public:
	CPhreeqc()
		: m_OutputOn(false)
		, m_ErrorOn(false)
		, m_LogOn(false)
		, m_SelectedOutputOn(false)
	{
	}

DECLARE_REGISTRY_RESOURCEID(IDR_PHREEQC)


BEGIN_COM_MAP(CPhreeqc)
	COM_INTERFACE_ENTRY(IPhreeqc)
	COM_INTERFACE_ENTRY(IDispatch)
	COM_INTERFACE_ENTRY(ISupportErrorInfo)
END_COM_MAP()

// ISupportsErrorInfo
	STDMETHOD(InterfaceSupportsErrorInfo)(REFIID riid);


	DECLARE_PROTECT_FINAL_CONSTRUCT()

	HRESULT FinalConstruct()
	{
		return S_OK;
	}

	void FinalRelease()
	{
	}

public:

public:
	STDMETHOD(LoadDatabase)(BSTR* filename, LONG* retval);

public:
	STDMETHOD(get_OutputOn)(VARIANT_BOOL* pVal);
	STDMETHOD(put_OutputOn)(VARIANT_BOOL newVal);

public:
	STDMETHOD(get_ErrorOn)(VARIANT_BOOL* pVal);
	STDMETHOD(put_ErrorOn)(VARIANT_BOOL newVal);

public:
	STDMETHOD(get_LogOn)(VARIANT_BOOL* pVal);
	STDMETHOD(put_LogOn)(VARIANT_BOOL newVal);

public:
	STDMETHOD(RunFile)(BSTR* filename, LONG* retval);

public:
	bool m_OutputOn;
	bool m_ErrorOn;
	bool m_LogOn;
	bool m_SelectedOutputOn;
public:
	STDMETHOD(Run)(LONG* retval);
public:
	STDMETHOD(get_SelectedOutputOn)(VARIANT_BOOL* pVal);
public:
	STDMETHOD(put_SelectedOutputOn)(VARIANT_BOOL newVal);
public:
	STDMETHOD(RunString)(BSTR* input, LONG* retval);
public:
	STDMETHOD(AccumulateLine)(BSTR* line);
public:
	STDMETHOD(get_ColumnCount)(LONG* pVal);
public:
	STDMETHOD(get_RowCount)(LONG* pVal);
public:
	STDMETHOD(get_Lines)(BSTR* pVal);
public:
	STDMETHOD(GetSelectedOutputArray)(VARIANT* retval);
public:
	STDMETHOD(GetLastErrorString)(BSTR* retval);
public:
	STDMETHOD(GetSelectedOutputColumnCount)(LONG* retval);
public:
	STDMETHOD(GetSelectedOutputRowCount)(LONG* retval);
public:
	STDMETHOD(GetSelectedOutputValue)(LONG row, LONG col, VARIANT* retval);
public:
	STDMETHOD(LoadDatabaseString)(BSTR* input, LONG* retval);
public:
	STDMETHOD(VarArgCount)(SAFEARRAY * psa, LONG* retval);
public:
	STDMETHOD(RunOpt)(VARIANT* OutputOn, VARIANT* ErrorOn, VARIANT* LogOn, VARIANT* SelectedOutputOn, LONG* retval);
public:
	STDMETHOD(ShowHelp)(LONG* id);
};

OBJECT_ENTRY_AUTO(__uuidof(Phreeqc), CPhreeqc)
