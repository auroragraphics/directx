module aurora.directx.dxgi;

import aurora.directx.com;
import aurora.directx.config;

public:


//
//	Constants
//

static if(DX110)
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

}
static if(DX111)
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
static if(DX112)
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

static if(DX110)
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
static if(DX111)
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
static if(DX112)
{
}


//
//	Structures
//

static if(DX110)
{
	public struct DXGI_ADAPTER_DESC {
		wchar Description[128];
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
		wchar Description[128];
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
		DXGI_RGB Scale;
		DXGI_RGB Offset;
		DXGI_RGB GammaCurve[1025];
	}

	public struct DXGI_GAMMA_CONTROL_CAPABILITIES {
		BOOL ScaleAndOffsetSupported;
		float MaxConvertedValue;
		float MinConvertedValue;
		uint NumGammaControlPoints;
		float ControlPointPositions[1025];
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
		wchar              DeviceName[32];
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

	public struct DXGI_RATIONAL {
		UINT Numerator;
		UINT Denominator;
	}

	public struct DXGI_RGB {
		float Red;
		float Green;
		float Blue;
	}

	public struct DXGI_RGBA {
		float r;
		float g;
		float b;
		float a;
	}

	public struct DXGI_SAMPLE_DESC {
		uint Count;
		uint Quality;
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
}
static if(DX111)
{
	public struct DXGI_ADAPTER_DESC2 {
		wchar Description[128];
		uint VendorId;
		uint DeviceId;
		uint SubSysId;
		uint Revision;
		size_t DedicatedVideoMemory;
		size_t DedicatedSystemMemory;
		size_t SharedSystemMemory;
		LUID AdapterLuid;
		uint Flags;
		DXGI_GRAPHICS_PREEMPTION_GRANULARITY GraphicsPreemptionGranularity;
		DXGI_COMPUTE_PREEMPTION_GRANULARITY  ComputePreemptionGranularity;
	}
	

	public struct DXGI_INFO_QUEUE_FILTER {
		DXGI_INFO_QUEUE_FILTER_DESC AllowList;
		DXGI_INFO_QUEUE_FILTER_DESC DenyList;
	}

	alias int DXGI_INFO_QUEUE_MESSAGE_ID;
	public struct DXGI_INFO_QUEUE_FILTER_DESC {
		uint                              NumCategories;
		DXGI_INFO_QUEUE_MESSAGE_CATEGORY *pCategoryList;
		uint                              NumSeverities;
		DXGI_INFO_QUEUE_MESSAGE_SEVERITY *pSeverityList;
		uint                              NumIDs;
		DXGI_INFO_QUEUE_MESSAGE_ID       *pIDList;
	}

	public struct DXGI_INFO_QUEUE_MESSAGE {
		GUID                             Producer;
		DXGI_INFO_QUEUE_MESSAGE_CATEGORY Category;
		DXGI_INFO_QUEUE_MESSAGE_SEVERITY Severity;
		DXGI_INFO_QUEUE_MESSAGE_ID       ID;
		const char                       *pDescription;
		size_t                           DescriptionByteLength;
	}

	public struct DXGI_MODE_DESC1 {
		uint                     Width;
		uint                     Height;
		DXGI_RATIONAL            RefreshRate;
		DXGI_FORMAT              Format;
		DXGI_MODE_SCANLINE_ORDER ScanlineOrdering;
		DXGI_MODE_SCALING        Scaling;
		BOOL                     Stereo;
	}

	public struct DXGI_OUTDUPL_FRAME_INFO {
		LARGE_INTEGER                 LastPresentTime;
		LARGE_INTEGER                 LastMouseUpdateTime;
		uint                          AccumulatedFrames;
		BOOL                          RectsCoalesced;
		BOOL                          ProtectedContentMaskedOut;
		DXGI_OUTDUPL_POINTER_POSITION PointerPosition;
		uint                          TotalMetadataBufferSize;
		uint                          PointerShapeBufferSize;
	}

	public struct DXGI_OUTDUPL_MOVE_RECT {
		POINT SourcePoint;
		RECT  DestinationRect;
	}

	public struct DXGI_OUTDUPL_POINTER_POSITION {
		POINT Position;
		BOOL  Visible;
	}

	public struct DXGI_OUTDUPL_POINTER_SHAPE_INFO {
		uint Type;
		uint Width;
		uint Height;
		uint Pitch;
		POINT HotSpot;
	}

	public struct DXGI_PRESENT_PARAMETERS {
		uint DirtyRectsCount;
		RECT *pDirtyRects;
		RECT *pScrollRect;
		POINT *pScrollOffset;
	}

	public struct DXGI_SWAP_CHAIN_DESC1 {
		uint             Width;
		uint             Height;
		DXGI_FORMAT      Format;
		BOOL             Stereo;
		DXGI_SAMPLE_DESC SampleDesc;
		uint       BufferUsage;
		uint             BufferCount;
		DXGI_SCALING     Scaling;
		DXGI_SWAP_EFFECT SwapEffect;
		DXGI_ALPHA_MODE  AlphaMode;
		uint             Flags;
	}

	public struct DXGI_SWAP_CHAIN_FULLSCREEN_DESC {
		DXGI_RATIONAL            RefreshRate;
		DXGI_MODE_SCANLINE_ORDER ScanlineOrdering;
		DXGI_MODE_SCALING        Scaling;
		BOOL                     Windowed;
	}
}
static if(DX112)
{
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

}


//
//	Interfaces
//

static if(DX110)
{
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

}
static if(DX111)
{
	mixin(uuid!(IDXGIAdapter2, "0AA1AE0A-FA0E-4B84-8644-E05FF8E5ACB5"));
	interface IDXGIAdapter2 : IDXGIAdapter1
	{
	extern(Windows):
		HRESULT GetDesc2(DXGI_ADAPTER_DESC2 *Desc);
	}

	mixin(uuid!(IDXGIDebug, "119E7452-DE9E-40fe-8806-88F90C12B441"));
	interface IDXGIDebug : IUnknown
	{
	extern(Windows):
		HRESULT ReportLiveObjects(GUID APIID, DXGI_DEBUG_RLO_FLAGS Flags);
	}

	mixin(uuid!(IDXGIDevice2, "05008617-fbfd-4051-a790-144884b4f6a9"));
	interface IDXGIDevice2 : IDXGIDevice1
	{
	extern(Windows):
		HRESULT EnqueueSetEvent(HANDLE Event);
		HRESULT OfferResources(uint NumResources, const(IDXGIResource) *Resources, DXGI_OFFER_RESOURCE_PRIORITY Priority);
		HRESULT ReclaimResources(uint NumResources, const(IDXGIResource) *Resources, BOOL *Discarded);
	}

	mixin(uuid!(IDXGIDisplayControl, "ea9dbf1a-c88e-4486-854a-98aa0138f30c"));
	interface IDXGIDisplayControl : IUnknown
	{
	extern(Windows):
		BOOL IsStereoEnabled();
		void SetStereoEnabled(BOOL Enabled);
	}

	mixin(uuid!(IDXGIFactory2, "50c83a1c-e072-4c48-87b0-3630fa36a6d0"));
	interface IDXGIFactory2 : IDXGIFactory1
	{
	extern(Windows):
		HRESULT CreateSwapChainForComposition(IUnknown Device, const DXGI_SWAP_CHAIN_DESC1 *Desc, IDXGIOutput RestrictToOutput, IDXGISwapChain1 *SwapChain);
		HRESULT CreateSwapChainForCoreWindow(IUnknown Device, IUnknown Window, const DXGI_SWAP_CHAIN_DESC1 *Desc, IDXGIOutput RestrictToOutput, IDXGISwapChain1 *SwapChain);
		HRESULT CreateSwapChainForHwnd(IUnknown Device, HWND hWnd, const DXGI_SWAP_CHAIN_DESC1 *Desc, const DXGI_SWAP_CHAIN_FULLSCREEN_DESC *FullscreenDesc, IDXGIOutput RestrictToOutput, IDXGISwapChain1 *SwapChain);
		HRESULT GetSharedResourceAdapterLuid(HANDLE Resource, LUID *Luid);
		BOOL IsWindowedStereoEnabled();
		HRESULT RegisterOcclusionStatusEvent(HANDLE Event, DWORD *Cookie);
		HRESULT RegisterOcclusionStatusWindow(HWND WindowHandle, uint Msg, DWORD *Cookie);
		HRESULT RegisterStereoStatusEvent(HANDLE Event, DWORD *Cookie);
		HRESULT RegisterStereoStatusWindow(HWND WindowHandle, uint Msg, DWORD *Cookie);
		void UnregisterOcclusionStatus(DWORD Cookie);
		void UnregisterStereoStatus(DWORD Cookie);
	}

	mixin(uuid!(IDXGIInfoQueue, "D67441C7-672A-476f-9E82-CD55B44949CE"));
	interface IDXGIInfoQueue : IUnknown
	{
	extern(Windows):
		HRESULT AddApplicationMessage(DXGI_INFO_QUEUE_MESSAGE_SEVERITY Severity, const(char)* Description);
		HRESULT AddMessage(GUID Producer, DXGI_INFO_QUEUE_MESSAGE_CATEGORY Category, DXGI_INFO_QUEUE_MESSAGE_SEVERITY Severity, DXGI_INFO_QUEUE_MESSAGE_ID ID, const(char)* Description);
		HRESULT AddRetrievalFilterEntries(GUID Producer, DXGI_INFO_QUEUE_FILTER *Filter);
		HRESULT AddStorageFilterEntries(GUID Producer, DXGI_INFO_QUEUE_FILTER *Filter);
		void ClearRetrievalFilter(GUID Producer);
		void ClearStorageFilter(GUID Producer);
		void ClearStoredMessages(GUID Producer);
		BOOL GetBreakOnCategory(GUID Producer, DXGI_INFO_QUEUE_MESSAGE_CATEGORY Category);
		BOOL GetBreakOnID(GUID Producer, DXGI_INFO_QUEUE_MESSAGE_ID ID);
		BOOL GetBreakOnSeverity(GUID Producer, DXGI_INFO_QUEUE_MESSAGE_SEVERITY Severity);
		HRESULT GetMessage(GUID Producer, ulong MessageIndex, DXGI_INFO_QUEUE_MESSAGE *Message, size_t *MessageByteLength);
		ulong GetMessageCountLimit(GUID Producer);
		BOOL GetMuteDebugOutput(GUID Producer);
		ulong GetNumMessagesAllowedByStorageFilter(GUID Producer);
		ulong GetNumMessagesDeniedByStorageFilter(GUID Producer);
		ulong GetNumMessagesDiscardedByMessageCountLimit(GUID Producer);
		ulong GetNumStoredMessages(GUID Producer);
		ulong GetNumStoredMessagesAllowedByRetrievalFilters(GUID Producer);
		HRESULT GetRetrievalFilter(GUID Producer, DXGI_INFO_QUEUE_FILTER *Filter, size_t *FilterByteLength);
		uint GetRetrievalFilterStackSize(GUID Producer);
		HRESULT GetStorageFilter(GUID Producer, DXGI_INFO_QUEUE_FILTER *Filter, size_t *FilterByteLength);
		uint GetStorageFilterStackSize(GUID Producer);
		void PopRetrievalFilter(GUID Producer);
		void PopStorageFilter(GUID Producer);
		HRESULT PushCopyOfRetrievalFilter(GUID Producer);
		HRESULT PushCopyOfStorageFilter(GUID Producer);
		HRESULT PushDenyAllRetrievalFilter(GUID Producer);
		HRESULT PushDenyAllStorageFilter(GUID Producer);
		HRESULT PushEmptyRetrievalFilter(GUID Producer);
		HRESULT PushEmptyStorageFilter(GUID Producer);
		HRESULT PushRetrievalFilter(GUID Producer, DXGI_INFO_QUEUE_FILTER *Filter);
		HRESULT PushStorageFilter(GUID Producer, DXGI_INFO_QUEUE_FILTER *Filter);
		HRESULT SetBreakOnCategory(GUID Producer, DXGI_INFO_QUEUE_MESSAGE_CATEGORY Category, BOOL Enable);
		HRESULT SetBreakOnID(GUID Producer, DXGI_INFO_QUEUE_MESSAGE_ID ID, BOOL Enable);
		HRESULT SetBreakOnSeverity(GUID Producer, DXGI_INFO_QUEUE_MESSAGE_SEVERITY Severity, BOOL Enable);
		HRESULT SetMessageCountLimit(GUID Producer, ulong MessageCountLimit);
		HRESULT SetMuteDebugOutput(GUID Producer, BOOL Mute);
	}

	mixin(uuid!(IDXGIOutput1, "00cddea8-939b-4b83-a340-a685226666cc"));
	interface IDXGIOutput1 : IDXGIOutput
	{
	extern(Windows):
		HRESULT DuplicateOutput(IUnknown Device, IDXGIOutputDuplication *OutputDuplication);
		HRESULT FindClosestMatchingMode1(const DXGI_MODE_DESC1 *ModeToMatch, DXGI_MODE_DESC1 *ClosestMatch, IUnknown ConcernedDevice);
		HRESULT GetDisplayModeList1(DXGI_FORMAT EnumFormat, uint Flags, uint *NumModes, DXGI_MODE_DESC1 *Desc);
		HRESULT GetDisplaySurfaceData1(IDXGIResource Destination);
	}

	mixin(uuid!(IDXGIOutputDuplication, "191cfac3-a341-470d-b26e-a864f428319c"));
	interface IDXGIOutputDuplication : IDXGIObject
	{
	extern(Windows):
		HRESULT AcquireNextFrame(uint TimeoutInMilliseconds, DXGI_OUTDUPL_FRAME_INFO *FrameInfo, IDXGIResource *DesktopResource);
		void GetDesc(DXGI_OUTDUPL_DESC *pDesc);
		HRESULT GetFrameDirtyRects(uint DirtyRectsBufferSize, RECT *DirtyRectsBuffer, uint *DirtyRectsBufferSizeRequired);
		HRESULT GetFrameMoveRects(uint MoveRectsBufferSize, DXGI_OUTDUPL_MOVE_RECT *MoveRectBuffer, uint *MoveRectsBufferSizeRequired);
		HRESULT GetFramePointerShape(uint PointerShapeBufferSize, void *PointerShapeBuffer, uint *PointerShapeBufferSizeRequired, DXGI_OUTDUPL_POINTER_SHAPE_INFO *PointerShapeInfo);
		HRESULT MapDesktopSurface(DXGI_MAPPED_RECT *LockedRect);
		HRESULT ReleaseFrame();
		HRESULT UnMapDesktopSurface();
	}

	mixin(uuid!(IDXGIResource1, "035f3ab4-482e-4e50-b41f-8a7f8bd8960b"));
	interface IDXGIResource1 : IDXGIResource
	{
	extern(Windows):
		HRESULT CreateSharedHandle(const SECURITY_ATTRIBUTES *Attributes, DWORD Access, const(wchar)* Name, HANDLE *Handle);
		HRESULT CreateSubresourceSurface(uint Index, IDXGISurface2 *Surface);
	}

	mixin(uuid!(IDXGISurface2, "aba496dd-b617-4cb8-a866-bc44d7eb1fa2"));
	interface IDXGISurface2 : IDXGISurface1
	{
	extern(Windows):
		HRESULT GetResource(GUID* RIID, void **ParentResource, uint *SubresourceIndex);
	}

	mixin(uuid!(IDXGISwapChain1, "790a45f7-0d42-4876-983a-0a55cfe6f4aa"));
	interface IDXGISwapChain1 : IDXGISwapChain
	{
	extern(Windows):
		HRESULT GetBackgroundColor(DXGI_RGBA *Color);
		HRESULT GetCoreWindow(GUID **RefIID, void **ppUnk);
		HRESULT GetDesc1(DXGI_SWAP_CHAIN_DESC1 *Desc);
		HRESULT GetFullscreenDesc(DXGI_SWAP_CHAIN_FULLSCREEN_DESC *Desc);
		HRESULT GetHwnd(HWND *Hwnd);
		HRESULT GetRestrictToOutput(IDXGIOutput *RestrictToOutput);
		HRESULT GetRotation(DXGI_MODE_ROTATION *Rotation);
		BOOL IsTemporaryMonoSupported();
		HRESULT Present1(uint SyncInterval, uint Flags, const DXGI_PRESENT_PARAMETERS *pPresentParameters);
		HRESULT SetBackgroundColor(const DXGI_RGBA *Color);
		HRESULT SetRotation(const DXGI_MODE_ROTATION Rotation);
	}

}
static if(DX112)
{
	mixin(uuid!(IDXGIDebug1, "c5a05f0c-16f2-4adf-9f4d-a8c4d58ac550"));
	public interface IDXGIDebug1 : IDXGIDebug
	{
	extern(Windows):
		void DisableLeakTrackingForThread();
		void EnableLeakTrackingForThread();
		BOOL IsLeakTrackingEnabledForThread();
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
		UINT GetCreationFlags();	
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
		BOOL SupportsOverlays();
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

}


//
//	Functions
//

static if(DX110)
{
	extern(Windows) public HRESULT CreateDXGIFactory(IID RIID, void **Factory);
}
static if(DX111)
{
	extern(Windows) public HRESULT CreateDXGIFactory1(IID RIID, void **Factory);
	extern(Windows) public HRESULT DXGIGetDebugInterface(IID RIID, void **Debug);
}
static if(DX112)
{
	extern(Windows) public HRESULT CreateDXGIFactory2(uint Flags, const ref IID RIID, void **Factory);
	extern(Windows) public HRESULT DXGIGetDebugInterface1(uint Flags, IID RIID, void **Debug);
}
