module aurora.directx.dxgi.dxgi1_3;

version(Windows):

import aurora.directx.com;
public import aurora.directx.dxgi.dxgitype;
public import aurora.directx.dxgi.dxgicommon;
public import aurora.directx.dxgi.dxgiformat;
public import aurora.directx.dxgi.dxgi1_2;

public:

//
//	Constants
//

//DXGI_CREATE_FACTORY
enum DXGI_CREATE_FACTORY_NORMAL = (0U);
enum DXGI_CREATE_FACTORY_DEBUG = (1U);

//DXGI_PRESENT
enum DXGI_PRESENT_USE_DURATION = (0x00000100U);

//
//	Enumerations
//



//
//	Structures
//

public struct DXGI_DECODE_SWAP_CHAIN_DESC {
	uint Flags;
}

public struct DXGI_FRAME_STATISTICS_MEDIA {
	DXGI_FRAME_STATISTICS Base;
	alias Base this;
	DXGI_FRAME_PRESENTATION_MODE CompositionMode;
	UINT                         ApprovedPresentDuration;
}

public struct DXGI_MATRIX_3X2_F {
	float _11;
	float _12;
	float _21;
	float _22;
	float _31;
	float _32;
}

enum DXGI_OVERLAY_SUPPORT_FLAG
{
	DIRECT	= 0x1,
	SCALING	= 0x2
}

//
//	Interfaces
//

mixin(uuid!(IDXGIDebug1, "c5a05f0c-16f2-4adf-9f4d-a8c4d58ac550"));
public interface IDXGIDebug1 : IDXGIDebug
{
extern(Windows):
	void DisableLeakTrackingForThread();
	void EnableLeakTrackingForThread();
	bool IsLeakTrackingEnabledForThread();
}

mixin(uuid!(IDXGIDecodeSwapChain, "2633066b-4514-4c7a-8fd8-12ea98059d18"));
public interface IDXGIDecodeSwapChain : IUnknown
{
extern(Windows):
	DXGI_MULTIPLANE_OVERLAY_YCbCr_FLAGS GetColorSpace();
	HRESULT GetDestSize(uint *Width, uint *Height);
	HRESULT GetSourceRect(RECT *Rect);
	HRESULT GetTargetRect(RECT *Rect);
	HRESULT PresentBuffer(uint BufferToPresent, uint SyncInterval, uint Flags);
	HRESULT SetColorSpace(DXGI_MULTIPLANE_OVERLAY_YCbCr_FLAGS ColorSpace);
	HRESULT SetDestSize(uint Width, uint Height);
	HRESULT SetSourceRect(const RECT *Rect);
	HRESULT SetTargetRect(const RECT *Rect);
}

mixin(uuid!(IDXGIDevice3, "6007896c-3244-4afd-bf18-a6d3beda5023"));
public interface IDXGIDevice3 : IDXGIDevice2
{
extern(Windows):
	void Trim();
}

mixin(uuid!(IDXGIFactory3, "25483823-cd46-4c7d-86ca-47aa95b837bd"));
interface IDXGIFactory3 : IDXGIFactory2
{
extern(Windows):
	uint GetCreationFlags();	
}

mixin(uuid!(IDXGIFactoryMedia, "41e7d1f2-a591-4f7b-a2e5-fa9c843e1c12"));
public interface IDXGIFactoryMedia : IDXGIObject
{
extern(Windows):
	HRESULT CreateDecodeSwapChainForCompositionSurfaceHandle(IUnknown Device, HANDLE Surface, const DXGI_DECODE_SWAP_CHAIN_DESC *Desc, IDXGIResource YuvDecodeBuffers, IDXGIOutput RestrictToOutput, IDXGIDecodeSwapChain *SwapChain);	
	HRESULT CreateSwapChainForCompositionSurfaceHandle(IUnknown Device, HANDLE Surface, const DXGI_SWAP_CHAIN_DESC1 *Desc, IDXGIOutput RestrictToOutput, IDXGISwapChain1 *SwapChain);
}

mixin(uuid!(IDXGIOutput2, "595e39d1-2724-4663-99b1-da969de28364"));
public interface IDXGIOutput2 : IDXGIOutput1
{
extern(Windows):
	bool SupportsOverlays();
}

mixin(uuid!(IDXGISwapChain2, "a8be2ac4-199f-4946-b331-79599fb98de7"));
public interface IDXGISwapChain2 : IDXGISwapChain1
{
extern(Windows):
	HANDLE GetFrameLatencyWaitableObject();
	HRESULT GetMatrixTransform(DXGI_MATRIX_3X2_F *Matrix);
	HRESULT GetMaximumFrameLatency(uint *MaxLatency);
	HRESULT GetSourceSize(uint *Width, uint *Height);
	HRESULT SetMatrixTransform(const DXGI_MATRIX_3X2_F *Matrix);
	HRESULT SetMaximumFrameLatency(uint MaxLatency);
	HRESULT SetSourceSize(uint Width, uint Height);
}

mixin(uuid!(IDXGISwapChainMedia,"dd95b90b-f05f-4f6a-bd65-25bfb264bd84"));
public interface IDXGISwapChainMedia : IUnknown
{
extern(Windows):
	HRESULT CheckPresentDurationSupport(uint DesiredPresentDuration, uint *ClosestSmallerPresentDuration, uint *ClosestLargerPresentDuration);
	HRESULT GetFrameStatisticsMedia(DXGI_FRAME_STATISTICS_MEDIA *Stats);
	HRESULT SetPresentDuration(uint Duration);
}

mixin(uuid!(IDXGIOutput3, "8a6bb301-7e7e-41F4-a8e0-5b32f7f99b18"));
public interface IDXGIOutput3 : IDXGIOutput2
{
extern(Windows):
	HRESULT CheckOverlaySupport(DXGI_FORMAT EnumFormat, IUnknown pConcernedDevice, uint *pFlags);
}

//
//	Functions
//

extern(Windows) public HRESULT CreateDXGIFactory2(uint Flags, const(GUID)* RIID, void **Factory);
extern(Windows) public HRESULT DXGIGetDebugInterface1(uint Flags, const(GUID)* RIID, void **Debug);
