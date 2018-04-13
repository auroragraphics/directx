module aurora.directx.d2d1.d2d1_1;

import aurora.directx.com;
import aurora.directx.d3d11;
import aurora.directx.dwrite;
import aurora.directx.dxgi;
import aurora.directx.wic;

public import aurora.directx.d2d1.d2d1_0;

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
