module aurora.directx.d2d1.d2d1_0;

version(Windows):

public import aurora.directx.com;
public import aurora.directx.dwrite;
public import aurora.directx.dxgi;
public import aurora.directx.wic;

public: 

//
//	Constants
//

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

enum int D2D1_INTERPOLATION_MODE_DEFINITION_NEAREST_NEIGHBOR = 0;
enum int D2D1_INTERPOLATION_MODE_DEFINITION_LINEAR = 1;
enum int D2D1_INTERPOLATION_MODE_DEFINITION_CUBIC = 2;
enum int D2D1_INTERPOLATION_MODE_DEFINITION_MULTI_SAMPLE_LINEAR = 3;
enum int D2D1_INTERPOLATION_MODE_DEFINITION_ANISOTROPIC = 4;
enum int D2D1_INTERPOLATION_MODE_DEFINITION_HIGH_QUALITY_CUBIC = 5;
enum int D2D1_INTERPOLATION_MODE_DEFINITION_FANT = 6;
enum int D2D1_INTERPOLATION_MODE_DEFINITION_MIPMAP_LINEAR = 7;

//
//	Enumerations
//

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

enum D2D1_BITMAP_INTERPOLATION_MODE
{
    NEAREST_NEIGHBOR = D2D1_INTERPOLATION_MODE_DEFINITION_NEAREST_NEIGHBOR,
    LINEAR = D2D1_INTERPOLATION_MODE_DEFINITION_LINEAR,
    FORCE_DWORD = 0xffffffff
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

public enum D2D1_FEATURE_LEVEL : int { 
	LEVEL_DEFAULT  = 0,
	LEVEL_9        = 0x9100,
	LEVEL_10       = 0xa000
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

public enum D2D1_FACTORY_TYPE : int { 
	SINGLE_THREADED  = 0,
	MULTI_THREADED   = 1
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

//
//	Structures
//
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
		float[4][3] m;
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
		float[4][4] m;
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
		float[5][4] m;
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

//
//	Interfaces
//

mixin(uuid!(ID2D1Bitmap, "a2296057-ea42-4099-983b-539fb6505426"));
public interface ID2D1Bitmap : ID2D1Image
{
extern(Windows):
	HRESULT CopyFromBitmap(const D2D1_POINT_2U *destPoint, ID2D1Bitmap bitmap, const D2D1_RECT_U *srcRect);
	HRESULT CopyFromMemory(const D2D1_RECT_U *dstRect, const void *srcData, uint pitch);
	HRESULT CopyFromRenderTarget(const D2D1_POINT_2U *destPoint, ID2D1RenderTarget renderTarget, const D2D1_RECT_U *srcRect);
	void GetDpi(float *dpiX, float *dpiY);
	D2D1_PIXEL_FORMAT GetPixelFormat();
	D2D1_SIZE_U GetPixelSize();
	D2D1_SIZE_F GetSize();
}

mixin(uuid!(ID2D1BitmapBrush, "2cd906aa-12e2-11dc-9fed-001143a055f9"));
public interface ID2D1BitmapBrush : ID2D1Brush
{
extern(Windows):
	void GetBitmap(ID2D1Bitmap *bitmap);
	D2D1_EXTEND_MODE GetExtendModeX();
	D2D1_EXTEND_MODE GetExtendModeY();
	D2D1_BITMAP_INTERPOLATION_MODE GetInterpolationMode();
	void SetBitmap(ID2D1Bitmap bitmap);
	void SetExtendModeX(D2D1_EXTEND_MODE extendModeX);
	void SetExtendModeY(D2D1_EXTEND_MODE extendModeY);
	void SetInterpolationMode(D2D1_BITMAP_INTERPOLATION_MODE interpolationMode);
}

mixin(uuid!(ID2D1BitmapRenderTarget, "2cd90695-12e2-11dc-9fed-001143a055f9"));
public interface ID2D1BitmapRenderTarget : ID2D1RenderTarget
{
extern(Windows):
	HRESULT GetBitmap(ID2D1Bitmap *bitmap);
}

mixin(uuid!(ID2D1Brush, "2cd906a8-12e2-11dc-9fed-001143a055f9"));
public interface ID2D1Brush : ID2D1Resource
{
extern(Windows):
	float GetOpacity();
	void GetTransform(D2D1_MATRIX_3X2_F *transform);
	void SetOpacity(float opacity);
	void SetTransform(const D2D1_MATRIX_3X2_F *transform);
}

mixin(uuid!(ID2D1DCRenderTarget, "1c51bc64-de61-46fd-9899-63a5d8f03950"));
public interface ID2D1DCRenderTarget : ID2D1RenderTarget
{
extern(Windows):
	HRESULT BindDC(const HDC hDC, const RECT *pSubRect);
}

mixin(uuid!(ID2D1DrawingStateBlock, "28506e39-ebf6-46a1-bb47-fd85565ab957"));
public interface ID2D1DrawingStateBlock : ID2D1Resource
{
extern(Windows):
	void GetDescription(D2D1_DRAWING_STATE_DESCRIPTION *stateDescription);
	void GetTextRenderingParams(IDWriteRenderingParams *textRenderingParams);
	void SetDescription(D2D1_DRAWING_STATE_DESCRIPTION *stateDescription);
	void SetTextRenderingParams(IDWriteRenderingParams textRenderingParams = null);
}

mixin(uuid!(ID2D1EllipseGeometry, "2cd906a4-12e2-11dc-9fed-001143a055f9"));
public interface ID2D1EllipseGeometry : ID2D1Geometry
{
extern(Windows):
	void GetEllipse(D2D1_ELLIPSE *ellipse);
}

mixin(uuid!(ID2D1Factory, "2cd906a4-12e2-11dc-9fed-001143a055f9"));
public interface ID2D1Factory : IUnknown
{
extern(Windows):
	HRESULT CreateDCRenderTarget(const D2D1_RENDER_TARGET_PROPERTIES *renderTargetProperties, ID2D1DCRenderTarget *dcRenderTarget);
	HRESULT CreateDrawingStateBlock(const D2D1_DRAWING_STATE_DESCRIPTION *drawingStateDescription, IDWriteRenderingParams textRenderingParams, ID2D1DrawingStateBlock *drawingStateBlock);
	HRESULT CreateDrawingStateBlock(ID2D1DrawingStateBlock *drawingStateBlock);
	HRESULT CreateDrawingStateBlock(const D2D1_DRAWING_STATE_DESCRIPTION *drawingStateDescription, ID2D1DrawingStateBlock *drawingStateBlock);
	HRESULT CreateDxgiSurfaceRenderTarget(IDXGISurface dxgiSurface, const D2D1_RENDER_TARGET_PROPERTIES *renderTargetProperties, ID2D1RenderTarget *renderTarget);
	HRESULT CreateEllipseGeometry(const D2D1_ELLIPSE *ellipse, ID2D1EllipseGeometry *ellipseGeometry);
	HRESULT CreateGeometryGroup(D2D1_FILL_MODE fillMode, ID2D1Geometry *geometries, uint geometriesCount, ID2D1GeometryGroup *geometryGroup);
	HRESULT CreateHwndRenderTarget(D2D1_RENDER_TARGET_PROPERTIES *renderTargetProperties, D2D1_HWND_RENDER_TARGET_PROPERTIES *hwndRenderTargetProperties, ID2D1HwndRenderTarget *hwndRenderTarget);
	HRESULT CreatePathGeometry(ID2D1PathGeometry *pathGeometry);
	HRESULT CreateRectangleGeometry(const D2D1_RECT_F *rectangle, ID2D1RectangleGeometry *rectangleGeometry);
	HRESULT CreateRoundedRectangleGeometry(const D2D1_ROUNDED_RECT *roundedRectangle, ID2D1RoundedRectangleGeometry *roundedRectangleGeometry);
	HRESULT CreateStrokeStyle(const D2D1_STROKE_STYLE_PROPERTIES *strokeStyleProperties, const(float) *dashes, uint dashesCount, ID2D1StrokeStyle *strokeStyle);
	HRESULT CreateTransformedGeometry(ID2D1Geometry sourceGeometry, const D2D1_MATRIX_3X2_F *transform, ID2D1TransformedGeometry *transformedGeometry);
	HRESULT CreateWicBitmapRenderTarget(IWICBitmap target, const D2D1_RENDER_TARGET_PROPERTIES *renderTargetProperties, ID2D1RenderTarget *renderTarget);
	void GetDesktopDpi(float *dpiX, float *dpiY);
	HRESULT ReloadSystemMetrics();
}

mixin(uuid!(ID2D1GdiInteropRenderTarget, "e0db51c3-6f77-4bae-b3d5-e47509b35838"));
public interface ID2D1GdiInteropRenderTarget : IUnknown
{
extern(Windows):
	HRESULT GetDC(D2D1_DC_INITIALIZE_MODE mode, HDC *hdc);
	HRESULT ReleaseDC(RECT *update);
}

mixin(uuid!(ID2D1Geometry, "2cd906a1-12e2-11dc-9fed-001143a055f9"));
public interface ID2D1Geometry : ID2D1Resource
{
extern(Windows):
	HRESULT CombineWithGeometry(ID2D1Geometry inputGeometry, D2D1_COMBINE_MODE combineMode, D2D1_MATRIX_3X2_F *inputGeometryTransform, ID2D1SimplifiedGeometrySink geometrySink);
	HRESULT CombineWithGeometry(ID2D1Geometry inputGeometry, D2D1_COMBINE_MODE combineMode, const D2D1_MATRIX_3X2_F *inputGeometryTransform, float flatteningTolerance, ID2D1SimplifiedGeometrySink geometrySink);
	HRESULT CompareWithGeometry(ID2D1Geometry inputGeometry, const D2D1_MATRIX_3X2_F *inputGeometryTransform, D2D1_GEOMETRY_RELATION *relation);
	HRESULT CompareWithGeometry(ID2D1Geometry inputGeometry, const D2D1_MATRIX_3X2_F *inputGeometryTransform, float flatteningTolerance, D2D1_GEOMETRY_RELATION *relation);
	HRESULT ComputeArea(const D2D1_MATRIX_3X2_F *worldTransform, float *area);
	HRESULT ComputeArea(const D2D1_MATRIX_3X2_F *worldTransform, float flatteningTolerance, float *area);
	HRESULT ComputeLength(const D2D1_MATRIX_3X2_F *worldTransform, float *length);
	HRESULT ComputeLength(const D2D1_MATRIX_3X2_F *worldTransform, float flatteningTolerance, float *length);
	HRESULT ComputePointAtLength(float length, const D2D1_MATRIX_3X2_F *worldTransform, D2D1_POINT_2F *point, D2D1_POINT_2F *unitTangentVector);
	HRESULT ComputePointAtLength(float length, const D2D1_MATRIX_3X2_F *worldTransform, float flatteningTolerance, D2D1_POINT_2F *point, D2D1_POINT_2F *unitTangentVector);
	HRESULT FillContainsPoint(D2D1_POINT_2F point, const D2D1_MATRIX_3X2_F *worldTransform, BOOL *contains);
	HRESULT FillContainsPoint(D2D1_POINT_2F point, const D2D1_MATRIX_3X2_F *worldTransform, float flatteningTolerance, BOOL *contains);
	HRESULT GetBounds(const D2D1_MATRIX_3X2_F *worldTransform, D2D1_RECT_F *bounds);
	HRESULT GetWidenedBounds(float strokeWidth, ID2D1StrokeStyle strokeStyle, const D2D1_MATRIX_3X2_F *worldTransform, D2D1_RECT_F *bounds);
	HRESULT GetWidenedBounds(float strokeWidth, ID2D1StrokeStyle strokeStyle, const D2D1_MATRIX_3X2_F *worldTransform, float flatteningTolerance, D2D1_RECT_F *bounds);
	HRESULT Outline(const D2D1_MATRIX_3X2_F *worldTransform, ID2D1SimplifiedGeometrySink geometrySink);
	HRESULT Outline(const D2D1_MATRIX_3X2_F *worldTransform, float flatteningTolerance, ID2D1SimplifiedGeometrySink geometrySink);
	HRESULT Simplify(D2D1_GEOMETRY_SIMPLIFICATION_OPTION simplificationOption, const D2D1_MATRIX_3X2_F *worldTransform, ID2D1SimplifiedGeometrySink geometrySink);
	HRESULT Simplify(D2D1_GEOMETRY_SIMPLIFICATION_OPTION simplificationOption, const D2D1_MATRIX_3X2_F *worldTransform, float flatteningTolerance, ID2D1SimplifiedGeometrySink geometrySink);
	HRESULT StrokeContainsPoint(D2D1_POINT_2F point, float strokeWidth, ID2D1StrokeStyle strokeStyle, const D2D1_MATRIX_3X2_F *worldTransform, BOOL *contains);
	HRESULT StrokeContainsPoint(D2D1_POINT_2F point, float strokeWidth, ID2D1StrokeStyle strokeStyle, const D2D1_MATRIX_3X2_F *worldTransform, float flatteningTolerance, BOOL *contains);
	HRESULT Tessellate(const D2D1_MATRIX_3X2_F *worldTransform, ID2D1TessellationSink tessellationSink);
	HRESULT Tessellate(const D2D1_MATRIX_3X2_F *worldTransform, float flatteningTolerance, ID2D1TessellationSink tessellationSink);
	HRESULT Widen(float strokeWidth, ID2D1StrokeStyle strokeStyle, const D2D1_MATRIX_3X2_F *worldTransform, ID2D1SimplifiedGeometrySink geometrySink);
	HRESULT Widen(float strokeWidth, ID2D1StrokeStyle strokeStyle, const D2D1_MATRIX_3X2_F *worldTransform, float flatteningTolerance, ID2D1SimplifiedGeometrySink geometrySink);
}

mixin(uuid!(ID2D1GeometryGroup, "2cd906a6-12e2-11dc-9fed-001143a055f9"));
public interface ID2D1GeometryGroup : ID2D1Geometry
{
extern(Windows):
	void GetSourceGeometries(const ID2D1Geometry *geometries, uint geometriesCount);
	D2D1_FILL_MODE GetFillMode();
	uint GetSourceGeometryCount();
}

mixin(uuid!(ID2D1GeometrySink, "2cd9069f-12e2-11dc-9fed-001143a055f9"));
public interface ID2D1GeometrySink : ID2D1SimplifiedGeometrySink
{
extern(Windows):
	void AddArc(D2D1_ARC_SEGMENT *arc);
	void AddBezier(const D2D1_BEZIER_SEGMENT *bezier);
	void AddLine(D2D1_POINT_2F point);
	void AddQuadraticBezier(const D2D1_QUADRATIC_BEZIER_SEGMENT *bezier);
	void AddQuadraticBeziers(const D2D1_QUADRATIC_BEZIER_SEGMENT *beziers, uint bezierCount);
}

mixin(uuid!(ID2D1GradientStopCollection, "2cd906a7-12e2-11dc-9fed-001143a055f9"));
public interface ID2D1GradientStopCollection : ID2D1Resource
{
extern(Windows):
	D2D1_GAMMA GetColorInterpolationGamma();
	D2D1_EXTEND_MODE GetExtendMode();
	uint GetGradientStopCount();
	void GetGradientStops(D2D1_GRADIENT_STOP *gradientStops, uint gradientStopsCount);
}

mixin(uuid!(ID2D1HwndRenderTarget, "2cd90698-12e2-11dc-9fed-001143a055f9"));
public interface ID2D1HwndRenderTarget : ID2D1RenderTarget
{
extern(Windows):
	D2D1_WINDOW_STATE CheckWindowState();
	HWND GetHwnd();
	HRESULT Resize(D2D1_SIZE_U *pixelSize);
}

mixin(uuid!(ID2D1Image, "65019f75-8da2-497c-b32c-dfa34e48ede6"));
public interface ID2D1Image : ID2D1Resource
{
extern(Windows):
}

mixin(uuid!(ID2D1Layer, "2cd9069b-12e2-11dc-9fed-001143a055f9"));
public interface ID2D1Layer : ID2D1Resource
{
extern(Windows):
	D2D1_SIZE_F GetSize();
}

mixin(uuid!(ID2D1LinearGradientBrush, "2cd906ab-12e2-11dc-9fed-001143a055f9"));
public interface ID2D1LinearGradientBrush : ID2D1Brush
{
extern(Windows):
	D2D1_POINT_2F GetEndPoint();
	void GetGradientStopCollection(ID2D1GradientStopCollection *gradientStopCollection);
	D2D1_POINT_2F GetStartPoint();
	void SetEndPoint(D2D1_POINT_2F endPoint);
	void SetStartPoint(D2D1_POINT_2F startPoint);
}

mixin(uuid!(ID2D1Mesh, "2cd906c2-12e2-11dc-9fed-001143a055f9"));
public interface ID2D1Mesh : ID2D1Resource
{
extern(Windows):
	HRESULT Open(ID2D1TessellationSink *tessellationSink);
}

mixin(uuid!(ID2D1PathGeometry, "2cd906a5-12e2-11dc-9fed-001143a055f9"));
public interface ID2D1PathGeometry : ID2D1Geometry
{
extern(Windows):
	HRESULT GetFigureCount(uint *count);
	HRESULT GetSegmentCount(uint *count);
	HRESULT Open(ID2D1GeometrySink *geometrySink);
	HRESULT Stream(ID2D1GeometrySink geometrySink);
}

mixin(uuid!(ID2D1RadialGradientBrush, "2cd906ac-12e2-11dc-9fed-001143a055f9"));
public interface ID2D1RadialGradientBrush : ID2D1Brush
{
extern(Windows):
	D2D1_POINT_2F GetCenter();
	D2D1_POINT_2F GetGradientOriginOffset();
	void GetGradientStopCollection(ID2D1GradientStopCollection *gradientStopCollection);
	float GetRadiusX();
	float GetRadiusY();
	void SetCenter(D2D1_POINT_2F center);
	void SetGradientOriginOffset(D2D1_POINT_2F gradientOriginOffset);
	void SetRadiusX(float radiusX);
	void SetRadiusY(float radiusY);
}

mixin(uuid!(ID2D1RectangleGeometry, "2cd906a2-12e2-11dc-9fed-001143a055f9"));
public interface ID2D1RectangleGeometry : ID2D1Geometry
{
extern(Windows):
	void GetRect(D2D1_RECT_F *rect);
}

mixin(uuid!(ID2D1RenderTarget, "2cd90694-12e2-11dc-9fed-001143a055f9"));
public interface ID2D1RenderTarget : ID2D1Resource
{
extern(Windows):
	void BeginDraw();
	void Clear(const D2D1_COLOR_F *clearColor = null);
	HRESULT CreateBitmap(D2D1_SIZE_U size, const D2D1_BITMAP_PROPERTIES *bitmapProperties, ID2D1Bitmap *bitmap);
	HRESULT CreateBitmap(D2D1_SIZE_U size, void *srcData, uint pitch, const D2D1_BITMAP_PROPERTIES *bitmapProperties, ID2D1Bitmap *bitmap);
	HRESULT CreateBitmapBrush(ID2D1Bitmap bitmap, D2D1_BITMAP_BRUSH_PROPERTIES *bitmapBrushProperties, D2D1_BRUSH_PROPERTIES *brushProperties, ID2D1BitmapBrush *bitmapBrush);
	HRESULT CreateBitmapBrush(ID2D1Bitmap bitmap, ID2D1BitmapBrush *bitmapBrush);
	HRESULT CreateBitmapBrush(ID2D1Bitmap bitmap, const D2D1_BITMAP_BRUSH_PROPERTIES *bitmapBrushProperties, ID2D1BitmapBrush *bitmapBrush);
	HRESULT CreateBitmapFromWicBitmap(IWICBitmapSource wicBitmapSource, ID2D1Bitmap *bitmap);
	HRESULT CreateBitmapFromWicBitmap(IWICBitmapSource wicBitmapSource, const D2D1_BITMAP_PROPERTIES *bitmapProperties, ID2D1Bitmap *bitmap);
	HRESULT CreateCompatibleRenderTarget(D2D1_SIZE_F desiredSize, D2D1_SIZE_U desiredPixelSize, D2D1_PIXEL_FORMAT desiredFormat, D2D1_COMPATIBLE_RENDER_TARGET_OPTIONS options, ID2D1BitmapRenderTarget *bitmapRenderTarget);
	HRESULT CreateCompatibleRenderTarget(D2D1_SIZE_F *desiredSize, D2D1_SIZE_U *desiredPixelSize, D2D1_PIXEL_FORMAT *desiredFormat, D2D1_COMPATIBLE_RENDER_TARGET_OPTIONS options, ID2D1BitmapRenderTarget *bitmapRenderTarget);
	HRESULT CreateCompatibleRenderTarget(ID2D1BitmapRenderTarget *bitmapRenderTarget);
	HRESULT CreateCompatibleRenderTarget(D2D1_SIZE_F desiredSize, ID2D1BitmapRenderTarget *bitmapRenderTarget);
	HRESULT CreateCompatibleRenderTarget(D2D1_SIZE_F desiredSize, D2D1_SIZE_U desiredPixelSize, ID2D1BitmapRenderTarget *bitmapRenderTarget);
	HRESULT CreateCompatibleRenderTarget(D2D1_SIZE_F desiredSize, D2D1_SIZE_U desiredPixelSize, D2D1_PIXEL_FORMAT desiredFormat, ID2D1BitmapRenderTarget *bitmapRenderTarget);
	HRESULT CreateGradientStopCollection(const D2D1_GRADIENT_STOP *gradientStops, uint gradientStopsCount, D2D1_GAMMA colorInterpolationGamma, D2D1_EXTEND_MODE extendMode, ID2D1GradientStopCollection *gradientStopCollection);
	HRESULT CreateGradientStopCollection(D2D1_GRADIENT_STOP *gradientStops, uint gradientStopsCount, ID2D1GradientStopCollection *gradientStopCollection);
	HRESULT CreateLayer(ID2D1Layer *layer);
	HRESULT CreateLayer(D2D1_SIZE_F size, ID2D1Layer *layer);
	HRESULT CreateLayer(D2D1_SIZE_F *size, ID2D1Layer *layer);
	HRESULT CreateLinearGradientBrush(const D2D1_LINEAR_GRADIENT_BRUSH_PROPERTIES *linearGradientBrushProperties, ID2D1GradientStopCollection gradientStopCollection, ID2D1LinearGradientBrush *linearGradientBrush);
	HRESULT CreateLinearGradientBrush(const D2D1_LINEAR_GRADIENT_BRUSH_PROPERTIES *linearGradientBrushProperties, const D2D1_BRUSH_PROPERTIES *brushProperties, ID2D1GradientStopCollection gradientStopCollection, ID2D1LinearGradientBrush *linearGradientBrush);
	HRESULT CreateMesh(ID2D1Mesh *mesh);
	HRESULT CreateRadialGradientBrush(const D2D1_RADIAL_GRADIENT_BRUSH_PROPERTIES *radialGradientBrushProperties, const D2D1_BRUSH_PROPERTIES *brushProperties, ID2D1GradientStopCollection gradientStopCollection, ID2D1RadialGradientBrush *radialGradientBrush);
	HRESULT CreateRadialGradientBrush(const D2D1_RADIAL_GRADIENT_BRUSH_PROPERTIES *radialGradientBrushProperties, ID2D1GradientStopCollection gradientStopCollection, ID2D1RadialGradientBrush *radialGradientBrush);
	HRESULT CreateSharedBitmap(IID* riid, void *data, D2D1_BITMAP_PROPERTIES *bitmapProperties, ID2D1Bitmap *bitmap);
	HRESULT CreateSolidColorBrush(const D2D1_COLOR_F *color, ID2D1SolidColorBrush *solidColorBrush);
	HRESULT CreateSolidColorBrush(const D2D1_COLOR_F *color, const D2D1_BRUSH_PROPERTIES *brushProperties, ID2D1SolidColorBrush *solidColorBrush);
	void DrawBitmap(ID2D1Bitmap bitmap, const D2D1_RECT_F *destinationRectangle = null, float opacity = 1.0f, D2D1_BITMAP_INTERPOLATION_MODE interpolationMode = D2D1_BITMAP_INTERPOLATION_MODE.LINEAR, const D2D1_RECT_F *sourceRectangle = null);
	void DrawEllipse(const D2D1_ELLIPSE *ellipse, ID2D1Brush brush, float strokeWidth = 1.0f, ID2D1StrokeStyle strokeStyle = null);
	void DrawGeometry(ID2D1Geometry geometry, ID2D1Brush brush, float strokeWidth = 1.0f, ID2D1StrokeStyle strokeStyle = null);
	void DrawGlyphRun(D2D1_POINT_2F baselineOrigin, const DWRITE_GLYPH_RUN *glyphRun, ID2D1Brush foregroundBrush, DWRITE_MEASURING_MODE measuringMode = DWRITE_MEASURING_MODE.NATURAL);
	void DrawLine(D2D1_POINT_2F point0, D2D1_POINT_2F point1, ID2D1Brush brush, float strokeWidth = 1.0f, ID2D1StrokeStyle strokeStyle = null);
	void DrawRectangle(const D2D1_RECT_F *rect, ID2D1Brush brush, float strokeWidth = 1.0f, ID2D1StrokeStyle strokeStyle = null);
	void DrawRoundedRectangle(const D2D1_ROUNDED_RECT *roundedRect, ID2D1Brush brush, float strokeWidth = 1.0f, ID2D1StrokeStyle strokeStyle = null);
	void DrawText(wchar *string, uint stringLength, IDWriteTextFormat textFormat, const D2D1_RECT_F *layoutRect, ID2D1Brush defaultForegroundBrush, D2D1_DRAW_TEXT_OPTIONS options = D2D1_DRAW_TEXT_OPTIONS.NONE, DWRITE_MEASURING_MODE measuringMode = DWRITE_MEASURING_MODE.NATURAL);
	void DrawTextLayout(D2D1_POINT_2F origin, IDWriteTextLayout textLayout, ID2D1Brush defaultForegroundBrush, D2D1_DRAW_TEXT_OPTIONS options = D2D1_DRAW_TEXT_OPTIONS.NONE);
	HRESULT EndDraw(D2D1_TAG *tag1 = null, D2D1_TAG *tag2 = null);
	void FillEllipse(const D2D1_ELLIPSE *ellipse, ID2D1Brush brush);
	void FillGeometry(ID2D1Geometry geometry, ID2D1Brush brush, ID2D1Brush opacityBrush = null);
	void FillMesh(ID2D1Mesh mesh, ID2D1Brush brush);
	void FillOpacityMask(ID2D1Bitmap opacityMask, ID2D1Brush brush, D2D1_OPACITY_MASK_CONTENT content, const D2D1_RECT_F *destinationRectangle = null, const D2D1_RECT_F *sourceRectangle = null);
	void FillRectangle(const D2D1_RECT_F *rect, ID2D1Brush brush);
	void FillRoundedRectangle(const D2D1_ROUNDED_RECT *roundedRect, ID2D1Brush brush);
	HRESULT Flush(D2D1_TAG *tag1 = null, D2D1_TAG *tag2 = null);
	D2D1_ANTIALIAS_MODE GetAntialiasMode();
	void GetDpi(float *dpiX, float *dpiY);
	uint GetMaximumBitmapSize();
	D2D1_PIXEL_FORMAT GetPixelFormat();
	D2D1_SIZE_U GetPixelSize();
	D2D1_SIZE_F GetSize();
	void GetTags(D2D1_TAG *tag1 = null, D2D1_TAG *tag2 = null);
	D2D1_TEXT_ANTIALIAS_MODE GetTextAntialiasMode();
	void GetTextRenderingParams(IDWriteRenderingParams *textRenderingParams);
	void GetTransform(D2D1_MATRIX_3X2_F *transform);
	BOOL IsSupported(const D2D1_RENDER_TARGET_PROPERTIES *renderTargetProperties);
	void PopAxisAlignedClip();
	void PopLayer();
	void PushAxisAlignedClip(const D2D1_RECT_F *clipRect, D2D1_ANTIALIAS_MODE antialiasMode);
	void PushLayer(const D2D1_LAYER_PARAMETERS *layerParameters, ID2D1Layer layer);
	void RestoreDrawingState(ID2D1DrawingStateBlock drawingStateBlock);
	void SaveDrawingState(ID2D1DrawingStateBlock *drawingStateBlock);
	void SetAntialiasMode(D2D1_ANTIALIAS_MODE antialiasMode);
	void SetDpi(float dpiX, float dpiY);
	void SetTags(D2D1_TAG tag1, D2D1_TAG tag2);
	void SetTextAntialiasMode(D2D1_TEXT_ANTIALIAS_MODE textAntialiasMode);
	void SetTextRenderingParams(IDWriteRenderingParams textRenderingParams = null);
	void SetTransform(const D2D1_MATRIX_3X2_F *transform);
}

mixin(uuid!(ID2D1Resource, "2cd90691-12e2-11dc-9fed-001143a055f9"));
public interface ID2D1Resource : IUnknown
{
extern(Windows):
	void GetFactory(ID2D1Factory *factory);
}

mixin(uuid!(ID2D1RoundedRectangleGeometry, "2cd906a3-12e2-11dc-9fed-001143a055f9"));
public interface ID2D1RoundedRectangleGeometry : ID2D1Geometry
{
extern(Windows):
	void GetRoundedRect(D2D1_ROUNDED_RECT *roundedRect);
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

mixin(uuid!(ID2D1SolidColorBrush, "2cd906a9-12e2-11dc-9fed-001143a055f9"));
public interface ID2D1SolidColorBrush : ID2D1Brush
{
extern(Windows):
	D2D1_COLOR_F GetColor();
	void SetColor(const D2D1_COLOR_F *color);
}

mixin(uuid!(ID2D1StrokeStyle, "2cd9069d-12e2-11dc-9fed-001143a055f9"));
public interface ID2D1StrokeStyle : ID2D1Resource
{
extern(Windows):
	D2D1_CAP_STYLE GetDashCap();
	void GetDashes(float *dashes, uint dashesCount);
	uint GetDashesCount();
	float GetDashOffset();
	D2D1_DASH_STYLE GetDashStyle();
	D2D1_CAP_STYLE GetEndCap();
	D2D1_LINE_JOIN GetLineJoin();
	float GetMiterLimit();
	D2D1_CAP_STYLE GetStartCap();
}

mixin(uuid!(ID2D1TessellationSink, "2cd906c1-12e2-11dc-9fed-001143a055f9"));
public interface ID2D1TessellationSink : IUnknown
{
extern(Windows):
	void AddTriangles(const D2D1_TRIANGLE *triangles, uint trianglesCount);
	HRESULT Close();
}

mixin(uuid!(ID2D1TransformedGeometry, "2cd906bb-12e2-11dc-9fed-001143a055f9"));
public interface ID2D1TransformedGeometry : ID2D1Geometry
{
extern(Windows):
	void GetSourceGeometry(ID2D1Geometry *sourceGeometry);
	void GetTransform(D2D1_MATRIX_3X2_F *transform);
}

//
//	Functions
//

extern(Windows)
{
	HRESULT D2D1CreateFactory(D2D1_FACTORY_TYPE factoryType, GUID* riid, void **ppIFactory);
	HRESULT D2D1CreateFactory(D2D1_FACTORY_TYPE factoryType, GUID* riid, const D2D1_FACTORY_OPTIONS *pFactoryOptions, void **ppIFactory);
	BOOL D2D1InvertMatrix(D2D1_MATRIX_3X2_F *matrix);
	BOOL D2D1IsMatrixInvertible(const D2D1_MATRIX_3X2_F *matrix);
	void D2D1MakeRotateMatrix(float angle, D2D1_POINT_2F center, D2D1_MATRIX_3X2_F *matrix);
	void D2D1MakeSkewMatrix(float angleX, float angleY, D2D1_POINT_2F center, D2D1_MATRIX_3X2_F *matrix);
}
