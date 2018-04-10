module aurora.directx.d3dx11;

import std.bitmanip;
import aurora.directx.com;
import aurora.directx.dxgi;
import aurora.directx.d3d11;

//
// D3D CSX
//

//
// Constants
//

enum int D3DX11_FFT_MAX_PRECOMPUTE_BUFFERS = 4;
enum int D3DX11_FFT_MAX_TEMP_BUFFERS = 4;
enum int D3DX11_FFT_MAX_DIMENSIONS = 32;

//
// Enumerations
//

public enum D3DX11_FFT_CREATE_FLAG : int { 
	DO_NOT_ADDREF_BUFFERS  = 0x01L
}

public enum D3DX11_FFT_DATA_TYPE : int { 
	REAL,
	COMPLEX
}

public enum D3DX11_FFT_DIM_MASK : int { 
	MASK_1D  = 0x1,
	MASK_2D  = 0x3,
	MASK_3D  = 0x7
}

public enum D3DX11_SCAN_DATA_TYPE : int { 
	FLOAT  = 1,
	INT = 2,
	UINT = 3
}

public enum D3DX11_SCAN_DIRECTION : int { 
	FORWARD   = 1,
	BACKWARD = 2
}

public enum D3DX11_SCAN_OPCODE : int { 
	ADD  = 1,
	MIN = 2,
	MAX = 3,
	MUL = 4,
	AND = 5,
	OR = 6,
	XOR = 7
}

//
// Structures
//

public struct D3DX11_FFT_BUFFER_INFO {
	uint NumTempBufferSizes;
	uint[D3DX11_FFT_MAX_TEMP_BUFFERS] TempBufferFloatSizes;
	uint NumPrecomputeBufferSizes;
	uint[D3DX11_FFT_MAX_PRECOMPUTE_BUFFERS] PrecomputeBufferFloatSizes;
}

public struct D3DX11_FFT_DESC {
	uint NumDimensions;
	uint[D3DX11_FFT_MAX_DIMENSIONS] ElementLengths;
	uint DimensionMask;
	D3DX11_FFT_DATA_TYPE Type;
}

//
// Functions
//

extern(Windows) HRESULT D3DX11CreateScan(ID3D11DeviceContext pDeviceContext, uint MaxElementScanSize, uint MaxScanCount, ID3DX11Scan *ppScan);
extern(Windows) HRESULT D3DX11CreateSegmentedScan(ID3D11DeviceContext pDeviceContext, uint MaxElementScanSize, ID3DX11SegmentedScan *ppScan);
extern(Windows) HRESULT D3DX11CreateFFT(ID3D11DeviceContext pDeviceContext,	const(D3DX11_FFT_DESC) *pDesc, uint Flags, D3DX11_FFT_BUFFER_INFO *pBufferInfo, ID3DX11FFT *ppFFT);
extern(Windows) HRESULT D3DX11CreateFFT1DComplex(ID3D11DeviceContext pDeviceContext, uint X, uint Flags, D3DX11_FFT_BUFFER_INFO *pBufferInfo, ID3DX11FFT *ppFFT);
extern(Windows) HRESULT D3DX11CreateFFT1DReal(ID3D11DeviceContext pDeviceContext, uint X, uint Flags, D3DX11_FFT_BUFFER_INFO *pBufferInfo, ID3DX11FFT *ppFFT);
extern(Windows) HRESULT D3DX11CreateFFT2DComplex(ID3D11DeviceContext pDeviceContext, uint X, uint Y, uint Flags, D3DX11_FFT_BUFFER_INFO *pBufferInfo, ID3DX11FFT *ppFFT);
extern(Windows) HRESULT D3DX11CreateFFT2DReal(ID3D11DeviceContext *pDeviceContext, uint X, uint Y, uint Flags, D3DX11_FFT_BUFFER_INFO *pBufferInfo, ID3DX11FFT *ppFFT);
extern(Windows) HRESULT D3DX11CreateFFT3DComplex(ID3D11DeviceContext *pDeviceContext, uint X, uint Y, uint Z, uint Flags, D3DX11_FFT_BUFFER_INFO *pBufferInfo, ID3DX11FFT *ppFFT);
extern(Windows) HRESULT D3DX11CreateFFT3DReal(ID3D11DeviceContext *pDeviceContext, uint X, uint Y, uint Z, uint Flags, D3DX11_FFT_BUFFER_INFO *pBufferInfo, ID3DX11FFT *ppFFT);

//
// Interfaces
//

mixin(uuid!(ID3DX11FFT, "b3f7a938-4c93-4310-a675-b30d6de50553"));
public interface ID3DX11FFT : IUnknown
{
extern(Windows):
	HRESULT AttachBuffersAndPrecompute(uint NumTempBuffers, const(ID3D11UnorderedAccessView) *ppTempBuffers, uint NumPrecomputeBuffers, const(ID3D11UnorderedAccessView) *ppPrecomputeBuffers);
	HRESULT ForwardTransform(const(ID3D11UnorderedAccessView) pInputBuffer, ID3D11UnorderedAccessView *ppOutputBuffer);
	float GetForwardScale();
	float GetInverseScale();
	HRESULT InverseTransform(const(ID3D11UnorderedAccessView) pInputBuffer, ID3D11UnorderedAccessView *ppOutputBuffer);
	HRESULT SetForwardScale(float ForwardScale);
	HRESULT SetInverseScale(float InverseScale);
}

mixin(uuid!(ID3DX11Scan, "5089b68f-e71d-4d38-be8e-f363b95a9405"));
public interface ID3DX11Scan : IUnknown
{
extern(Windows):
	HRESULT Multiscan(D3DX11_SCAN_DATA_TYPE ElementType, D3DX11_SCAN_OPCODE OpCode, uint ElementScanSize, uint ElementScanPitch, uint ScanCount, ID3D11UnorderedAccessView pSrc, ID3D11UnorderedAccessView pDst);
	HRESULT Scan(D3DX11_SCAN_DATA_TYPE ElementType, D3DX11_SCAN_OPCODE OpCode, uint ElementScanSize, ID3D11UnorderedAccessView pSrc, ID3D11UnorderedAccessView pDst);
	HRESULT SetScanDirection(D3DX11_SCAN_DIRECTION Direction);
}

mixin(uuid!(ID3DX11SegmentedScan, "a915128c-d954-4c79-bfe1-64db923194d6"));
public interface ID3DX11SegmentedScan : IUnknown
{
extern(Windows):
	HRESULT SegScan(D3DX11_SCAN_DATA_TYPE ElementType, D3DX11_SCAN_OPCODE OpCode, uint ElementScanSize, ID3D11UnorderedAccessView pSrc, ID3D11UnorderedAccessView pSrcElementFlags, ID3D11UnorderedAccessView pDst);
	HRESULT SetScanDirection(D3DX11_SCAN_DIRECTION Direction);
}
