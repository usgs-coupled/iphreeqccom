// COM.h : Declaration of the CCOM

#pragma once
#include "resource.h"       // main symbols

#include "IPhreeqcCOM.h"
#include "IPhreeqc.hpp"


#if defined(_WIN32_WCE) && !defined(_CE_DCOM) && !defined(_CE_ALLOW_SINGLE_THREADED_OBJECTS_IN_MTA)
#error "Single-threaded COM objects are not properly supported on Windows CE platform, such as the Windows Mobile platforms that do not include full DCOM support. Define _CE_ALLOW_SINGLE_THREADED_OBJECTS_IN_MTA to force ATL to support creating single-thread COM object's and allow use of it's single-threaded COM object implementations. The threading model in your rgs file was set to 'Free' as that is the only threading model supported in non DCOM Windows CE platforms."
#endif



// CCOM

class ATL_NO_VTABLE CCOM :
	public CComObjectRootEx<CComSingleThreadModel>,
	public CComCoClass<CCOM, &CLSID_IPhreeqcCOMObject>,
	public ISupportErrorInfo,
	public IDispatchImpl<IPhreeqcCOM, &IID_IPhreeqcCOM, &LIBID_IPhreeqcCOMLib, /*wMajor =*/ 2, /*wMinor =*/ 0>
{
public:
	CCOM()
	: IPhreeqcPtr(0)
	{
	}

DECLARE_REGISTRY_RESOURCEID(IDR_COM)


BEGIN_COM_MAP(CCOM)
	COM_INTERFACE_ENTRY(IPhreeqcCOM)
	COM_INTERFACE_ENTRY(IDispatch)
	COM_INTERFACE_ENTRY(ISupportErrorInfo)
END_COM_MAP()

// ISupportsErrorInfo
	STDMETHOD(InterfaceSupportsErrorInfo)(REFIID riid);


	DECLARE_PROTECT_FINAL_CONSTRUCT()

	HRESULT FinalConstruct()
	{
		ATLTRACE("CCOM FinalConstruct\n");
		try
		{
			this->IPhreeqcPtr = new IPhreeqc;
		}
		catch (std::bad_alloc)
		{
			ATLTRACE("CCOM FinalConstruct E_OUTOFMEMORY\n");
			return E_OUTOFMEMORY;
		}
		catch (...)
		{
			ATLTRACE("CCOM FinalConstruct E_OUTOFMEMORY\n");
			return E_OUTOFMEMORY;
		}
		return S_OK;
	}

	void FinalRelease()
	{
		delete this->IPhreeqcPtr;
	}

private:

	IPhreeqc* IPhreeqcPtr;

public:

	STDMETHOD(LoadDatabase)(BSTR filename, LONG* retval);
	STDMETHOD(get_OutputFileOn)(VARIANT_BOOL* pVal);
	STDMETHOD(put_OutputFileOn)(VARIANT_BOOL newVal);
	STDMETHOD(get_ErrorFileOn)(VARIANT_BOOL* pVal);
	STDMETHOD(put_ErrorFileOn)(VARIANT_BOOL newVal);
	STDMETHOD(get_LogFileOn)(VARIANT_BOOL* pVal);
	STDMETHOD(put_LogFileOn)(VARIANT_BOOL newVal);
	STDMETHOD(RunFile)(BSTR filename, LONG* retval);
	STDMETHOD(RunAccumulated)(LONG* retval);
	STDMETHOD(get_SelectedOutputFileOn)(VARIANT_BOOL* pVal);
	STDMETHOD(put_SelectedOutputFileOn)(VARIANT_BOOL newVal);
	STDMETHOD(RunString)(BSTR input, LONG* retval);
	STDMETHOD(AccumulateLine)(BSTR line);
	STDMETHOD(get_ColumnCount)(LONG* pVal);
	STDMETHOD(get_RowCount)(LONG* pVal);
	STDMETHOD(get_Lines)(BSTR* pVal);
	STDMETHOD(GetSelectedOutputArray)(VARIANT* retval);
	STDMETHOD(GetErrorString)(BSTR* retval);
	STDMETHOD(GetSelectedOutputValue)(LONG row, LONG col, VARIANT* retval);
	STDMETHOD(LoadDatabaseString)(BSTR input, LONG* retval);
	STDMETHOD(get_DumpFileOn)(VARIANT_BOOL* pVal);
	STDMETHOD(put_DumpFileOn)(VARIANT_BOOL newVal);
	STDMETHOD(get_DumpStringOn)(VARIANT_BOOL* pVal);
	STDMETHOD(put_DumpStringOn)(VARIANT_BOOL newVal);
	STDMETHOD(GetComponentList)(VARIANT* retval);
	STDMETHOD(GetWarningString)(BSTR* retval);
	STDMETHOD(GetDumpString)(BSTR* retval);
	STDMETHOD(ClearAccumulatedLines)(void);
};

OBJECT_ENTRY_AUTO(__uuidof(IPhreeqcCOMObject), CCOM)
