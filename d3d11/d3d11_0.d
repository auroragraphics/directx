module aurora.directx.d3d11.d3d11_0;

public import std.bitmanip;
public import aurora.directx.com;
public import aurora.directx.dxgi;
public import aurora.directx.d3d.d3dcommon;
public import aurora.directx.d3d11.d3d11shader;
public import aurora.directx.d3d11.d3d11sdklayers;
public import aurora.directx.d3d11.d3d11shadertracing;

//
// Core D3D11
//

extern (Windows) {
	HRESULT D3D11CreateDevice(IDXGIAdapter pAdapter, D3D_DRIVER_TYPE DriverType, HMODULE Software, UINT Flags, const D3D_FEATURE_LEVEL *pFeatureLevels, UINT FeatureLevels, UINT SDKVersion, ID3D11Device *ppDevice, D3D_FEATURE_LEVEL *pFeatureLevel, ID3D11DeviceContext *ppImmediateContext);
	HRESULT D3D11CreateDeviceAndSwapChain(IDXGIAdapter pAdapter, D3D_DRIVER_TYPE DriverType, HMODULE Software, UINT Flags, const D3D_FEATURE_LEVEL *pFeatureLevels, UINT FeatureLevels, UINT SDKVersion, const DXGI_SWAP_CHAIN_DESC *pSwapChainDesc, IDXGISwapChain *ppSwapChain, ID3D11Device *ppDevice, D3D_FEATURE_LEVEL *pFeatureLevel, ID3D11DeviceContext *ppImmediateContext);
}

//
// Enumerations
//

public enum D3D11_ASYNC_GETDATA_FLAG : int { 
	DONOTFLUSH  = 0x1
}

public enum D3D11_BLEND : int { 
	ZERO              = 1,
	ONE               = 2,
	SRC_COLOR         = 3,
	INV_SRC_COLOR     = 4,
	SRC_ALPHA         = 5,
	INV_SRC_ALPHA     = 6,
	DEST_ALPHA        = 7,
	INV_DEST_ALPHA    = 8,
	DEST_COLOR        = 9,
	INV_DEST_COLOR    = 10,
	SRC_ALPHA_SAT     = 11,
	BLEND_FACTOR      = 14,
	INV_BLEND_FACTOR  = 15,
	SRC1_COLOR        = 16,
	INV_SRC1_COLOR    = 17,
	SRC1_ALPHA        = 18,
	INV_SRC1_ALPHA    = 19
}

public enum D3D11_BLEND_OP : int { 
	ADD           = 1,
	SUBTRACT      = 2,
	REV_SUBTRACT  = 3,
	MIN           = 4,
	MAX           = 5
}

public enum D3D11_CLEAR_FLAG : int { 
	DEPTH    = 0x1L,
	STENCIL  = 0x2L
}

public enum D3D11_COLOR_WRITE_ENABLE : int { 
	RED    = 1,
	GREEN  = 2,
	BLUE   = 4,
	ALPHA  = 8,
	ALL    = ( RED | GREEN | BLUE | ALPHA )
}

public enum D3D11_COPY_FLAGS : int { 
	NO_OVERWRITE  = 0x1,
	DISCARD       = 0x2
}

public enum D3D11_COUNTER : int { 
	DEVICE_DEPENDENT_0  = 0x40000000
}

public enum D3D11_COUNTER_TYPE : int  { 
	FLOAT32  = 0,
	UINT16   = ( FLOAT32 + 1 ),
	UINT32   = ( UINT16 + 1 ),
	UINT64   = ( UINT32 + 1 )
}

public enum D3D11_CREATE_DEVICE_FLAG : int { 
	SINGLETHREADED                                 = 0x1,
	DEBUG                                          = 0x2,
	SWITCH_TO_REF                                  = 0x4,
	PREVENT_INTERNAL_THREADING_OPTIMIZATIONS       = 0x8,
	BGRA_SUPPORT                                   = 0x20,
	DEBUGGABLE                                     = 0x40,
	PREVENT_ALTERING_LAYER_SETTINGS_FROM_REGISTRY  = 0x80,
	DISABLE_GPU_TIMEOUT                            = 0x100,
	VIDEO_SUPPORT                                  = 0x800
}

public enum D3D11_COMPARISON_FUNC : int { 
	D3D11_COMPARISON_NEVER          = 1,
	D3D11_COMPARISON_LESS           = 2,
	D3D11_COMPARISON_EQUAL          = 3,
	D3D11_COMPARISON_LESS_EQUAL     = 4,
	D3D11_COMPARISON_GREATER        = 5,
	D3D11_COMPARISON_NOT_EQUAL      = 6,
	D3D11_COMPARISON_GREATER_EQUAL  = 7,
	D3D11_COMPARISON_ALWAYS         = 8
}

public enum D3D11_1_CREATE_DEVICE_CONTEXT_STATE_FLAG : int { 
	SINGLETHREADED  = 0x1
} 

public enum D3D11_CULL_MODE : int { 
	NONE   = 1,
	FRONT  = 2,
	BACK   = 3
}

public enum D3D11_DEPTH_WRITE_MASK : int { 
	ZERO  = 0,
	ALL   = 1
}

public enum D3D11_DEVICE_CONTEXT_TYPE : int { 
	IMMEDIATE  = 0,
	DEFERRED   = ( IMMEDIATE + 1 )
}

public enum D3D11_FEATURE : int { 
	THREADING                       = 0,
	DOUBLES                         = ( THREADING + 1 ),
	FORMAT_SUPPORT                  = ( DOUBLES + 1 ),
	FORMAT_SUPPORT2                 = ( FORMAT_SUPPORT + 1 ),
	D3D10_X_HARDWARE_OPTIONS        = ( FORMAT_SUPPORT2 + 1 ),
	D3D11_OPTIONS                   = ( D3D10_X_HARDWARE_OPTIONS + 1 ),
	ARCHITECTURE_INFO               = ( D3D11_OPTIONS + 1 ),
	D3D9_OPTIONS                    = ( ARCHITECTURE_INFO + 1 ),
	SHADER_MIN_PRECISION_SUPPORT    = ( D3D9_OPTIONS + 1 ),
	D3D9_SHADOW_SUPPORT             = ( SHADER_MIN_PRECISION_SUPPORT + 1 ),
	D3D11_OPTIONS1                  = ( D3D9_SHADOW_SUPPORT + 1 ),
	D3D9_SIMPLE_INSTANCING_SUPPORT  = ( D3D11_OPTIONS1 + 1 ),
	MARKER_SUPPORT                  = ( D3D9_SIMPLE_INSTANCING_SUPPORT + 1 ),
	D3D9_OPTIONS1                   = ( MARKER_SUPPORT + 1 )
}

public enum D3D11_FILL_MODE : int { 
	WIREFRAME  = 2,
	SOLID      = 3
}

public enum D3D11_FILTER : int { 
	MIN_MAG_MIP_POINT                           = 0,
	MIN_MAG_POINT_MIP_LINEAR                    = 0x1,
	MIN_POINT_MAG_LINEAR_MIP_POINT              = 0x4,
	MIN_POINT_MAG_MIP_LINEAR                    = 0x5,
	MIN_LINEAR_MAG_MIP_POINT                    = 0x10,
	MIN_LINEAR_MAG_POINT_MIP_LINEAR             = 0x11,
	MIN_MAG_LINEAR_MIP_POINT                    = 0x14,
	MIN_MAG_MIP_LINEAR                          = 0x15,
	ANISOTROPIC                                 = 0x55,
	COMPARISON_MIN_MAG_MIP_POINT                = 0x80,
	COMPARISON_MIN_MAG_POINT_MIP_LINEAR         = 0x81,
	COMPARISON_MIN_POINT_MAG_LINEAR_MIP_POINT   = 0x84,
	COMPARISON_MIN_POINT_MAG_MIP_LINEAR         = 0x85,
	COMPARISON_MIN_LINEAR_MAG_MIP_POINT         = 0x90,
	COMPARISON_MIN_LINEAR_MAG_POINT_MIP_LINEAR  = 0x91,
	COMPARISON_MIN_MAG_LINEAR_MIP_POINT         = 0x94,
	COMPARISON_MIN_MAG_MIP_LINEAR               = 0x95,
	COMPARISON_ANISOTROPIC                      = 0xd5,
	MINIMUM_MIN_MAG_MIP_POINT                   = 0x100,
	MINIMUM_MIN_MAG_POINT_MIP_LINEAR            = 0x101,
	MINIMUM_MIN_POINT_MAG_LINEAR_MIP_POINT      = 0x104,
	MINIMUM_MIN_POINT_MAG_MIP_LINEAR            = 0x105,
	MINIMUM_MIN_LINEAR_MAG_MIP_POINT            = 0x110,
	MINIMUM_MIN_LINEAR_MAG_POINT_MIP_LINEAR     = 0x111,
	MINIMUM_MIN_MAG_LINEAR_MIP_POINT            = 0x114,
	MINIMUM_MIN_MAG_MIP_LINEAR                  = 0x115,
	MINIMUM_ANISOTROPIC                         = 0x155,
	MAXIMUM_MIN_MAG_MIP_POINT                   = 0x180,
	MAXIMUM_MIN_MAG_POINT_MIP_LINEAR            = 0x181,
	MAXIMUM_MIN_POINT_MAG_LINEAR_MIP_POINT      = 0x184,
	MAXIMUM_MIN_POINT_MAG_MIP_LINEAR            = 0x185,
	MAXIMUM_MIN_LINEAR_MAG_MIP_POINT            = 0x190,
	MAXIMUM_MIN_LINEAR_MAG_POINT_MIP_LINEAR     = 0x191,
	MAXIMUM_MIN_MAG_LINEAR_MIP_POINT            = 0x194,
	MAXIMUM_MIN_MAG_MIP_LINEAR                  = 0x195,
	MAXIMUM_ANISOTROPIC                         = 0x1d5
}

public enum D3D11_FILTER_TYPE : int { 
	POINT   = 0,
	LINEAR  = 1
}

public enum D3D11_FORMAT_SUPPORT : int { 
	BUFFER                       = 0x1,
	IA_VERTEX_BUFFER             = 0x2,
	IA_INDEX_BUFFER              = 0x4,
	SO_BUFFER                    = 0x8,
	TEXTURE1D                    = 0x10,
	TEXTURE2D                    = 0x20,
	TEXTURE3D                    = 0x40,
	TEXTURECUBE                  = 0x80,
	SHADER_LOAD                  = 0x100,
	SHADER_SAMPLE                = 0x200,
	SHADER_SAMPLE_COMPARISON     = 0x400,
	SHADER_SAMPLE_MONO_TEXT      = 0x800,
	MIP                          = 0x1000,
	MIP_AUTOGEN                  = 0x2000,
	RENDER_TARGET                = 0x4000,
	BLENDABLE                    = 0x8000,
	DEPTH_STENCIL                = 0x10000,
	CPU_LOCKABLE                 = 0x20000,
	MULTISAMPLE_RESOLVE          = 0x40000,
	DISPLAY                      = 0x80000,
	CAST_WITHIN_BIT_LAYOUT       = 0x100000,
	MULTISAMPLE_RENDERTARGET     = 0x200000,
	MULTISAMPLE_LOAD             = 0x400000,
	SHADER_GATHER                = 0x800000,
	BACK_BUFFER_CAST             = 0x1000000,
	TYPED_UNORDERED_ACCESS_VIEW  = 0x2000000,
	SHADER_GATHER_COMPARISON     = 0x4000000,
	DECODER_OUTPUT               = 0x8000000,
	VIDEO_PROCESSOR_OUTPUT       = 0x10000000,
	VIDEO_PROCESSOR_INPUT        = 0x20000000,
	VIDEO_ENCODER                = 0x40000000
}

public enum D3D11_FORMAT_SUPPORT2 : int { 
	UAV_ATOMIC_ADD                                = 0x1,
	UAV_ATOMIC_BITWISE_OPS                        = 0x2,
	UAV_ATOMIC_COMPARE_STORE_OR_COMPARE_EXCHANGE  = 0x4,
	UAV_ATOMIC_EXCHANGE                           = 0x8,
	UAV_ATOMIC_SIGNED_MIN_OR_MAX                  = 0x10,
	UAV_ATOMIC_UNSIGNED_MIN_OR_MAX                = 0x20,
	UAV_TYPED_LOAD                                = 0x40,
	UAV_TYPED_STORE                               = 0x80,
	OUTPUT_MERGER_LOGIC_OP                        = 0x100,
	TILED                                         = 0x200,
	SHAREABLE                                     = 0x400
}

public enum D3D11_INPUT_CLASSIFICATION : int { 
	VERTEX_DATA    = 0,
	INSTANCE_DATA  = 1
}

public enum D3D11_LOGIC_OP : int { 
	CLEAR          = 0,
	SET            = ( CLEAR + 1 ),
	COPY           = ( SET + 1 ),
	COPY_INVERTED  = ( COPY + 1 ),
	NOOP           = ( COPY_INVERTED + 1 ),
	INVERT         = ( NOOP + 1 ),
	AND            = ( INVERT + 1 ),
	NAND           = ( AND + 1 ),
	OR             = ( NAND + 1 ),
	NOR            = ( OR + 1 ),
	XOR            = ( NOR + 1 ),
	EQUIV          = ( XOR + 1 ),
	AND_REVERSE    = ( EQUIV + 1 ),
	AND_INVERTED   = ( AND_REVERSE + 1 ),
	OR_REVERSE     = ( AND_INVERTED + 1 ),
	OR_INVERTED    = ( OR_REVERSE + 1 )
}

public enum D3D11_PRIMITIVE : int { 
	_UNDEFINED               = 0,
	_POINT                   = 1,
	_LINE                    = 2,
	_TRIANGLE                = 3,
	_LINE_ADJ                = 6,
	_TRIANGLE_ADJ            = 7,
	_1_CONTROL_POINT_PATCH   = 8,
	_2_CONTROL_POINT_PATCH   = 9,
	_3_CONTROL_POINT_PATCH   = 10,
	_4_CONTROL_POINT_PATCH   = 11,
	_5_CONTROL_POINT_PATCH   = 12,
	_6_CONTROL_POINT_PATCH   = 13,
	_7_CONTROL_POINT_PATCH   = 14,
	_8_CONTROL_POINT_PATCH   = 15,
	_9_CONTROL_POINT_PATCH   = 16,
	_10_CONTROL_POINT_PATCH  = 17,
	_11_CONTROL_POINT_PATCH  = 18,
	_12_CONTROL_POINT_PATCH  = 19,
	_13_CONTROL_POINT_PATCH  = 20,
	_14_CONTROL_POINT_PATCH  = 21,
	_15_CONTROL_POINT_PATCH  = 22,
	_16_CONTROL_POINT_PATCH  = 23,
	_17_CONTROL_POINT_PATCH  = 24,
	_18_CONTROL_POINT_PATCH  = 25,
	_19_CONTROL_POINT_PATCH  = 26,
	_20_CONTROL_POINT_PATCH  = 27,
	_21_CONTROL_POINT_PATCH  = 28,
	_22_CONTROL_POINT_PATCH  = 29,
	_23_CONTROL_POINT_PATCH  = 30,
	_24_CONTROL_POINT_PATCH  = 31,
	_25_CONTROL_POINT_PATCH  = 32,
	_26_CONTROL_POINT_PATCH  = 33,
	_27_CONTROL_POINT_PATCH  = 34,
	_28_CONTROL_POINT_PATCH  = 35,
	_29_CONTROL_POINT_PATCH  = 36,
	_30_CONTROL_POINT_PATCH  = 37,
	_31_CONTROL_POINT_PATCH  = 38,
	_32_CONTROL_POINT_PATCH  = 39
}

public enum D3D11_PRIMITIVE_TOPOLOGY { 
	_UNDEFINED                   = 0,
	_POINTLIST                   = 1,
	_LINELIST                    = 2,
	_LINESTRIP                   = 3,
	_TRIANGLELIST                = 4,
	_TRIANGLESTRIP               = 5,
	_LINELIST_ADJ                = 10,
	_LINESTRIP_ADJ               = 11,
	_TRIANGLELIST_ADJ            = 12,
	_TRIANGLESTRIP_ADJ           = 13,
	_1_CONTROL_POINT_PATCHLIST   = 33,
	_2_CONTROL_POINT_PATCHLIST   = 34,
	_3_CONTROL_POINT_PATCHLIST   = 35,
	_4_CONTROL_POINT_PATCHLIST   = 36,
	_5_CONTROL_POINT_PATCHLIST   = 37,
	_6_CONTROL_POINT_PATCHLIST   = 38,
	_7_CONTROL_POINT_PATCHLIST   = 39,
	_8_CONTROL_POINT_PATCHLIST   = 40,
	_9_CONTROL_POINT_PATCHLIST   = 41,
	_10_CONTROL_POINT_PATCHLIST  = 42,
	_11_CONTROL_POINT_PATCHLIST  = 43,
	_12_CONTROL_POINT_PATCHLIST  = 44,
	_13_CONTROL_POINT_PATCHLIST  = 45,
	_14_CONTROL_POINT_PATCHLIST  = 46,
	_15_CONTROL_POINT_PATCHLIST  = 47,
	_16_CONTROL_POINT_PATCHLIST  = 48,
	_17_CONTROL_POINT_PATCHLIST  = 49,
	_18_CONTROL_POINT_PATCHLIST  = 50,
	_19_CONTROL_POINT_PATCHLIST  = 51,
	_20_CONTROL_POINT_PATCHLIST  = 52,
	_21_CONTROL_POINT_PATCHLIST  = 53,
	_22_CONTROL_POINT_PATCHLIST  = 54,
	_23_CONTROL_POINT_PATCHLIST  = 55,
	_24_CONTROL_POINT_PATCHLIST  = 56,
	_25_CONTROL_POINT_PATCHLIST  = 57,
	_26_CONTROL_POINT_PATCHLIST  = 58,
	_27_CONTROL_POINT_PATCHLIST  = 59,
	_28_CONTROL_POINT_PATCHLIST  = 60,
	_29_CONTROL_POINT_PATCHLIST  = 61,
	_30_CONTROL_POINT_PATCHLIST  = 62,
	_31_CONTROL_POINT_PATCHLIST  = 63,
	_32_CONTROL_POINT_PATCHLIST  = 64
}

public enum D3D11_QUERY : int { 
	EVENT                          = 0,
	OCCLUSION                      = ( EVENT + 1 ),
	TIMESTAMP                      = ( OCCLUSION + 1 ),
	TIMESTAMP_DISJOINT             = ( TIMESTAMP + 1 ),
	PIPELINE_STATISTICS            = ( TIMESTAMP_DISJOINT + 1 ),
	OCCLUSION_PREDICATE            = ( PIPELINE_STATISTICS + 1 ),
	SO_STATISTICS                  = ( OCCLUSION_PREDICATE + 1 ),
	SO_OVERFLOW_PREDICATE          = ( SO_STATISTICS + 1 ),
	SO_STATISTICS_STREAM0          = ( SO_OVERFLOW_PREDICATE + 1 ),
	SO_OVERFLOW_PREDICATE_STREAM0  = ( SO_STATISTICS_STREAM0 + 1 ),
	SO_STATISTICS_STREAM1          = ( SO_OVERFLOW_PREDICATE_STREAM0 + 1 ),
	SO_OVERFLOW_PREDICATE_STREAM1  = ( SO_STATISTICS_STREAM1 + 1 ),
	SO_STATISTICS_STREAM2          = ( SO_OVERFLOW_PREDICATE_STREAM1 + 1 ),
	SO_OVERFLOW_PREDICATE_STREAM2  = ( SO_STATISTICS_STREAM2 + 1 ),
	SO_STATISTICS_STREAM3          = ( SO_OVERFLOW_PREDICATE_STREAM2 + 1 ),
	SO_OVERFLOW_PREDICATE_STREAM3  = ( SO_STATISTICS_STREAM3 + 1 )
}

public enum D3D11_QUERY_MISC_FLAG : int { 
	PREDICATEHINT  = 0x1
}

public enum D3D11_RAISE_FLAG : int { 
	D3D11_RAISE_FLAG_DRIVER_INTERNAL_ERROR  = 0x1L
}

public enum D3D11_SHADER_MIN_PRECISION_SUPPORT : int { 
	PRECISION_10_BIT  = 0x1,
	PRECISION_16_BIT  = 0x2
}

public enum D3D11_STENCIL_OP : int { 
	KEEP      = 1,
	ZERO      = 2,
	REPLACE   = 3,
	INCR_SAT  = 4,
	DECR_SAT  = 5,
	INVERT    = 6,
	INCR      = 7,
	DECR      = 8
}

public enum D3D11_TEXTURE_ADDRESS_MODE { 
	WRAP         = 1,
	MIRROR       = 2,
	CLAMP        = 3,
	BORDER       = 4,
	MIRROR_ONCE  = 5
}

public enum D3D11_TEXTURECUBE_FACE : int { 
	POSITIVE_X  = 0,
	NEGATIVE_X  = 1,
	POSITIVE_Y  = 2,
	NEGATIVE_Y  = 3,
	POSITIVE_Z  = 4,
	NEGATIVE_Z  = 5
}

public enum D3D11_TILED_RESOURCES_TIER { 
	NOT_SUPPORTED  = 0,
	TIER_1         = 1,
	TIER_2         = 2
}

//
// Structures
//

alias RECT D3D11_RECT;

public struct D3D11_BLEND_DESC {
	bool AlphaToCoverageEnable;
	bool IndependentBlendEnable;
	D3D11_RENDER_TARGET_BLEND_DESC[8] RenderTarget;
}

public struct D3D11_BOX {
	uint left;
	uint top;
	uint front;
	uint right;
	uint bottom;
	uint back;
}

public struct D3D11_COUNTER_DESC {
	D3D11_COUNTER Counter;
	uint MiscFlags;
}

public struct D3D11_COUNTER_INFO {
	D3D11_COUNTER LastDeviceDependentCounter;
	uint          NumSimultaneousCounters;
	ubyte         NumDetectableParallelUnits;
}

public struct D3D11_DEPTH_STENCIL_DESC {
	bool                       DepthEnable;
	D3D11_DEPTH_WRITE_MASK     DepthWriteMask;
	D3D11_COMPARISON_FUNC      DepthFunc;
	bool                       StencilEnable;
	ubyte                      StencilReadMask;
	ubyte                      StencilWriteMask;
	D3D11_DEPTH_STENCILOP_DESC FrontFace;
	D3D11_DEPTH_STENCILOP_DESC BackFace;
}

public struct D3D11_DEPTH_STENCILOP_DESC {
	D3D11_STENCIL_OP      StencilFailOp;
	D3D11_STENCIL_OP      StencilDepthFailOp;
	D3D11_STENCIL_OP      StencilPassOp;
	D3D11_COMPARISON_FUNC StencilFunc;
}

public struct D3D11_FEATURE_DATA_D3D10_X_HARDWARE_OPTIONS {
	bool ComputeShaders_Plus_RawAndStructuredBuffers_Via_Shader_4_x;
}

public struct D3D11_FEATURE_DATA_DOUBLES {
	bool DoublePrecisionFloatShaderOps;
}

public struct D3D11_FEATURE_DATA_FORMAT_SUPPORT {
	DXGI_FORMAT InFormat;
	uint OutFormatSupport;
}

public struct D3D11_FEATURE_DATA_FORMAT_SUPPORT2 {
	DXGI_FORMAT InFormat;
	uint OutFormatSupport2;
}

public struct D3D11_FEATURE_DATA_THREADING {
	bool DriverConcurrentCreates;
	bool DriverCommandLists;
}

public struct D3D11_INPUT_ELEMENT_DESC {
	const(char)*			   SemanticName;
	uint                       SemanticIndex;
	DXGI_FORMAT                Format;
	uint                       InputSlot;
	uint                       AlignedByteOffset;
	D3D11_INPUT_CLASSIFICATION InputSlotClass;
	uint                       InstanceDataStepRate;
}

public struct D3D11_QUERY_DATA_PIPELINE_STATISTICS {
	ulong IAVertices;
	ulong IAPrimitives;
	ulong VSInvocations;
	ulong GSInvocations;
	ulong GSPrimitives;
	ulong CInvocations;
	ulong CPrimitives;
	ulong PSInvocations;
	ulong HSInvocations;
	ulong DSInvocations;
	ulong CSInvocations;
}

public struct D3D11_QUERY_DATA_SO_STATISTICS {
	ulong NumPrimitivesWritten;
	ulong PrimitivesStorageNeeded;
}

public struct D3D11_QUERY_DATA_TIMESTAMP_DISJOINT {
	ulong Frequency;
	bool Disjoint;
}

public struct D3D11_QUERY_DESC {
	D3D11_QUERY Query;
	uint MiscFlags;
}

public struct D3D11_RASTERIZER_DESC {
	D3D11_FILL_MODE FillMode;
	D3D11_CULL_MODE CullMode;
	bool            FrontCounterClockwise;
	int             DepthBias;
	float           DepthBiasClamp;
	float           SlopeScaledDepthBias;
	bool            DepthClipEnable;
	bool            ScissorEnable;
	bool            MultisampleEnable;
	bool            AntialiasedLineEnable;
}

public struct D3D11_RENDER_TARGET_BLEND_DESC {
	bool           BlendEnable;
	D3D11_BLEND    SrcBlend;
	D3D11_BLEND    DestBlend;
	D3D11_BLEND_OP BlendOp;
	D3D11_BLEND    SrcBlendAlpha;
	D3D11_BLEND    DestBlendAlpha;
	D3D11_BLEND_OP BlendOpAlpha;
	ubyte          RenderTargetWriteMask;
}

public struct D3D11_SAMPLER_DESC {
	D3D11_FILTER               Filter;
	D3D11_TEXTURE_ADDRESS_MODE AddressU;
	D3D11_TEXTURE_ADDRESS_MODE AddressV;
	D3D11_TEXTURE_ADDRESS_MODE AddressW;
	float                      MipLODBias;
	uint                       MaxAnisotropy;
	D3D11_COMPARISON_FUNC      ComparisonFunc;
	float[4]                   BorderColor;
	float                      MinLOD;
	float                      MaxLOD;
}

public struct D3D11_SO_DECLARATION_ENTRY {
	uint   Stream;
	const(char)* SemanticName;
	uint   SemanticIndex;
	ubyte   StartComponent;
	ubyte   ComponentCount;
	ubyte   OutputSlot;
}

public struct D3D11_VIEWPORT {
	float TopLeftX;
	float TopLeftY;
	float Width;
	float Height;
	float MinDepth;
	float MaxDepth;
}

public struct D3D11_BLEND_DESC1 {
	bool AlphaToCoverageEnable;
	bool IndependentBlendEnable;
	D3D11_RENDER_TARGET_BLEND_DESC1[8] RenderTarget;
}

public struct D3D11_FEATURE_DATA_ARCHITECTURE_INFO {
	bool TileBasedDeferredRenderer;
}

public struct D3D11_FEATURE_DATA_D3D9_OPTIONS {
	bool FullNonPow2TextureSupport;
}

public struct D3D11_FEATURE_DATA_D3D9_SHADOW_SUPPORT {
	bool SupportsDepthAsTextureWithLessEqualComparisonFilter;
}

public struct D3D11_FEATURE_DATA_D3D11_OPTIONS {
	bool OutputMergerLogicOp;
	bool UAVOnlyRenderingForcedSampleCount;
	bool DiscardAPIsSeenByDriver;
	bool FlagsForUpdateAndCopySeenByDriver;
	bool ClearView;
	bool CopyWithOverlap;
	bool ConstantBufferPartialUpdate;
	bool ConstantBufferOffsetting;
	bool MapNoOverwriteOnDynamicConstantBuffer;
	bool MapNoOverwriteOnDynamicBufferSRV;
	bool MultisampleRTVWithForcedSampleCountOne;
	bool SAD4ShaderInstructions;
	bool ExtendedDoublesShaderInstructions;
	bool ExtendedResourceSharing;
}

public struct D3D11_FEATURE_DATA_SHADER_MIN_PRECISION_SUPPORT {
	uint PixelShaderMinPrecision;
	uint AllOtherShaderStagesMinPrecision;
}

public struct D3D11_RASTERIZER_DESC1 {
	D3D11_FILL_MODE FillMode;
	D3D11_CULL_MODE CullMode;
	bool            FrontCounterClockwise;
	int             DepthBias;
	float           DepthBiasClamp;
	float           SlopeScaledDepthBias;
	bool            DepthClipEnable;
	bool            ScissorEnable;
	bool            MultisampleEnable;
	bool            AntialiasedLineEnable;
	uint            ForcedSampleCount;
}

public struct D3D11_RENDER_TARGET_BLEND_DESC1 {
	bool           BlendEnable;
	bool           LogicOpEnable;
	D3D11_BLEND    SrcBlend;
	D3D11_BLEND    DestBlend;
	D3D11_BLEND_OP BlendOp;
	D3D11_BLEND    SrcBlendAlpha;
	D3D11_BLEND    DestBlendAlpha;
	D3D11_BLEND_OP BlendOpAlpha;
	D3D11_LOGIC_OP LogicOp;
	ubyte          RenderTargetWriteMask;
}

public struct D3D11_FEATURE_DATA_D3D9_SIMPLE_INSTANCING_SUPPORT {
	bool SimpleInstancingSupported;
}

public struct D3D11_FEATURE_DATA_D3D11_OPTIONS1 {
	D3D11_TILED_RESOURCES_TIER TiledResourcesTier;
	bool MinMaxFiltering;
	bool ClearViewAlsoSupportsDepthOnlyFormats;
	bool MapOnDefaultBuffers;
}

public struct D3D11_FEATURE_DATA_MARKER_SUPPORT {
	bool Profile;
}

//
// Interfaces
//

mixin(uuid!(ID3D11Asynchronous, "4b35d0cd-1e15-4258-9c98-1b1333f6dd3b"));
public interface ID3D11Asynchronous : ID3D11DeviceChild
{
extern(Windows):
	uint GetDataSize();
}

mixin(uuid!(ID3D11BlendState, "75b68faa-347d-4159-8f45-a0640f01cd9a"));
public interface ID3D11BlendState : ID3D11DeviceChild
{
extern(Windows):
	void GetDesc(D3D11_BLEND_DESC *pDesc);
}

mixin(uuid!(ID3D11Counter, "6e8c49fb-a371-4770-b440-29086022b741"));
public interface ID3D11Counter : ID3D11Asynchronous
{
extern(Windows):
	void GetDesc(D3D11_COUNTER_DESC *pDesc);
}

mixin(uuid!(ID3D11CommandList, "a24bc4d1-769e-43f7-8013-98ff566c18e2"));
public interface ID3D11CommandList : ID3D11DeviceChild
{
extern(Windows):
	uint GetContextFlags();
}

mixin(uuid!(ID3D11DepthStencilState, "03823efb-8d8f-4e1c-9aa2-f64bb2cbfdf1"));
public interface ID3D11DepthStencilState : ID3D11DeviceChild
{
extern(Windows):
	void GetDesc(D3D11_DEPTH_STENCIL_DESC *pDesc);
}

mixin(uuid!(ID3D11Device, "db6f6ddb-ac77-4e88-8253-819df9bbf140"));
public interface ID3D11Device : IUnknown
{
extern(Windows):
	void GetDesc(D3D11_DEPTH_STENCIL_DESC *pDesc);
	HRESULT CheckCounter(const D3D11_COUNTER_DESC *pDesc, D3D11_COUNTER_TYPE *pType, uint *pActiveCounters, char* szName, uint* pNameLength, char* szUnits, uint* pUnitsLength, char* szDescription, uint* pDescriptionLength);
	void CheckCounterInfo(D3D11_COUNTER_INFO *pCounterInfo);
	HRESULT CheckFeatureSupport(D3D11_FEATURE Feature, void *pFeatureSupportData, uint FeatureSupportDataSize);
	HRESULT CheckFormatSupport(DXGI_FORMAT Format, uint* pFormatSupport);
	HRESULT CheckMultisampleQualityLevels(DXGI_FORMAT Format, uint SampleCount, uint *pNumQualityLevels);
	HRESULT CreateBlendState(const D3D11_BLEND_DESC *pBlendStateDesc, ID3D11BlendState *ppBlendState);
	HRESULT CreateBuffer(const D3D11_BUFFER_DESC *pDesc, const D3D11_SUBRESOURCE_DATA *pInitialData, ID3D11Buffer *ppBuffer);
	HRESULT CreateClassLinkage(ID3D11ClassLinkage *ppLinkage);
	HRESULT CreateComputeShader(const void *pShaderBytecode, SIZE_T BytecodeLength, ID3D11ClassLinkage pClassLinkage, ID3D11ComputeShader *ppComputeShader);
	HRESULT CreateCounter(const D3D11_COUNTER_DESC *pCounterDesc, ID3D11Counter *ppCounter);
	HRESULT CreateDeferredContext(uint ContextFlags, ID3D11DeviceContext *ppDeferredContext);
	HRESULT CreateDepthStencilState(const D3D11_DEPTH_STENCIL_DESC *pDepthStencilDesc, ID3D11DepthStencilState *ppDepthStencilState);
	HRESULT CreateDepthStencilView(ID3D11Resource pResource, const D3D11_DEPTH_STENCIL_VIEW_DESC *pDesc, ID3D11DepthStencilView *ppDepthStencilView);
	HRESULT CreateDomainShader(const void *pShaderBytecode, SIZE_T BytecodeLength, ID3D11ClassLinkage pClassLinkage, ID3D11DomainShader *ppDomainShader);
	HRESULT CreateGeometryShader(const void *pShaderBytecode, SIZE_T BytecodeLength, ID3D11ClassLinkage pClassLinkage, ID3D11GeometryShader *ppGeometryShader);
	HRESULT CreateGeometryShaderWithStreamOutput(const void *pShaderBytecode, SIZE_T BytecodeLength, const D3D11_SO_DECLARATION_ENTRY *pSODeclaration, UINT NumEntries, const UINT *pBufferStrides, UINT NumStrides, UINT RasterizedStream, ID3D11ClassLinkage pClassLinkage, ID3D11GeometryShader *ppGeometryShader);
	HRESULT CreateHullShader(const void *pShaderBytecode, SIZE_T BytecodeLength, ID3D11ClassLinkage pClassLinkage, ID3D11HullShader *ppHullShader);
	HRESULT CreateInputLayout(const D3D11_INPUT_ELEMENT_DESC *pInputElementDescs, UINT NumElements, const void *pShaderBytecodeWithInputSignature, SIZE_T BytecodeLength, ID3D11InputLayout *ppInputLayout);
	HRESULT CreatePixelShader(const void *pShaderBytecode, SIZE_T BytecodeLength, ID3D11ClassLinkage pClassLinkage, ID3D11PixelShader *ppPixelShader);
	HRESULT CreatePredicate(const D3D11_QUERY_DESC *pPredicateDesc, ID3D11Predicate *ppPredicate);
	HRESULT CreateQuery(const D3D11_QUERY_DESC *pQueryDesc, ID3D11Query *ppQuery);
	HRESULT CreateRasterizerState(const D3D11_RASTERIZER_DESC *pRasterizerDesc, ID3D11RasterizerState *ppRasterizerState);
	HRESULT CreateRenderTargetView(ID3D11Resource pResource, const D3D11_RENDER_TARGET_VIEW_DESC *pDesc, ID3D11RenderTargetView *ppRTView);
	HRESULT CreateSamplerState(const D3D11_SAMPLER_DESC *pSamplerDesc, ID3D11SamplerState *ppSamplerState);
	HRESULT CreateShaderResourceView(ID3D11Resource pResource, const D3D11_SHADER_RESOURCE_VIEW_DESC *pDesc, ID3D11ShaderResourceView **ppSRView);
	HRESULT CreateTexture1D(const D3D11_TEXTURE1D_DESC *pDesc, const D3D11_SUBRESOURCE_DATA *pInitialData, ID3D11Texture1D *ppTexture1D);
	HRESULT CreateTexture2D(const D3D11_TEXTURE2D_DESC *pDesc, const D3D11_SUBRESOURCE_DATA *pInitialData, ID3D11Texture2D *ppTexture2D);
	HRESULT CreateTexture3D(const D3D11_TEXTURE3D_DESC *pDesc, const D3D11_SUBRESOURCE_DATA *pInitialData, ID3D11Texture3D *ppTexture3D);
	HRESULT CreateUnorderedAccessView(ID3D11Resource *pResource, const D3D11_UNORDERED_ACCESS_VIEW_DESC *pDesc, ID3D11UnorderedAccessView **ppUAView);
	HRESULT CreateVertexShader(const void *pShaderBytecode, uint BytecodeLength, ID3D11ClassLinkage pClassLinkage, ID3D11VertexShader *ppVertexShader);
	uint GetCreationFlags();
	HRESULT GetDeviceRemovedReason();
	uint GetExceptionMode();
	D3D_FEATURE_LEVEL GetFeatureLevel();
	void GetImmediateContext(ID3D11DeviceContext *ppImmediateContext);
	HRESULT GetPrivateData(GUID* guid, uint* pDataSize, void* pData);
	HRESULT OpenSharedResource(HANDLE hResource, IID* ReturnedInterface, void **ppResource);
	HRESULT SetExceptionMode(uint RaiseFlags);
	HRESULT SetPrivateData(GUID* guid, uint DataSize, const void *pData);
	HRESULT SetPrivateDataInterface(GUID* guid, const IUnknown *pData);
}

mixin(uuid!(ID3D11DeviceChild, "1841e5c8-16b0-489b-bcc8-44cfb0d5deae"));
public interface ID3D11DeviceChild : IUnknown
{
extern(Windows):
	void GetDevice(ID3D11Device **ppDevice);
	HRESULT GetPrivateData(GUID* guid, uint* pDataSize, void *pData);
	HRESULT SetPrivateData(GUID* guid, uint DataSize, const void *pData);
	HRESULT SetPrivateDataInterface(GUID* guid, const IUnknown pData);
}

mixin(uuid!(ID3D11DeviceContext, "c0bfa96c-e089-44fb-8eaf-26f8796190da"));
public interface ID3D11DeviceContext : ID3D11DeviceChild
{
extern(Windows):
	void Begin(ID3D11Asynchronous *pAsync);
	void ClearDepthStencilView(ID3D11DepthStencilView pDepthStencilView, uint ClearFlags, float Depth, ubyte Stencil);
	void ClearRenderTargetView(ID3D11RenderTargetView pRenderTargetView, const float[4] ColorRGBA);
	void ClearState();
	void ClearUnorderedAccessViewFloat(ID3D11UnorderedAccessView pUnorderedAccessView, const float[4] Values);
	void ClearUnorderedAccessViewUint(ID3D11UnorderedAccessView pUnorderedAccessView, const uint[4] Values);
	void CopyResource(ID3D11Resource pDstResource, ID3D11Resource pSrcResource);
	void CopyStructureCount(ID3D11Buffer pDstBuffer, uint DstAlignedByteOffset, ID3D11UnorderedAccessView pSrcView);
	void CopySubresourceRegion(ID3D11Resource pDstResource, uint DstSubresource, uint DstX, uint DstY, uint DstZ, ID3D11Resource pSrcResource, uint SrcSubresource, const D3D11_BOX *pSrcBox);
	void CSGetConstantBuffers(uint StartSlot, uint NumBuffers, ID3D11Buffer *ppConstantBuffers);
	void CSGetSamplers(uint StartSlot, uint NumSamplers, ID3D11SamplerState *ppSamplers);
	void CSGetShader(ID3D11ComputeShader *ppComputeShader, ID3D11ClassInstance *ppClassInstances, uint* pNumClassInstances);
	void CSGetShaderResources(uint StartSlot, uint NumViews, ID3D11ShaderResourceView *ppShaderResourceViews);
	void CSGetUnorderedAccessViews(uint StartSlot, uint NumUAVs, const(ID3D11UnorderedAccessView) *ppUnorderedAccessViews);
	void CSSetConstantBuffers(uint StartSlot, uint NumBuffers, const(ID3D11Buffer) *ppConstantBuffers);
	void CSSetSamplers(uint StartSlot, uint NumSamplers, const(ID3D11SamplerState) *ppSamplers);
	void CSSetShader(ID3D11ComputeShader pShader, const(ID3D11ClassInstance) *ppClassInstances, uint NumClassInstances);
	void CSSetShaderResources(uint StartSlot, uint NumViews, const(ID3D11ShaderResourceView) *ppShaderResourceViews);
	void CSSetUnorderedAccessViews(uint StartSlot, uint NumUAVs, const(ID3D11UnorderedAccessView) *ppUnorderedAccessViews, const(uint) *pUAVInitialCounts);
	void Dispatch(uint ThreadGroupCountX, uint ThreadGroupCountY, uint ThreadGroupCountZ);
	void DispatchIndirect(ID3D11Buffer pBufferForArgs, uint AlignedOffsetForArgs);
	void Draw(uint VertexCount, uint StartVertexLocation);
	void DrawAuto();
	void DrawIndexed(uint IndexCount, uint StartIndexLocation, int BaseVertexLocation);
	void DrawIndexedInstanced(uint IndexCountPerInstance, uint InstanceCount, uint StartIndexLocation, int BaseVertexLocation, uint StartInstanceLocation);
	void DrawIndexedInstancedIndirect(ID3D11Buffer pBufferForArgs, uint AlignedByteOffsetForArgs);
	void DrawInstanced(uint VertexCountPerInstance, uint InstanceCount, uint StartVertexLocation, uint StartInstanceLocation);
	void DrawInstancedIndirect(ID3D11Buffer pBufferForArgs, uint AlignedByteOffsetForArgs);
	void DSGetConstantBuffers(uint StartSlot, uint NumBuffers, ID3D11Buffer *ppConstantBuffers);
	void DSGetSamplers(uint StartSlot, uint NumSamplers, ID3D11SamplerState *ppSamplers);
	void DSGetShader(ID3D11DomainShader *ppDomainShader, ID3D11ClassInstance *ppClassInstances, uint* pNumClassInstances);
	void DSGetShaderResources(uint StartSlot, uint NumViews, ID3D11ShaderResourceView *ppShaderResourceViews);
	void DSSetConstantBuffers(uint StartSlot, uint NumBuffers, const(ID3D11Buffer) *ppConstantBuffers);
	void DSSetSamplers(uint StartSlot, uint NumSamplers, const(ID3D11SamplerState) *ppSamplers);
	void DSSetShader(ID3D11DomainShader *pShader, const(ID3D11ClassInstance) *ppClassInstances, uint NumClassInstances);
	void DSSetShaderResources(uint StartSlot, uint NumViews, const(ID3D11ShaderResourceView) *ppShaderResourceViews);
	void End(ID3D11Asynchronous *pAsync);
	void ExecuteCommandList(ID3D11CommandList pCommandList, bool RestoreContextState);
	HRESULT FinishCommandList(bool RestoreDeferredContextState, ID3D11CommandList *ppCommandList);
	void Flush();
	void GenerateMips(ID3D11ShaderResourceView pShaderResourceView);
	uint GetContextFlags();
	HRESULT GetData(ID3D11Asynchronous *pAsync, void *pData, uint DataSize, uint GetDataFlags);
	void GetPredication(ID3D11Predicate *ppPredicate, bool* pPredicateValue);
	float GetResourceMinLOD(ID3D11Resource pResource);
	D3D11_DEVICE_CONTEXT_TYPE GetType();
	void GSGetConstantBuffers(uint StartSlot, uint NumBuffers, ID3D11Buffer *ppConstantBuffers);
	void GSGetSamplers(uint StartSlot, uint NumSamplers, ID3D11SamplerState *ppSamplers);
	void GSGetShader(ID3D11GeometryShader *ppGeometryShader, ID3D11ClassInstance *ppClassInstances, uint* pNumClassInstances);
	void GSGetShaderResources(uint StartSlot, uint NumViews, ID3D11ShaderResourceView *ppShaderResourceViews);
	void GSSetConstantBuffers(uint StartSlot, uint NumBuffers, const(ID3D11Buffer) *ppConstantBuffers);
	void GSSetSamplers(uint StartSlot, uint NumSamplers, const(ID3D11SamplerState) *ppSamplers);
	void GSSetShader(ID3D11GeometryShader *pShader, const(ID3D11ClassInstance) *ppClassInstances, uint NumClassInstances);
	void GSSetShaderResources(uint StartSlot, uint NumViews, const(ID3D11ShaderResourceView) *ppShaderResourceViews);
	void HSGetConstantBuffers(uint StartSlot, uint NumBuffers, ID3D11Buffer *ppConstantBuffers);
	void HSGetSamplers(uint StartSlot, uint NumSamplers, ID3D11SamplerState *ppSamplers);
	void HSGetShader(ID3D11HullShader *ppHullShader, ID3D11ClassInstance *ppClassInstances, uint* pNumClassInstances);
	void HSGetShaderResources(uint StartSlot, uint NumViews, ID3D11ShaderResourceView *ppShaderResourceViews);
	void HSSetConstantBuffers(uint StartSlot, uint NumBuffers, const(ID3D11Buffer) *ppConstantBuffers);
	void HSSetSamplers(uint StartSlot, uint NumSamplers, const(ID3D11SamplerState) *ppSamplers);
	void HSSetShader(ID3D11HullShader *pShader, const(ID3D11ClassInstance) *ppClassInstances, uint NumClassInstances);
	void HSSetShaderResources(uint StartSlot, uint NumViews, const(ID3D11ShaderResourceView) *ppShaderResourceViews);
	void IAGetIndexBuffer(ID3D11Buffer *pIndexBuffer, DXGI_FORMAT *Format, uint* Offset);
	void IAGetInputLayout(ID3D11InputLayout *ppInputLayout);
	void IAGetPrimitiveTopology(D3D11_PRIMITIVE_TOPOLOGY *pTopology);
	void IAGetVertexBuffers(uint StartSlot, uint NumBuffers, ID3D11Buffer *ppVertexBuffers, uint *pStrides, uint *pOffsets);
	void IASetIndexBuffer(ID3D11Buffer pIndexBuffer, DXGI_FORMAT Format, uint Offset);
	void IASetInputLayout(ID3D11InputLayout pInputLayout);
	void IASetPrimitiveTopology(D3D11_PRIMITIVE_TOPOLOGY Topology);
	void IASetVertexBuffers(uint StartSlot, uint NumBuffers, const(ID3D11Buffer) *ppVertexBuffers, const(uint) *pStrides, const(uint) *pOffsets);
	HRESULT Map(ID3D11Resource pResource, uint Subresource, D3D11_MAP MapType, uint MapFlags, D3D11_MAPPED_SUBRESOURCE *pMappedResource);
	void OMGetBlendState(ID3D11BlendState *ppBlendState, float[4] BlendFactor, uint* pSampleMask);
	void OMGetDepthStencilState(ID3D11DepthStencilState *ppDepthStencilState, uint* pStencilRef);
	void OMGetRenderTargets(uint NumViews, ID3D11RenderTargetView *ppRenderTargetViews, ID3D11DepthStencilView *ppDepthStencilView);
	void OMGetRenderTargetsAndUnorderedAccessViews(uint NumViews, ID3D11RenderTargetView *ppRenderTargetViews, ID3D11DepthStencilView *ppDepthStencilView, uint UAVStartSlot, uint NumUAVs, ID3D11UnorderedAccessView *ppUnorderedAccessViews);
	void OMSetBlendState(ID3D11BlendState pBlendState, const float[4] BlendFactor, uint SampleMask);
	void OMSetDepthStencilState(ID3D11DepthStencilState pDepthStencilState, uint StencilRef);
	void OMSetRenderTargets(uint NumViews, const(ID3D11RenderTargetView) *ppRenderTargetViews, ID3D11DepthStencilView pDepthStencilView);
	void OMSetRenderTargetsAndUnorderedAccessViews(uint NumViews, const(ID3D11RenderTargetView) *ppRenderTargetViews, ID3D11DepthStencilView pDepthStencilView, uint UAVStartSlot, uint NumUAVs, const(ID3D11UnorderedAccessView) *ppUnorderedAccessView, const(uint) *pUAVInitialCounts);
	void PSGetConstantBuffers(uint StartSlot, uint NumBuffers, ID3D11Buffer *ppConstantBuffers);
	void PSGetSamplers(uint StartSlot, uint NumSamplers, ID3D11SamplerState *ppSamplers);
	void PSGetShader(ID3D11PixelShader *ppPixelShader, ID3D11ClassInstance *ppClassInstances, uint* pNumClassInstances);
	void PSGetShaderResources(uint StartSlot, uint NumViews, ID3D11ShaderResourceView *ppShaderResourceViews);
	void PSSetConstantBuffers(uint StartSlot, uint NumBuffers, const(ID3D11Buffer) *ppConstantBuffers);
	void PSSetSamplers(uint StartSlot, uint NumSamplers, const(ID3D11SamplerState) *ppSamplers);
	void PSSetShader(ID3D11PixelShader *pShader, const(ID3D11ClassInstance) *ppClassInstances, uint NumClassInstances);
	void PSSetShaderResources(uint StartSlot, uint NumViews, const(ID3D11ShaderResourceView) *ppShaderResourceViews);
	void ResolveSubresource(ID3D11Resource pDstResource, uint DstSubresource, ID3D11Resource pSrcResource, uint SrcSubresource, DXGI_FORMAT Format);
	void RSGetScissorRects(uint* pNumRects, D3D11_RECT *pRects);
	void RSGetState(ID3D11RasterizerState *ppRasterizerState);
	void RSGetViewports(uint* pNumViewports, D3D11_VIEWPORT *pViewports);
	void RSSetScissorRects(uint NumRects, const D3D11_RECT *pRects);
	void RSSetState(ID3D11RasterizerState pRasterizerState);
	void RSSetViewports(uint NumViewports, const D3D11_VIEWPORT *pViewports);
	void SetPredication(ID3D11Predicate pPredicate, bool PredicateValue);
	void SetResourceMinLOD(ID3D11Resource pResource, float MinLOD);
	void SOGetTargets(uint NumBuffers, ID3D11Buffer *ppSOTargets);
	void SOSetTargets(uint NumBuffers, const(ID3D11Buffer) *ppSOTargets, const(uint) *pOffsets);
	void Unmap(ID3D11Resource pResource, uint Subresource);
	void UpdateSubresource(ID3D11Resource pDstResource, uint DstSubresource, const(D3D11_BOX) *pDstBox, const(void) *pSrcData, uint SrcRowPitch, uint SrcDepthPitch);
	void VSGetConstantBuffers(uint StartSlot, uint NumBuffers, ID3D11Buffer *ppConstantBuffers);
	void VSGetSamplers(uint StartSlot, uint NumSamplers, ID3D11SamplerState *ppSamplers);
	void VSGetShader(ID3D11VertexShader *ppVertexShader, ID3D11ClassInstance *ppClassInstances, uint* pNumClassInstances);
	void VSGetShaderResources(uint StartSlot, uint NumViews, ID3D11ShaderResourceView *ppShaderResourceViews);
	void VSSetConstantBuffers(uint StartSlot, uint NumBuffers, const(ID3D11Buffer) *ppConstantBuffers);
	void VSSetSamplers(uint StartSlot, uint NumSamplers, const(ID3D11SamplerState) *ppSamplers);
	void VSSetShader(ID3D11VertexShader *pShader, const(ID3D11ClassInstance) *ppClassInstances, uint NumClassInstances);
	void VSSetShaderResources(uint StartSlot, uint NumViews, const(ID3D11ShaderResourceView) *ppShaderResourceViews);
}

mixin(uuid!(ID3D11InputLayout, "e4819ddc-4cf0-4025-bd26-5de82a3e07b7"));
public interface ID3D11InputLayout : ID3D11DeviceChild
{
extern(Windows):
}

mixin(uuid!(ID3D11Predicate, "9eb576dd-9f77-4d86-81aa-8bab5fe490e2"));
public interface ID3D11Predicate : ID3D11Query
{
extern(Windows):
}

mixin(uuid!(ID3D11Query, "d6c00747-87b7-425e-b84d-44d108560afd"));
public interface ID3D11Query : ID3D11Asynchronous
{
extern(Windows):
	void GetDesc(D3D11_QUERY_DESC *pDesc);
}

mixin(uuid!(ID3D11RasterizerState, "9bb4ab81-ab1a-4d8f-b506-fc04200b6ee7"));
public interface ID3D11RasterizerState : ID3D11DeviceChild
{
extern(Windows):
	void GetDesc(D3D11_RASTERIZER_DESC *pDesc);
}

mixin(uuid!(ID3D11SamplerState, "da6fea51-564c-4487-9810-f0d0f9b4e3a5"));
public interface ID3D11SamplerState : ID3D11DeviceChild
{
extern(Windows):
	void GetDesc(D3D11_SAMPLER_DESC *pDesc);
}

mixin(uuid!(ID3D11BlendState1, "cc86fabe-da55-401d-85e7-e3c9de2877e9"));
public interface ID3D11BlendState1 : ID3D11BlendState
{
extern(Windows):
	void GetDesc1(D3D11_BLEND_DESC1 *pDesc);
}

mixin(uuid!(ID3D11Device1, "a04bfb29-08ef-43d6-a49c-a9bdbdcbe686"));
public interface ID3D11Device1 : ID3D11Device
{
extern(Windows):
	HRESULT CreateBlendState1(const D3D11_BLEND_DESC1 *pBlendStateDesc, ID3D11BlendState1 *ppBlendState);
	HRESULT CreateDeferredContext1(uint ContextFlags, ID3D11DeviceContext1 *ppDeferredContext);
	HRESULT CreateDeviceContextState(uint Flags, const D3D_FEATURE_LEVEL *pFeatureLevels, uint FeatureLevels, uint SDKVersion, IID* EmulatedInterface, D3D_FEATURE_LEVEL *pChosenFeatureLevel, ID3DDeviceContextState *ppContextState);
	HRESULT CreateRasterizerState1(const D3D11_RASTERIZER_DESC1 *pRasterizerDesc, ID3D11RasterizerState1 *ppRasterizerState);
	void GetImmediateContext1(ID3D11DeviceContext1 *ppImmediateContext);
	HRESULT OpenSharedResource1(HANDLE hResource, IID* returnedInterface, void **ppResource);
	HRESULT OpenSharedResourceByName(const(wchar)* lpName, uint dwDesiredAccess, IID* returnedInterface, void **ppResource);
}

mixin(uuid!(ID3D11DeviceContext1, "bb2c6faa-b5fb-4082-8e6b-388b8cfa90e1"));
public interface ID3D11DeviceContext1 : ID3D11DeviceContext
{
extern(Windows):
	void ClearView(ID3D11View pView, const(float[4]) Color, const(D3D11_RECT) *pRect, uint NumRects);
	void CopySubresourceRegion1(ID3D11Resource pDstResource, uint DstSubresource, uint DstX, uint DstY, uint DstZ, ID3D11Resource pSrcResource, uint SrcSubresource, const(D3D11_BOX) *pSrcBox, uint CopyFlags);
	void CSGetConstantBuffers1(uint StartSlot, uint NumBuffers, ID3D11Buffer *ppConstantBuffers, uint* pFirstConstant, uint* pNumConstants);
	void CSSetConstantBuffers1(uint StartSlot, uint NumBuffers, const(ID3D11Buffer) *ppConstantBuffers, const(uint)*pFirstConstant, const(uint)*pNumConstants);
	void DiscardResource(ID3D11Resource pResource);
	void DiscardView(ID3D11View pResourceView);
	void DiscardView1(ID3D11View pResourceView, const(D3D11_RECT) *pRects, uint NumRects);
	void DSGetConstantBuffers1(uint StartSlot, uint NumBuffers, ID3D11Buffer *ppConstantBuffers, uint* pFirstConstant, uint* pNumConstants);
	void DSSetConstantBuffers1(uint StartSlot, uint NumBuffers, const(ID3D11Buffer) *ppConstantBuffers, const(uint) *pFirstConstant, const(uint) *pNumConstants);
	void GSGetConstantBuffers1(uint StartSlot, uint NumBuffers, ID3D11Buffer *ppConstantBuffers, uint* pFirstConstant, uint* pNumConstants);
	void GSSetConstantBuffers1(uint StartSlot, uint NumBuffers, const(ID3D11Buffer) *ppConstantBuffers, const(uint) *pFirstConstant, const(uint) *pNumConstants);
	void HSGetConstantBuffers1(uint StartSlot, uint NumBuffers, ID3D11Buffer *ppConstantBuffers, uint* pFirstConstant, uint* pNumConstants);
	void HSSetConstantBuffers1(uint StartSlot, uint NumBuffers, const(ID3D11Buffer) *ppConstantBuffers, const(uint) *pFirstConstant, const(uint) *pNumConstants);
	void PSGetConstantBuffers1(uint StartSlot, uint NumBuffers, ID3D11Buffer *ppConstantBuffers, uint* pFirstConstant, uint* pNumConstants);
	void PSSetConstantBuffers1(uint StartSlot, uint NumBuffers, const(ID3D11Buffer) *ppConstantBuffers, const(uint) *pFirstConstant, const(uint) *pNumConstants);
	void SwapDeviceContextState(ID3DDeviceContextState pState, ID3DDeviceContextState *ppPreviousState);
	void UpdateSubresource1(ID3D11Resource pDstResource, uint DstSubresource, const(D3D11_BOX) *pDstBox, const(void) *pSrcData, uint SrcRowPitch, uint SrcDepthPitch, uint CopyFlags);
	void VSGetConstantBuffers1(uint StartSlot, uint NumBuffers, ID3D11Buffer *ppConstantBuffers, uint* pFirstConstant, uint* pNumConstants);
	void VSSetConstantBuffers1(uint StartSlot, uint NumBuffers, const(ID3D11Buffer) *ppConstantBuffers, const(uint) *pFirstConstant, const(uint) *pNumConstants);
}

mixin(uuid!(ID3DDeviceContextState, "5c1e0d8a-7c23-48f9-8c59-a92958ceff11"));
public interface ID3DDeviceContextState : ID3D11DeviceChild
{
extern(Windows):
}

mixin(uuid!(ID3D11RasterizerState1, "1217d7a6-5039-418c-b042-9cbe256afd6e"));
public interface ID3D11RasterizerState1 : ID3D11RasterizerState
{
extern(Windows):
	void GetDesc1(D3D11_RASTERIZER_DESC1 *pDesc);
}

mixin(uuid!(ID3D11Device2, "9d06dffa-d1e5-4d07-83a8-1bb123f2f841"));
public interface ID3D11Device2 : ID3D11Device1
{
extern(Windows):
	HRESULT CheckMultisampleQualityLevels1(DXGI_FORMAT Format, uint SampleCount, uint Flags, uint* pNumQualityLevels);
	HRESULT CreateDeferredContext2(uint ContextFlags, ID3D11DeviceContext2 *ppDeferredContext);
	void GetImmediateContext2(ID3D11DeviceContext2 *ppImmediateContext);
	void GetResourceTiling(ID3D11Resource pTiledResource, uint *pNumTilesForEntireResource, D3D11_PACKED_MIP_DESC *pPackedMipDesc, D3D11_TILE_SHAPE *pStandardTileShapeForNonPackedMips, uint *pNumSubresourceTilings, uint FirstSubresourceTilingToGet, D3D11_SUBRESOURCE_TILING *pSubresourceTilingsForNonPackedMips);
}

mixin(uuid!(ID3D11DeviceContext2, "420d5b32-b90c-4da4-bef0-359f6a24a83a"));
public interface ID3D11DeviceContext2 : ID3D11DeviceContext1
{
extern(Windows):
	void UpdateTiles(ID3D11Resource pDestTiledResource, const(D3D11_TILED_RESOURCE_COORDINATE) *pDestTileRegionStartCoordinate, const(D3D11_TILE_REGION_SIZE) *pDestTileRegionSize, const(void) *pSourceTileData, uint Flags);
	HRESULT CopyTileMappings(ID3D11Resource pDestTiledResource, const(D3D11_TILED_RESOURCE_COORDINATE) *pDestRegionStartCoord, ID3D11Resource pSourceTiledResource, const(D3D11_TILED_RESOURCE_COORDINATE) *pSourceRegionStartCoord, const(D3D11_TILE_REGION_SIZE) *pTileRegionSize, uint Flags);
	void CopyTiles(ID3D11Resource TiledResource, const(D3D11_TILED_RESOURCE_COORDINATE) *pTileRegionStartCoord, const D3D11_TILE_REGION_SIZE *pTileRegionSize, ID3D11Buffer pBuffer, ulong BufferStartOffsetInBytes, uint Flags);
	HRESULT ResizeTilePool(ID3D11Buffer pTilePool, ulong NewSizeInBytes);
	void TiledResourceBarrier(ID3D11DeviceChild pTiledResourceOrViewAccessBeforeBarrier, ID3D11DeviceChild pTiledResourceOrViewAccessAfterBarrier);
	HRESULT UpdateTileMappings(ID3D11Resource pTiledResource, uint NumTiledResourceRegions, const(D3D11_TILED_RESOURCE_COORDINATE) *pTiledResourceRegionStartCoordinates, const(D3D11_TILE_REGION_SIZE) *pTiledResourceRegionSizes, ID3D11Buffer pTilePool, uint NumRanges, const(uint) *pRangeFlags, const(uint) *pTilePoolStartOffsets, const(uint) *pRangeTileCounts, uint Flags);
}

//
// Resources D3D11
//

uint D3D11CalcSubresource(uint MipSlice, uint ArraySlice, uint MipLevels ) { return MipSlice + ArraySlice * MipLevels; }

//
// Enumerations
//

public enum D3D11_BIND_FLAG : int { 
	VERTEX_BUFFER     = 0x1L,
	INDEX_BUFFER      = 0x2L,
	CONSTANT_BUFFER   = 0x4L,
	SHADER_RESOURCE   = 0x8L,
	STREAM_OUTPUT     = 0x10L,
	RENDER_TARGET     = 0x20L,
	DEPTH_STENCIL     = 0x40L,
	UNORDERED_ACCESS  = 0x80L,
	DECODER           = 0x200L,
	VIDEO_ENCODER     = 0x400L
}

public enum D3D11_BUFFEREX_SRV_FLAG : int { 
	RAW  = 0x1
}

public enum D3D11_BUFFER_UAV_FLAG : int { 
	RAW      = 0x1,
	APPEND   = 0x2,
	COUNTER  = 0x4
}

public enum D3D11_CPU_ACCESS_FLAG : int { 
	WRITE  = 0x10000L,
	READ   = 0x20000L
}

public enum D3D11_DSV_DIMENSION : int{ 
	UNKNOWN           = 0,
	TEXTURE1D         = 1,
	TEXTURE1DARRAY    = 2,
	TEXTURE2D         = 3,
	TEXTURE2DARRAY    = 4,
	TEXTURE2DMS       = 5,
	TEXTURE2DMSARRAY  = 6
}

public enum D3D11_DSV_FLAG : int { 
	DEPTH    = 0x1L,
	STENCIL  = 0x2L
}

public enum D3D11_MAP : int { 
	READ                = 1,
	WRITE               = 2,
	READ_WRITE          = 3,
	WRITE_DISCARD       = 4,
	WRITE_NO_OVERWRITE  = 5
}

public enum D3D11_MAP_FLAG : int { 
	D3D11_MAP_FLAG_DO_NOT_WAIT  = 0x100000L
}

public enum D3D11_RESOURCE_DIMENSION : int { 
	UNKNOWN    = 0,
	BUFFER     = 1,
	TEXTURE1D  = 2,
	TEXTURE2D  = 3,
	TEXTURE3D  = 4
}

public enum D3D11_RESOURCE_MISC_FLAG : int { 
	GENERATE_MIPS                    = 0x1L,
	SHARED                           = 0x2L,
	TEXTURECUBE                      = 0x4L,
	DRAWINDIRECT_ARGS                = 0x10L,
	BUFFER_ALLOW_RAW_VIEWS           = 0x20L,
	BUFFER_STRUCTURED                = 0x40L,
	RESOURCE_CLAMP                   = 0x80L,
	SHARED_KEYEDMUTEX                = 0x100L,
	GDI_COMPATIBLE                   = 0x200L,
	SHARED_NTHANDLE                  = 0x800L,
	RESTRICTED_CONTENT               = 0x1000L,
	RESTRICT_SHARED_RESOURCE         = 0x2000L,
	RESTRICT_SHARED_RESOURCE_DRIVER  = 0x4000L,
	GUARDED                          = 0x8000L,
	TILE_POOL                        = 0x20000L,
	TILED                            = 0x40000L
}

public enum D3D11_RTV_DIMENSION : int { 
	UNKNOWN           = 0,
	BUFFER            = 1,
	TEXTURE1D         = 2,
	TEXTURE1DARRAY    = 3,
	TEXTURE2D         = 4,
	TEXTURE2DARRAY    = 5,
	TEXTURE2DMS       = 6,
	TEXTURE2DMSARRAY  = 7,
	TEXTURE3D         = 8
}

public enum D3D11_SRV_DIMENSION : int { 
	UNKNOWN           = 0,
	BUFFER            = 1,
	TEXTURE1D         = 2,
	TEXTURE1DARRAY    = 3,
	TEXTURE2D         = 4,
	TEXTURE2DARRAY    = 5,
	TEXTURE2DMS       = 6,
	TEXTURE2DMSARRAY  = 7,
	TEXTURE3D         = 8,
	TEXTURECUBE       = 9,
	TEXTURECUBEARRAY  = 10,
	BUFFEREX          = 11
}

public enum D3D11_STANDARD_MULTISAMPLE_QUALITY_LEVELS : int { 
	STANDARD_MULTISAMPLE_PATTERN  = 0xffffffff,
	CENTER_MULTISAMPLE_PATTERN    = 0xfffffffe
}

public enum D3D11_UAV_DIMENSION : int { 
	UNKNOWN         = 0,
	BUFFER          = 1,
	TEXTURE1D       = 2,
	TEXTURE1DARRAY  = 3,
	TEXTURE2D       = 4,
	TEXTURE2DARRAY  = 5,
	TEXTURE3D       = 8
}

public enum D3D11_USAGE : int { 
	DEFAULT    = 0,
	IMMUTABLE  = 1,
	DYNAMIC    = 2,
	STAGING    = 3
}

public enum D3D11_CHECK_MULTISAMPLE_QUALITY_LEVELS_FLAG : int{ 
	TILED_RESOURCE  = 0x1
}

public enum D3D11_TILE_COPY_FLAG : int { 
	NO_OVERWRITE                              = 0x1,
	LINEAR_BUFFER_TO_SWIZZLED_TILED_RESOURCE  = 0x2,
	SWIZZLED_TILED_RESOURCE_TO_LINEAR_BUFFER  = 0x4
}

public enum D3D11_TILE_MAPPING_FLAG : int { 
	NO_OVERWRITE  = 0x1
}

public enum D3D11_TILE_RANGE_FLAG : int { 
	NULL               = 0x1,
	SKIP               = 0x2,
	REUSE_SINGLE_TILE  = 0x4
}

//
// Structures
//

public struct D3D11_BUFFER_DESC {
	uint ByteWidth;
	D3D11_USAGE Usage;
	uint BindFlags;
	uint CPUAccessFlags;
	uint MiscFlags;
	uint StructureByteStride;
}

public struct D3D11_BUFFER_RTV {
	union {
		uint FirstElement;
		uint ElementOffset;
	};
	union {
		uint NumElements;
		uint ElementWidth;
	};
}

public struct D3D11_BUFFER_SRV {
	union {
		uint FirstElement;
		uint ElementOffset;
	};
	union {
		uint NumElements;
		uint ElementWidth;
	};
}

public struct D3D11_BUFFER_UAV {
	uint FirstElement;
	uint NumElements;
	uint Flags;
}

public struct D3D11_BUFFEREX_SRV {
	uint FirstElement;
	uint NumElements;
	uint Flags;
}

public struct D3D11_DEPTH_STENCIL_VIEW_DESC {
	DXGI_FORMAT         Format;
	D3D11_DSV_DIMENSION ViewDimension;
	uint                Flags;
	union {
		D3D11_TEX1D_DSV         Texture1D;
		D3D11_TEX1D_ARRAY_DSV   Texture1DArray;
		D3D11_TEX2D_DSV         Texture2D;
		D3D11_TEX2D_ARRAY_DSV   Texture2DArray;
		D3D11_TEX2DMS_DSV       Texture2DMS;
		D3D11_TEX2DMS_ARRAY_DSV Texture2DMSArray;
	};
}

public struct D3D11_MAPPED_SUBRESOURCE {
	void *pData;
	uint RowPitch;
	uint DepthPitch;
}

public struct D3D11_RENDER_TARGET_VIEW_DESC {
	DXGI_FORMAT         Format;
	D3D11_RTV_DIMENSION ViewDimension;
	union {
		D3D11_BUFFER_RTV        Buffer;
		D3D11_TEX1D_RTV         Texture1D;
		D3D11_TEX1D_ARRAY_RTV   Texture1DArray;
		D3D11_TEX2D_RTV         Texture2D;
		D3D11_TEX2D_ARRAY_RTV   Texture2DArray;
		D3D11_TEX2DMS_RTV       Texture2DMS;
		D3D11_TEX2DMS_ARRAY_RTV Texture2DMSArray;
		D3D11_TEX3D_RTV         Texture3D;
	};
}

public struct D3D11_SHADER_RESOURCE_VIEW_DESC {
	DXGI_FORMAT         Format;
	D3D11_SRV_DIMENSION ViewDimension;
	union {
		D3D11_BUFFER_SRV        Buffer;
		D3D11_TEX1D_SRV         Texture1D;
		D3D11_TEX1D_ARRAY_SRV   Texture1DArray;
		D3D11_TEX2D_SRV         Texture2D;
		D3D11_TEX2D_ARRAY_SRV   Texture2DArray;
		D3D11_TEX2DMS_SRV       Texture2DMS;
		D3D11_TEX2DMS_ARRAY_SRV Texture2DMSArray;
		D3D11_TEX3D_SRV         Texture3D;
		D3D11_TEXCUBE_SRV       TextureCube;
		D3D11_TEXCUBE_ARRAY_SRV TextureCubeArray;
		D3D11_BUFFEREX_SRV      BufferEx;
	};
}

public struct D3D11_SUBRESOURCE_DATA {
	const void *pSysMem;
	uint SysMemPitch;
	uint SysMemSlicePitch;
}

public struct D3D11_TEX1D_ARRAY_DSV {
	uint MipSlice;
	uint FirstArraySlice;
	uint ArraySize;
}

public struct D3D11_TEX1D_ARRAY_RTV {
	uint MipSlice;
	uint FirstArraySlice;
	uint ArraySize;
}

public struct D3D11_TEX1D_ARRAY_SRV {
	uint MostDetailedMip;
	uint MipLevels;
	uint FirstArraySlice;
	uint ArraySize;
}

public struct D3D11_TEX1D_ARRAY_UAV {
	uint MipSlice;
	uint FirstArraySlice;
	uint ArraySize;
}

public struct D3D11_TEX1D_DSV {
	uint MipSlice;
}

public struct D3D11_TEX1D_RTV {
	uint MipSlice;
}

public struct D3D11_TEX1D_SRV {
	uint MostDetailedMip;
	uint MipLevels;
}

public struct D3D11_TEX1D_UAV {
	uint MipSlice;
}

public struct D3D11_TEX2D_ARRAY_DSV {
	uint MipSlice;
	uint FirstArraySlice;
	uint ArraySize;
}

public struct D3D11_TEX2D_ARRAY_RTV {
	uint MipSlice;
	uint FirstArraySlice;
	uint ArraySize;
}

public struct D3D11_TEX2D_ARRAY_SRV {
	uint MostDetailedMip;
	uint MipLevels;
	uint FirstArraySlice;
	uint ArraySize;
}

public struct D3D11_TEX2D_ARRAY_UAV {
	uint MipSlice;
	uint FirstArraySlice;
	uint ArraySize;
}

public struct D3D11_TEX2D_DSV {
	uint MipSlice;
}

public struct D3D11_TEX2D_RTV {
	uint MipSlice;
}

public struct D3D11_TEX2D_SRV {
	uint MostDetailedMip;
	uint MipLevels;
}

public struct D3D11_TEX2D_UAV {
	uint MipSlice;
}

public struct D3D11_TEX2DMS_ARRAY_DSV {
	uint FirstArraySlice;
	uint ArraySize;
}

public struct D3D11_TEX2DMS_ARRAY_RTV {
	uint FirstArraySlice;
	uint ArraySize;
}

public struct D3D11_TEX2DMS_ARRAY_SRV {
	uint FirstArraySlice;
	uint ArraySize;
}

public struct D3D11_TEX2DMS_DSV {
	uint UnusedField_NothingToDefine;
}

public struct D3D11_TEX2DMS_RTV {
	uint UnusedField_NothingToDefine;
}

public struct D3D11_TEX2DMS_SRV {
	uint UnusedField_NothingToDefine;
}

public struct D3D11_TEX3D_RTV {
	uint MipSlice;
	uint FirstWSlice;
	uint WSize;
}

public struct D3D11_TEX3D_SRV {
	uint MostDetailedMip;
	uint MipLevels;
}

public struct D3D11_TEX3D_UAV {
	uint MipSlice;
	uint FirstWSlice;
	uint WSize;
}

public struct D3D11_TEXCUBE_ARRAY_SRV {
	uint MostDetailedMip;
	uint MipLevels;
	uint First2DArrayFace;
	uint NumCubes;
}

public struct D3D11_TEXCUBE_SRV {
	uint MostDetailedMip;
	uint MipLevels;
}

public struct D3D11_TEXTURE1D_DESC {
	uint Width;
	uint MipLevels;
	uint ArraySize;
	DXGI_FORMAT Format;
	D3D11_USAGE Usage;
	uint BindFlags;
	uint CPUAccessFlags;
	uint MiscFlags;
}

public struct D3D11_TEXTURE2D_DESC {
	uint Width;
	uint Height;
	uint MipLevels;
	uint ArraySize;
	DXGI_FORMAT Format;
	DXGI_SAMPLE_DESC SampleDesc;
	D3D11_USAGE Usage;
	uint BindFlags;
	uint CPUAccessFlags;
	uint MiscFlags;
}

public struct D3D11_TEXTURE3D_DESC {
	uint Width;
	uint Height;
	uint Depth;
	uint MipLevels;
	DXGI_FORMAT Format;
	D3D11_USAGE Usage;
	uint BindFlags;
	uint CPUAccessFlags;
	uint MiscFlags;
}

public struct D3D11_PACKED_MIP_DESC {
	ubyte NumStandardMips;
	ubyte NumPackedMips;
	uint NumTilesForPackedMips;
	uint StartTileIndexInOverallResource;
}

public struct D3D11_SUBRESOURCE_TILING {
	uint WidthInTiles;
	ushort HeightInTiles;
	ushort DepthInTiles;
	uint StartTileIndexInOverallResource;
}

public struct D3D11_TILE_REGION_SIZE {
	uint NumTiles;
	bool bUseBox;
	uint Width;
	ushort Height;
	ushort Depth;
}

public struct D3D11_TILED_RESOURCE_COORDINATE {
	uint X;
	uint Y;
	uint Z;
	uint Subresource;
}

public struct D3D11_TILE_SHAPE {
	uint WidthInTexels;
	uint HeightInTexels;
	uint DepthInTexels;
}

public struct D3D11_UNORDERED_ACCESS_VIEW_DESC {
	DXGI_FORMAT         Format;
	D3D11_UAV_DIMENSION ViewDimension;
	union {
		D3D11_BUFFER_UAV      Buffer;
		D3D11_TEX1D_UAV       Texture1D;
		D3D11_TEX1D_ARRAY_UAV Texture1DArray;
		D3D11_TEX2D_UAV       Texture2D;
		D3D11_TEX2D_ARRAY_UAV Texture2DArray;
		D3D11_TEX3D_UAV       Texture3D;
	};
}

//
// Interfaces
//

mixin(uuid!(ID3D11Buffer, "48570b85-d1ee-4fcd-a250-eb350722b037"));
public interface ID3D11Buffer : ID3D11Resource
{
extern(Windows):
	void GetDesc(D3D11_BUFFER_DESC *pDesc);
}

mixin(uuid!(ID3D11Resource, "dc8e63f3-d12b-4952-b47b-5e45026a862d"));
public interface ID3D11Resource : ID3D11DeviceChild
{
extern(Windows):
	uint GetEvictionPriority();
	void GetType(D3D11_RESOURCE_DIMENSION *rType);
	void SetEvictionPriority(uint EvictionPriority);
}

mixin(uuid!(ID3D11Texture1D, "f8fb5c27-c6b3-4f75-a4c8-439af2ef564c"));
public interface ID3D11Texture1D : ID3D11Resource
{
extern(Windows):
	void GetDesc(D3D11_TEXTURE1D_DESC *pDesc);
}

mixin(uuid!(ID3D11Texture2D, "6f15aaf2-d208-4e89-9ab4-489535d34f9c"));
public interface ID3D11Texture2D : ID3D11Resource
{
extern(Windows):
	void GetDesc(D3D11_TEXTURE2D_DESC *pDesc);
}

mixin(uuid!(ID3D11Texture3D, "037e866e-f56d-4357-a8af-9dabbe6e250e"));
public interface ID3D11Texture3D : ID3D11Resource
{
extern(Windows):
	void GetDesc(D3D11_TEXTURE3D_DESC *pDesc);
}

mixin(uuid!(ID3D11DepthStencilView, "9fdac92a-1876-48c3-afad-25b94f84a9b6"));
public interface ID3D11DepthStencilView : ID3D11View
{
extern(Windows):
	void GetDesc(D3D11_DEPTH_STENCIL_VIEW_DESC *pDesc);
}

mixin(uuid!(ID3D11RenderTargetView, "dfdba067-0b8d-4865-875b-d7b4516cc164"));
public interface ID3D11RenderTargetView : ID3D11View
{
extern(Windows):
	void GetDesc(D3D11_RENDER_TARGET_VIEW_DESC *pDesc);
}

mixin(uuid!(ID3D11ShaderResourceView, "b0e06fe0-8192-4e1a-b1ca-36d7414710b2"));
public interface ID3D11ShaderResourceView : ID3D11View
{
extern(Windows):
	void GetDesc(D3D11_SHADER_RESOURCE_VIEW_DESC *pDesc);
}

mixin(uuid!(ID3D11UnorderedAccessView, "28acf509-7f5c-48f6-8611-f316010a6380"));
public interface ID3D11UnorderedAccessView : ID3D11View
{
extern(Windows):
	void GetDesc(D3D11_UNORDERED_ACCESS_VIEW_DESC *pDesc);
}

mixin(uuid!(ID3D11View, "839d1216-bb2e-412b-b7f4-a9dbebe08ed1"));
public interface ID3D11View : ID3D11DeviceChild
{
extern(Windows):
	void GetResource(ID3D11Resource **ppResource);
}

//
// Shaders D3D11
//

//
// Enumerations
//

public enum D3D11_CBUFFER_TYPE : int { 
	CBUFFER,
	TBUFFER,
	INTERFACE_POINTERS,
	RESOURCE_BIND_INFO
}

public enum D3D11_RESOURCE_RETURN_TYPE : int { 
	UNORM      = 1,
	SNORM      = 2,
	SINT       = 3,
	UINT       = 4,
	FLOAT      = 5,
	MIXED      = 6,
	DOUBLE     = 7,
	CONTINUED  = 8
}

public enum D3D11_SHADER_VERSION_TYPE : int { 
	PIXEL_SHADER     = 0,
	VERTEX_SHADER    = 1,
	GEOMETRY_SHADER  = 2,
	HULL_SHADER      = 3,
	DOMAIN_SHADER    = 4,
	COMPUTE_SHADER   = 5
}

public enum D3D11_TESSELLATOR_DOMAIN : int { 
	UNDEFINED  = 0,
	ISOLINE    = 1,
	TRI        = 2,
	QUAD       = 3
}

public enum D3D11_TESSELLATOR_PARTITIONING : int { 
	UNDEFINED        = 0,
	INTEGER          = 1,
	POW2             = 2,
	FRACTIONAL_ODD   = 3,
	FRACTIONAL_EVEN  = 4
}

public enum D3D11_TESSELLATOR_OUTPUT_PRIMITIVE : int { 
	UNDEFINED     = 0,
	POINT         = 1,
	LINE          = 2,
	TRIANGLE_CW   = 3,
	TRIANGLE_CCW  = 4
}

public enum D3D11_SHADER_TYPE : int { 
	VERTEX_SHADER    = 1,
	HULL_SHADER      = 2,
	DOMAIN_SHADER    = 3,
	GEOMETRY_SHADER  = 4,
	PIXEL_SHADER     = 5,
	COMPUTE_SHADER   = 6
}

public enum D3D11_TRACE_GS_INPUT_PRIMITIVE { 
	UNDEFINED     = 0,
	POINT         = 1,
	LINE          = 2,
	TRIANGLE      = 3,
	LINE_ADJ      = 6,
	TRIANGLE_ADJ  = 7
}

public enum D3D11_TRACE_REGISTER_TYPE { 
	OUTPUT_NULL_REGISTER                         = 0,
	INPUT_REGISTER                               = ( OUTPUT_NULL_REGISTER + 1 ),
	INPUT_PRIMITIVE_ID_REGISTER                  = ( INPUT_REGISTER + 1 ),
	IMMEDIATE_CONSTANT_BUFFER                    = ( INPUT_PRIMITIVE_ID_REGISTER + 1 ),
	TEMP_REGISTER                                = ( IMMEDIATE_CONSTANT_BUFFER + 1 ),
	INDEXABLE_TEMP_REGISTER                      = ( TEMP_REGISTER + 1 ),
	OUTPUT_REGISTER                              = ( INDEXABLE_TEMP_REGISTER + 1 ),
	OUTPUT_DEPTH_REGISTER                        = ( OUTPUT_REGISTER + 1 ),
	CONSTANT_BUFFER                              = ( OUTPUT_DEPTH_REGISTER + 1 ),
	IMMEDIATE32                                  = ( CONSTANT_BUFFER + 1 ),
	SAMPLER                                      = ( IMMEDIATE32 + 1 ),
	RESOURCE                                     = ( SAMPLER + 1 ),
	RASTERIZER                                   = ( RESOURCE + 1 ),
	OUTPUT_COVERAGE_MASK                         = ( RASTERIZER + 1 ),
	STREAM                                       = ( OUTPUT_COVERAGE_MASK + 1 ),
	THIS_POINTER                                 = ( STREAM + 1 ),
	OUTPUT_CONTROL_POINT_ID_REGISTER             = ( THIS_POINTER + 1 ),
	INPUT_FORK_INSTANCE_ID_REGISTER              = ( OUTPUT_CONTROL_POINT_ID_REGISTER + 1 ),
	INPUT_JOIN_INSTANCE_ID_REGISTER              = ( INPUT_FORK_INSTANCE_ID_REGISTER + 1 ),
	INPUT_CONTROL_POINT_REGISTER                 = ( INPUT_JOIN_INSTANCE_ID_REGISTER + 1 ),
	OUTPUT_CONTROL_POINT_REGISTER                = ( INPUT_CONTROL_POINT_REGISTER + 1 ),
	INPUT_PATCH_CONSTANT_REGISTER                = ( OUTPUT_CONTROL_POINT_REGISTER + 1 ),
	INPUT_DOMAIN_POINT_REGISTER                  = ( INPUT_PATCH_CONSTANT_REGISTER + 1 ),
	UNORDERED_ACCESS_VIEW                        = ( INPUT_DOMAIN_POINT_REGISTER + 1 ),
	THREAD_GROUP_SHARED_MEMORY                   = ( UNORDERED_ACCESS_VIEW + 1 ),
	INPUT_THREAD_ID_REGISTER                     = ( THREAD_GROUP_SHARED_MEMORY + 1 ),
	INPUT_THREAD_GROUP_ID_REGISTER               = ( INPUT_THREAD_ID_REGISTER + 1 ),
	INPUT_THREAD_ID_IN_GROUP_REGISTER            = ( INPUT_THREAD_GROUP_ID_REGISTER + 1 ),
	INPUT_COVERAGE_MASK_REGISTER                 = ( INPUT_THREAD_ID_IN_GROUP_REGISTER + 1 ),
	INPUT_THREAD_ID_IN_GROUP_FLATTENED_REGISTER  = ( INPUT_COVERAGE_MASK_REGISTER + 1 ),
	INPUT_GS_INSTANCE_ID_REGISTER                = ( INPUT_THREAD_ID_IN_GROUP_FLATTENED_REGISTER + 1 ),
	OUTPUT_DEPTH_GREATER_EQUAL_REGISTER          = ( INPUT_GS_INSTANCE_ID_REGISTER + 1 ),
	OUTPUT_DEPTH_LESS_EQUAL_REGISTER             = ( OUTPUT_DEPTH_GREATER_EQUAL_REGISTER + 1 ),
	IMMEDIATE64                                  = ( OUTPUT_DEPTH_LESS_EQUAL_REGISTER + 1 ),
	INPUT_CYCLE_COUNTER_REGISTER                 = ( IMMEDIATE64 + 1 ),
	INTERFACE_POINTER                            = ( INPUT_CYCLE_COUNTER_REGISTER + 1 )
}

//
// Structures
//

public struct D3D11_CLASS_INSTANCE_DESC {
	uint InstanceId;
	uint InstanceIndex;
	uint TypeId;
	uint ConstantBuffer;
	uint BaseConstantBufferOffset;
	uint BaseTexture;
	uint BaseSampler;
	bool Created;
}

public struct D3D11_FUNCTION_DESC {
	uint Version;
	const(char)* Creator;
	uint Flags;
	uint ConstantBuffers;
	uint BoundResources;
	uint InstructionCount;
	uint TempRegisterCount;
	uint TempArrayCount;
	uint DefCount;
	uint DclCount;
	uint TextureNormalInstructions;
	uint TextureLoadInstructions;
	uint TextureCompInstructions;
	uint TextureBiasInstructions;
	uint TextureGradientInstructions;
	uint FloatInstructionCount;
	uint IntInstructionCount;
	uint UintInstructionCount;
	uint StaticFlowControlCount;
	uint DynamicFlowControlCount;
	uint MacroInstructionCount;
	uint ArrayInstructionCount;
	uint MovInstructionCount;
	uint MovcInstructionCount;
	uint ConversionInstructionCount;
	uint BitwiseInstructionCount;
	D3D_FEATURE_LEVEL MinFeatureLevel;
	ulong RequiredFeatureFlags;
	const(char)* Name;
	int FunctionParameterCount;
	bool HasReturn;
	bool Has10Level9VertexShader;
	bool Has10Level9PixelShader;
}

public struct D3D11_LIBRARY_DESC {
	const(char)* Creator;
	uint Flags;
	uint FunctionCount;
}

public struct D3D11_SHADER_BUFFER_DESC {
	const(char)* Name;
	D3D_CBUFFER_TYPE Type;
	uint Variables;
	uint Size;
	uint uFlags;
}

public struct D3D11_SHADER_DESC {
	uint Version;
	const(char)* Creator;
	uint Flags;
	uint ConstantBuffers;
	uint BoundResources;
	uint InputParameters;
	uint OutputParameters;
	uint InstructionCount;
	uint TempRegisterCount;
	uint TempArrayCount;
	uint DefCount;
	uint DclCount;
	uint TextureNormalInstructions;
	uint TextureLoadInstructions;
	uint TextureCompInstructions;
	uint TextureBiasInstructions;
	uint TextureGradientInstructions;
	uint FloatInstructionCount;
	uint IntInstructionCount;
	uint UintInstructionCount;
	uint StaticFlowControlCount;
	uint DynamicFlowControlCount;
	uint MacroInstructionCount;
	uint ArrayInstructionCount;
	uint CutInstructionCount;
	uint EmitInstructionCount;
	uint GSOutputTopology;
	uint GSMaxOutputVertexCount;
	D3D_PRIMITIVE InputPrimitive;
	uint PatchConstantParameters;
	uint cGSInstanceCount;
	uint cControlPoints;
	D3D_TESSELLATOR_OUTPUT_PRIMITIVE HSOutputPrimitive;
	D3D_TESSELLATOR_PARTITIONING HSPartitioning;
	D3D_TESSELLATOR_DOMAIN TessellatorDomain;
	uint cBarrierInstructions;
	uint cInterlockedInstructions;
	uint cTextureStoreInstructions;
}

public struct D3D11_SHADER_INPUT_BIND_DESC {
	const(char)* Name;
	D3D_SHADER_INPUT_TYPE Type;
	uint BindPoint;
	uint BindCount;
	uint uFlags;
	D3D_RESOURCE_RETURN_TYPE ReturnType;
	D3D_SRV_DIMENSION Dimension;
	uint NumSamples;
}

public struct D3D11_SHADER_TYPE_DESC {
	D3D_SHADER_VARIABLE_CLASS Class;
	D3D_SHADER_VARIABLE_TYPE Type;
	uint Rows;
	uint Columns;
	uint Elements;
	uint Members;
	uint Offset;
	const(char)* Name;
}

public struct D3D11_SHADER_VARIABLE_DESC {
	const(char)* Name;
	uint StartOffset;
	uint Size;
	uint uFlags;
	void* DefaultValue;
}

public struct D3D11_SIGNATURE_PARAMETER_DESC {
	const(char)* SemanticName;
	uint SemanticIndex;
	uint Register;
	D3D_NAME SystemValueType;
	D3D_REGISTER_COMPONENT_TYPE ComponentType;
	ubyte Mask;
	ubyte ReadWriteMask;
	uint Stream;
	D3D_MIN_PRECISION MinPrecision;
}

alias ubyte D3D11_TRACE_COMPONENT_MASK;
alias ushort D3D11_TRACE_MISC_OPERATIONS_MASK;

public struct D3D11_COMPUTE_SHADER_TRACE_DESC {
	ulong Invocation;
	uint[3] ThreadIDInGroup;
	uint[3] ThreadGroupID;
}

public struct D3D11_DOMAIN_SHADER_TRACE_DESC {
	ulong Invocation;
}

public struct D3D11_GEOMETRY_SHADER_TRACE_DESC {
	ulong Invocation;
}

public struct D3D11_HULL_SHADER_TRACE_DESC {
	ulong Invocation;
}

public struct D3D11_PIXEL_SHADER_TRACE_DESC {
	ulong Invocation;
	int X;
	int Y;
	ulong SampleMask;
}

public struct D3D11_SHADER_TRACE_DESC {
	D3D11_SHADER_TYPE Type;
	uint Flags;
	union {
		D3D11_VERTEX_SHADER_TRACE_DESC   VertexShaderTraceDesc;
		D3D11_HULL_SHADER_TRACE_DESC     HullShaderTraceDesc;
		D3D11_DOMAIN_SHADER_TRACE_DESC   DomainShaderTraceDesc;
		D3D11_GEOMETRY_SHADER_TRACE_DESC GeometryShaderTraceDesc;
		D3D11_PIXEL_SHADER_TRACE_DESC    PixelShaderTraceDesc;
		D3D11_COMPUTE_SHADER_TRACE_DESC  ComputeShaderTraceDesc;
	};
}

public struct D3D11_TRACE_REGISTER {
	D3D11_TRACE_REGISTER_TYPE RegType;
	union {		
		ushort Index1D;		
		ushort[2] Index2D;
	};
	ubyte OperandIndex;
	ubyte Flags;
}

public struct D3D11_TRACE_STATS {
	D3D11_SHADER_TRACE_DESC TraceDesc;
	ubyte NumInvocationsInStamp;
	ubyte TargetStampIndex;
	uint NumTraceSteps;
	D3D11_TRACE_COMPONENT_MASK[32] InputMask;
	D3D11_TRACE_COMPONENT_MASK[32] OutputMask;
	ushort NumTemps;
	ushort MaxIndexableTempIndex;
	ushort[4096] IndexableTempSize;
	ushort ImmediateConstantBufferSize;
	uint[4][2] PixelPosition;
	ulong[4] PixelCoverageMask;
	ulong[4] PixelDiscardedMask;
	ulong[4] PixelCoverageMaskAfterShader;
	ulong[4] PixelCoverageMaskAfterA2CSampleMask;
	ulong[4] PixelCoverageMaskAfterA2CSampleMaskDepth;
	ulong[4] PixelCoverageMaskAfterA2CSampleMaskDepthStencil;
	bool PSOutputsDepth;
	bool PSOutputsMask;
	D3D11_TRACE_GS_INPUT_PRIMITIVE GSInputPrimitive;
	bool GSInputsPrimitiveID;
	D3D11_TRACE_COMPONENT_MASK[32] HSOutputPatchConstantMask;
	D3D11_TRACE_COMPONENT_MASK[32] DSInputPatchConstantMask;
}

public struct D3D11_TRACE_STEP {
	uint ID;
	bool InstructionActive;
	ubyte NumRegistersWritten;
	ubyte NumRegistersRead;
	D3D11_TRACE_MISC_OPERATIONS_MASK MiscOperations;
	uint OpcodeType;
	uint CurrentGlobalCycle;
}

public struct D3D11_TRACE_VALUE {
	uint[4] Bits;
	D3D11_TRACE_COMPONENT_MASK ValidMask;
}

public struct D3D11_VERTEX_SHADER_TRACE_DESC {
	ulong Invocation;
}

//
// Interfaces
//

mixin(uuid!(ID3D11ClassInstance, "a6cd7faa-b0b7-4a2f-9436-8662a65797cb"));
public interface ID3D11ClassInstance : ID3D11DeviceChild
{
extern(Windows):
	void GetClassLinkage(ID3D11ClassLinkage *ppLinkage);
	void GetDesc(D3D11_CLASS_INSTANCE_DESC *pDesc);
	void GetInstanceName(wchar* pInstanceName, uint *pBufferLength);
	void GetTypeName(const(char)* pTypeName, uint *pBufferLength);
}

mixin(uuid!(ID3D11ClassLinkage, "ddf57cba-9543-46e4-a12b-f207a0fe7fed"));
public interface ID3D11ClassLinkage : ID3D11DeviceChild
{
extern(Windows):
	HRESULT CreateClassInstance(const(char)* pszClassTypeName, uint ConstantBufferOffset, uint ConstantVectorOffset, uint TextureOffset, uint SamplerOffset, ID3D11ClassInstance *ppInstance);
	HRESULT GetClassInstance(const(wchar)* pClassInstanceName, uint InstanceIndex, ID3D11ClassInstance *ppInstance);
}

mixin(uuid!(ID3D11ComputeShader, "4f5b196e-c2bd-495e-bd01-1fded38e4969"));
public interface ID3D11ComputeShader : ID3D11DeviceChild
{
extern(Windows):
}

mixin(uuid!(ID3D11DomainShader, "f582c508-0f36-490c-9977-31eece268cfa"));
public interface ID3D11DomainShader : ID3D11DeviceChild
{
extern(Windows):
}

mixin(uuid!(ID3D11FunctionLinkingGraph, "54133220-1CE8-43D3-8236-9855C5CEECFF"));
public interface ID3D11FunctionLinkingGraph : IUnknown
{
extern(Windows):
	HRESULT CallFunction(const(char)* pModuleInstanceNamespace, ID3D11ModuleInstance pModuleWithFunctionPrototype, const(char)* pFunctionName, ID3D11LinkingNode *ppCallNode);
	HRESULT CreateModuleInstance(ID3D11ModuleInstance *ppModuleInstance, ID3DBlob *ppErrorBuffer);
	HRESULT GenerateHlsl(uint uFlags, ID3DBlob *ppBuffer);
	HRESULT GetLastError(ID3DBlob *ppErrorBuffer);
	HRESULT PassValue(ID3D11LinkingNode pSrcNode, int SrcParameterIndex, ID3D11LinkingNode pDstNode, int DstParameterIndex);
	HRESULT PassValueWithSwizzle(ID3D11LinkingNode pSrcNode, int SrcParameterIndex, const(char)* pSrcSwizzle, ID3D11LinkingNode pDstNode, int DstParameterIndex, const(char)* pDstSwizzle);
	HRESULT SetInputSignature(const D3D11_PARAMETER_DESC *pInputParameters, uint cInputParameters, ID3D11LinkingNode *ppInputNode);
	HRESULT SetOutputSignature(const D3D11_PARAMETER_DESC *pOutputParameters, uint cOutputParameters, ID3D11LinkingNode *ppOutputNode);
}
extern(Windows) HRESULT D3DCreateFunctionLinkingGraph(uint uFlags, ID3D11FunctionLinkingGraph *ppFunctionLinkingGraph);


mixin(uuid!(ID3D11FunctionReflection, "207BCECB-D683-4A06-A8A3-9B149B9F73A4"));
public interface ID3D11FunctionReflection
{
extern(Windows):
	ID3D11ShaderReflectionConstantBuffer GetConstantBufferByIndex(uint BufferIndex);
	ID3D11ShaderReflectionConstantBuffer GetConstantBufferByName(const(char*) Name);
	HRESULT GetDesc(D3D11_FUNCTION_DESC *pDesc);
	ID3D11FunctionParameterReflection GetFunctionParameter(int ParameterIndex);
	HRESULT GetResourceBindingDesc(uint ResourceIndex, D3D11_SHADER_INPUT_BIND_DESC *pDesc);
	HRESULT GetResourceBindingDescByName(const(char)* Name, D3D11_SHADER_INPUT_BIND_DESC *pDesc);
	ID3D11ShaderReflectionVariable* GetVariableByName(const(char)** Name);
}

mixin(uuid!(ID3D11FunctionParameterReflection, "42757488-334F-47FE-982E-1A65D08CC462"));
public interface ID3D11FunctionParameterReflection
{
extern(Windows):
	HRESULT GetDesc(D3D11_PARAMETER_DESC *pDesc);
}

mixin(uuid!(ID3D11GeometryShader, "38325b96-effb-4022-ba02-2e795b70275c"));
public interface ID3D11GeometryShader : ID3D11DeviceChild
{
extern(Windows):
}

mixin(uuid!(ID3D11HullShader, "8e5c6061-628a-4c8e-8264-bbe45cb3d5dd"));
public interface ID3D11HullShader : ID3D11DeviceChild
{
extern(Windows):
}

mixin(uuid!(ID3D11LibraryReflection, "54384F1B-5B3E-4BB7-AE01-60BA3097CBB6"));
public interface ID3D11LibraryReflection : IUnknown
{
extern(Windows):
	HRESULT GetDesc(D3D11_LIBRARY_DESC *pDesc);
	ID3D11FunctionReflection GetFunctionByIndex(int FunctionIndex);
}
extern(Windows) HRESULT D3DReflectLibrary(const(void)* pSrcData, uint SrcDataSize, IID* riid, void** ppReflector);

mixin(uuid!(ID3D11Linker, "59A6CD0E-E10D-4C1F-88C0-63ABA1DAF30E"));
public interface ID3D11Linker : IUnknown
{
extern(Windows):
	HRESULT AddClipPlaneFromCBuffer(uint uCBufferSlot, uint uCBufferEntry);
	HRESULT Link(ID3D11ModuleInstance pEntry, const(char)* pEntryName, const(char)* pNpTargetNameame, uint uFlags, ID3DBlob *ppShaderBlob, ID3DBlob *ppErrorBuffer);
	HRESULT UseLibrary(ID3D11ModuleInstance pLibraryMI);
}
extern(Windows) HRESULT D3DCreateLinker(ID3D11Linker *ppLinker);

mixin(uuid!(ID3D11LinkingNode, "D80DD70C-8D2F-4751-94A1-03C79B3556DB"));
public interface ID3D11LinkingNode : IUnknown
{
extern(Windows):
}

mixin(uuid!(ID3D11Module, "CAC701EE-80FC-4122-8242-10B39C8CEC34"));
public interface ID3D11Module : IUnknown
{
extern(Windows):
	HRESULT CreateInstance(const(char)* pNamespace, ID3D11ModuleInstance *ppModuleInstance);
}
extern(Windows) HRESULT D3DLoadModule(const(void)* pSrcData, uint cbSrcDataSize, ID3D11Module *ppModule);

mixin(uuid!(ID3D11ModuleInstance, "469E07F7-045A-48D5-AA12-68A478CDF75D"));
public interface ID3D11ModuleInstance : IUnknown
{
extern(Windows):
	HRESULT BindConstantBuffer(uint uSrcSlot, uint uDstSlot, uint cbDstOffset);
	HRESULT BindConstantBufferByName(const(char)* pName, uint uDstSlot, uint cbDstOffset);
	HRESULT BindResource(uint uSrcSlot, uint uDstSlot, uint uCount);
	HRESULT BindResourceAsUnorderedAccessView(uint uSrcSrvSlot, uint uDstUavSlot, uint uCount);
	HRESULT BindResourceAsUnorderedAccessViewByName(const(char)* pSrvName, uint uDstUavSlot, uint uCount);
	HRESULT BindResourceByName(const(char)* pName, uint uDstSlot, uint uCount);
	HRESULT BindSampler(uint uSrcSlot, uint  uDstSlot, uint uCount);
	HRESULT BindSamplerByName(const(char)* pName, uint uDstSlot, uint uCount);
	HRESULT BindUnorderedAccessView(uint uSrcSlot, uint uDstSlot, uint uCount);
	HRESULT BindUnorderedAccessViewByName(const(char)* pName, uint uDstSlot, uint uCount);
}

mixin(uuid!(ID3D11PixelShader, "ea82e40d-51dc-4f33-93d4-db7c9125ae8c"));
public interface ID3D11PixelShader : ID3D11DeviceChild
{
extern(Windows):
}

mixin(uuid!(ID3D11ShaderReflection, "8d536ca1-0cca-4956-a837-786963755584"));
public interface ID3D11ShaderReflection : IUnknown
{
extern(Windows):
	uint GetBitwiseInstructionCount();
	ID3D11ShaderReflectionConstantBuffer GetConstantBufferByIndex(uint Index);
	ID3D11ShaderReflectionConstantBuffer GetConstantBufferByName(const(char)* Name);
	uint GetConversionInstructionCount();
	HRESULT GetDesc(D3D11_SHADER_DESC *pDesc);
	D3D_PRIMITIVE GetGSInputPrimitive();
	HRESULT GetInputParameterDesc(uint ParameterIndex, D3D11_SIGNATURE_PARAMETER_DESC *pDesc);
	HRESULT GetMinFeatureLevel(D3D_FEATURE_LEVEL *pLevel);
	uint GetMovcInstructionCount();
	uint GetMovInstructionCount();
	uint GetNumInterfaceSlots();
	HRESULT GetOutputParameterDesc(uint ParameterIndex, D3D11_SIGNATURE_PARAMETER_DESC *pDesc);
	HRESULT GetPatchConstantParameterDesc(uint ParameterIndex, D3D11_SIGNATURE_PARAMETER_DESC *pDesc);
	ulong GetRequiresFlags();
	HRESULT GetResourceBindingDesc(uint ResourceIndex, D3D11_SHADER_INPUT_BIND_DESC *pDesc);
	HRESULT GetResourceBindingDescByName(const(char)* Name, D3D11_SHADER_INPUT_BIND_DESC *pDesc);
	uint GetThreadGroupSize(uint *pSizeX, uint *pSizeY, uint *pSizeZ);
	ID3D11ShaderReflectionVariable GetVariableByName(const(char)* *Name);
	BOOL IsSampleFrequencyShader();
}
extern(Windows) HRESULT D3DReflect(const(void)* pSrcData, uint SrcDataSize, IID* pInterface,void **ppReflector);

mixin(uuid!(ID3D11ShaderReflectionConstantBuffer, "EB62D63D-93DD-4318-8AE8-C6F83AD371B8"));
public interface ID3D11ShaderReflectionConstantBuffer
{
extern(Windows):
	HRESULT GetDesc(D3D11_SHADER_BUFFER_DESC *pDesc);
	ID3D11ShaderReflectionVariable GetVariableByIndex(uint Index);
	ID3D11ShaderReflectionVariable GetVariableByName(const(char)* Name);
}

mixin(uuid!(ID3D11ShaderReflectionType, "6E6FFA6A-9BAE-4613-A51E-91652D508C21"));
public interface ID3D11ShaderReflectionType
{
extern(Windows):
	HRESULT GetDesc(D3D11_SHADER_VARIABLE_DESC *pDesc);
	uint GetInterfaceSlot(uint uArrayIndex);
	ID3D11ShaderReflectionType GetType();
}

mixin(uuid!(ID3D11ShaderReflectionVariable, "51F23923-F3E5-4BD1-91CB-606177D8DB4C"));
public interface ID3D11ShaderReflectionVariable
{
extern(Windows):
	HRESULT GetDesc(D3D11_SHADER_BUFFER_DESC *pDesc);
	ID3D11ShaderReflectionVariable GetVariableByIndex(uint Index);
	ID3D11ShaderReflectionVariable GetVariableByName(const(char)* Name);
}

mixin(uuid!(ID3D11VertexShader, "3b301d64-d678-4289-8897-22f8928b72f3"));
public interface ID3D11VertexShader : ID3D11DeviceChild
{
extern(Windows):
}

mixin(uuid!(ID3D11ShaderTrace, "36b013e6-2811-4845-baa7-d623fe0df104"));
public interface ID3D11ShaderTrace : IUnknown
{
extern(Windows):
	HRESULT GetInitialRegisterContents(D3D11_TRACE_REGISTER *pRegister, D3D11_TRACE_VALUE *pValue);
	HRESULT GetReadRegister(uint stepIndex, uint readRegisterIndex, D3D11_TRACE_REGISTER *pRegister, D3D11_TRACE_VALUE *pValue);
	HRESULT GetStep(uint stepIndex, D3D11_TRACE_STEP *pTraceStep);
	HRESULT GetTraceStats(D3D11_TRACE_STATS *pTraceStats);
	HRESULT GetWrittenRegister(uint stepIndex, uint writtenRegisterIndex, D3D11_TRACE_REGISTER *pRegister, D3D11_TRACE_VALUE *pValue);
	HRESULT PSSelectStamp(uint stampIndex);
	void ResetTrace();
	HRESULT TraceReady(ulong *pTestCount);
}

mixin(uuid!(ID3D11ShaderTraceFactory, "1fbad429-66ab-41cc-9617-667ac10e4459"));
public interface ID3D11ShaderTraceFactory : IUnknown
{
extern(Windows):
	HRESULT CreateShaderTrace(IUnknown *pShader, D3D11_SHADER_TRACE_DESC *pTraceDesc, ID3D11ShaderTrace *ppShaderTrace);
}
