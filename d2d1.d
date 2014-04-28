module aurora.dx11.d2d1;

import aurora.dx11.com;
import aurora.dx11.config;
import aurora.dx11.d3d;
import aurora.dx11.dxgi;

//
//	Constants
//

static if(DX11_0 || DX11_1 || DX11_2)
{
	alias ulong D2D1_TAG;
	enum D2D1_DEFAULT_FLATTENING_TOLERANCE = 0.25f;
	enum D2D1_INVALID_TAG = ulong.max;
	enum D2D1_INVALID_PROPERTY_INDEX = uint.max;
	enum D2D1_APPEND_ALLIGNED_ELEMENT = -1;

	//D2DERR
	enum D2DERR_BAD_NUMBER = 0x88990011;
	enum D2DERR_BITMAP_BOUND_AS_TARGET = 0x88990025L;
	enum D2DERR_BITMAP_CANNOT_DRAW = 0x88990021L;
	enum D2DERR_CYCLIC_GRAPH = 0x88990020L;
	enum D2DERR_DISPLAY_FORMAT_NOT_SUPPORTED = 0x88990009;
	enum D2DERR_DISPLAY_STATE_INVALID = 0x88990006;
	enum D2DERR_EFFECT_IS_NOT_REGISTERED = 0x88990028L;
	enum D2DERR_EXCEEDS_MAX_BITMAP_SIZE = 0x8899001D;
	enum D2DERR_INCOMPATIBLE_BRUSH_TYPES = 0x88990018;
	enum D2DERR_INSUFFICIENT_BUFFER = 0x7A;
	enum D2DERR_INSUFFICIENT_DEVICE_CAPABILITIES = 0x88990026L;
	enum D2DERR_INTERMEDIATE_TOO_LARGE = 0x88990027L;
	enum D2DERR_INTERNAL_ERROR = 0x88990008;
	enum D2DERR_INVALID_CALL = 0x8899000A;
	enum D2DERR_INVALID_GRAPH_CONFIGURATION = 0x8899001EL;
	enum D2DERR_INVALID_INTERNAL_GRAPH_CONFIGURATION = 0x8899001FL;
	enum D2DERR_INVALID_PROPERTY = 0x88990029L;
	enum D2DERR_INVALID_TARGET = 0x88990024L;
	enum D2DERR_LAYER_ALREADY_IN_USE = 0x88990013;
	enum D2DERR_MAX_TEXTURE_SIZE_EXCEEDED = 0x8899000F;
	enum D2DERR_NO_HARDWARE_DEVICE = 0x8899000B;
	enum D2DERR_NO_SUBPROPERTIES = 0x8899002AL;
	enum D2DERR_NOT_INITIALIZED = 0x88990002;
	enum D2DERR_ORIGINAL_TARGET_NOT_BOUND = 0x88990023L;
	enum D2DERR_OUTSTANDING_BITMAP_REFERENCES = 0x88990022L;
	enum D2DERR_POP_CALL_DID_NOT_MATCH_PUSH = 0x88990014;
	enum D2DERR_PRINT_FORMAT_NOT_SUPPORTED = 0x8899002CL;
	enum D2DERR_PRINT_JOB_CLOSED = 0x8899002BL;
	enum D2DERR_PUSH_POP_UNBALANCED = 0x88990016;
	enum D2DERR_RECREATE_TARGET = 0x8899000C;
	enum D2DERR_RENDER_TARGET_HAS_LAYER_OR_CLIPRECT = 0x88990017;
	enum D2DERR_SCANNER_FAILED = 0x88990004;
	enum D2DERR_SCREEN_ACCESS_DENIED = 0x88990005;
	enum D2DERR_SHADER_COMPILE_FAILED = 0x8899000E;
	enum D2DERR_TARGET_NOT_GDI_COMPATIBLE = 0x8899001A;
	enum D2DERR_TEXT_EFFECT_IS_WRONG_TYPE = 0x8899001B;
	enum D2DERR_TEXT_RENDERER_NOT_RELEASED = 0x8899001C;
	enum D2DERR_TOO_MANY_SHADER_ELEMENTS = 0x8899000D;
	enum D2DERR_TOO_MANY_TRANSFORM_INPUTS = 0x8899002DL;
	enum D2DERR_UNSUPPORTED_OPERATION = 0x88990003;
	enum D2DERR_UNSUPPORTED_PIXEL_FORMAT = 0x88982F80;
	enum D2DERR_UNSUPPORTED_VERSION = 0x88990010;
	enum D2DERR_WIN32_ERROR = 0x88990019;
	enum D2DERR_WRONG_FACTORY = 0x88990012;
	enum D2DERR_WRONG_RESOURCE_DOMAIN = 0x88990015;
	enum D2DERR_WRONG_STATE = 0x88990001;
	enum D2DERR_ZERO_VECTOR = 0x88990007;
}
static if(DX11_1 || DX11_2)
{
	alias D2D1_APPEND_ALLIGNED_ELEMENT = -1;
}
static if(DX11_2)
{
}

//
//	Enumerations
//

static if(DX11_0 || DX11_1 || DX11_2)
{
	public enum D2D1_ALPHA_MODE : int { 
		UNKNOWN        = 0,
		PREMULTIPLIED  = 1,
		STRAIGHT       = 2,
		IGNORE         = 3
	} 

	public enum D2D1_ANTIALIAS_MODE : int { 
		PER_PRIMITIVE  = 0,
		ALIASED        = 1
	} 

	public enum D2D1_ARC_SIZE { 
		SMALL  = 0,
		LARGE  = 1
	} 

	public enum D2D1_BITMAP_INTERPOLATION_MODE : int { 
		NEAREST_NEIGHBOR  = 0,
		LINEAR            = 1
	} 

	public enum D2D1_CAP_STYLE : int { 
		FLAT      = 0,
		SQUARE    = 1,
		ROUND     = 2,
		TRIANGLE  = 3
	} 

	public enum D2D1_COMBINE_MODE : int { 
		UNION      = 0,
		INTERSECT  = 1,
		XOR        = 2,
		EXCLUDE    = 3
	} 

	public enum D2D1_COMPATIBLE_RENDER_TARGET_OPTIONS : int { 
		NONE            = 0x00000000,
		GDI_COMPATIBLE  = 0x00000001
	}

	public enum D2D1_DASH_STYLE : int { 
		SOLID         = 0,
		DASH          = 1,
		DOT           = 2,
		DASH_DOT      = 3,
		DASH_DOT_DOT  = 4,
		CUSTOM        = 5
	} 

	public enum D2D1_DC_INITIALIZE_MODE : int { 
		COPY   = 0,
		CLEAR  = 1
	} 

	public enum D2D1_DEBUG_LEVEL : int { 
		NONE         = 0,
		ERROR        = 1,
		WARNING      = 2,
		INFORMATION  = 3
	} 

	public enum D2D1_FIGURE_BEGIN : int { 
		FILLED  = 0,
		HOLLOW  = 1
	}

	public enum D2D1_FIGURE_END : int { 
		OPEN    = 0,
		CLOSED  = 1
	} 

	public enum D2D1_FILL_MODE : int { 
		ALTERNATE  = 0,
		WINDING    = 1
	} 

	public enum D2D1_GAMMA : int { 
		GAMMA_2_2  = 0,
		GAMMA_1_0  = 1
	} 

	public enum D2D1_GEOMETRY_RELATION : int { 
		UNKNOWN       = 0,
		DISJOINT      = 1,
		IS_CONTAINED  = 2,
		CONTAINS      = 3,
		OVERLAP       = 4
	} 

	public enum D2D1_GEOMETRY_SIMPLIFICATION_OPTION : int { 
		CUBICS_AND_LINES  = 0,
		LINES             = 1
	} 

	public enum D2D1_LAYER_OPTIONS : int { 
		NONE                      = 0x00000000,
		INITIALIZE_FOR_CLEARTYPE  = 0x00000001
	} 

	public enum D2D1_LINE_JOIN : int { 
		MITER           = 0,
		BEVEL           = 1,
		ROUND           = 2,
		MITER_OR_BEVEL  = 3
	} 

	public enum D2D1_OPACITY_MASK_CONTENT : int { 
		GRAPHICS             = 0,
		TEXT_NATURAL         = 1,
		TEXT_GDI_COMPATIBLE  = 2
	} 

	public enum D2D1_PATH_SEGMENT : int { 
		NONE                   = 0x00000000,
		FORCE_UNSTROKED        = 0x00000001,
		FORCE_ROUND_LINE_JOIN  = 0x00000002
	} 

	public enum D2D1_PRESENT_OPTIONS : int { 
		NONE             = 0x00000000,
		RETAIN_CONTENTS  = 0x00000001,
		IMMEDIATELY      = 0x00000002
	} 

	public enum D2D1_RENDER_TARGET_TYPE : int { 
		DEFAULT    = 0,
		SOFTWARE   = 1,
		HARDWARE   = 2
	} 

	public enum D2D1_RENDER_TARGET_USAGE : int { 
		NONE                   = 0x00000000,
		FORCE_BITMAP_REMOTING  = 0x00000001,
		GDI_COMPATIBLE         = 0x00000002
	} 

	public enum D2D1_SWEEP_DIRECTION : int { 
		COUNTER_CLOCKWISE  = 0,
		CLOCKWISE          = 1
	} 

	public enum D2D1_TEXT_ANTIALIAS_MODE : int { 
		DEFAULT    = 0,
		CLEARTYPE  = 1,
		GRAYSCALE  = 2,
		ALIASED    = 3
	} 

	public enum D2D1_WINDOW_STATE : int { 
		NONE      = 0x0000000,
		OCCLUDED  = 0x0000001
	} 
}
static if(DX11_1 || DX11_2)
{
	public enum D2D1_BITMAP_OPTIONS : int { 
		NONE            = 0,
		TARGET          = 1,
		CANNOT_DRAW     = 2,
		CPU_READ        = 4,
		GDI_COMPATIBLE  = 8
	} 

	public enum D2D1_BLEND : int { 
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
		INV_BLEND_FACTOR  = 15
	}

	public enum D2D1_BLEND_OPERATION : int { 
		ADD            = 1,
		SUBTRACT       = 2,
		REV_SUBSTRACT  = 3,
		MIN            = 4,
		MAX            = 5
	}

	public enum D2D1_BUFFER_PRECISION : int { 
		PRECISION_UNKNOWN          = 0,
		PRECISION_8BPC_UNORM       = 1,
		PRECISION_8BPC_UNORM_SRGB  = 2,
		PRECISION_16BPC_UNORM      = 3,
		PRECISION_16BPC_FLOAT      = 4,
		PRECISION_32BPC_FLOAT      = 5,
		PRECISION_FORCE_DWORD      = 0xffffffff
	}

	public enum D2D1_CHANGE_TYPE : int { 
		NONE        = 0,
		PROPERTIES  = 1,
		CONTEXT     = 2,
		GRAPH       = 3
	}

	public enum D2D1_CHANNEL_DEPTH : int { 
		DEPTH_DEFAULT  = 0,
		DEPTH_1        = 1,
		DEPTH_4        = 4
	}

	public enum D2D1_COLOR_SPACE : int { 
		CUSTOM  = 0,
		SRGB    = 1,
		SCRGB   = 2,
		FORCE_DWORD  = 0xffffffff
	} 

	public enum D2D1_COLOR_INTERPOLATION_MODE : int { 
		STRAIGHT       = 0,
		PREMULTIPLIED  = 1
	}

	public enum D2D1_COMPOSITE_MODE : int { 
		SOURCE_OVER          = 0,
		DESTINATION_OVER     = 1,
		SOURCE_IN            = 2,
		DESTINATION_IN       = 3,
		SOURCE_OUT           = 4,
		DESTINATION_OUT      = 5,
		SOURCE_ATOP          = 6,
		DESTINATION_ATOP     = 7,
		XOR                  = 8,
		PLUS                 = 9,
		SOURCE_COPY          = 10,
		BOUNDED_SOURCE_COPY  = 11,
		MASK_INVERT          = 12
	} 

	public enum D2D1_DEVICE_CONTEXT_OPTIONS : int { 
		NONE                                = 0,
		ENABLE_MULTITHREADED_OPTIMIZATIONS  = 1
	} 

	public enum D2D1_DRAW_TEXT_OPTIONS : int { 
		NO_SNAP            = 0x00000001,
		CLIP               = 0x00000002,
		NONE               = 0x00000000,
		ENABLE_COLOR_FONT  = 0x00000004
	} 

	public enum D2D1_EXTEND_MODE : int { 
		CLAMP   = 0,
		WRAP    = 1,
		MIRROR  = 2
	} 

	public enum D2D1_FACTORY_TYPE : int { 
		SINGLE_THREADED  = 0,
		MULTI_THREADED   = 1
	} 

	public enum D2D1_FEATURE : int { 
		DOUBLES                   = 0,
		D3D10_X_HARDWARE_OPTIONS  = 1
	}

	public enum D2D1_FEATURE_LEVEL : int { 
		LEVEL_DEFAULT  = 0,
		LEVEL_9        = 0x9100,
		LEVEL_10       = 0xa000
	} 

	public enum D2D1_FILTER : int { 
		MIN_MAG_MIP_POINT                = 0x00,
		MIN_MAG_POINT_MIP_LINEAR         = 0x01,
		MIN_POINT_MAG_LINEAR_MIP_POINT   = 0x04,
		MIN_POINT_MAG_MIP_LINEAR         = 0x05,
		MIN_LINEAR_MAG_MIP_POINT         = 0x10,
		MIN_LINEAR_MAG_POINT_MIP_LINEAR  = 0x11,
		MIN_MAG_LINEAR_MIP_POINT         = 0x14,
		MIN_MAG_MIP_LINEAR               = 0x15,
		ANISOTROPIC                      = 0x55
	}

	public enum D2D1_GAMMA_CONVERSION : int { 
		CONVERSION_NONE        = 0,
		CONVERSION_2_2_TO_1_0  = 1,
		CONVERSION_1_0_TO_2_2  = 2
	} 

	public enum D2D1_INTERPOLATION_MODE : int { 
		NEAREST_NEIGHBOR,
		LINEAR,
		CUBIC,
		MULTI_SAMPLE_LINEAR,
		ANISOTROPIC,
		HIGH_QUALITY_CUBIC
	} 

	public enum D2D1_LAYER_OPTIONS1 : int { 
		NONE                        = 0,
		INITIALIZE_FROM_BACKGROUND  = 1,
		IGNORE_ALPHA                = 2
	}

	public enum D2D1_MAP_OPTIONS : int { 
		READ     = 1,
		WRITE    = 2,
		DISCARD  = 4
	} 

	public enum D2D1_PIXEL_OPTIONS { 
		NONE              = 0,
		TRIVIAL_SAMPLING  = 1
	}

	public enum D2D1_PRIMITIVE_BLEND : int { 
		SOURCE_OVER  = 0,
		COPY         = 1,
		MIN          = 2,
		ADD          = 3
	} 

	public enum D2D1_PRINT_FONT_SUBSET_MODE { 
		DEFAULT   = 0,
		EACHPAGE  = 1,
		NONE      = 2
	}

	public enum D2D1_PROPERTY_TYPE : int { 
		UNKNOWN          = 0,
		STRING           = 1,
		BOOL             = 2,
		UINT32           = 3,
		INT32            = 4,
		FLOAT            = 5,
		VECTOR2          = 6,
		VECTOR3          = 7,
		VECTOR4          = 8,
		BLOB             = 9,
		IUNKNOWN         = 10,
		ENUM             = 11,
		ARRAY            = 12,
		CLSID            = 13,
		MATRIX_3X2       = 14,
		MATRIX_4X3       = 15,
		MATRIX_4X4       = 16,
		MATRIX_5X4       = 17,
		COLOR_CONTEXT    = 17
	} 

	public enum D2D1_PROPERTY : int { 
		CLSID              = 0x80000000,
		DISPLAYNAME        = 0x80000001,
		AUTHOR             = 0x80000002,
		CATEGORY           = 0x80000003,
		DESCRIPTION        = 0x80000004,
		INPUTS             = 0x80000005,
		CACHED             = 0x80000006,
		PRECISION          = 0x80000007,
		MIN_INPUTS         = 0x80000008,
		MAX_INPUTS         = 0x80000009
	} 

	public enum D2D1_RESOURCE_TYPE : int { 
		NONE    = 0,
		SHADER  = 1,
		BUFFER  = 2
	} 

	public enum D2D1_STROKE_TRANSFORM_TYPE : int { 
		NORMAL    = 0,
		FIXED     = 1,
		HAIRLINE  = 2
	} 

	public enum D2D1_SUBPROPERTY : int { 
		DISPLAYNAME       = 0x80000000,
		ISREADONLY        = 0x80000001,
		MIN               = 0x80000002,
		MAX               = 0x80000003,
		DEFAULT           = 0x80000004,
		FIELDS            = 0x80000005,
		INDEX             = 0x80000006
	} 

	public enum D2D1_THREADING_MODE { 
		SINGLE_THREADED  = 0,
		MULTI_THREADED   = 1
	} 

	public enum D2D1_UNIT_MODE : int { 
		DIPS    = 0,
		PIXELS  = 1
	} 

	public enum D2D1_VERTEX_OPTIONS : int { 
		NONE               = 0,
		DO_NOT_CLEAR       = 1,
		USE_DEPTH_BUFFER   = 2,
		ASSUME_NO_OVERLAP  = 4
	}

	public enum D2D1_VERTEX_USAGE : int { 
		STATIC   = 0,
		DYNAMIC  = 1
	}
}
static if(DX11_2)
{
	public enum D2D1_RENDERING_PRIORITY : int { 
		NORMAL  = 0,
		LOW     = 1
	}
}

//
//	Structures
//

static if(DX11_0 || DX11_1 || DX11_2)
{
	alias D3DCOLORVALUE D2D_COLOR_F;
	alias D2D_COLOR_F D2D1_COLOR_F;

	public struct D2D_MATRIX_3X2_F {
		float _11;
		float _12;
		float _21;
		float _22;
		float _31;
		float _32;
	}
	alias D2D_MATRIX_3X2_F D2D1_MATRIX_3X2_F;

	public struct D2D_MATRIX_4X3_F {
		union {
			struct {
				float _11, _12, _13;
				float _21, _22, _23;
				float _31, _32, _33;
				float _41, _42, _43;
			}
			float m[4][3];
		}
	}
	alias D2D_MATRIX_4X3_F D2D1_MATRIX_4X3_F;

	public struct D2D_MATRIX_4X4_F {
		union {
			struct {
				float _11, _12, _13, _14;
				float _21, _22, _23, _24;
				float _31, _32, _33, _34;
				float _41, _42, _43, _44;
			}
			float m[4][4];
		}
	}
	alias D2D_MATRIX_4X4_F D2D1_MATRIX_4X4_F;

	public struct D2D_MATRIX_5X4_F {
		union {
			struct {
				float _11, _12, _13, _14;
				float _21, _22, _23, _24;
				float _31, _32, _33, _34;
				float _41, _42, _43, _44;
				float _51, _52, _53, _54;
			}
			float m[5][4];
		}
	}
	alias D2D_MATRIX_5X4_F D2D1_MATRIX_5X4_F;

	public struct D2D_POINT_2F {
		float x;
		float y;
	}
	alias D2D_POINT_2F D2D1_POINT_2F;

	public struct POINT {
		long x;
		long y;
	} 
	alias POINT D2D_POINT_2L;

	public struct D2D_POINT_2U {
		uint x;
		uint y;
	}
	alias D2D_POINT_2U D2D1_POINT_2U;

	public struct D2D_RECT_F {
		float left;
		float top;
		float right;
		float bottom;
	}
	alias D2D_RECT_F D2D1_RECT_F;

	public struct RECT {
		long left;
		long top;
		long right;
		long bottom;
	} 
	alias RECT D2D_RECT_L;

	public struct D2D_RECT_U {
		uint left;
		uint top;
		uint right;
		uint bottom;
	}
	alias D2D_RECT_U D2D1_RECT_U;

	public struct D2D_SIZE_F {
		float width;
		float height;
	}
	alias D2D_SIZE_F D2D1_SIZE_F;

	public struct D2D_SIZE_U {
		uint width;
		uint height;
	}
	alias D2D_SIZE_U D2D1_SIZE_U;

	public struct D2D_VECTOR_2F {
		float x;
		float y;
	}

	public struct D2D_VECTOR_3F {
		float x;
		float y;
		float z;
	}

	public struct D2D_VECTOR_4F {
		float x;
		float y;
		float z;
		float w;
	}

	public struct D2D1_ARC_SEGMENT {
		D2D1_POINT_2F        point;
		D2D1_SIZE_F          size;
		float                rotationAngle;
		D2D1_SWEEP_DIRECTION sweepDirection;
		D2D1_ARC_SIZE        arcSize;
	}

	public struct D2D1_BEZIER_SEGMENT {
		D2D1_POINT_2F point1;
		D2D1_POINT_2F point2;
		D2D1_POINT_2F point3;
	}

	public struct D2D1_BITMAP_BRUSH_PROPERTIES {
		D2D1_EXTEND_MODE               extendModeX;
		D2D1_EXTEND_MODE               extendModeY;
		D2D1_BITMAP_INTERPOLATION_MODE interpolationMode;
	}

	public struct D2D1_BITMAP_PROPERTIES {
		D2D1_PIXEL_FORMAT pixelFormat;
		float             dpiX;
		float             dpiY;
	}

	public struct D2D1_BRUSH_PROPERTIES {
		float             opacity;
		D2D1_MATRIX_3X2_F transform;
	}

	public struct D2D1_DRAWING_STATE_DESCRIPTION {
		D2D1_ANTIALIAS_MODE      antialiasMode;
		D2D1_TEXT_ANTIALIAS_MODE textAntialiasMode;
		D2D1_TAG                 tag1;
		D2D1_TAG                 tag2;
		D2D1_MATRIX_3X2_F        transform;
	}

	public struct D2D1_ELLIPSE {
		D2D1_POINT_2F point;
		float         radiusX;
		float         radiusY;
	}

	public struct D2D1_FACTORY_OPTIONS {
		D2D1_DEBUG_LEVEL debugLevel;
	}

	public struct D2D1_GRADIENT_STOP {
		FLOAT        position;
		D2D1_COLOR_F color;
	}

	public struct D2D1_HWND_RENDER_TARGET_PROPERTIES {
		HWND                 hwnd;
		D2D1_SIZE_U          pixelSize;
		D2D1_PRESENT_OPTIONS presentOptions;
	}

	public struct D2D1_LAYER_PARAMETERS {
		D2D1_RECT_F         contentBounds;
		ID2D1Geometry       geometricMask;
		D2D1_ANTIALIAS_MODE maskAntialiasMode;
		D2D1_MATRIX_3X2_F   maskTransform;
		FLOAT               opacity;
		ID2D1Brush          opacityBrush;
		D2D1_LAYER_OPTIONS  layerOptions;
	}

	public struct D2D1_LINEAR_GRADIENT_BRUSH_PROPERTIES {
		D2D1_POINT_2F startPoint;
		D2D1_POINT_2F endPoint;
	}

	public struct D2D1_PIXEL_FORMAT {
		DXGI_FORMAT     format;
		D2D1_ALPHA_MODE alphaMode;
	}

	public struct D2D1_QUADRATIC_BEZIER_SEGMENT {
		D2D1_POINT_2F point1;
		D2D1_POINT_2F point2;
	}

	public struct D2D1_RADIAL_GRADIENT_BRUSH_PROPERTIES {
		D2D1_POINT_2F center;
		D2D1_POINT_2F gradientOriginOffset;
		float         radiusX;
		float         radiusY;
	}

	public struct D2D1_RENDER_TARGET_PROPERTIES {
		D2D1_RENDER_TARGET_TYPE  type;
		D2D1_PIXEL_FORMAT        pixelFormat;
		float                    dpiX;
		float                    dpiY;
		D2D1_RENDER_TARGET_USAGE usage;
		D2D1_FEATURE_LEVEL       minLevel;
	}

	public struct D2D1_ROUNDED_RECT {
		D2D1_RECT_F rect;
		float       radiusX;
		float       radiusY;
	}

	public struct D2D1_STROKE_STYLE_PROPERTIES {
		D2D1_CAP_STYLE  startCap;
		D2D1_CAP_STYLE  endCap;
		D2D1_CAP_STYLE  dashCap;
		D2D1_LINE_JOIN  lineJoin;
		float           miterLimit;
		D2D1_DASH_STYLE dashStyle;
		float           dashOffset;
	}

	public struct D2D1_TRIANGLE {
		D2D1_POINT_2F point1;
		D2D1_POINT_2F point2;
		D2D1_POINT_2F point3;
	}
}
static if(DX11_1 || DX11_2)
{
	public struct D2D1_BITMAP_BRUSH_PROPERTIES1 {
		D2D1_EXTEND_MODE        extendModeX;
		D2D1_EXTEND_MODE        extendModeY;
		D2D1_INTERPOLATION_MODE interpolationMode;
	}

	public struct D2D1_BITMAP_PROPERTIES1 {
		D2D1_PIXEL_FORMAT   pixelFormat;
		float               dpiX;
		float               dpiY;
		D2D1_BITMAP_OPTIONS bitmapOptions;
		ID2D1ColorContext   colorContext;
	}

	public struct D2D1_BLEND_DESCRIPTION {
		D2D1_BLEND           sourceBlend;
		D2D1_BLEND           destinationBlend;
		D2D1_BLEND_OPERATION blendOperation;
		D2D1_BLEND           sourceBlendAlpha;
		D2D1_BLEND           destinationBlendAlpha;
		D2D1_BLEND_OPERATION blendOperationAlpha;
		float                blendFactor[4];
	}

	public struct D2D1_CREATION_PROPERTIES {
		D2D1_THREADING_MODE         threadingMode;
		D2D1_DEBUG_LEVEL            debugLevel;
		D2D1_DEVICE_CONTEXT_OPTIONS options;
	}

	public struct D2D1_CUSTOM_VERTEX_BUFFER_PROPERTIES {
		GUID                          vertexShader;
		const D2D1_INPUT_ELEMENT_DESC *inputElements;
		uint                        elementCount;
		uint                        stride;
	}

	public struct D2D1_DRAWING_STATE_DESCRIPTION1 {
		D2D1_ANTIALIAS_MODE      antialiasMode;
		D2D1_TEXT_ANTIALIAS_MODE textAntialiasMode;
		D2D1_TAG                 tag1;
		D2D1_TAG                 tag2;
		D2D1_MATRIX_3X2_F        transform;
		D2D1_PRIMITIVE_BLEND     primitiveBlend;
		D2D1_UNIT_MODE           unitMode;
	}

	public struct D2D1_EFFECT_INPUT_DESCRIPTION {
		ID2D1Effect Effect;
		uint      inputIndex;
		D2D1_RECT_F inputRectangle;
	}

	public struct D2D1_FEATURE_DATA_DOUBLES {
		BOOL doublePrecisionFloatShaderOps;
	}

	public struct D2D1_FEATURE_DATA_D3D10_X_HARDWARE_OPTIONS {
		BOOL computeShaders_Plus_RawAndStructuredBuffers_Via_Shader_4_x;
	}

	public struct D2D1_IMAGE_BRUSH_PROPERTIES {
		D2D1_RECT_F             sourceRectangle;
		D2D1_EXTEND_MODE        extendModeX;
		D2D1_EXTEND_MODE        extendModeY;
		D2D1_INTERPOLATION_MODE interpolationMode;
	}

	public struct D2D1_INPUT_DESCRIPTION {
		D2D1_FILTER filter;
		uint      levelOfDetailCount;
	}

	public struct D2D1_INPUT_ELEMENT_DESC {
		PCSTR       semanticName;
		uint      semanticIndex;
		DXGI_FORMAT format;
		uint      inputSlot;
		uint      alignedByteOffset;
	}

	public struct D2D1_LAYER_PARAMETERS1 {
		D2D1_RECT_F         contentBounds;
		ID2D1Geometry       geometricMask;
		D2D1_ANTIALIAS_MODE maskAntialiasMode;
		D2D1_MATRIX_3X2_F   maskTransform;
		FLOAT               opacity;
		ID2D1Brush          opacityBrush;
		D2D1_LAYER_OPTIONS1 layerOptions;
	}

	public struct D2D1_MAPPED_RECT {
		uint pitch;
		ubyte *bits;
	}

	public struct D2D1_POINT2L {
		long x;
		long y;
	}
	alias D2D1_POINT2L D2D1_POINT_2L;

	public struct D2D1_POINT_DESCRIPTION {
		D2D1_POINT_2F point;
		D2D1_POINT_2F unitTangentVector;
		uint        endSegment;
		uint        endFigure;
		float         lengthToEndSegment;
	}

	public struct D2D1_PRINT_CONTROL_PROPERTIES {
		D2D1_PRINT_FONT_SUBSET_MODE fontSubset;
		float                       rasterDPI;
		D2D1_COLOR_SPACE            colorSpace;
	}

	public struct D2D1_PROPERTY_BINDING {
		PCWSTR                      propertyName;
		PD2D1_PROPERTY_SET_FUNCTION setFunction;
		PD2D1_PROPERTY_GET_FUNCTION getFunction;
	}

	public struct D2D1_RECTL {
		long left;
		long top;
		long right;
		long bottom;
	}
	alias D2D1_RECTL D2D1_RECT_L;

	public struct D2D1_RESOURCE_TEXTURE_PROPERTIES {
		const uint           *extents;
		uint                 dimensions;
		D2D1_BUFFER_PRECISION  bufferPrecision;
		D2D1_CHANNEL_DEPTH     channelDepth;
		D2D1_FILTER            filter;
		const D2D1_EXTEND_MODE *extendModes;
	}

	public struct D2D1_RESOURCE_USAGE {
		size_t workingTextureAreaMemory;
		size_t cachingTextureAreaMemory;
		size_t shaderCacheMemory;
	}

	public struct D2D1_RENDERING_CONTROLS {
		D2D1_BUFFER_PRECISION bufferPrecision;
		uint                tileSize;
	}

	public struct D2D1_STROKE_STYLE_PROPERTIES1 {
		D2D1_CAP_STYLE             startCap;
		D2D1_CAP_STYLE             endCap;
		D2D1_CAP_STYLE             dashCap;
		D2D1_LINE_JOIN             lineJoin;
		float                      miterLimit;
		D2D1_DASH_STYLE            dashStyle;
		float                      dashOffset;
		D2D1_STROKE_TRANSFORM_TYPE transformType;
	}

	public struct D2D1_VECTOR_2F {
		float x;
		float y;
	}

	public struct D2D1_VECTOR_3F {
		float x;
		float y;
		float z;
	}

	public struct D2D1_VECTOR_4F {
		float x;
		float y;
		float z;
		float w;
	}

	public struct D2D1_VERTEX_BUFFER_PROPERTIES {
		uint            inputCount;
		D2D1_VERTEX_USAGE usage;
		const ubyte        *data;
		uint            byteWidth;
	}

	public struct D2D1_VERTEX_RANGE {
		uint startVertex;
		uint vertexCount;
	}

	public struct PD2D1_EFFECT_FACTORY {
		IUnknown *effectImplementation;
	}
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
	extern(Windows)
	{
		HRESULT D2D1CreateFactory(D2D1_FACTORY_TYPE factoryType, GUID* riid, void **ppIFactory);
		HRESULT D2D1CreateFactory(D2D1_FACTORY_TYPE factoryType, GUID* riid, const D2D1_FACTORY_OPTIONS *pFactoryOptions, void **ppIFactory);
		BOOL D2D1InvertMatrix(D2D1_MATRIX_3X2_F *matrix);
		BOOL D2D1IsMatrixInvertible(const D2D1_MATRIX_3X2_F *matrix);
		void D2D1MakeRotateMatrix(float angle, D2D1_POINT_2F center, D2D1_MATRIX_3X2_F *matrix);
		void D2D1MakeSkewMatrix(float angleX, float angleY, D2D1_POINT_2F center, D2D1_MATRIX_3X2_F *matrix);
	}
}
static if(DX11_1 || DX11_2)
{
	extern(Windows)
	{
		float D2D1ComputeMaximumScaleFactor(const D2D1_MATRIX_3X2_F *matrix);
		HRESULT D2D1CreateDevice(IDXGIDevice dxgiDevice, const D2D1_CREATION_PROPERTIES *creationProperties, ID2D1Device *d2dDevice);
		HRESULT D2D1CreateDeviceContext(IDXGISurface dxgiSurface, const D2D1_CREATION_PROPERTIES *creationProperties, ID2D1DeviceContext *d2dDeviceContext);
		D2D1_PROPERTY_TYPE GetType(uint index);
		HRESULT StringGetter(const IUnknown effect, ubyte *data, uint dataSize, uint *actualSize);
		HRESULT StringSetter(IUnknown effect, ubyte *data, uint dataSize);
		HRESULT ValueGetter(const IUnknown *effect, ubyte *data, uint dataSize, uint *actualSize);
		HRESULT ValueSetter(IUnknown effect, const ubyte *data, uint dataSize);
		D2D1_COLOR_F D2D1ConvertColorSpace(D2D1_COLOR_SPACE sourceColorSpace, D2D1_COLOR_SPACE destinationColorSpace, const D2D1_COLOR_F *color);
		void D2D1SinCos(float angle, float *s, float *c);
		float D2D1Tan(float angle);
		float D2D1Vec3Length(float x, float y, float z);
	}
}
static if(DX11_2)
{
}

mixin(uuid!(ID2D1SimplifiedGeometrySink, "2cd9069e-12e2-11dc-9fed-001143a055f9"));
public interface ID2D1SimplifiedGeometrySink : IUnknown
{
extern(Windows):
	void AddBeziers(const D2D1_BEZIER_SEGMENT* Beziers, uint Count);
	void AddLines(const D2D_POINT_2F* Points, uint Count);
	void BeginFigure(D2D1_POINT_2F StartPoint, D2D1_FIGURE_BEGIN FigureBegin);
	HRESULT Close();
	void EndFigure(D2D1_FIGURE_END FigureEnd);
	void SetFillMode(D2D1_FILL_MODE FillMode);
	void SetSegmentFlags(D2D1_PATH_SEGMENT VertexFlags);
}