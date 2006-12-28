// Phreeqc.cpp : Implementation of CPhreeqc

#include "stdafx.h"
#include "Phreeqc.h"

#include <comutil.h> // _bstr_t
#include <atlsafe.h> // CComSafeArray
#include <HtmlHelp.h>

#include "IPhreeqc.h"


// CPhreeqc

STDMETHODIMP CPhreeqc::InterfaceSupportsErrorInfo(REFIID riid)
{
	static const IID* arr[] = 
	{
		&IID_IPhreeqc
	};

	for (int i=0; i < sizeof(arr) / sizeof(arr[0]); i++)
	{
		if (InlineIsEqualGUID(*arr[i],riid))
			return S_OK;
	}
	return S_FALSE;
}

STDMETHODIMP CPhreeqc::LoadDatabase(BSTR* filename, LONG* retval)
{
	if( !filename || !retval )
	{
		return E_POINTER;
	}

	_bstr_t f(*filename, true);

	if (*retval = ::LoadDatabase(f))
	{
#if defined(SUPPORT_ERROR_INFO)
		return AtlReportError(GetObjectCLSID(), ::GetLastErrorString());
#endif
	}

	return S_OK;

}

STDMETHODIMP CPhreeqc::get_OutputOn(VARIANT_BOOL* pVal)
{
	if( !pVal )
	{
		return E_POINTER;
	}

	if (this->m_OutputOn)
	{
		*pVal = VARIANT_TRUE;
	}
	else
	{
		*pVal = VARIANT_FALSE;
	}
	return S_OK;
}

STDMETHODIMP CPhreeqc::put_OutputOn(VARIANT_BOOL newVal)
{
	if (newVal == VARIANT_TRUE)
	{
		this->m_OutputOn = true;
	}
	else
	{
		this->m_OutputOn = false;
	}
	return S_OK;
}

STDMETHODIMP CPhreeqc::get_ErrorOn(VARIANT_BOOL* pVal)
{
	if( !pVal )
	{
		return E_POINTER;
	}

	if (this->m_ErrorOn)
	{
		*pVal = VARIANT_TRUE;
	}
	else
	{
		*pVal = VARIANT_FALSE;
	}
	return S_OK;
}

STDMETHODIMP CPhreeqc::put_ErrorOn(VARIANT_BOOL newVal)
{
	if (newVal == VARIANT_TRUE)
	{
		this->m_ErrorOn = true;
	}
	else
	{
		this->m_ErrorOn = false;
	}
	return S_OK;
}

STDMETHODIMP CPhreeqc::get_LogOn(VARIANT_BOOL* pVal)
{
	if( !pVal )
	{
		return E_POINTER;
	}

	if (this->m_LogOn)
	{
		*pVal = VARIANT_TRUE;
	}
	else
	{
		*pVal = VARIANT_FALSE;
	}
	return S_OK;
}

STDMETHODIMP CPhreeqc::put_LogOn(VARIANT_BOOL newVal)
{
	if (newVal == VARIANT_TRUE)
	{
		this->m_LogOn = true;
	}
	else
	{
		this->m_LogOn = false;
	}
	return S_OK;
}

STDMETHODIMP CPhreeqc::RunFile(BSTR* filename, LONG* retval)
{
	if( !filename || !retval )
	{
		return E_POINTER;
	}

	_bstr_t f(*filename, true);

	if (*retval = ::RunFile(f, this->m_OutputOn, this->m_ErrorOn, this->m_LogOn, this->m_SelectedOutputOn))
	{
#if defined(SUPPORT_ERROR_INFO)
		return AtlReportError(GetObjectCLSID(), ::GetLastErrorString());
#endif
	}

	return S_OK;
}

STDMETHODIMP CPhreeqc::Run(LONG* retval)
{
	if( !retval )
	{
		return E_POINTER;
	}

	if (*retval = ::Run(this->m_OutputOn, this->m_ErrorOn, this->m_LogOn, this->m_SelectedOutputOn))
	{
#if defined(SUPPORT_ERROR_INFO)
		return AtlReportError(GetObjectCLSID(), ::GetLastErrorString());
#endif
	}

	return S_OK;
}

STDMETHODIMP CPhreeqc::get_SelectedOutputOn(VARIANT_BOOL* pVal)
{
	if( !pVal )
	{
		return E_POINTER;
	}

	if (this->m_SelectedOutputOn)
	{
		*pVal = VARIANT_TRUE;
	}
	else
	{
		*pVal = VARIANT_FALSE;
	}
	return S_OK;
}

STDMETHODIMP CPhreeqc::put_SelectedOutputOn(VARIANT_BOOL newVal)
{
	if (newVal == VARIANT_TRUE)
	{
		this->m_SelectedOutputOn = true;
	}
	else
	{
		this->m_SelectedOutputOn = false;
	}
	return S_OK;
}

STDMETHODIMP CPhreeqc::RunString(BSTR* input, LONG* retval)
{
	if( !input || !retval )
	{
		return E_POINTER;
	}

	_bstr_t in(*input, true);

	if (*retval = ::RunString(in, this->m_OutputOn, this->m_ErrorOn, this->m_LogOn, this->m_SelectedOutputOn))
	{
#if defined(SUPPORT_ERROR_INFO)
		return AtlReportError(GetObjectCLSID(), ::GetLastErrorString());
#endif
	}

	return S_OK;
}

STDMETHODIMP CPhreeqc::AccumulateLine(BSTR* line)
{
	if( !line )
	{
		return E_POINTER;
	}

	_bstr_t in(*line, true);

	VRESULT vr = ::AccumulateLine(in);

	if (vr == VR_OUTOFMEMORY)
	{
		return E_OUTOFMEMORY;
	}

	return S_OK;
}

STDMETHODIMP CPhreeqc::get_ColumnCount(LONG* pVal)
{
	if( !pVal )
	{
		return E_POINTER;
	}

	*pVal = ::GetSelectedOutputColumnCount();

	return S_OK;
}

STDMETHODIMP CPhreeqc::get_RowCount(LONG* pVal)
{
	if( !pVal )
	{
		return E_POINTER;
	}

	*pVal = ::GetSelectedOutputRowCount();

	return S_OK;
}

STDMETHODIMP CPhreeqc::get_Lines(BSTR* pVal)
{
	extern const std::string& GetAccumulatedLines(void);

	if( !pVal )
	{
		return E_POINTER;
	}

	CComBSTR bstrVal(GetAccumulatedLines().c_str());
	*pVal = ::SysAllocString(bstrVal.m_str);

	return S_OK;
}

STDMETHODIMP CPhreeqc::GetSelectedOutputArray(VARIANT* retval)
{
	// Initialize the bounds for the array
	SAFEARRAYBOUND safeBound[2];

	// Set up the bounds for the first index
	// rows
	safeBound[0].cElements = ::GetSelectedOutputRowCount();
	safeBound[0].lLbound = 0;

	// Set up the bounds for the second index
	// cols
	safeBound[1].cElements = ::GetSelectedOutputColumnCount();
	safeBound[1].lLbound = 0 ;


	// Initialize the VARIANT
	::VariantInit(retval);
	retval->vt = VT_VARIANT | VT_ARRAY;
	retval->parray = ::SafeArrayCreate(VT_VARIANT, 2, safeBound);


	long lDimension[2];

	for (ULONG i = 0; i < safeBound[0].cElements; ++i)
	{
		for (ULONG j = 0; j < safeBound[1].cElements; ++j)
		{
			VAR var;
			::VarInit(&var);
			::GetSelectedOutputValue(i, j, &var);

			lDimension[0] = i;
			lDimension[1] = j;

			switch(var.type)
			{
			case TT_EMPTY:
				{
					CComVariant variant;
					::SafeArrayPutElement(retval->parray, lDimension, &variant);
				}
				break;
			case TT_ERROR:
				{
					CComVariant variant;
					::SafeArrayPutElement(retval->parray, lDimension, &variant);
				}
				break;
			case TT_LONG:
				{
					CComVariant variant(var.lVal);
					::SafeArrayPutElement(retval->parray, lDimension, &variant);
				}
				break;
			case TT_DOUBLE:
				{
					CComVariant variant(var.dVal);
					::SafeArrayPutElement(retval->parray, lDimension, &variant);
				}
				break;
			case TT_STRING:
				{
					CComBSTR bstrVal(var.sVal);
					CComVariant variant(bstrVal);
					::SafeArrayPutElement(retval->parray, lDimension, &variant);
				}
				break;
			default:
				ATLASSERT(false);
			}
			::VarClear(&var);
		}
	}

	return S_OK;
}

STDMETHODIMP CPhreeqc::GetLastErrorString(BSTR* retval)
{
	if( !retval )
	{
		return E_POINTER;
	}

	CComBSTR bstrVal(::GetLastErrorString());
	*retval = ::SysAllocString(bstrVal.m_str);

	return S_OK;
}

STDMETHODIMP CPhreeqc::GetSelectedOutputColumnCount(LONG* retval)
{
	if( !retval )
	{
		return E_POINTER;
	}

	*retval = ::GetSelectedOutputColumnCount();

	return S_OK;
}

STDMETHODIMP CPhreeqc::GetSelectedOutputRowCount(LONG* retval)
{
	if( !retval )
	{
		return E_POINTER;
	}

	*retval = ::GetSelectedOutputRowCount();

	return S_OK;
}

STDMETHODIMP CPhreeqc::GetSelectedOutputValue(LONG row, LONG col, VARIANT* retval)
{
	if( !retval )
	{
		return E_POINTER;
	}

	HRESULT hr = S_OK;
	VAR v;
	::VarInit(&v);
	VRESULT vr = ::GetSelectedOutputValue(row, col, &v);	
	switch(vr)
	{
	case VR_INVALIDROW: case VR_INVALIDCOL:
		hr = E_INVALIDARG;
		break;
	case VR_OUTOFMEMORY:
		hr = E_OUTOFMEMORY;
		break;
	}

	switch(v.type)
	{
	case TT_EMPTY:
		::VariantChangeType(retval, retval, 0, VT_EMPTY);
		retval->lVal = v.lVal;
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
			retval->bstrVal =  ::SysAllocString(bstrVal.m_str);
		}
		break;
	}
	::VarClear(&v);
	return hr;
}

STDMETHODIMP CPhreeqc::LoadDatabaseString(BSTR* input, LONG* retval)
{
	if( !input || !retval )
	{
		return E_POINTER;
	}

	_bstr_t in(*input, true);

	if (*retval = ::LoadDatabaseString(in))
	{
#if defined(SUPPORT_ERROR_INFO)
		return AtlReportError(GetObjectCLSID(), ::GetLastErrorString());
#endif
	}
	return S_OK;
}

STDMETHODIMP CPhreeqc::VarArgCount(SAFEARRAY * psa, LONG* retval)
{
	CComSafeArray<VARIANT> sa;

	HRESULT hr = sa.Attach(psa);
	if (hr == S_OK)
	{
		*retval = sa.GetCount();
	}
	return hr;
}

STDMETHODIMP CPhreeqc::RunOpt(VARIANT* OutputOn, VARIANT* ErrorOn, VARIANT* LogOn, VARIANT* SelectedOutputOn, LONG* retval)
{
	if( !OutputOn || !ErrorOn || !LogOn || !SelectedOutputOn )
	{
		return E_POINTER;
	}

	int out_on = this->m_OutputOn ? 1 : 0;
	int err_on = this->m_ErrorOn ? 1 : 0;
	int log_on = this->m_LogOn ? 1 : 0;
	int sel_on = this->m_SelectedOutputOn ? 1 : 0;

	if (OutputOn->vt == VT_BOOL)
	{
		out_on = OutputOn->boolVal == VARIANT_TRUE ? 1 : 0;
	}
	if (ErrorOn->vt == VT_BOOL)
	{
		err_on = ErrorOn->boolVal == VARIANT_TRUE ? 1 : 0;
	}
	if (LogOn->vt == VT_BOOL)
	{
		log_on = LogOn->boolVal == VARIANT_TRUE ? 1 : 0;
	}
	if (SelectedOutputOn->vt == VT_BOOL)
	{
		sel_on = SelectedOutputOn->boolVal == VARIANT_TRUE ? 1 : 0;
	}

	if (*retval = ::Run(out_on, err_on, log_on, sel_on))
	{
#if defined(SUPPORT_ERROR_INFO)
		return AtlReportError(GetObjectCLSID(), ::GetLastErrorString());
#endif
	}

	return S_OK;
}

STDMETHODIMP CPhreeqc::ShowHelp(LONG* id)
{
	::HtmlHelp(NULL, _T("C:\\cygwin\\home\\charlton\\programs\\IPhreeqcMMS-Trunk\\IPhreeqc\\PhreeqcCOM\\Debug\\PhreeqcCOM.chm"),
		HH_HELP_CONTEXT,
		*id);

	return S_OK;
}
