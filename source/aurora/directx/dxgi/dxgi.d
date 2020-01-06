module aurora.directx.dxgi.dxgi;

version(Windows):

import aurora.directx.com;
public import aurora.directx.dxgi.dxgitype;
public import aurora.directx.dxgi.dxgicommon;
public import aurora.directx.dxgi.dxgiformat;

public:

//
//	Constants
//

//DXGI_ERROR
enum DXGI_ERROR_DEVICE_HUNG = 0x887A0006;
enum DXGI_ERROR_DEVICE_REMOVED = 0x887A0005;
enum DXGI_ERROR_DEVICE_RESET = 0x887A0007;
enum DXGI_ERROR_DRIVER_INTERNAL_ERROR = 0x887A0020;
enum DXGI_ERROR_FRAME_STATISTICS_DISJOINT = 0x887A000B;
enum DXGI_ERROR_GRAPHICS_VIDPN_SOURCE_IN_USE = 0x887A000C;
enum DXGI_ERROR_INVALID_CALL = 0x887A0001;
enum DXGI_ERROR_NONEXCLUSIVE = 0x887A0021;
enum DXGI_ERROR_NOT_CURRENTLY_AVAILABLE = 0x887A0022;
enum DXGI_ERROR_NOT_FOUND = 0x887A0002;
enum DXGI_ERROR_REMOTE_CLIENT_DISCONNECTED = 0x887A0023;
enum DXGI_ERROR_REMOTE_OUTOFMEMORY = 0x887A0024;
enum DXGI_ERROR_WAS_STILL_DRAWING = 0x887A000A;
enum DXGI_ERROR_UNSUPPORTED = 0x887A0004;
enum DXGI_ERROR_ACCESS_LOST = 0x887A0026;
enum DXGI_ERROR_WAIT_TIMEOUT = 0x887A0027;
enum DXGI_ERROR_SESSION_DISCONNECTED = 0x887A0028;
enum DXGI_ERROR_RESTRICT_TO_OUTPUT_STALE = 0x887A0029;
enum DXGI_ERROR_CANNOT_PROTECT_CONTENT = 0x887A002A;
enum DXGI_ERROR_ACCESS_DENIED = 0x887A002B;
enum DXGI_ERROR_NAME_ALREADY_EXISTS = 0x887A002C;

//DXGI_ENUM_MODES
enum DXGI_ENUM_MODES_INTERLACED = (1U);
enum DXGI_ENUM_MODES_SCALING    = (2U);

//DXGI_PRESENT
enum DXGI_PRESENT_FRAME           = (0x00000000U);
enum DXGI_PRESENT_TEST            = (0x00000001U);
enum DXGI_PRESENT_DO_NOT_SEQUENCE = (0x00000002U);
enum DXGI_PRESENT_RESTART         = (0x00000004U);

//DXGI_STATUS
enum DXGI_STATUS_OCCLUDED = 0x087A0001;
enum DXGI_STATUS_MODE_CHANGED = 0x087A0007;
enum DXGI_STATUS_MODE_CHANGE_IN_PROGRESS = 0x087A0008;

//DXGI_USAGE
enum DXGI_USAGE_SHADER_INPUT         = (1L << (0 + 4));
enum DXGI_USAGE_RENDER_TARGET_OUTPUT = (1L << (1 + 4));
enum DXGI_USAGE_BACK_BUFFER          = (1L << (2 + 4));
enum DXGI_USAGE_SHARED               = (1L << (3 + 4));
enum DXGI_USAGE_READ_ONLY            = (1L << (4 + 4));
enum DXGI_USAGE_DISCARD_ON_PRESENT   = (1L << (5 + 4));
enum DXGI_USAGE_UNORDERED_ACCESS     = (1L << (6 + 4));
alias uint DXGI_USAGE;

//DXGI_MAP
enum DXGI_MAP_READ    = (1U);
enum DXGI_MAP_WRITE   = (2U);
enum DXGI_MAP_DISCARD = (4U);

//DXGI_RESOURCE_PRIORITY
enum DXGI_RESOURCE_PRIORITY_MINIMUM = (0x2800_0000U);
enum DXGI_RESOURCE_PRIORITY_LOW	    = (0x5000_0000U);
enum DXGI_RESOURCE_PRIORITY_NORMAL  = (0x7800_0000U);
enum DXGI_RESOURCE_PRIORITY_HIGH    = (0xa000_0000U);
enum DXGI_RESOURCE_PRIORITY_MAXIMUM = (0xc800_0000U);

//DXGI_CPU_ACCESS
enum DXGI_CPU_ACCESS_NONE       = ( 0U);
enum DXGI_CPU_ACCESS_DYNAMIC    = ( 1U);
enum DXGI_CPU_ACCESS_READ_WRITE = ( 2U);
enum DXGI_CPU_ACCESS_SCRATCH    = ( 3U);
enum DXGI_CPU_ACCESS_FIELD      = (15U);

//DXGI_SWAP_CHAIN_FLAG
enum DXGI_SWAP_CHAIN_FLAG_NONPREROTATED                    = (1U);
enum DXGI_SWAP_CHAIN_FLAG_ALLOW_MODE_SWITCH                = (2U);
enum DXGI_SWAP_CHAIN_FLAG_GDI_COMPATIBLE                   = (4U);
enum DXGI_SWAP_CHAIN_FLAG_RESTRICTED_CONTENT               = (8U);
enum DXGI_SWAP_CHAIN_FLAG_RESTRICT_SHARED_RESOURCE_DRIVER  = (16U);
enum DXGI_SWAP_CHAIN_FLAG_DISPLAY_ONLY                     = (32U);
enum DXGI_SWAP_CHAIN_FLAG_FRAME_LATENCY_WAITABLE_OBJECT    = (64U);
enum DXGI_SWAP_CHAIN_FLAG_FOREGROUND_LAYER                 = (128U);

//DXGI_MWA
enum DXGI_MWA_NO_WINDOW_CHANGES = (1 << 0);
enum DXGI_MWA_NO_ALT_ENTER      = (1 << 1);
enum DXGI_MWA_NO_PRINT_SCREEN   = (1 << 2);
enum DXGI_MWA_VALID             = (0x7);

//DXGI_DEBUG
//const IID DXGI_DEBUG_ALL = { 0xe48ae283, 0xda80, 0x490b, 0x87, 0xe6, 0x43, 0xe9, 0xa9, 0xcf, 0xda, 0x8 };
//const IID DXGI_DEBUG_DX = { 0x35cdd7fc, 0x13b2, 0x421d, 0xa5, 0xd7, 0x7e, 0x44, 0x51, 0x28, 0x7d, 0x64 };
//const IID DXGI_DEBUG_DXGI = { 0x25cddaa4, 0xb1c6, 0x47e1, 0xac, 0x3e, 0x98, 0x87, 0x5b, 0x5a, 0x2e, 0x2a };
//const IID DXGI_DEBUG_APP = { 0x6cd6e01, 0x4219, 0x4ebd, 0x87, 0x9, 0x27, 0xed, 0x23, 0x36, 0xc, 0x62 };
//const IID DXGI_DEBUG_D3D11 = { 0x4b99317b, 0xac39, 0x4aa6, 0xbb, 0xb, 0xba, 0xa0, 0x47, 0x84, 0x79, 0x8f };

//
//	Enumerations
//

public enum DXGI_ADAPTER_FLAG : int { 
	NONE         = 0,
	REMOTE       = 1,
	SOFTWARE     = 2,
	FORCE_DWORD  = 0xffffffff
}

public enum DXGI_FRAME_PRESENTATION_MODE : int { 
	COMPOSED  = 0,
	OVERLAY   = 1,
	NONE      = 2
}

public enum DXGI_MULTIPLANE_OVERLAY_YCbCr_FLAGS : int { 
	NOMINAL_RANGE  = 0x1,
	BT709          = 0x2,
	xvYCC          = 0x4
}

public enum DXGI_RESIDENCY : int { 
	FULLY_RESIDENT             = 1,
	RESIDENT_IN_SHARED_MEMORY  = 2,
	EVICTED_TO_DISK            = 3
}

public enum DXGI_SWAP_CHAIN_FLAG : int { 
	NONPREROTATED                    = 1,
	ALLOW_MODE_SWITCH                = 2,
	GDI_COMPATIBLE                   = 4,
	RESTRICTED_CONTENT               = 8,
	RESTRICT_SHARED_RESOURCE_DRIVER  = 16,
	DISPLAY_ONLY                     = 32,
	FRAME_LATENCY_WAITABLE_OBJECT    = 64,
	FOREGROUND_LAYER                 = 128
}

enum DXGI_SWAP_EFFECT : int { 
	DISCARD          = 0,
	SEQUENTIAL       = 1,
	FLIP_SEQUENTIAL  = 3
}

//
//	Structures
//

public struct DXGI_ADAPTER_DESC {
	wchar[128] Description;
	uint VendorId;
	uint DeviceId;
	uint SubSysId;
	uint Revision;
	size_t DedicatedVideoMemory;
	size_t DedicatedSystemMemory;
	size_t SharedSystemMemory;
	LUID AdapterLuid;
}

public struct DXGI_ADAPTER_DESC1 {
	wchar[128] Description;
	uint VendorId;
	uint DeviceId;
	uint SubSysId;
	uint Revision;
	size_t DedicatedVideoMemory;
	size_t DedicatedSystemMemory;
	size_t SharedSystemMemory;
	LUID AdapterLuid;
	uint Flags;
}

public struct DXGI_FRAME_STATISTICS {
	uint PresentCount;
	uint PresentRefreshCount;
	uint SyncRefreshCount;
	LARGE_INTEGER SyncQPCTime;
	LARGE_INTEGER SyncGPUTime;
}

public struct DXGI_GAMMA_CONTROL {
	DXGI_RGB               Scale;
	DXGI_RGB               Offset;
	DXGI_RGB[1025]         GammaCurve;
}

public struct DXGI_GAMMA_CONTROL_CAPABILITIES {
	BOOL                   ScaleAndOffsetSupported;
	float                  MaxConvertedValue;
	float                  MinConvertedValue;
	uint                   NumGammaControlPoints;
	float[1025]           ControlPointPosition;
}

public struct DXGI_MAPPED_RECT {
	int Pitch;
	ubyte *pBits;
}

public struct DXGI_MODE_DESC {
	uint                     Width;
	uint                     Height;
	DXGI_RATIONAL            RefreshRate;
	DXGI_FORMAT              Format;
	DXGI_MODE_SCANLINE_ORDER ScanlineOrdering;
	DXGI_MODE_SCALING        Scaling;
}

public struct DXGI_OUTPUT_DESC {
	wchar[32]          DeviceName;
	RECT               DesktopCoordinates;
	BOOL               AttachedToDesktop;
	DXGI_MODE_ROTATION Rotation;
	long               Monitor;
}

public struct DXGI_OUTDUPL_DESC {
	DXGI_MODE_DESC     ModeDesc;
	DXGI_MODE_ROTATION Rotation;
	BOOL               DesktopImageInSystemMemory;
}

public struct DXGI_SHARED_RESOURCE {
	HANDLE Handle;
}

public struct DXGI_SURFACE_DESC {
	uint             Width;
	uint             Height;
	DXGI_FORMAT      Format;
	DXGI_SAMPLE_DESC SampleDesc;
}

public struct DXGI_SWAP_CHAIN_DESC {
	DXGI_MODE_DESC   BufferDesc;
	DXGI_SAMPLE_DESC SampleDesc;
	uint             BufferUsage;
	uint             BufferCount;
	HWND             OutputWindow;
	BOOL             Windowed;
	DXGI_SWAP_EFFECT SwapEffect;
	uint             Flags;
}

//
//	Interfaces
//

mixin(uuid!(IDXGIObject, "aec22fb8-76f3-4639-9be0-28eb43a67a2e"));
interface IDXGIObject : IUnknown
{
extern(Windows):
	HRESULT GetParent(GUID* IID, void** Parent);
	HRESULT GetPrivateData(GUID* IID, uint* DataSize, void* Data);
	HRESULT SetPrivateData(GUID* IID, uint DataSize, const void* Data);
	HRESULT SetPrivateDataInterface(GUID* IID, const(IUnknown) Unknown);
}

mixin(uuid!(IDXGIAdapter, "2411e7e1-12ac-4ccf-bd14-9798e8534dc0"));
interface IDXGIAdapter : IDXGIObject
{
extern(Windows):
	HRESULT CheckInterfaceSupport(GUID* InterfaceName, LARGE_INTEGER *UMDVersion);
	HRESULT EnumOutputs(uint Output, IDXGIOutput *Output);
	HRESULT GetDesc(DXGI_ADAPTER_DESC *Desc);
}

mixin(uuid!(IDXGIAdapter1, "29038f61-3839-4626-91fd-086879011a05"));
interface IDXGIAdapter1 : IDXGIAdapter
{
extern(Windows):
	HRESULT GetDesc1(DXGI_ADAPTER_DESC1 *Desc);
}

mixin(uuid!(IDXGIDevice, "54ec77fa-1377-44e6-8c32-88fd5f44c84c"));
interface IDXGIDevice : IDXGIObject
{
extern(Windows):
	HRESULT CreateSurface(const DXGI_SURFACE_DESC *Desc, uint NumSurfaces, DXGI_USAGE Usage, const DXGI_SHARED_RESOURCE *SharedResource, IDXGISurface *Surface);
	HRESULT GetAdapter(IDXGIAdapter *Adapter);
	HRESULT GetGPUThreadPriority(int *Priority);
	HRESULT QueryResourceResidency(const(IUnknown) *Resources, DXGI_RESIDENCY *ResidencyStatus, uint NumResources);
	HRESULT SetGPUThreadPriority(int Priority);
}

mixin(uuid!(IDXGIDevice1, "77db970f-6276-48ba-ba28-070143b4392c"));
interface IDXGIDevice1 : IDXGIDevice
{
extern(Windows):
	HRESULT GetMaximumFrameLatency(uint *MaxLatency);
	HRESULT SetMaximumFrameLatency(uint MaxLatency);
}

mixin(uuid!(IDXGIDeviceSubObject, "3d3e0379-f9de-4d58-bb6c-18d62992f1a6"));
interface IDXGIDeviceSubObject : IDXGIObject
{
extern(Windows):
	HRESULT GetDevice(GUID RIID, void **Device);
}

mixin(uuid!(IDXGIFactory, "7b7166ec-21c7-44ae-b21a-c9ae321ae369"));
interface IDXGIFactory : IDXGIObject
{
extern(Windows):
	HRESULT CreateSoftwareAdapter(HMODULE Module, IDXGIAdapter *Adapter);
	HRESULT CreateSwapChain(IUnknown Device, DXGI_SWAP_CHAIN_DESC *Desc, IDXGISwapChain *SwapChain);
	HRESULT EnumAdapters(uint Adapter,IDXGIAdapter *Adapter);
	HRESULT GetWindowAssociation(HWND *WindowHandle);
	HRESULT MakeWindowAssociation(HWND WindowHandle, uint Flags);
}

mixin(uuid!(IDXGIFactory1, "770aae78-f26f-4dba-a829-253c83d1b387"));
interface IDXGIFactory1 : IDXGIFactory
{
extern(Windows):
	HRESULT EnumAdapters1(uint Adapter, IDXGIAdapter1 *Adapter);
	BOOL IsCurrent();
}

mixin(uuid!(IDXGIKeyedMutex, "9d8e1289-d7b3-465f-8126-250e349af85d"));
interface IDXGIKeyedMutex : IDXGIDeviceSubObject
{
extern(Windows):
	HRESULT AcquireSync(ulong Key, DWORD Milliseconds);
	HRESULT ReleaseSync(ulong Key);
}

mixin(uuid!(IDXGIOutput, "ae02eedb-c735-4690-8d52-5a8dc20213aa"));
interface IDXGIOutput : IDXGIObject
{
extern(Windows):
	HRESULT FindClosestMatchingMode(const DXGI_MODE_DESC *ModeToMatch, DXGI_MODE_DESC *ClosestMatch, IUnknown ConcernedDevice);
	HRESULT GetDesc(DXGI_OUTPUT_DESC *Desc);
	HRESULT GetDisplayModeList(DXGI_FORMAT EnumFormat, uint Flags, uint *NumModes, DXGI_MODE_DESC *Desc);
	HRESULT GetDisplaySurfaceData(IDXGISurface Destination);
	HRESULT GetFrameStatistics(DXGI_FRAME_STATISTICS *Stats);
	HRESULT GetGammaControl(DXGI_GAMMA_CONTROL *Array);
	HRESULT GetGammaControlCapabilities(DXGI_GAMMA_CONTROL_CAPABILITIES *GammaCaps);
	void ReleaseOwnership();
	HRESULT SetDisplaySurface(IDXGISurface ScanoutSurface);
	HRESULT SetGammaControl(const DXGI_GAMMA_CONTROL *Array);
	HRESULT TakeOwnership(IUnknown Device, BOOL Exclusive);
	HRESULT WaitForVBlank();
}

mixin(uuid!(IDXGIResource, "035f3ab4-482e-4e50-b41f-8a7f8bd8960b"));
interface IDXGIResource : IDXGIDeviceSubObject
{
extern(Windows):
	HRESULT GetEvictionPriority(uint *EvictionPriority);
	HRESULT GetSharedHandle(HANDLE *SharedHandle);
	HRESULT GetUsage(DXGI_USAGE *Usage);
	HRESULT SetEvictionPriority(uint EvictionPriority);
}

mixin(uuid!(IDXGISurface, "cafcb56c-6ac3-4889-bf47-9e23bbd260ec"));
interface IDXGISurface : IDXGIDeviceSubObject
{
extern(Windows):
	HRESULT GetDesc(DXGI_SURFACE_DESC *Desc);
	HRESULT Map(DXGI_MAPPED_RECT *LockedRect, uint MapFlags);
	HRESULT Unmap();
}

mixin(uuid!(IDXGISurface1, "4AE63092-6327-4c1b-80AE-BFE12EA32B86"));
interface IDXGISurface1 : IDXGISurface
{
extern(Windows):
	HRESULT GetDC(BOOL Discard, HDC *hdc);
	HRESULT ReleaseDC(RECT *DirtyRect);
}

mixin(uuid!(IDXGISwapChain, "310d36a0-d2e7-4c0a-aa04-6a9d23b8886a"));
interface IDXGISwapChain : IDXGIDeviceSubObject
{
extern(Windows):
	HRESULT GetBuffer(uint Buffer, GUID *RIID, void **Surface);
	HRESULT GetContainingOutput(IDXGIOutput *Output);
	HRESULT GetDesc(DXGI_SWAP_CHAIN_DESC *Desc);
	HRESULT GetFrameStatistics(DXGI_FRAME_STATISTICS *Stats);
	HRESULT GetFullscreenState(BOOL *Fullscreen, IDXGIOutput *Target);
	HRESULT GetLastPresentCount(uint *LastPresentCount);
	HRESULT Present(uint SyncInterval, uint Flags);
	HRESULT ResizeBuffers(uint BufferCount, uint Width, uint Height, DXGI_FORMAT NewFormat, uint SwapChainFlags);
	HRESULT ResizeTarget(const DXGI_MODE_DESC *NewTargetParameters);
	HRESULT SetFullscreenState(BOOL Fullscreen, IDXGIOutput Target);
}

//
//	Functions
//
extern(Windows) public HRESULT CreateDXGIFactory(const(GUID)* RIID, void **Factory);
extern(Windows) public HRESULT CreateDXGIFactory1(const(GUID)* RIID, void **Factory);
extern(Windows) public HRESULT DXGIGetDebugInterface(const(GUID)* RIID, void **Debug);
