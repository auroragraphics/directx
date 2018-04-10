module aurora.directx.d2d1;

import aurora.directx.com;
import aurora.directx.d3d11;
import aurora.directx.dwrite;
import aurora.directx.dxgi;
import aurora.directx.wic;

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

struct D3DCOLORVALUE {
	float r;
	float g;
	float b;
	float a;
}	
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

//
//	Enumerations
//

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

public enum D2D1_FEATURE : int { 
	DOUBLES                   = 0,
	D3D10_X_HARDWARE_OPTIONS  = 1
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

//
//	Structures
//

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
	float[4]             blendFactor;
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

//
//	Interfaces
//

mixin(uuid!(ID2D1AnalysisTransform, "0359dc30-95e6-4568-9055-27720d130e93"));
public interface ID2D1AnalysisTransform : IUnknown
{
extern(Windows):
	HRESULT ProcessAnalysisResults(const(ubyte) *analysisData, uint analysisDataCount);
}

mixin(uuid!(ID2D1Bitmap1, "a898a84c-3873-4588-b08b-ebbf978df041"));
public interface ID2D1Bitmap1 : ID2D1Bitmap
{
extern(Windows):
	void GetColorContext(ID2D1ColorContext *colorContext);
	D2D1_BITMAP_OPTIONS GetOptions();
	void GetSourceStream(IStream *Stream);
	HRESULT GetSurface(IDXGISurface *dxgiSurface);
	HRESULT Map(D2D1_MAP_OPTIONS Options, D2D1_MAPPED_RECT *mappedRect);
	HRESULT Unmap();
}

mixin(uuid!(ID2D1BitmapBrush1, "41343a53-e41a-49a2-91cd-21793bbb62e5"));
public interface ID2D1BitmapBrush1 : ID2D1BitmapBrush
{
extern(Windows):
	D2D1_INTERPOLATION_MODE GetInterpolationMode1();
	void SetInterpolationMode1(D2D1_INTERPOLATION_MODE interpolationMode);
}

mixin(uuid!(ID2D1BlendTransform, "63ac0b32-ba44-450f-8806-7f4ca1ff2f1b"));
public interface ID2D1BlendTransform : ID2D1ConcreteTransform
{
extern(Windows):
	void GetDescription(D2D1_BLEND_DESCRIPTION *description);
	void SetDescription(const D2D1_BLEND_DESCRIPTION *description);
}

mixin(uuid!(ID2D1BorderTransform, "63ac0b32-ba44-450f-8806-7f4ca1ff2f1b"));
public interface ID2D1BorderTransform : ID2D1ConcreteTransform
{
extern(Windows):
	D2D1_EXTEND_MODE GetExtendModeX();
	D2D1_EXTEND_MODE GetExtendModeY();
	void SetExtendModeX(D2D1_EXTEND_MODE extendMode);
	void SetExtendModeY(D2D1_EXTEND_MODE extendMode);
}

mixin(uuid!(ID2D1BoundsAdjustmentTransform, "90f732e2-5092-4606-a819-8651970baccd"));
public interface ID2D1BoundsAdjustmentTransform : ID2D1TransformNode
{
extern(Windows):
	void GetOutputBounds(D2D1_RECT_L *outputBounds);
	void SetOutputBounds(const D2D1_RECT_L *outputBounds);
}

mixin(uuid!(ID2D1ColorContext, "1c4820bb-5771-4518-a581-2fe4dd0ec657"));
public interface ID2D1ColorContext : ID2D1Resource
{
extern(Windows):
	D2D1_COLOR_SPACE GetSpace();
	uint GetProfileSize();
	HRESULT GetProfile(ubyte *profile, uint profileSize);
}

mixin(uuid!(ID2D1CommandList, "b4f34a19-2383-4d76-94f6-ec343657c3dc"));
public interface ID2D1CommandList : ID2D1Image
{
extern(Windows):
	HRESULT Close();
	HRESULT Stream(ID2D1CommandSink Sink);
}

mixin(uuid!(ID2D1CommandSink, "54d7898a-a061-40a7-bec7-e465bcba2c4f"));
public interface ID2D1CommandSink : IUnknown
{
extern(Windows):
	HRESULT BeginDraw();
	HRESULT Clear(const D2D1_COLOR_F *clearColor);
	void DrawBitmap(ID2D1Bitmap bitmap, D2D1_RECT_F destinationRectangle, float opacity, D2D1_INTERPOLATION_MODE interpolationMode, const D2D1_RECT_F sourceRectangle, const D2D1_MATRIX_4X4_F perspectiveTransform);
	void DrawGdiMetafile(ID2D1GdiMetafile gdiMetafile, const D2D1_POINT_2F *targetOffset);
	HRESULT DrawGeometry(ID2D1Geometry geometry, ID2D1Brush brush, float strokeWidth, ID2D1StrokeStyle strokeStyle);
	HRESULT DrawGlyphRun(D2D1_POINT_2F baselineOrigin, const DWRITE_GLYPH_RUN *glyphRun, const DWRITE_GLYPH_RUN_DESCRIPTION *glyphRunDescription, ID2D1Brush *foregroundBrush, DWRITE_MEASURING_MODE measuringMode);
	HRESULT DrawImage(ID2D1Image image, const D2D1_POINT_2F *targetOffset, const D2D1_RECT_F *imageRectangle, D2D1_INTERPOLATION_MODE interpolationMode, D2D1_COMPOSITE_MODE compositeMode);
	HRESULT DrawLine(D2D1_POINT_2F Point0, D2D1_POINT_2F Point1, ID2D1Brush Brush, float strokeWidth, ID2D1StrokeStyle strokeStyle);
	HRESULT DrawRectangle(const D2D1_RECT_F *Rect, ID2D1Brush Brush, float strokeWidth, ID2D1StrokeStyle strokeStyle);
	HRESULT EndDraw();
	HRESULT FillGeometry(ID2D1Geometry geometry, ID2D1Brush brush, ID2D1Brush opacityBrush);
	HRESULT FillMesh(ID2D1Mesh mesh, ID2D1Brush brush);
	HRESULT FillOpacityMask(ID2D1Bitmap opacityMask, ID2D1Brush brush, const D2D1_RECT_F *destinationRectangle, const D2D1_RECT_F *sourceRectangle);
	HRESULT FillRectangle(const D2D1_RECT_F *rect, ID2D1Brush brush);
	HRESULT PopAxisAlignedClip();
	HRESULT PopLayer();
	HRESULT PushAxisAlignedClip(const D2D1_RECT_F *clipRect, D2D1_ANTIALIAS_MODE antialiasMode);
	HRESULT PushLayer(const D2D1_LAYER_PARAMETERS1 *layerParameters, ID2D1Layer layer);
	HRESULT SetAntialiasMode(D2D1_ANTIALIAS_MODE antialiasMode);
	HRESULT SetPrimitiveBlend(D2D1_PRIMITIVE_BLEND primitiveBlend);
	HRESULT SetTags(D2D1_TAG tag1, D2D1_TAG tag2);
	HRESULT SetTextAntialiasMode(D2D1_TEXT_ANTIALIAS_MODE textAntialiasMode);
	HRESULT SetTextRenderingParams(IDWriteRenderingParams textRenderingParams);
	HRESULT SetTransform(const D2D1_MATRIX_3X2_F *transform);
	HRESULT SetUnitMode(D2D1_UNIT_MODE unitMode);
}

mixin(uuid!(ID2D1ComputeInfo, "5598b14b-9fd7-48b7-9bdb-8f0964eb38bc"));
public interface ID2D1ComputeInfo : ID2D1RenderInfo
{
extern(Windows):
	HRESULT SetComputeShader(GUID* shaderId);
	HRESULT SetComputeShaderConstantBuffer(const ubyte *buffer, uint bufferCount);
	HRESULT SetResourceTexture(uint textureIndex, ID2D1ResourceTexture resourceTexture);
}

mixin(uuid!(ID2D1ComputeTransform, "0d85573c-01e3-4f7d-bfd9-0d60608bf3c3"));
public interface ID2D1ComputeTransform : ID2D1Transform
{
extern(Windows):
	HRESULT CalculateThreadgroups(const D2D1_RECT_L *outputRect, uint *dimensionX, uint *dimensionY, uint *dimensionZ);
	HRESULT SetComputeInfo(ID2D1ComputeInfo computeInfo);
}

mixin(uuid!(ID2D1ConcreteTransform, "1a799d8a-69f7-4e4c-9fed-437ccc6684cc"));
public interface ID2D1ConcreteTransform : ID2D1TransformNode
{
extern(Windows):
	void SetCached(BOOL isCached);
	HRESULT SetOutputBuffer(D2D1_BUFFER_PRECISION bufferPrecision, D2D1_CHANNEL_DEPTH channelDepth);
}

mixin(uuid!(ID2D1Device, "47dd575d-ac05-4cdd-8049-9b02cd16f44c"));
public interface ID2D1Device : ID2D1Resource
{
extern(Windows):
	HRESULT ClearResources(uint millisecondsSinceUse = 0);
	HRESULT CreateDeviceContext(D2D1_DEVICE_CONTEXT_OPTIONS options, const ID2D1DeviceContext *deviceContext);
	HRESULT CreatePrintControl(IWICImagingFactory wicFactory, IPrintDocumentPackageTarget documentTarget, const D2D1_PRINT_CONTROL_PROPERTIES *printControlProperties, ID2D1PrintControl *printControl);
	ulong GetMaximumTextureMemory();
	void SetMaximumTextureMemory(ulong maximumInBytes);
}

mixin(uuid!(ID2D1DeviceContext, "e8f7fe7a-191c-466d-ad95-975678bda998"));
public interface ID2D1DeviceContext : ID2D1RenderTarget
{
extern(Windows):
	HRESULT CreateBitmap(D2D1_SIZE_U size, const void *srcData, uint pitch, const D2D1_BITMAP_PROPERTIES1 *bitmapProperties, ID2D1Bitmap1 *bitmap);
	HRESULT CreateBitmap(D2D1_SIZE_U size, const void *srcData, uint pitch, const D2D1_BITMAP_PROPERTIES1 *bitmapProperties, ID2D1Bitmap1 *bitmap);
	HRESULT CreateBitmapBrush(ID2D1Bitmap bitmap, D2D1_BITMAP_BRUSH_PROPERTIES1 bitmapBrushProperties, D2D1_BRUSH_PROPERTIES  brushProperties, ID2D1BitmapBrush1 *bitmapBrush);
	HRESULT CreateBitmapBrush(ID2D1Bitmap bitmap, D2D1_BITMAP_BRUSH_PROPERTIES1 *bitmapBrushProperties, D2D1_BRUSH_PROPERTIES  *brushProperties, ID2D1BitmapBrush1 *bitmapBrush);
	HRESULT CreateBitmapBrush(ID2D1Bitmap bitmap, ID2D1BitmapBrush1 *bitmapBrush);
	HRESULT CreateBitmapBrush(ID2D1Bitmap bitmap, D2D1_BITMAP_BRUSH_PROPERTIES1 *bitmapBrushProperties, ID2D1BitmapBrush1 *bitmapBrush);
	HRESULT CreateBitmapFromDxgiSurface(IDXGISurface surface, const D2D1_BITMAP_PROPERTIES1 bitmapProperties, ID2D1Bitmap1 *bitmap);
	HRESULT CreateBitmapFromDxgiSurface(IDXGISurface surface, const D2D1_BITMAP_PROPERTIES1 *bitmapProperties, ID2D1Bitmap1 *bitmap);
	HRESULT CreateBitmapFromWicBitmap(IWICBitmapSource wicBitmapSource, const D2D1_BITMAP_PROPERTIES1 *bitmapProperties, ID2D1Bitmap1 *bitmap);
	HRESULT CreateColorContext(D2D1_COLOR_SPACE space, const BYTE *Profile, uint profileSize, ID2D1ColorContext *colorContext);
	HRESULT CreateColorContextFromFilename(PCWSTR Filename, ID2D1ColorContext *colorContext);
	HRESULT CreateColorContextFromWicColorContext(IWICColorContext wicColorContext, ID2D1ColorContext *colorContext);
	HRESULT CreateCommandList(ID2D1CommandList *commandList);
	HRESULT CreateEffect(CLSID* effectId, ID2D1Effect *effect);
	HRESULT CreateGradientStopCollection(const D2D1_GRADIENT_STOP *gradientStops, uint gradientStopsCount, D2D1_COLOR_SPACE preInterpolationSpace, D2D1_COLOR_SPACE postInterpolationSpace, D2D1_BUFFER_PRECISION bufferPrecision, D2D1_EXTEND_MODE extendMode, D2D1_COLOR_INTERPOLATION_MODE colorInterpolationMode, ID2D1GradientStopCollection1 *gradientStopCollection);
	HRESULT CreateImageBrush(ID2D1Image image, const D2D1_IMAGE_BRUSH_PROPERTIES *imageBrushProperties, const D2D1_BRUSH_PROPERTIES *brushProperties, ID2D1ImageBrush *imageBrush);
	HRESULT CreateImageBrush(ID2D1Image image, const D2D1_IMAGE_BRUSH_PROPERTIES *imageBrushProperties, ID2D1ImageBrush *imageBrush);
	void DrawGdiMetafile(ID2D1GdiMetafile gdiMetafile, const D2D1_POINT_2F targetOffset);
	void DrawGdiMetafile(ID2D1GdiMetafile gdiMetafile, const D2D1_POINT_2F *targetOffset);
	void DrawGlyphRun(D2D1_POINT_2F baselineOrigin, const DWRITE_GLYPH_RUN *glyphRun, const DWRITE_GLYPH_RUN_DESCRIPTION *glyphRunDescription, ID2D1Brush *foregroundBrush, DWRITE_MEASURING_MODE measuringMode);
	void DrawImage(ID2D1Image image, const D2D1_POINT_2F *targetOffset, const D2D1_RECT_F *imageRectangle, D2D1_INTERPOLATION_MODE interpolationMode, D2D1_COMPOSITE_MODE compositeMode);
	void DrawImage(ID2D1Effect effect, const D2D1_POINT_2F *targetOffset, const D2D1_RECT_F *imageRectangle, D2D1_INTERPOLATION_MODE interpolationMode, D2D1_COMPOSITE_MODE compositeMode);
	void DrawImage(ID2D1Image image, D2D1_INTERPOLATION_MODE interpolationMode, D2D1_COMPOSITE_MODE compositeMode);
	void DrawImage(ID2D1Effect effect, D2D1_INTERPOLATION_MODE interpolationMode, D2D1_COMPOSITE_MODE compositeMode);
	void DrawImage(ID2D1Image image, const D2D1_POINT_2F *targetOffset, D2D1_INTERPOLATION_MODE interpolationMode, D2D1_COMPOSITE_MODE compositeMode);
	void DrawImage(ID2D1Effect effect, const D2D1_POINT_2F *targetOffset, D2D1_INTERPOLATION_MODE interpolationMode, D2D1_COMPOSITE_MODE compositeMode);
	void FillOpacityMask(ID2D1Bitmap opacityMask, ID2D1Brush brush, const D2D1_RECT_F *destinationRectangle, const D2D1_RECT_F *sourceRectangle);
	void GetDevice(ID2D1Device *device);
	HRESULT GetEffectInvalidRectangleCount(ID2D1Effect effect, uint *rectangleCount);
	HRESULT GetEffectInvalidRectangles(ID2D1Effect effect, D2D1_RECT_F *, uint rectanglesCount);
	HRESULT GetEffectRequiredInputRectangles(ID2D1Effect renderEffect, const D2D1_RECT_F *renderImageRectangle, const D2D1_EFFECT_INPUT_DESCRIPTION *inputDescriptions, D2D1_RECT_F *requiredInputRects, uint inputCount);
	HRESULT GetGlyphRunWorldBounds(D2D1_POINT_2F baselineOrigin, const DWRITE_GLYPH_RUN *glyphRun, DWRITE_MEASURING_MODE measuringMode, D2D1_RECT_F **bounds);
	void GetImageLocalBounds(ID2D1Image image, D2D1_RECT_F[1] localBounds);
	HRESULT GetImageWorldBounds(ID2D1Image image, D2D1_RECT_F[1] worldBounds);
	D2D1_PRIMITIVE_BLEND GetPrimitiveBlend();
	void GetRenderingControls(D2D1_RENDERING_CONTROLS *renderingControls);
	void GetTarget(ID2D1Image *target);
	D2D1_UNIT_MODE GetUnitMode();
	HRESULT InvalidateEffectInputRectangle(ID2D1Effect effect, uint input, const D2D1_RECT_F *inputRectangle);
	BOOL IsBufferPrecisionSupported(D2D1_BUFFER_PRECISION bufferPrecision);
	BOOL IsDxgiFormatSupported(DXGI_FORMAT format);
	void PushLayer(const D2D1_LAYER_PARAMETERS1 *layerParameters, ID2D1Layer layer);
	void SetPrimitiveBlend(D2D1_PRIMITIVE_BLEND primitiveBlend);
	void SetRenderingControls(const D2D1_RENDERING_CONTROLS *renderingControls);
	void SetTarget(ID2D1Image target);
	void SetUnitMode(D2D1_UNIT_MODE unitMode);
}

mixin(uuid!(ID2D1DrawInfo, "693ce632-7f2f-45de-93fe-18d88b37aa21"));
public interface ID2D1DrawInfo : ID2D1RenderInfo
{
extern(Windows):
	HRESULT SetPixelShader(GUID* shaderId, D2D1_PIXEL_OPTIONS pixelOptions = D2D1_PIXEL_OPTIONS.NONE);
	HRESULT SetPixelShaderConstantBuffer(const(ubyte) *buffer, uint bufferCount);
	HRESULT SetResourceTexture(uint textureIndex, ID2D1ResourceTexture resourceTexture);
	HRESULT SetVertexProcessing(ID2D1VertexBuffer vertexBuffer, D2D1_VERTEX_OPTIONS vertexOptions, const D2D1_BLEND_DESCRIPTION *blendDescription = null, const D2D1_VERTEX_RANGE *vertexRange = null, GUID *vertexShader = null);
	HRESULT SetVertexShaderConstantBuffer(const(BYTE) *buffer, uint bufferCount);
}

mixin(uuid!(ID2D1DrawingStateBlock1, "689f1f85-c72e-4e33-8f19-85754efd5ace"));
public interface ID2D1DrawingStateBlock1 : ID2D1DrawingStateBlock
{
extern(Windows):
	void GetDescription1(D2D1_DRAWING_STATE_DESCRIPTION1 *stateDescription);
	void SetDescription1(const D2D1_DRAWING_STATE_DESCRIPTION1 stateDescription1);
}

mixin(uuid!(ID2D1DrawTransform, "36bfdcb6-9739-435d-a30d-a653beff6a6f"));
public interface ID2D1DrawTransform : ID2D1Transform
{
extern(Windows):
	HRESULT SetDrawInfo(ID2D1DrawInfo drawInfo);
}

mixin(uuid!(ID2D1Effect, "28211a43-7d89-476f-8181-2d6159b220ad"));
public interface ID2D1Effect : ID2D1Properties
{
extern(Windows):
	void GetInput(uint Index, ID2D1Image *Input);
	uint GetInputCount();
	void GetOutput(ID2D1Image *outputImage);
	void SetInput(uint index, ID2D1Image input, BOOL invalidate = TRUE);
	HRESULT SetInputCount(uint inputCount);
	void SetInputEffect(uint index, ID2D1Effect input, BOOL invalidate = TRUE);
}

mixin(uuid!(ID2D1EffectContext, "3d9f916b-27dc-4ad7-b4f1-64945340f563"));
public interface ID2D1EffectContext : IUnknown
{
extern(Windows):
	HRESULT CheckFeatureSupport(D2D1_FEATURE feature, void *featureSupportData, uint featureSupportDataSize);
	HRESULT CreateBlendTransform(uint numInputs, const D2D1_BLEND_DESCRIPTION  *blendDescription, ID2D1BlendTransform *blendTransform);
	HRESULT CreateBorderTransform(D2D1_EXTEND_MODE extendModeX, D2D1_EXTEND_MODE extendModeY, ID2D1BorderTransform *transform);
	HRESULT CreateBoundsAdjustmentTransform(const D2D1_RECT_L *outputRectangle, ID2D1BoundsAdjustmentTransform *transform);
	HRESULT CreateColorContext(D2D1_COLOR_SPACE space, const(ubyte) *profile, uint profileSize, ID2D1ColorContext *colorContext);
	HRESULT CreateColorContextFromFilename(PCWSTR filename, ID2D1ColorContext *colorContext);
	HRESULT CreateColorContextFromWicColorContext(IWICColorContext *wicColorContext, ID2D1ColorContext *colorContext);
	HRESULT CreateEffect(CLSID* effectId, ID2D1Effect *effect);
	HRESULT CreateOffsetTransform(D2D1_POINT_2L offset, ID2D1OffsetTransform *transform);
	HRESULT CreateResourceTexture(const (GUID*) resourceId, const D2D1_RESOURCE_TEXTURE_PROPERTIES *resourceTextureProperties, const (ubyte) *data, const (uint) *strides, uint dataSize, ID2D1ResourceTexture **resourceTexture);
	HRESULT CreateTransformNodeFromEffect(ID2D1Effect effect, ID2D1TransformNode *transformNode);
	HRESULT CreateVertexBuffer(const D2D1_VERTEX_BUFFER_PROPERTIES *vertexBufferProperties, const GUID *resourceId, const D2D1_CUSTOM_VERTEX_BUFFER_PROPERTIES *customVertexBufferProperties, ID2D1VertexBuffer *buffer);
	HRESULT FindResourceTexture(const GUID *resourceId, ID2D1ResourceTexture *resourceTexture);
	HRESULT FindVertexBuffer(const GUID *resourceId, ID2D1VertexBuffer *vertexBuffer);
	void GetDpi(float *dpiX, float *dpiY);
	HRESULT GetMaximumSupportedFeatureLevel(const D3D_FEATURE_LEVEL *featureLevels, uint featureLevelsCount, D3D_FEATURE_LEVEL *maximumSupportedFeatureLevel);
	BOOL IsBufferPrecisionSupported(D2D1_BUFFER_PRECISION bufferPrecision);
	BOOL IsShaderLoaded(GUID* shaderId);
	HRESULT LoadComputeShader(GUID* resourceId, ubyte *shaderBuffer, uint shaderBufferCount);
	HRESULT LoadPixelShader(GUID* shaderId, const(ubyte) *shaderBuffer, uint shaderBufferCount);
	HRESULT LoadVertexShader(GUID* resourceId, ubyte *shaderBuffer, uint shaderBufferCount);
}

mixin(uuid!(ID2D1EffectImpl, "a248fd3f-3e6c-4e63-9f03-7f68ecc91db9"));
public interface ID2D1EffectImpl : IUnknown
{
extern(Windows):
	HRESULT Initialize(ID2D1EffectContext effectContext, ID2D1TransformGraph transformGraph);
	HRESULT PrepareForRender(D2D1_CHANGE_TYPE changeType);
	HRESULT SetGraph(ID2D1TransformGraph transformGraph);
}

mixin(uuid!(ID2D1Factory1, "bb12d362-daee-4b9a-aa1d-14ba401cfa1f"));
public interface ID2D1Factory1 : ID2D1Factory
{
extern(Windows):
	HRESULT CreateDevice(IDXGIDevice dxgiDevice, ID2D1Device *d2dDevice);
	HRESULT CreateDrawingStateBlock(const D2D1_DRAWING_STATE_DESCRIPTION1 *drawingStateDescription, IDWriteRenderingParams textRenderingParams, ID2D1DrawingStateBlock1 *drawingStateBlock);
	HRESULT CreateDrawingStateBlock(ID2D1DrawingStateBlock1 *drawingStateBlock);
	HRESULT CreateDrawingStateBlock(const D2D1_DRAWING_STATE_DESCRIPTION1 *drawingStateDescription, ID2D1DrawingStateBlock1 *drawingStateBlock);
	HRESULT CreateGdiMetafile(IStream *metafileStream, ID2D1GdiMetafile **metafile);
	HRESULT CreatePathGeometry(const ID2D1PathGeometry1 **pathGeometry);
	HRESULT CreateStrokeStyle(const D2D1_STROKE_STYLE_PROPERTIES1 *strokeStyleProperties, const float *dashes, uint dashesCount, const ID2D1StrokeStyle1 *strokeStyle);
	HRESULT GetEffectProperties(CLSID* effectId, ID2D1Properties **properties);
	HRESULT GetRegisteredEffects(CLSID *effects, uint effectCount, uint *effectsReturned, uint *effectsRegistered);
	HRESULT RegisterEffectFromStream(CLSID* classId, IStream propertyXml, const D2D1_PROPERTY_BINDING *Bindings, uint bindingsCount, PD2D1_EFFECT_FACTORY effectFactory);
	HRESULT RegisterEffectFromString(CLSID* classId, PCWSTR propertyXml, const D2D1_PROPERTY_BINDING *Bindings, uint bindingsCount, PD2D1_EFFECT_FACTORY effectFactory);
	HRESULT UnregisterEffect(CLSID* classId);
}

mixin(uuid!(ID2D1GdiMetafile, "2f543dc3-cfc1-4211-864f-cfd91c6f3395"));
public interface ID2D1GdiMetafile : ID2D1Resource
{
extern(Windows):
	HRESULT GetBounds(D2D1_RECT_F *bounds);
	HRESULT Stream(ID2D1GdiMetafileSink metafileSink);
}

mixin(uuid!(ID2D1GdiMetafileSink, "82237326-8111-4f7c-bcf4-b5c1175564fe"));
public interface ID2D1GdiMetafileSink : IUnknown
{
extern(Windows):
	BOOL ProcessRecord(DWORD recordType, void *recordData, uint recordDataSize);
}

mixin(uuid!(ID2D1GradientStopCollection1, "ae1572f4-5dd0-4777-998b-9279472ae63b"));
public interface ID2D1GradientStopCollection1 : ID2D1GradientStopCollection
{
extern(Windows):
	D2D1_BUFFER_PRECISION GetBufferPrecision();
	D2D1_COLOR_INTERPOLATION_MODE GetColorInterpolationMode();
	void GetGradientStops1(D2D1_GRADIENT_STOP *gradientStops, uint gradientStopsCount);
	D2D1_COLOR_SPACE GetPostInterpolationSpace();
	D2D1_COLOR_SPACE GetPreInterpolationSpace();
}

mixin(uuid!(ID2D1ImageBrush, "fe9e984d-3f95-407c-b5db-cb94d4e8f87c"));
public interface ID2D1ImageBrush : ID2D1Brush
{
extern(Windows):
	D2D1_EXTEND_MODE GetExtendModeX();
	D2D1_EXTEND_MODE GetExtendModeY();
	void GetImage(ID2D1Image *Image);
	D2D1_INTERPOLATION_MODE GetInterpolationMode();
	void GetSourceRectangle(D2D1_RECT_F *sourceRectangle);
	void SetExtendModeX(D2D1_EXTEND_MODE extendModeX);
	void SetExtendModeY(D2D1_EXTEND_MODE extendModeY);
	void SetImage(ID2D1Image Image);
	void SetInterpolationMode(D2D1_INTERPOLATION_MODE interpolationMode);
	void SetSourceRectangle(const(D2D1_RECT_F*) sourceRectangle);
}

mixin(uuid!(ID2D1Multithread, "31e6e7bc-e0ff-4d46-8c64-a0a8c41c15d3"));
public interface ID2D1Multithread : IUnknown
{
extern(Windows):
	void Enter();
	BOOL GetMultithreadProtected();
	void Leave();
}

mixin(uuid!(ID2D1OffsetTransform, "3fe6adea-7643-4f53-bd14-a0ce63f24042"));
public interface ID2D1OffsetTransform : ID2D1TransformNode
{
extern(Windows):
	D2D1_POINT_2L GetOffset();
	void SetOffset(D2D1_POINT_2L offset);
}

mixin(uuid!(ID2D1PathGeometry1, "62baa2d2-ab54-41b7-b872-787e0106a421"));
public interface ID2D1PathGeometry1 : ID2D1PathGeometry
{
extern(Windows):
	HRESULT ComputePointAndSegmentAtLength(float length, uint startSegment, const D2D1_MATRIX_3X2_F *worldTransform, float flatteningTolerance, D2D1_POINT_DESCRIPTION *pointDescription);
}

mixin(uuid!(ID2D1PrintControl, "2c1d867d-c290-41c8-ae7e-34a98702e9a5"));
public interface ID2D1PrintControl : IUnknown
{
extern(Windows):
	HRESULT AddPage(ID2D1CommandList commandList, D2D_SIZE_F pageSize, IStream *pagePrintTicketStream, D2D1_TAG *tag1 = null, D2D1_TAG *tag2 = null);
	HRESULT Close();
}

mixin(uuid!(ID2D1Properties, "483473d7-cd46-4f9d-9d3a-3112aa80159d"));
public interface ID2D1Properties : IUnknown
{
extern(Windows):
	uint GetPropertyCount();
	uint GetPropertyIndex(PCWSTR name);
	HRESULT GetPropertyName(uint index, PWSTR name, uint nameCount);
	uint GetPropertyNameLength(uint index);
	HRESULT GetSubProperties(uint index, ID2D1Properties *subProperties);
	D2D1_PROPERTY_TYPE GetType(uint index);
	HRESULT GetValue(uint index, ubyte *data, uint dataSize);
	HRESULT GetValue(uint index, D2D1_PROPERTY_TYPE type, ubyte *data, uint dataSize);
	HRESULT GetValueByName(PCWSTR name, ubyte *data, uint dataSize);
	HRESULT GetValueByName(PCWSTR name, D2D1_PROPERTY_TYPE type, ubyte *data, uint dataSize);
	uint GetValueSize(uint index);
	HRESULT SetValue(uint index, const(ubyte) *data, uint dataSize);
	HRESULT SetValue(uint index, D2D1_PROPERTY_TYPE type, const(ubyte) *data, uint dataSize);
	HRESULT SetValueByName(PCWSTR name, const(ubyte) *data, uint dataSize);
	HRESULT SetValueByName(PCWSTR name, D2D1_PROPERTY_TYPE  type, const(ubyte) *data, uint dataSize);
}

mixin(uuid!(ID2D1RenderInfo, "519ae1bd-d19a-420d-b849-364f594776b7"));
public interface ID2D1RenderInfo : IUnknown
{
extern(Windows):
	void SetCached(BOOL isCached);
	HRESULT SetInputDescription(uint index, D2D1_INPUT_DESCRIPTION inputDescription);
	void SetInstructionCountHint(uint instructionCount);
	HRESULT SetOutputBuffer(D2D1_BUFFER_PRECISION bufferPrecision, D2D1_CHANNEL_DEPTH channelDepth);
}

mixin(uuid!(ID2D1ResourceTexture, "688d15c3-02b0-438d-b13a-d1b44c32c39a"));
public interface ID2D1ResourceTexture : IUnknown
{
extern(Windows):
	HRESULT Update(const(uint) *minimumExtents, const(uint) *maximumExtents, const(uint) *strides, uint dimensions, const(ubyte) *data, uint dataCount);
}

mixin(uuid!(ID2D1SourceTransform, "db1800dd-0c34-4cf9-be90-31cc0a5653e1"));
public interface ID2D1SourceTransform : ID2D1Transform
{
extern(Windows):
	HRESULT Draw(ID2D1Bitmap1 target, const D2D1_RECT_L *drawRect, D2D1_POINT_2U targetOrigin);
	HRESULT SetRenderInfo(ID2D1RenderInfo renderInfo);
}

mixin(uuid!(ID2D1StrokeStyle1, "10a72a66-e91c-43f4-993f-ddf4b82b0b4a"));
public interface ID2D1StrokeStyle1 : ID2D1StrokeStyle
{
extern(Windows):
	D2D1_STROKE_TRANSFORM_TYPE GetStrokeTransformType();
}

mixin(uuid!(ID2D1Transform, "ef1a287d-342a-4f76-8fdb-da0d6ea9f92b"));
public interface ID2D1Transform : ID2D1TransformNode
{
extern(Windows):
	HRESULT MapInputRectsToOutputRect(const D2D1_RECT_L *inputRects, const D2D1_RECT_L *inputOpaqueRects, uint inputRectCount, D2D1_RECT_L *outputRect, D2D1_RECT_L *outputOpaqueRect);
	HRESULT MapInvalidRect(uint inputIndex, D2D1_RECT_L invalidInputRect, D2D1_RECT_L *invalidOutputRect);
	HRESULT MapOutputRectToInputRects(const D2D1_RECT_L *outputRect, D2D1_RECT_L *inputRects, uint inputRectsCount);
}

mixin(uuid!(ID2D1TransformGraph, "13d29038-c3e6-4034-9081-13b53a417992"));
public interface ID2D1TransformGraph : IUnknown
{
extern(Windows):
	HRESULT AddNode(ID2D1TransformNode node);
	void Clear();
	HRESULT ConnectNode(ID2D1TransformNode fromNode, ID2D1TransformNode toNode, uint toNodeInputIndex);
	HRESULT ConnectToEffectInput(uint toEffectInputIndex, ID2D1TransformNode node, uint toNodeInputIndex);
	uint GetInputCount();
	HRESULT RemoveNode(ID2D1TransformNode node);
	HRESULT SetOutputNode(ID2D1TransformNode node);
	HRESULT SetPassthroughGraph(uint effectInputIndex);
	HRESULT SetSingleTransformNode(ID2D1TransformNode node);
}

mixin(uuid!(ID2D1TransformNode, "b2efe1e7-729f-4102-949f-505fa21bf666"));
public interface ID2D1TransformNode : IUnknown
{
extern(Windows):
	uint GetInputCount();
}

mixin(uuid!(ID2D1VertexBuffer, "9b8b1336-00a5-4668-92b7-ced5d8bf9b7b"));
public interface ID2D1VertexBuffer : IUnknown
{
extern(Windows):
	HRESULT Map(const(ubyte) **data, uint bufferSize);
	HRESULT Unmap();
}

//
//	Functions
//

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
	
	alias long function (IUnknown effect, const (ubyte) *data, uint dataSize) PD2D1_PROPERTY_SET_FUNCTION; 
	alias long function (IUnknown effect, ubyte *data, uint dataSize, uint *actualSize) PD2D1_PROPERTY_GET_FUNCTION; 
}

//
//	Enumerations
//

public enum D2D1_RENDERING_PRIORITY : int { 
	NORMAL  = 0,
	LOW     = 1
}

//
//	Interfaces
//

mixin(uuid!(ID2D1CommandSink1, "9eb767fd-4269-4467-b8c2-eb30cb305743"));
public interface ID2D1CommandSink1 : ID2D1CommandSink
{
extern(Windows):
	HRESULT SetPrimitiveBlend1(D2D1_PRIMITIVE_BLEND primitiveBlend);
}

mixin(uuid!(ID2D1Device1, "d21768e1-23a4-4823-a14b-7c3eba85d658"));
public interface ID2D1Device1 : ID2D1Device
{
extern(Windows):
	D2D1_RENDERING_PRIORITY GetRenderingPriority();
	HRESULT SetRenderingPriority(D2D1_RENDERING_PRIORITY renderingPriority);
}

mixin(uuid!(ID2D1DeviceContext1, "d37f57e4-6908-459f-a199-e72f24f79987"));
public interface ID2D1DeviceContext1 : ID2D1DeviceContext
{
extern(Windows):
	HRESULT CreateFilledGeometryRealization(ID2D1Geometry geometry, float flatteningTolerance, ID2D1GeometryRealization *geometryRealization);
	HRESULT CreateStrokedGeometryRealization(ID2D1Geometry geometry, float flatteningTolerance, float strokeWidth, ID2D1StrokeStyle strokeStyle, ID2D1GeometryRealization *geometryRealization);
	HRESULT DrawGeometryRealization(ID2D1GeometryRealization geometryRealization, ID2D1Brush brush);
}

mixin(uuid!(ID2D1Factory2, "94f81a73-9212-4376-9c58-b16a3a0d3992"));
public interface ID2D1Factory2 : ID2D1Factory1
{
extern(Windows):
	HRESULT CreateDevice(IDXGIDevice *dxgiDevice, ID2D1Device1 **d2dDevice1);
}

mixin(uuid!(ID2D1GeometryRealization, "a16907d7-bc02-4801-99e8-8cf7f485f774"));
public interface ID2D1GeometryRealization : ID2D1Resource
{
extern(Windows):
}
