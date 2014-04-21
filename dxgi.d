module aurora.dxi.dxgi;

import com;
import std.c.windows.com;
import std.c.windows.windows;

import config;

public:

//
//	Constants
//

static if(DX11_0 || DX11_1 || DX11_2)
{
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
	const IID DXGI_DEBUG_ALL = { 0xe48ae283, 0xda80, 0x490b, 0x87, 0xe6, 0x43, 0xe9, 0xa9, 0xcf, 0xda, 0x8 };
	const IID DXGI_DEBUG_DX = { 0x35cdd7fc, 0x13b2, 0x421d, 0xa5, 0xd7, 0x7e, 0x44, 0x51, 0x28, 0x7d, 0x64 };
	const IID DXGI_DEBUG_DXGI = { 0x25cddaa4, 0xb1c6, 0x47e1, 0xac, 0x3e, 0x98, 0x87, 0x5b, 0x5a, 0x2e, 0x2a };
	const IID DXGI_DEBUG_APP = { 0x6cd6e01, 0x4219, 0x4ebd, 0x87, 0x9, 0x27, 0xed, 0x23, 0x36, 0xc, 0x62 };
	const IID DXGI_DEBUG_D3D11 = { 0x4b99317b, 0xac39, 0x4aa6, 0xbb, 0xb, 0xba, 0xa0, 0x47, 0x84, 0x79, 0x8f };

}
static if(DX11_1 || DX11_2)
{
	//DXGI_ENUM_MODES
	enum DXGI_ENUM_MODES_STEREO          = (4U);
	enum DXGI_ENUM_MODES_DISABLED_STEREO = (8U);

	//DXGI_PRESENT
	enum DXGI_PRESENT_DO_NOT_WAIT           = (0x00000008U);
	enum DXGI_PRESENT_STEREO_PREFER_RIGHT   = (0x00000010U);
	enum DXGI_PRESENT_STEREO_TEMPORARY_MONO = (0x00000020U);
	enum DXGI_PRESENT_RESTRICT_TO_OUTPUT    = (0x00000040U);

}
static if(DX11_2)
{
	//DXGI_CREATE_FACTORY
	enum DXGI_CREATE_FACTORY_NORMAL = (0U);
	enum DXGI_CREATE_FACTORY_DEBUG = (1U);

	//DXGI_PRESENT
	enum DXGI_PRESENT_USE_DURATION = (0x00000100U);		//Not Supported Until Windows 8.1

}


//
//	Enumerations
//

static if(DX11_0 || DX11_1 || DX11_2)
{
	public enum DXGI_ADAPTER_FLAG : int { 
		NONE         = 0,
		REMOTE       = 1,
		SOFTWARE     = 2,
		FORCE_DWORD  = 0xffffffff
	}

	public enum DXGI_FORMAT : int { 
		FORMAT_UNKNOWN                     = 0,
		FORMAT_R32G32B32A32_TYPELESS       = 1,
		FORMAT_R32G32B32A32_FLOAT          = 2,
		FORMAT_R32G32B32A32_UINT           = 3,
		FORMAT_R32G32B32A32_SINT           = 4,
		FORMAT_R32G32B32_TYPELESS          = 5,
		FORMAT_R32G32B32_FLOAT             = 6,
		FORMAT_R32G32B32_UINT              = 7,
		FORMAT_R32G32B32_SINT              = 8,
		FORMAT_R16G16B16A16_TYPELESS       = 9,
		FORMAT_R16G16B16A16_FLOAT          = 10,
		FORMAT_R16G16B16A16_UNORM          = 11,
		FORMAT_R16G16B16A16_UINT           = 12,
		FORMAT_R16G16B16A16_SNORM          = 13,
		FORMAT_R16G16B16A16_SINT           = 14,
		FORMAT_R32G32_TYPELESS             = 15,
		FORMAT_R32G32_FLOAT                = 16,
		FORMAT_R32G32_UINT                 = 17,
		FORMAT_R32G32_SINT                 = 18,
		FORMAT_R32G8X24_TYPELESS           = 19,
		FORMAT_D32_FLOAT_S8X24_UINT        = 20,
		FORMAT_R32_FLOAT_X8X24_TYPELESS    = 21,
		FORMAT_X32_TYPELESS_G8X24_UINT     = 22,
		FORMAT_R10G10B10A2_TYPELESS        = 23,
		FORMAT_R10G10B10A2_UNORM           = 24,
		FORMAT_R10G10B10A2_UINT            = 25,
		FORMAT_R11G11B10_FLOAT             = 26,
		FORMAT_R8G8B8A8_TYPELESS           = 27,
		FORMAT_R8G8B8A8_UNORM              = 28,
		FORMAT_R8G8B8A8_UNORM_SRGB         = 29,
		FORMAT_R8G8B8A8_UINT               = 30,
		FORMAT_R8G8B8A8_SNORM              = 31,
		FORMAT_R8G8B8A8_SINT               = 32,
		FORMAT_R16G16_TYPELESS             = 33,
		FORMAT_R16G16_FLOAT                = 34,
		FORMAT_R16G16_UNORM                = 35,
		FORMAT_R16G16_UINT                 = 36,
		FORMAT_R16G16_SNORM                = 37,
		FORMAT_R16G16_SINT                 = 38,
		FORMAT_R32_TYPELESS                = 39,
		FORMAT_D32_FLOAT                   = 40,
		FORMAT_R32_FLOAT                   = 41,
		FORMAT_R32_UINT                    = 42,
		FORMAT_R32_SINT                    = 43,
		FORMAT_R24G8_TYPELESS              = 44,
		FORMAT_D24_UNORM_S8_UINT           = 45,
		FORMAT_R24_UNORM_X8_TYPELESS       = 46,
		FORMAT_X24_TYPELESS_G8_UINT        = 47,
		FORMAT_R8G8_TYPELESS               = 48,
		FORMAT_R8G8_UNORM                  = 49,
		FORMAT_R8G8_UINT                   = 50,
		FORMAT_R8G8_SNORM                  = 51,
		FORMAT_R8G8_SINT                   = 52,
		FORMAT_R16_TYPELESS                = 53,
		FORMAT_R16_FLOAT                   = 54,
		FORMAT_D16_UNORM                   = 55,
		FORMAT_R16_UNORM                   = 56,
		FORMAT_R16_UINT                    = 57,
		FORMAT_R16_SNORM                   = 58,
		FORMAT_R16_SINT                    = 59,
		FORMAT_R8_TYPELESS                 = 60,
		FORMAT_R8_UNORM                    = 61,
		FORMAT_R8_UINT                     = 62,
		FORMAT_R8_SNORM                    = 63,
		FORMAT_R8_SINT                     = 64,
		FORMAT_A8_UNORM                    = 65,
		FORMAT_R1_UNORM                    = 66,
		FORMAT_R9G9B9E5_SHAREDEXP          = 67,
		FORMAT_R8G8_B8G8_UNORM             = 68,
		FORMAT_G8R8_G8B8_UNORM             = 69,
		FORMAT_BC1_TYPELESS                = 70,
		FORMAT_BC1_UNORM                   = 71,
		FORMAT_BC1_UNORM_SRGB              = 72,
		FORMAT_BC2_TYPELESS                = 73,
		FORMAT_BC2_UNORM                   = 74,
		FORMAT_BC2_UNORM_SRGB              = 75,
		FORMAT_BC3_TYPELESS                = 76,
		FORMAT_BC3_UNORM                   = 77,
		FORMAT_BC3_UNORM_SRGB              = 78,
		FORMAT_BC4_TYPELESS                = 79,
		FORMAT_BC4_UNORM                   = 80,
		FORMAT_BC4_SNORM                   = 81,
		FORMAT_BC5_TYPELESS                = 82,
		FORMAT_BC5_UNORM                   = 83,
		FORMAT_BC5_SNORM                   = 84,
		FORMAT_B5G6R5_UNORM                = 85,
		FORMAT_B5G5R5A1_UNORM              = 86,
		FORMAT_B8G8R8A8_UNORM              = 87,
		FORMAT_B8G8R8X8_UNORM              = 88,
		FORMAT_R10G10B10_XR_BIAS_A2_UNORM  = 89,
		FORMAT_B8G8R8A8_TYPELESS           = 90,
		FORMAT_B8G8R8A8_UNORM_SRGB         = 91,
		FORMAT_B8G8R8X8_TYPELESS           = 92,
		FORMAT_B8G8R8X8_UNORM_SRGB         = 93,
		FORMAT_BC6H_TYPELESS               = 94,
		FORMAT_BC6H_UF16                   = 95,
		FORMAT_BC6H_SF16                   = 96,
		FORMAT_BC7_TYPELESS                = 97,
		FORMAT_BC7_UNORM                   = 98,
		FORMAT_BC7_UNORM_SRGB              = 99,
		FORMAT_AYUV                        = 100,
		FORMAT_Y410                        = 101,
		FORMAT_Y416                        = 102,
		FORMAT_NV12                        = 103,
		FORMAT_P010                        = 104,
		FORMAT_P016                        = 105,
		FORMAT_420_OPAQUE                  = 106,
		FORMAT_YUY2                        = 107,
		FORMAT_Y210                        = 108,
		FORMAT_Y216                        = 109,
		FORMAT_NV11                        = 110,
		FORMAT_AI44                        = 111,
		FORMAT_IA44                        = 112,
		FORMAT_P8                          = 113,
		FORMAT_A8P8                        = 114,
		FORMAT_B4G4R4A4_UNORM              = 115,
		FORMAT_FORCE_UINT                  = 0xffffffff
	}

	public enum DXGI_FRAME_PRESENTATION_MODE : int { 
		COMPOSED  = 0,
		OVERLAY   = 1,
		NONE      = 2
	}

	enum DXGI_MODE_SCANLINE_ORDER : int { 
		UNSPECIFIED       = 0,
		PROGRESSIVE       = 1,
		UPPER_FIELD_FIRST = 2,
		LOWER_FIELD_FIRST = 3
	}
	
	enum DXGI_MODE_SCALING : int { 
		UNSPECIFIED = 0,
		CENTERED    = 1,
		STRETCHED   = 2
	}
	
	enum DXGI_MODE_ROTATION : int { 
		UNSPECIFIED = 0,
		IDENTITY    = 1,
		ROTATE90    = 2,
		ROTATE180   = 3,
		ROTATE270   = 4
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

}
static if(DX11_1 || DX11_2)
{
	public enum DXGI_ALPHA_MODE : int { 
		UNSPECIFIED    = 0,
		PREMULTIPLIED  = 1,
		STRAIGHT       = 2,
		IGNORE         = 3,
		FORCE_DWORD    = 0xffffffff
	}

	public enum DXGI_COMPUTE_PREEMPTION_GRANULARITY : int { 
		DMA_BUFFER_BOUNDARY    = 0,
		DISPATCH_BOUNDARY      = 1,
		THREAD_GROUP_BOUNDARY  = 2,
		THREAD_BOUNDARY        = 3,
		INSTRUCTION_BOUNDARY   = 4
	}

	public enum DXGI_DEBUG_RLO_FLAGS : int { 
		SUMMARY  = 0x1,
		DETAIL   = 0x2,
		ALL      = 0x3
	}

	public enum DXGI_GRAPHICS_PREEMPTION_GRANULARITY : int { 
		DMA_BUFFER_BOUNDARY   = 0,
		PRIMITIVE_BOUNDARY    = 1,
		TRIANGLE_BOUNDARY     = 2,
		PIXEL_BOUNDARY        = 3,
		INSTRUCTION_BOUNDARY  = 4
	}

	public enum DXGI_INFO_QUEUE_MESSAGE_CATEGORY : int { 
		UNKNOWN                = 0,
		MISCELLANEOUS          = ( UNKNOWN + 1 ),
		INITIALIZATION         = ( MISCELLANEOUS + 1 ),
		CLEANUP                = ( INITIALIZATION + 1 ),
		COMPILATION            = ( CLEANUP + 1 ),
		STATE_CREATION         = ( COMPILATION + 1 ),
		STATE_SETTING          = ( STATE_CREATION + 1 ),
		STATE_GETTING          = ( STATE_SETTING + 1 ),
		RESOURCE_MANIPULATION  = ( STATE_GETTING + 1 ),
		EXECUTION              = ( RESOURCE_MANIPULATION + 1 ),
		SHADER                 = ( EXECUTION + 1 )
	}

	public enum DXGI_INFO_QUEUE_MESSAGE_SEVERITY : int { 
		CORRUPTION  = 0,
		ERROR       = ( CORRUPTION + 1 ),
		WARNING     = ( ERROR + 1 ),
		INFO        = ( WARNING + 1 ),
		MESSAGE     = ( INFO + 1 )
	}

	public enum DXGI_OFFER_RESOURCE_PRIORITY : int { 
		LOW     = 1,
		NORMAL  = ( LOW + 1 ),
		HIGH    = ( NORMAL + 1 )
	}

	public enum DXGI_OUTDUPL_POINTER_SHAPE_TYPE : int { 
		MONOCHROME    = 0x1,
		COLOR         = 0x2,
		MASKED_COLOR  = 0x4
	}

	public enum DXGI_SCALING : int { 
		STRETCH               = 0,
		NONE                  = 1,
		ASPECT_RATIO_STRETCH  = 2
	}

}
static if(DX11_2)
{
}


//
//	Structures
//

static if(DX11_0 || DX11_1 || DX11_2)
{
}
static if(DX11_1 || DX11_2)
{
}
static if(DX11_2)
{
}


//
//	Interfaces
//

static if(DX11_0 || DX11_1 || DX11_2)
{
}
static if(DX11_1 || DX11_2)
{
}
static if(DX11_2)
{
}


//
//	Functions
//

static if(DX11_0 || DX11_1 || DX11_2)
{
	extern(C++) HRESULT CreateDXGIFactory(IID RIID, void **Factory);
}
static if(DX11_1 || DX11_2)
{
	extern(C++) HRESULT CreateDXGIFactory1(IID RIID, void **Factory);
	extern(Windows) HRESULT DXGIGetDebugInterface(IID RIID, void **Debug);
}
static if(DX11_2)
{
	extern(C++) HRESULT CreateDXGIFactory2(uint Flags, const ref IID RIID, void **Factory);
	extern(Windows) HRESULT DXGIGetDebugInterface1(uint Flags, IID RIID, void **Debug);
}


struct DXGI_RATIONAL
{
	uint Numerator;
	uint Denominator;
}

struct DXGI_MODE_DESC
{
	uint Width;
	uint Height;
	DXGI_RATIONAL RefreshRate;
	DXGI_FORMAT Format;
	DXGI_MODE_SCANLINE_ORDER ScanlineOrdering;
	DXGI_MODE_SCALING Scaling;
}

struct DXGI_MODE_DESC1 {
	uint Width;
	uint Height;
	DXGI_RATIONAL RefreshRate;
	DXGI_FORMAT Format;
	DXGI_MODE_SCANLINE_ORDER ScanlineOrdering;
	DXGI_MODE_SCALING Scaling;
	BOOL Stereo;
}

struct DXGI_OUTPUT_DESC {
	wchar DeviceName[32];
	RECT DesktopCoordinates;
	BOOL AttachedToDesktop;
	DXGI_MODE_ROTATION Rotation;
	void* Monitor;
}

struct DXGI_FRAME_STATISTICS {
	uint PresentCount;
	uint PresentRefreshCount;
	uint SyncRefreshCount;
	LARGE_INTEGER SyncQPCTime;
	LARGE_INTEGER SyncGPUTime;
}

struct DXGI_RGB {
	float Red;
	float Green;
	float Blue;
}

struct DXGI_GAMMA_CONTROL {
	DXGI_RGB Scale;
	DXGI_RGB Offset;
	DXGI_RGB GammaCurve[1025];
}

struct DXGI_GAMMA_CONTROL_CAPABILITIES {
	BOOL  ScaleAndOffsetSupported;
	float MaxConvertedValue;
	float MinConvertedValue;
	uint  NumGammaControlPoints;
	float ControlPointPositions[1025];
}

struct DXGI_MAPPED_RECT {
	int Pitch;
	ubyte* Bits;
}

struct DXGI_SURFACE_DESC {
	uint Width;
	uint Height;
	DXGI_FORMAT Format;
	DXGI_SAMPLE_DESC SampleDesc;
}

struct DXGI_ADAPTER_DESC {
	wchar  Description[128];
	uint   VendorID;
	uint   DeviceID;
	uint   SubSysID;
	uint   Revision;
	size_t DedicatedVideoMemory;
	size_t DedicatedSystemMemory;
	size_t SharedSystemMemory;
	LUID   AdapterLUID;
}

struct DXGI_ADAPTER_DESC1 {
	wchar Description[128];
	uint VendorID;
	uint DeviceID;
	uint SubSysID;
	uint Revision;
	size_t DedicatedVideoMemory;
	size_t DedicatedSystemMemory;
	size_t SharedSystemMemory;
	LUID AdapterLUID;
	uint Flags;
}

struct DXGI_ADAPTER_DESC2 {
	wchar Description[128];
	uint VendorID;
	uint DeviceID;
	uint SubSysID;
	uint Revision;
	size_t DedicatedVideoMemory;
	size_t DedicatedSystemMemory;
	size_t SharedSystemMemory;
	LUID AdapterLUID;
	uint Flags;
	DXGI_GRAPHICS_PREEMPTION_GRANULARITY GraphicsPreemptionGranularity;
	DXGI_COMPUTE_PREEMPTION_GRANULARITY ComputePreemptionGranularity;
}

struct DXGI_SHARED_RESOURCE {
	void* Handle;
}

struct DXGI_SAMPLE_DESC {
	uint Count;
	uint Quality;
}

struct DXGI_SWAP_CHAIN_DESC {
	DXGI_MODE_DESC BufferDesc;
	DXGI_SAMPLE_DESC SampleDesc;
	uint BufferUsage;
	uint BufferCount;
	HWND OutputWindow;
	BOOL Windowed;
	DXGI_SWAP_EFFECT SwapEffect;
	uint Flags;
}

struct DXGI_SWAP_CHAIN_DESC1 {
	uint Width;
	uint Height;
	DXGI_FORMAT Format;
	BOOL Stereo;
	DXGI_SAMPLE_DESC SampleDesc;
	uint BufferUsage;
	uint BufferCount;
	DXGI_SCALING Scaling;
	DXGI_SWAP_EFFECT SwapEffect;
	DXGI_ALPHA_MODE AlphaMode;
	uint Flags;
}

struct DXGI_SWAP_CHAIN_FULLSCREEN_DESC {
	DXGI_RATIONAL RefreshRate;
	DXGI_MODE_SCANLINE_ORDER ScanlineOrdering;
	DXGI_MODE_SCALING Scaling;
	BOOL Windowed;
}

struct DXGI_PRESENT_PARAMETERS {
	uint DirtyRectsCount;
	RECT *DirtyRects;
	RECT *ScrollRect;
	POINT *ScrollOffset;
}

struct DXGI_RGBA {
	float r;
	float g;
	float b;
	float a;
}

mixin(uuid!(IDXGIObject, "aec22fb8-76f3-4639-9be0-28eb43a67a2e"));
interface IDXGIObject : IUnknown
{
	extern(Windows):
	HRESULT GetParent(GUID* IID, void** Parent);
	HRESULT GetPrivateData(GUID* IID, uint* DataSize, void* Data);
	HRESULT SetPrivateData(GUID* IID, uint DataSize, const void* Data);
	HRESULT SetPrivateDataInterface(GUID* IID, const(IUnknown) Unknown);
}

mixin(uuid!(IDXGIOutput, "ae02eedb-c735-4690-8d52-5a8dc20213aa"));
interface IDXGIOutput : IDXGIObject
{
	extern(Windows):
	HRESULT FindClosestMatchingMode(const DXGI_MODE_DESC* ModeToMatch, DXGI_MODE_DESC* ClosestMatch, const(IUnknown) ConcernedDevice);
	HRESULT GetDisplayModeList(DXGI_FORMAT EnumFormats, uint Flags, uint* ModeCount, DXGI_MODE_DESC Modes);
	HRESULT GetDisplaySurfaceData(IDXGISurface Destination);
	HRESULT GetFrameStatistics(DXGI_FRAME_STATISTICS* Stats);
	HRESULT GetGammaControl(DXGI_GAMMA_CONTROL* Array);
	HRESULT GetGammaControlCapabilities(DXGI_GAMMA_CONTROL_CAPABILITIES* GammaCaps);
	void ReleaseOwnership();
	HRESULT SetDisplaySurface(IDXGISurface* ScanoutSurface);
	HRESULT SetGammaControl(const DXGI_GAMMA_CONTROL* Array);
	HRESULT TakeOwnership(const(IUnknown) Device, BOOL Exclusive);
	HRESULT WaitForVBlank();
}

mixin(uuid!(IDXGIOutput1, "ae02eedb-c735-4690-8d52-5a8dc20213aa"));
interface IDXGIOutput1 : IDXGIOutput
{
	extern(Windows):
	HRESULT FindClosestMatchingMode1(const DXGI_MODE_DESC1* ModeToMatch, DXGI_MODE_DESC1* ClosestMatch, const(IUnknown) ConcernedDevice);
	HRESULT GetDisplayModeList1(DXGI_FORMAT EnumFormats, uint Flags, uint* ModeCount, DXGI_MODE_DESC1 Modes);
	HRESULT GetDisplaySurfaceData1(IDXGIResource Destination);
}

mixin(uuid!(IDXGIDeviceSubObject, "3d3e0379-f9de-4d58-bb6c-18d62992f1a6"));
interface IDXGIDeviceSubObject : IDXGIObject
{
	extern(Windows) HRESULT GetDevice(GUID* IID, void** Device);
}

mixin(uuid!(IDXGISurface, "cafcb56c-6ac3-4889-bf47-9e23bbd260ec"));
interface IDXGISurface : IDXGIDeviceSubObject
{
	extern(Windows):
	HRESULT GetDesc(DXGI_SURFACE_DESC* Desc);
	HRESULT Map(DXGI_MAPPED_RECT* LockedRect, uint MapFlags);
	HRESULT Unmap();
}

mixin(uuid!(IDXGISurface1, "4AE63092-6327-4c1b-80AE-BFE12EA32B86"));
interface IDXGISurface1 : IDXGISurface
{
	extern(Windows):
	HRESULT GetDC(BOOL Discard, void* HDC);
	HRESULT ReleaseDC(RECT* DirtyRect);
}

mixin(uuid!(IDXGISurface2, "aba496dd-b617-4cb8-a866-bc44d7eb1fa2"));
interface IDXGISurface2 : IDXGISurface1
{
	extern(Windows) HRESULT GetResource(GUID* IID, void** ParentResource, uint* SubresourceIndex);
}

mixin(uuid!(IDXGIAdapter, "2411e7e1-12ac-4ccf-bd14-9798e8534dc0"));
interface IDXGIAdapter : IDXGIObject
{
	extern(Windows):
	HRESULT CheckInterfaceSupport(GUID* InterfaceName, LARGE_INTEGER* pUMDVersion);
	HRESULT EnumOutputs(uint Output, IDXGIOutput* Output);
	HRESULT GetDesc(DXGI_ADAPTER_DESC* Desc);
}

mixin(uuid!(IDXGIAdapter1, "29038f61-3839-4626-91fd-086879011a05"));
interface IDXGIAdapter1 : IDXGIAdapter
{
	extern(Windows) HRESULT GetDesc1(DXGI_ADAPTER_DESC1* Desc);
}

mixin(uuid!(IDXGIAdapter2, "0AA1AE0A-FA0E-4B84-8644-E05FF8E5ACB5"));
interface IDXGIAdapter2 : IDXGIAdapter
{
	extern(Windows) HRESULT GetDesc2(DXGI_ADAPTER_DESC2* Desc);
}

mixin(uuid!(IDXGIResource, "035f3ab4-482e-4e50-b41f-8a7f8bd8960b"));
interface IDXGIResource : IDXGIDeviceSubObject
{
	extern(Windows):
	HRESULT GetEvictionPriority(uint* EvictionPriority);
	HRESULT GetUsage(uint* Usage);
	HRESULT GetSharedHandle(void** SharedHandle);
	HRESULT SetEvictionPriority(uint EvictionPriority);
}

mixin(uuid!(IDXGIResource1, "30961379-4609-4a41-998e-54fe567ee0c1"));
interface IDXGIResource1 : IDXGIResource
{
	extern(Windows):
	HRESULT CreateSharedHandle(const SECURITY_ATTRIBUTES* Attributes, uint Access, const(wchar)* Name, void** Handle);
	HRESULT CreateSubresourceSurface(uint index, IDXGISurface2* Surface);
}

mixin(uuid!(IDXGIDevice, "54ec77fa-1377-44e6-8c32-88fd5f44c84c"));
interface IDXGIDevice : IDXGIObject
{
	extern(Windows):
	HRESULT CreateSurface(const DXGI_SURFACE_DESC* Desc, uint NumSurfaces, uint Usage, const DXGI_SHARED_RESOURCE* SharedResource, IDXGISurface *Surface);
	HRESULT GetAdapter(IDXGIAdapter* Adapter);
	HRESULT GetGPUThreadPriority(int* Priority);
	HRESULT QueryResourceResidency(const(IUnknown)* Resources, DXGI_RESIDENCY *ResidencyStatus, uint NumResources);
	HRESULT SetGPUThreadPriority(int Priority);
}

mixin(uuid!(IDXGIDevice1, "77db970f-6276-48ba-ba28-070143b4392c"));
interface IDXGIDevice1 : IDXGIDevice
{
	extern(Windows):
	HRESULT GetMaximumFrameLatency(uint* MaxLatency);
	HRESULT SetMaximumFrameLatency(uint MaxLatency);
}

mixin(uuid!(IDXGIDevice2, "05008617-fbfd-4051-a790-144884b4f6a9"));
interface IDXGIDevice2 : IDXGIDevice1
{
	extern(Windows):
	HRESULT EnqueueSetEvent(void* Event);
	HRESULT OfferResources(uint NumResources, const(IDXGIResource)* Resources, DXGI_OFFER_RESOURCE_PRIORITY Priority);
	HRESULT OfferResources(uint NumResources, const(IDXGIResource)* Resources, BOOL* Discarded);
}

mixin(uuid!(IDXGISwapChain, "310d36a0-d2e7-4c0a-aa04-6a9d23b8886a"));
interface IDXGISwapChain : IDXGIDeviceSubObject
{
	extern(Windows):
	HRESULT GetBuffer(uint Buffer,GUID* IID, void** Surface);
	HRESULT GetContainingOutput(IDXGIOutput *Output);
	HRESULT GetDesc(DXGI_SWAP_CHAIN_DESC* Desc);
	HRESULT GetFrameStatistics(DXGI_FRAME_STATISTICS *Stats);
	HRESULT GetFullscreenState(BOOL* Fullscreen, IDXGIOutput *Target);
	HRESULT GetLastPresentCount(uint* LastPresentCount);
	HRESULT Present(uint SyncInterval, uint Flags);
	HRESULT ResizeBuffers(uint BufferCount, uint Width, uint Height, DXGI_FORMAT NewFormat, uint SwapChainFlags);
	HRESULT ResizeTarget(const DXGI_MODE_DESC* NewTargetParameters);
	HRESULT SetFullscreenState(BOOL Fullscreen, IDXGIOutput Target);
}

mixin(uuid!(IDXGISwapChain1, "790a45f7-0d42-4876-983a-0a55cfe6f4aa"));
interface IDXGISwapChain1 : IDXGISwapChain
{
	extern(Windows):
	HRESULT GetBackgroundColor(DXGI_RGBA* Color);
	HRESULT GetCoreWindow(GUID* IID, void **CoreWindow);
	HRESULT GetFullscreenDesc(DXGI_SWAP_CHAIN_FULLSCREEN_DESC* Desc);
	HRESULT GetHwnd(HWND* Hwnd);
	HRESULT GetRestrictToOutput(IDXGIOutput* RestrictToOutput);
	HRESULT GetRotation(DXGI_MODE_ROTATION* Rotation);
	BOOL IsTemporaryMonoSupported();
	HRESULT Present1(uint SyncInterval, uint Flags, const DXGI_PRESENT_PARAMETERS* PresentParameters);
	HRESULT SetBackgroundColor(const DXGI_RGBA* Color);
	HRESULT SetRotation(const DXGI_MODE_ROTATION Rotation);
}

mixin(uuid!(IDXGIFactory, "7b7166ec-21c7-44ae-b21a-c9ae321ae369"));
interface IDXGIFactory : IDXGIObject
{
	extern(Windows):
	HRESULT CreateSoftwareAdapter(void* Module, IDXGIAdapter* Adapter);
	HRESULT CreateSwapChain(const(IUnknown) Device, DXGI_SWAP_CHAIN_DESC* Desc, IDXGISwapChain * SwapChain);
	HRESULT EnumAdapters(uint Adapter, IDXGIAdapter *Adapter);
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

// Requires Windows 8.1

//mixin(uuid!(IDXGIFactory2, "50c83a1c-e072-4c48-87b0-3630fa36a6d0"));
//interface IDXGIFactory2 : IDXGIFactory1
//{
//	extern(Windows):
//	HRESULT CreateSwapChainForComposition(const(IUnknown) Device, const DXGI_SWAP_CHAIN_DESC1* Desc, const(IDXGIOutput) RestrictToOutput, IDXGISwapChain1 *SwapChain);
//	HRESULT CreateSwapChainForCoreWindow(const(IUnknown) Device, const(IUnknown) Window, const(DXGI_SWAP_CHAIN_DESC1)* Desc, const(IDXGIOutput) RestrictToOutput, IDXGISwapChain1 *SwapChain);
//	HRESULT CreateSwapChainForHwnd(const(IUnknown) Device, HWND hWnd, const(DXGI_SWAP_CHAIN_DESC1)* Desc, const(DXGI_SWAP_CHAIN_FULLSCREEN_DESC)* FullscreenDesc, const(IDXGIOutput) RestrictToOutput, IDXGISwapChain1* SwapChain);
//	HRESULT GetSharedResourceAdapterLuid(void* Resource, LUID* Luid);
//	BOOL IsWindowedStereoEnabled();
//	HRESULT RegisterOcclusionStatusEvent(void* Event, uint* Cookie);
//	HRESULT RegisterOcclusionStatusWindow(HWND WindowHandle, uint Msg, uint* Cookie);
//	HRESULT RegisterStereoStatusEvent(void* Event, uint* Cookie);
//	HRESULT RegisterStereoStatusWindow(HWND WindowHandle, uint Msg, uint* Cookie);
//	void UnregisterOcclusionStatus(uint Cookie);
//	void UnregisterStereoStatus(uint Cookie);
//}

mixin(uuid!(IDXGIDisplayControl, "ea9dbf1a-c88e-4486-854a-98aa0138f30c"));
interface IDXGIDisplayControl : IUnknown
{
	extern(Windows):
	BOOL IsStereoEnabled();
	void SetStereoEnabled(BOOL Enabled);
}

mixin(uuid!(IDXGIKeyedMutex, "9d8e1289-d7b3-465f-8126-250e349af85d"));
interface IDXGIKeyedMutex : IDXGIDeviceSubObject
{
	extern(Windows):
	HRESULT AcquireSync(ulong Key, uint Milliseconds);
	HRESULT ReleaseSync(ulong Key);
}