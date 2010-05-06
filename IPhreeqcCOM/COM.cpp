// COM.cpp : Implementation of CCOM

#include "stdafx.h"
#include "COM.h"

#include <comdef.h>   // _com_issue_error
#include <comutil.h>  // _bstr_t
#include <atlsafe.h>  // CComSafeArray
//#include <HtmlHelp.h>

#define MACRO_CHECK_IPHREEQC_PTR() do {if (this->IPhreeqcPtr == 0) {return E_OUTOFMEMORY;}} while (0)

// CCOM

STDMETHODIMP CCOM::InterfaceSupportsErrorInfo(REFIID riid)
{
	static const IID* arr[] = 
	{
		&IID_IPhreeqcCOM
	};

	for (int i=0; i < sizeof(arr) / sizeof(arr[0]); i++)
	{
		if (InlineIsEqualGUID(*arr[i],riid))
			return S_OK;
	}
	return S_FALSE;
}

STDMETHODIMP CCOM::LoadDatabase(BSTR* filename, LONG* retval)
{
	if( !filename || !retval )
	{
		return E_POINTER;
	}

	MACRO_CHECK_IPHREEQC_PTR();

	_bstr_t f(*filename, true);

	if ((*retval = this->IPhreeqcPtr->LoadDatabase(f)))
	{
#if defined(SUPPORT_ERROR_INFO)
		return AtlReportError(GetObjectCLSID(), this->IPhreeqcPtr->GetErrorString());
#endif
	}

	return S_OK;
}

STDMETHODIMP CCOM::get_OutputOn(VARIANT_BOOL* pVal)
{
	if( !pVal )
	{
		return E_POINTER;
	}
	MACRO_CHECK_IPHREEQC_PTR();

	if (this->IPhreeqcPtr->GetOutputOn())
	{
		*pVal = VARIANT_TRUE;
	}
	else
	{
		*pVal = VARIANT_FALSE;
	}

	return S_OK;
}

STDMETHODIMP CCOM::put_OutputOn(VARIANT_BOOL newVal)
{
	MACRO_CHECK_IPHREEQC_PTR();

	this->IPhreeqcPtr->SetOutputOn(newVal == VARIANT_TRUE);

	return S_OK;
}

STDMETHODIMP CCOM::get_ErrorOn(VARIANT_BOOL* pVal)
{
	if( !pVal )
	{
		return E_POINTER;
	}
	MACRO_CHECK_IPHREEQC_PTR();

	if (this->IPhreeqcPtr->GetErrorOn())
	{
		*pVal = VARIANT_TRUE;
	}
	else
	{
		*pVal = VARIANT_FALSE;
	}

	return S_OK;
}

STDMETHODIMP CCOM::put_ErrorOn(VARIANT_BOOL newVal)
{
	MACRO_CHECK_IPHREEQC_PTR();

	this->IPhreeqcPtr->SetErrorOn(newVal == VARIANT_TRUE);

	return S_OK;
}

STDMETHODIMP CCOM::get_LogOn(VARIANT_BOOL* pVal)
{
	if( !pVal )
	{
		return E_POINTER;
	}
	MACRO_CHECK_IPHREEQC_PTR();

	if (this->IPhreeqcPtr->GetLogOn())
	{
		*pVal = VARIANT_TRUE;
	}
	else
	{
		*pVal = VARIANT_FALSE;
	}

	return S_OK;
}

STDMETHODIMP CCOM::put_LogOn(VARIANT_BOOL newVal)
{
	MACRO_CHECK_IPHREEQC_PTR();

	this->IPhreeqcPtr->SetLogOn(newVal == VARIANT_TRUE);

	return S_OK;
}

STDMETHODIMP CCOM::RunFile(BSTR* filename, LONG* retval)
{
	if( !filename || !retval )
	{
		return E_POINTER;
	}
	MACRO_CHECK_IPHREEQC_PTR();

	_bstr_t f(*filename, true);

	if (*retval = this->IPhreeqcPtr->RunFile(f))
	{
#if defined(SUPPORT_ERROR_INFO)
		return AtlReportError(GetObjectCLSID(), this->IPhreeqcPtr->GetErrorString());
#endif
	}

	return S_OK;
}

STDMETHODIMP CCOM::RunAccumulated(LONG* retval)
{
	if( !retval )
	{
		return E_POINTER;
	}
	MACRO_CHECK_IPHREEQC_PTR();

	if (*retval = this->IPhreeqcPtr->RunAccumulated())
	{
#if defined(SUPPORT_ERROR_INFO)
		return AtlReportError(GetObjectCLSID(), this->IPhreeqcPtr->GetErrorString());
#endif
	}

	return S_OK;
}

STDMETHODIMP CCOM::get_SelectedOutputOn(VARIANT_BOOL* pVal)
{
	if( !pVal )
	{
		return E_POINTER;
	}
	MACRO_CHECK_IPHREEQC_PTR();

	if (this->IPhreeqcPtr->GetSelectedOutputOn())
	{
		*pVal = VARIANT_TRUE;
	}
	else
	{
		*pVal = VARIANT_FALSE;
	}

	return S_OK;
}

STDMETHODIMP CCOM::put_SelectedOutputOn(VARIANT_BOOL newVal)
{
	MACRO_CHECK_IPHREEQC_PTR();

	this->IPhreeqcPtr->SetSelectedOutputOn(newVal == VARIANT_TRUE);

	return S_OK;
}

STDMETHODIMP CCOM::RunString(BSTR* input, LONG* retval)
{
	if( !input || !retval )
	{
		return E_POINTER;
	}
	MACRO_CHECK_IPHREEQC_PTR();

	_bstr_t in(*input, true);

	if (*retval = this->IPhreeqcPtr->RunString(in))
	{
#if defined(SUPPORT_ERROR_INFO)
		return AtlReportError(GetObjectCLSID(), this->IPhreeqcPtr->GetErrorString());
#endif
	}

	return S_OK;
}

STDMETHODIMP CCOM::AccumulateLine(BSTR* line)
{
	if( !line )
	{
		return E_POINTER;
	}
	MACRO_CHECK_IPHREEQC_PTR();

	_bstr_t in(*line, true);

	VRESULT vr = this->IPhreeqcPtr->AccumulateLine(in);

	if (vr == VR_OUTOFMEMORY)
	{
		return E_OUTOFMEMORY;
	}

	return S_OK;
}

STDMETHODIMP CCOM::get_ColumnCount(LONG* pVal)
{
	if( !pVal )
	{
		return E_POINTER;
	}
	MACRO_CHECK_IPHREEQC_PTR();

	*pVal = this->IPhreeqcPtr->GetSelectedOutputColumnCount();

	return S_OK;
}

STDMETHODIMP CCOM::get_RowCount(LONG* pVal)
{
	if( !pVal )
	{
		return E_POINTER;
	}
	MACRO_CHECK_IPHREEQC_PTR();

	*pVal = this->IPhreeqcPtr->GetSelectedOutputRowCount();

	return S_OK;
}

STDMETHODIMP CCOM::get_Lines(BSTR* pVal)
{
	if( !pVal )
	{
		return E_POINTER;
	}
	MACRO_CHECK_IPHREEQC_PTR();

	CComBSTR bstrVal(this->IPhreeqcPtr->GetAccumulatedLines().c_str());
	*pVal = ::SysAllocString(bstrVal.m_str);

	return S_OK;
}

STDMETHODIMP CCOM::GetSelectedOutputArray(VARIANT* retval)
{
	if( !retval )
	{
		return E_POINTER;
	}
	MACRO_CHECK_IPHREEQC_PTR();

	// Initialize the bounds for the array
	SAFEARRAYBOUND safeBound[2];

	// Set up the bounds for the first index
	// rows
	safeBound[0].cElements = this->IPhreeqcPtr->GetSelectedOutputRowCount();
	safeBound[0].lLbound = 0;

	// Set up the bounds for the second index
	// cols
	safeBound[1].cElements = this->IPhreeqcPtr->GetSelectedOutputColumnCount();
	safeBound[1].lLbound = 0;


	// Initialize the VARIANT
	::VariantInit(retval);
	retval->vt = VT_VARIANT | VT_ARRAY;
	retval->parray = ::SafeArrayCreate(VT_VARIANT, 2, safeBound);
	if (retval->parray == 0)
	{
		return E_OUTOFMEMORY;
	}

	long lDimension[2];
	for (ULONG i = 0; i < safeBound[0].cElements; ++i)
	{
		for (ULONG j = 0; j < safeBound[1].cElements; ++j)
		{
			HRESULT hr = S_OK;
			VAR var;
			::VarInit(&var);
			this->IPhreeqcPtr->GetSelectedOutputValue(i, j, &var);

			lDimension[0] = i;
			lDimension[1] = j;

			switch(var.type)
			{
			case TT_EMPTY:
				{
					CComVariant variant;
					hr = ::SafeArrayPutElement(retval->parray, lDimension, &variant);
				}
				break;
			case TT_ERROR:
				{
					CComVariant variant;
					hr = ::SafeArrayPutElement(retval->parray, lDimension, &variant);
				}
				break;
			case TT_LONG:
				{
					CComVariant variant(var.lVal);
					hr = ::SafeArrayPutElement(retval->parray, lDimension, &variant);
				}
				break;
			case TT_DOUBLE:
				{
					CComVariant variant(var.dVal);
					hr = ::SafeArrayPutElement(retval->parray, lDimension, &variant);
				}
				break;
			case TT_STRING:
				{
					CComBSTR bstrVal(var.sVal);
					CComVariant variant(bstrVal);
					hr = ::SafeArrayPutElement(retval->parray, lDimension, &variant);
				}
				break;
			default:
				ATLASSERT(false);
			}
			::VarClear(&var);
			if (hr != S_OK)
			{
				return hr;
			}
		}
	}

	return S_OK;
}

STDMETHODIMP CCOM::GetErrorString(BSTR* retval)
{
	if( !retval )
	{
		return E_POINTER;
	}
	MACRO_CHECK_IPHREEQC_PTR();

	CComBSTR bstrVal(this->IPhreeqcPtr->GetErrorString());
	*retval = ::SysAllocString(bstrVal.m_str);

	return S_OK;
}

STDMETHODIMP CCOM::GetSelectedOutputValue(LONG row, LONG col, VARIANT* retval)
{
	if( !retval )
	{
		return E_POINTER;
	}
	MACRO_CHECK_IPHREEQC_PTR();

	HRESULT hr = S_OK;
	VAR v;
	::VarInit(&v);
	VRESULT vr = this->IPhreeqcPtr->GetSelectedOutputValue(row, col, &v);	
	switch(vr)
	{
	case VR_INVALIDROW: case VR_INVALIDCOL:
		::VariantChangeType(retval, retval, 0, VT_EMPTY);
		hr = E_INVALIDARG;
		break;
	case VR_OUTOFMEMORY:
		::VariantChangeType(retval, retval, 0, VT_EMPTY);
		hr = E_OUTOFMEMORY;
		break;
	}

	switch(v.type)
	{
	case TT_EMPTY:
		::VariantChangeType(retval, retval, 0, VT_EMPTY);
		break;

	case TT_LONG:
		::VariantChangeType(retval, retval, 0, VT_I4);
		retval->lVal = v.lVal;
		break;

	case TT_DOUBLE:
		::VariantChangeType(retval, retval, 0, VT_R8);
		retval->dblVal = v.dVal;
		break;

	case TT_STRING:
		{
			CComBSTR bstrVal(v.sVal);
			::VariantChangeType(retval, retval, 0, VT_BSTR);
			retval->bstrVal = ::SysAllocString(bstrVal.m_str);
		}
		break;
	}
	::VarClear(&v);

	return hr;
}

STDMETHODIMP CCOM::LoadDatabaseString(BSTR* input, LONG* retval)
{
	if( !input || !retval )
	{
		return E_POINTER;
	}
	MACRO_CHECK_IPHREEQC_PTR();

	_bstr_t in(*input, true);

	if (*retval = this->IPhreeqcPtr->LoadDatabaseString(in))
	{
#if defined(SUPPORT_ERROR_INFO)
		return AtlReportError(GetObjectCLSID(), this->IPhreeqcPtr->GetErrorString());
#endif
	}

	return S_OK;
}

STDMETHODIMP CCOM::get_DumpOn(VARIANT_BOOL* pVal)
{
	if( !pVal )
	{
		return E_POINTER;
	}
	MACRO_CHECK_IPHREEQC_PTR();

	if (this->IPhreeqcPtr->GetDumpOn())
	{
		*pVal = VARIANT_TRUE;
	}
	else
	{
		*pVal = VARIANT_FALSE;
	}

	return S_OK;
}

STDMETHODIMP CCOM::put_DumpOn(VARIANT_BOOL newVal)
{
	MACRO_CHECK_IPHREEQC_PTR();

	this->IPhreeqcPtr->SetDumpOn(newVal == VARIANT_TRUE);

	return S_OK;
}

STDMETHODIMP CCOM::get_DumpStringOn(VARIANT_BOOL* pVal)
{
	if( !pVal )
	{
		return E_POINTER;
	}
	MACRO_CHECK_IPHREEQC_PTR();

	if (this->IPhreeqcPtr->GetDumpStringOn())
	{
		*pVal = VARIANT_TRUE;
	}
	else
	{
		*pVal = VARIANT_FALSE;
	}

	return S_OK;
}

STDMETHODIMP CCOM::put_DumpStringOn(VARIANT_BOOL newVal)
{
	MACRO_CHECK_IPHREEQC_PTR();

	this->IPhreeqcPtr->SetDumpStringOn(newVal == VARIANT_TRUE);

	return S_OK;
}

STDMETHODIMP CCOM::GetComponentList(VARIANT* retval)
{
	if( !retval )
	{
		return E_POINTER;
	}
	MACRO_CHECK_IPHREEQC_PTR();

	try
	{
		std::list< std::string > s = this->IPhreeqcPtr->ListComponents();

		// Initialize the bounds for the array
		SAFEARRAYBOUND safeBound[1];

		// Set up the bounds
		safeBound[0].cElements = (ULONG)s.size();
		safeBound[0].lLbound = 0;

		// Initialize the VARIANT
		::VariantInit(retval);
		retval->vt = VT_VARIANT | VT_ARRAY;
		retval->parray = ::SafeArrayCreate(VT_VARIANT, 1, safeBound);
		if (retval->parray == 0)
		{
			return E_OUTOFMEMORY;
		}

		long lDimension[1];
		std::list< std::string >::iterator it = s.begin();
		for(long i = 0; it != s.end(); ++it, ++i)
		{
			lDimension[0] = i;
			CComBSTR bstrVal((*it).c_str());
			CComVariant variant(bstrVal);
			HRESULT hr = ::SafeArrayPutElement(retval->parray, lDimension, &variant);
			if (hr != S_OK)
			{
				return hr;
			}
		}
	}
	catch (std::bad_alloc)
	{
		return E_OUTOFMEMORY;
	}

	return S_OK;
}

STDMETHODIMP CCOM::GetWarningString(BSTR* retval)
{
	if( !retval )
	{
		return E_POINTER;
	}
	MACRO_CHECK_IPHREEQC_PTR();

	CComBSTR bstrVal(this->IPhreeqcPtr->GetWarningString());
	*retval = ::SysAllocString(bstrVal.m_str);

	return S_OK;
}

STDMETHODIMP CCOM::GetDumpString(BSTR* retval)
{
	if( !retval )
	{
		return E_POINTER;
	}
	MACRO_CHECK_IPHREEQC_PTR();

	CComBSTR bstrVal(this->IPhreeqcPtr->GetDumpString());
	*retval = ::SysAllocString(bstrVal.m_str);

	return S_OK;
}
