module aurora.directx.d2d1.d2d1_3;

import aurora.directx.com;
import aurora.directx.d3d11;
import aurora.directx.dwrite;
import aurora.directx.dxgi;
import aurora.directx.wic;

public import aurora.directx.d2d1.d2d1_2;
public import aurora.directx.dwrite.dwrite_3;
public import aurora.directx.d2d1.d2d1svg;
public import aurora.directx.d2d1.d2d1effects_2;

public:

///
///	Enumerations
///

enum D2D1_INK_NIB_SHAPE : int
{
    ROUND = 0,
    SQUARE = 1,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_ORIENTATION : int
{
    DEFAULT = 1,
    FLIP_HORIZONTAL = 2,
    ROTATE_CLOCKWISE180 = 3,
    ROTATE_CLOCKWISE180_FLIP_HORIZONTAL = 4,
    ROTATE_CLOCKWISE90_FLIP_HORIZONTAL = 5,
    ROTATE_CLOCKWISE270 = 6,
    ROTATE_CLOCKWISE270_FLIP_HORIZONTAL = 7,
    ROTATE_CLOCKWISE90 = 8,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_IMAGE_SOURCE_LOADING_OPTIONS : int
{
    NONE = 0,
    RELEASE_SOURCE = 1,
    CACHE_ON_DEMAND = 2,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_TRANSFORMED_IMAGE_SOURCE_OPTIONS : int
{
    NONE = 0,
    DISABLE_DPI_SCALE = 1,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_IMAGE_SOURCE_FROM_DXGI_OPTIONS
{
    NONE = 0,
    LOW_QUALITY_PRIMARY_CONVERSION = 1,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_PATCH_EDGE_MODE : int
{
    ALIASED = 0,
    ANTIALIASED = 1,
    ALIASED_INFLATED = 2,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_SPRITE_OPTIONS : int
{
    NONE = 0,
    CLAMP_TO_SOURCE_RECTANGLE = 1,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_COLOR_BITMAP_GLYPH_SNAP_OPTION : int
{
    DEFAULT = 0,
    DISABLE = 1,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_GAMMA1 : int
{
    G22 = D2D1_GAMMA.GAMMA_2_2,
    G10 = D2D1_GAMMA.GAMMA_1_0,
    G2084 = 2,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_COLOR_CONTEXT_TYPE : int
{
    ICC = 0,
    SIMPLE = 1,
    DXGI = 2,
    FORCE_DWORD = 0xffffffff
}

///
/// Structures
///

struct D2D1_TRANSFORMED_IMAGE_SOURCE_PROPERTIES
{
    D2D1_ORIENTATION orientation;
    float scaleX;
    float scaleY;
    D2D1_INTERPOLATION_MODE interpolationMode;
    D2D1_TRANSFORMED_IMAGE_SOURCE_OPTIONS options;
}

struct D2D1_INK_POINT
{
    float x;
    float y;
    float radius;
}

struct D2D1_INK_BEZIER_SEGMENT
{
    D2D1_INK_POINT point1;
    D2D1_INK_POINT point2;
    D2D1_INK_POINT point3;
}

struct D2D1_INK_STYLE_PROPERTIES
{
    D2D1_INK_NIB_SHAPE nibShape;
    D2D1_MATRIX_3X2_F nibTransform;
}

struct D2D1_GRADIENT_MESH_PATCH
{
    D2D1_POINT_2F point00;
    D2D1_POINT_2F point01;
    D2D1_POINT_2F point02;
    D2D1_POINT_2F point03;
    D2D1_POINT_2F point10;
    D2D1_POINT_2F point11;
    D2D1_POINT_2F point12;
    D2D1_POINT_2F point13;
    D2D1_POINT_2F point20;
    D2D1_POINT_2F point21;
    D2D1_POINT_2F point22;
    D2D1_POINT_2F point23;
    D2D1_POINT_2F point30;
    D2D1_POINT_2F point31;
    D2D1_POINT_2F point32;
    D2D1_POINT_2F point33;
    D2D1_COLOR_F color00;
    D2D1_COLOR_F color03;
    D2D1_COLOR_F color30;
    D2D1_COLOR_F color33;
    D2D1_PATCH_EDGE_MODE topEdgeMode;
    D2D1_PATCH_EDGE_MODE leftEdgeMode;
    D2D1_PATCH_EDGE_MODE bottomEdgeMode;
    D2D1_PATCH_EDGE_MODE rightEdgeMode;
}

struct D2D1_SIMPLE_COLOR_PROFILE
{
    D2D1_POINT_2F redPrimary;
    D2D1_POINT_2F greenPrimary;
    D2D1_POINT_2F bluePrimary;
    D2D1_POINT_2F whitePointXZ;
    D2D1_GAMMA1 gamma;
}

///
/// Interfaces
///

mixin(uuid!(ID2D1InkStyle, "bae8b344-23fc-4071-8cb5-d05d6f073848"));
public interface ID2D1InkStyle : ID2D1Resource
{
extern(Windows):
	D2D1_INK_NIB_SHAPE GetNibShape();
    void GetNibTransform(D2D1_MATRIX_3X2_F *transform);
    void SetNibShape(D2D1_INK_NIB_SHAPE nibShape);
    void SetNibTransform(const D2D1_MATRIX_3X2_F *transform);
    final void SetNibTransform(const D2D1_MATRIX_3X2_F transform) {
        SetNibTransform(&transform);
    }
}

mixin(uuid!(ID2D1Ink, "b499923b-7029-478f-a8b3-432c7c5f5312"));
public interface ID2D1Ink : ID2D1Resource
{
extern(Windows):
	HRESULT AddSegments(const D2D1_INK_BEZIER_SEGMENT *segments, uint segmentsCount);
    HRESULT GetBounds(ID2D1InkStyle inkStyle, const D2D1_MATRIX_3X2_F *worldTransform, D2D1_RECT_F *bounds);
    uint GetSegmentCount();
    HRESULT GetSegments(uint startSegment, D2D1_INK_BEZIER_SEGMENT *segments, uint segmentsCount);
    D2D1_INK_POINT GetStartPoint();
    HRESULT RemoveSegmentsAtEnd(uint segmentsCount);
    HRESULT SetSegmentAtEnd(const D2D1_INK_BEZIER_SEGMENT *segment);
    HRESULT SetSegments(uint startSegment, const D2D1_INK_BEZIER_SEGMENT *segments, uint segmentsCount);
    void SetStartPoint(const D2D1_INK_POINT *startPoint);
    HRESULT StreamAsGeometry(ID2D1InkStyle inkStyle, const D2D1_MATRIX_3X2_F *worldTransform, float flatteningTolerance, ID2D1SimplifiedGeometrySink geometrySink);

    final void SetStartPoint(const D2D1_INK_POINT startPoint) {
        SetStartPoint(&startPoint);
    }
    
    final HRESULT SetSegmentAtEnd(const D2D1_INK_BEZIER_SEGMENT segment) {
        return SetSegmentAtEnd(&segment);
    }
    
    final HRESULT StreamAsGeometry(ID2D1InkStyle inkStyle, const D2D1_MATRIX_3X2_F *worldTransform, ID2D1SimplifiedGeometrySink geometrySink ) {
        return StreamAsGeometry(inkStyle, worldTransform, D2D1_DEFAULT_FLATTENING_TOLERANCE, geometrySink);
    }
    
    final HRESULT StreamAsGeometry(ID2D1InkStyle inkStyle, const D2D1_MATRIX_3X2_F worldTransform, ID2D1SimplifiedGeometrySink geometrySink) {
        return StreamAsGeometry(inkStyle, &worldTransform, D2D1_DEFAULT_FLATTENING_TOLERANCE, geometrySink);
    }

    final HRESULT StreamAsGeometry(ID2D1InkStyle inkStyle, const D2D1_MATRIX_3X2_F worldTransform, float flatteningTolerance, ID2D1SimplifiedGeometrySink geometrySink) {
        return StreamAsGeometry(inkStyle, &worldTransform, flatteningTolerance, geometrySink);
    }
}

mixin(uuid!(ID2D1GradientMesh, "f292e401-c050-4cde-83d7-04962d3b23c2"));
public interface ID2D1GradientMesh : ID2D1Resource
{
extern(Windows):
	uint GetPatchCount();
    HRESULT GetPatches(uint startIndex, D2D1_GRADIENT_MESH_PATCH *patches, uint patchesCount);
}

mixin(uuid!(ID2D1ImageSource, "c9b664e5-74a1-4378-9ac2-eefc37a3f4d8"));
public interface ID2D1ImageSource : ID2D1Image
{
extern(Windows):
	HRESULT OfferResources();
    HRESULT TryReclaimResources(bool *resourcesDiscarded);
}

mixin(uuid!(ID2D1ImageSourceFromWic, "77395441-1c8f-4555-8683-f50dab0fe792"));
public interface ID2D1ImageSourceFromWic : ID2D1ImageSource
{
extern(Windows):
	HRESULT EnsureCached(const D2D1_RECT_U *rectangleToFill);
    final HRESULT EnsureCached(const D2D1_RECT_U rectangleToFill) {
        return EnsureCached(&rectangleToFill);
    }
    void GetSource(IWICBitmapSource wicBitmapSource);
    HRESULT TrimCache(const D2D1_RECT_U *rectangleToPreserve);
    final HRESULT TrimCache(const D2D1_RECT_U rectangleToPreserve) {
        return TrimCache(&rectangleToPreserve);
    }
}

mixin(uuid!(ID2D1TransformedImageSource, "7f1f79e5-2796-416c-8f55-700f911445e5"));
public interface ID2D1TransformedImageSource : ID2D1Image
{
extern(Windows):
	void GetProperties(D2D1_TRANSFORMED_IMAGE_SOURCE_PROPERTIES *properties);
    void GetSource(ID2D1ImageSource *imageSource);
}

mixin(uuid!(ID2D1LookupTable3D, "53dd9855-a3b0-4d5b-82e1-26e25c5e5797"));
public interface ID2D1LookupTable3D : ID2D1Resource
{
extern(Windows):
}

mixin(uuid!(ID2D1DeviceContext2, "394ea6a3-0c34-4321-950b-6ca20f0be6c7"));
public interface ID2D1DeviceContext2 : ID2D1DeviceContext1
{
extern(Windows):
    HRESULT CreateGradientMesh(const D2D1_GRADIENT_MESH_PATCH *patches, uint patchesCount, ID2D1GradientMesh *gradientMesh);
    HRESULT CreateImageSourceFromDxgi(IDXGISurface *surfaces, const D2D1_RECT_U *sourceRectangles, uint surfaceCount, DXGI_COLOR_SPACE_TYPE colorSpace, D2D1_IMAGE_SOURCE_FROM_DXGI_OPTIONS options, ID2D1ImageSource *imageSource);
    HRESULT CreateLookupTable3D(D2D1_BUFFER_PRECISION precision, const uint *extents, const byte *data, uint dataCount, const uint *strides, ID2D1LookupTable3D *lookupTable);
    HRESULT CreateTransformedImageSource(ID2D1ImageSource imageSource, const D2D1_TRANSFORMED_IMAGE_SOURCE_PROPERTIES *properties, ID2D1TransformedImageSource *transformedImageSource);

    HRESULT CreateInk(const D2D1_INK_POINT *startPoint, ID2D1Ink *ink);
    final HRESULT CreateInk(const D2D1_INK_POINT startPoint, ID2D1Ink *ink) {
        return CreateInk(&startPoint, ink);
    }
    HRESULT CreateInkStyle(const D2D1_INK_STYLE_PROPERTIES *inkStyleProperties, ID2D1InkStyle *inkStyle);
    final HRESULT CreateInkStyle(const D2D1_INK_STYLE_PROPERTIES inkStyleProperties, ID2D1InkStyle *inkStyle) {
        return CreateInkStyle(&inkStyleProperties, inkStyle);
    }
    HRESULT CreateImageSourceFromWic(IWICBitmapSource wicBitmapSource, D2D1_IMAGE_SOURCE_LOADING_OPTIONS loadingOptions, D2D1_ALPHA_MODE alphaMode, ID2D1ImageSourceFromWic *imageSource);
    final HRESULT CreateImageSourceFromWic(IWICBitmapSource wicBitmapSource, D2D1_IMAGE_SOURCE_LOADING_OPTIONS loadingOptions, ID2D1ImageSourceFromWic *imageSource) {
        return CreateImageSourceFromWic(wicBitmapSource, loadingOptions, D2D1_ALPHA_MODE.UNKNOWN, imageSource);
    }    
    final HRESULT CreateImageSourceFromWic(IWICBitmapSource wicBitmapSource, ID2D1ImageSourceFromWic *imageSource) {
        return CreateImageSourceFromWic(wicBitmapSource, D2D1_IMAGE_SOURCE_LOADING_OPTIONS.NONE, D2D1_ALPHA_MODE.UNKNOWN, imageSource);
    }    
    void DrawGdiMetafile(ID2D1GdiMetafile gdiMetafile, const D2D1_RECT_F *destinationRectangle, const D2D1_RECT_F *sourceRectangle = NULL);
    final void DrawGdiMetafile(ID2D1GdiMetafile gdiMetafile, const D2D1_RECT_F destinationRectangle, const D2D1_RECT_F sourceRectangle) {
        return DrawGdiMetafile(gdiMetafile, &destinationRectangle, &sourceRectangle);
    }
    final void DrawGdiMetafile(ID2D1GdiMetafile gdiMetafile, const D2D1_RECT_F destinationRectangle, const D2D1_RECT_F *sourceRectangle = null) {
        return DrawGdiMetafile(gdiMetafile, &destinationRectangle, sourceRectangle);
    }
    void DrawGradientMesh(ID2D1GradientMesh gradientMesh);
    void DrawInk(ID2D1Ink ink, ID2D1Brush brush, ID2D1InkStyle inkStyle);
    HRESULT GetGradientMeshWorldBounds(ID2D1GradientMesh gradientMesh, D2D1_RECT_F *pBounds);
}

mixin(uuid!(ID2D1Device2, "a44472e1-8dfb-4e60-8492-6e2861c9ca8b"));
public interface ID2D1Device2 : ID2D1Device1
{
extern(Windows):
    HRESULT CreateDeviceContext(D2D1_DEVICE_CONTEXT_OPTIONS options, ID2D1DeviceContext2 *deviceContext2);
    void FlushDeviceContexts(ID2D1Bitmap bitmap);
    HRESULT GetDxgiDevice(IDXGIDevice *dxgiDevice);
}

mixin(uuid!(ID2D1Factory3, "0869759f-4f00-413f-b03e-2bda45404d0f"));
public interface ID2D1Factory3 : ID2D1Factory2
{
extern(Windows):
    HRESULT CreateDevice(IDXGIDevice dxgiDevice, ID2D1Device2 *d2dDevice2);
}

mixin(uuid!(ID2D1CommandSink2, "3bab440e-417e-47df-a2e2-bc0be6a00916"));
public interface ID2D1CommandSink2 : ID2D1CommandSink1
{
extern(Windows):
    void DrawGdiMetafile(ID2D1GdiMetafile gdiMetafile, const D2D1_RECT_F *destinationRectangle, const D2D1_RECT_F *sourceRectangle);
    void DrawGradientMesh(ID2D1GradientMesh gradientMesh);
    void DrawInk(ID2D1Ink ink, ID2D1Brush brush, ID2D1InkStyle inkStyle);
}

mixin(uuid!(ID2D1GdiMetafile1, "2e69f9e8-dd3f-4bf9-95ba-c04f49d788df"));
public interface ID2D1GdiMetafile1 : ID2D1GdiMetafile
{
extern(Windows):
    HRESULT GetDpi(float *dpiX, float *dpiY);
    HRESULT GetSourceBounds(out D2D1_RECT_F *bounds);
}

mixin(uuid!(ID2D1GdiMetafileSink1, "fd0ecb6b-91e6-411e-8655-395e760f91b4"));
public interface ID2D1GdiMetafileSink1 : ID2D1GdiMetafileSink
{
extern(Windows):
    HRESULT ProcessRecord( DWORD recordType, const void *recordData, uint recordDataSize, uint flags);
}

mixin(uuid!(ID2D1SpriteBatch, "4dc583bf-3a10-438a-8722-e9765224f1f1"));
public interface ID2D1SpriteBatch : ID2D1Resource
{
extern(Windows):
    HRESULT AddSprites(uint spriteCount, const D2D1_RECT_F *destinationRectangles, const D2D1_RECT_U *sourceRectangles = null, const D2D1_COLOR_F *colors = null, const D2D1_MATRIX_3X2_F *transforms = null, uint destinationRectanglesStride = D2D1_RECT_F.sizeof, uint sourceRectangleStride = D2D1_RECT_U.sizeof, uint colorStride = D2D1_COLOR_F.sizeof, uint transformStride = D2D1_MATRIX_3X2_F.sizeof);
    void Clear();
    uint GetSpriteCount();
    HRESULT GetSprites(uint startIndex, uint spriteCount, D2D1_RECT_F *destinationRectangles = NULL, D2D1_RECT_U *sourceRectangles = null, D2D1_COLOR_F *colors = null, D2D1_MATRIX_3X2_F *transforms = null);
    HRESULT SetSprites(uint startIndex, uint spriteCount, const D2D1_RECT_F *destinationRectangles = NULL, const D2D1_RECT_U *sourceRectangles = null, const D2D1_COLOR_F *colors = null, const D2D1_MATRIX_3X2_F *transforms = null, uint destinationRectanglesStride = D2D1_RECT_F.sizeof, uint sourceRectangleStride = D2D1_RECT_U.sizeof, uint colorStride = D2D1_COLOR_F.sizeof, uint transformStride = D2D1_MATRIX_3X2_F.sizeof);
}

mixin(uuid!(ID2D1DeviceContext3, "235a7496-8351-414c-bcd4-6672ab2d8e00"));
public interface ID2D1DeviceContext3 : ID2D1DeviceContext2
{
extern(Windows):
    HRESULT CreateSpriteBatch(ID2D1SpriteBatch *spriteBatch);
    void DrawSpriteBatch(ID2D1SpriteBatch spriteBatch, uint startIndex, uint spriteCount, ID2D1Bitmap bitmap, D2D1_BITMAP_INTERPOLATION_MODE interpolationMode = D2D1_BITMAP_INTERPOLATION_MODE.LINEAR, D2D1_SPRITE_OPTIONS spriteOptions = D2D1_SPRITE_OPTIONS.NONE);
    final void DrawSpriteBatch(ID2D1SpriteBatch spriteBatch, ID2D1Bitmap bitmap, D2D1_BITMAP_INTERPOLATION_MODE interpolationMode = D2D1_BITMAP_INTERPOLATION_MODE.LINEAR, D2D1_SPRITE_OPTIONS spriteOptions = D2D1_SPRITE_OPTIONS.NONE) {
        return DrawSpriteBatch(spriteBatch, 0, spriteBatch.GetSpriteCount(), bitmap, interpolationMode, spriteOptions);
    }
}

mixin(uuid!(ID2D1Device3, "852f2087-802c-4037-ab60-ff2e7ee6fc01"));
public interface ID2D1Device3 : ID2D1Device2
{
extern(Windows):
    HRESULT CreateDeviceContext(D2D1_DEVICE_CONTEXT_OPTIONS options, ID2D1DeviceContext3 *deviceContext3);
}

mixin(uuid!(ID2D1Factory4, "bd4ec2d2-0662-4bee-ba8e-6f29f032e096"));
public interface ID2D1Factory4 : ID2D1Factory3
{
extern(Windows):
    HRESULT CreateDevice(IDXGIDevice  dxgiDevice, ID2D1Device3 *d2dDevice3);
}

mixin(uuid!(ID2D1CommandSink3, "18079135-4cf3-4868-bc8e-06067e6d242d"));
public interface ID2D1CommandSink3 : ID2D1CommandSink2
{
extern(Windows):
    HRESULT DrawSpriteBatch(ID2D1SpriteBatch spriteBatch, uint startIndex, uint spriteCount, ID2D1Bitmap bitmap, D2D1_BITMAP_INTERPOLATION_MODE interpolationMode, D2D1_SPRITE_OPTIONS spriteOptions);
}

mixin(uuid!(ID2D1SvgGlyphStyle, "af671749-d241-4db8-8e41-dcc2e5c1a438"));
public interface ID2D1SvgGlyphStyle : ID2D1Resource
{
extern(Windows):
    void GetFill(ID2D1Brush *brush);
    void GetStroke(ID2D1Brush *brush, float*strokeWidth = NULL, float *dashes = NULL, uint dashesCount = 0, float *dashOffset = null);
    uint GetStrokeDashesCount();
    HRESULT SetFill(ID2D1Brush brush);
    HRESULT SetStroke(ID2D1Brush brush, float strokeWidth = 1.0f, const float *dashes = NULL, uint dashesCount = 0, float dashOffset = 1.0f);
}

mixin(uuid!(ID2D1DeviceContext4, "8c427831-3d90-4476-b647-c4fae349e4db"));
public interface ID2D1DeviceContext4 : ID2D1DeviceContext3
{
extern(Windows):
    HRESULT CreateSvgGlyphStyle(ID2D1SvgGlyphStyle *svgGlyphStyle);
    void DrawColorBitmapGlyphRun(DWRITE_GLYPH_IMAGE_FORMATS glyphImageFormat, D2D1_POINT_2F baselineOrigin, const DWRITE_GLYPH_RUN *glyphRun, DWRITE_MEASURING_MODE measuringMode = DWRITE_MEASURING_MODE.NATURAL, D2D1_COLOR_BITMAP_GLYPH_SNAP_OPTION bitmapSnapOption = D2D1_COLOR_BITMAP_GLYPH_SNAP_OPTION.DEFAULT);
    void DrawSvgGlyphRun(D2D1_POINT_2F baselineOrigin, const DWRITE_GLYPH_RUN *glyphRun, ID2D1Brush defaultFillBrush = null, ID2D1SvgGlyphStyle svgGlyphStyle = null, uint colorPaletteIndex = 0, DWRITE_MEASURING_MODE measuringMode = DWRITE_MEASURING_MODE.NATURAL);
    void DrawText(const WCHAR *string, uint stringLength, IDWriteTextFormat textFormat, const D2D1_RECT_F *layoutRect, ID2D1Brush defaultFillBrush, ID2D1SvgGlyphStyle svgGlyphStyle, uint colorPaletteIndex = 0, D2D1_DRAW_TEXT_OPTIONS options = D2D1_DRAW_TEXT_OPTIONS.ENABLE_COLOR_FONT, DWRITE_MEASURING_MODE measuringMode = DWRITE_MEASURING_MODE.NATURAL);
    final void DrawText(const WCHAR *string, uint stringLength, IDWriteTextFormat textFormat, const D2D1_RECT_F layoutRect, ID2D1Brush defaultFillBrush, ID2D1SvgGlyphStyle svgGlyphStyle, uint colorPaletteIndex = 0, D2D1_DRAW_TEXT_OPTIONS options = D2D1_DRAW_TEXT_OPTIONS.ENABLE_COLOR_FONT, DWRITE_MEASURING_MODE measuringMode = DWRITE_MEASURING_MODE.NATURAL) {
        return DrawText(string, stringLength, textFormat, &layoutRect, defaultFillBrush, svgGlyphStyle, colorPaletteIndex, options, measuringMode);
    }
    void DrawTextLayout(D2D1_POINT_2F origin, IDWriteTextLayout textLayout, ID2D1Brush defaultFillBrush, ID2D1SvgGlyphStyle svgGlyphStyle, uint colorPaletteIndex = 0, D2D1_DRAW_TEXT_OPTIONS options = D2D1_DRAW_TEXT_OPTIONS.ENABLE_COLOR_FONT);
    HRESULT GetColorBitmapGlyphImage(DWRITE_GLYPH_IMAGE_FORMATS glyphImageFormat, D2D1_POINT_2F glyphOrigin, IDWriteFontFace fontFace, float fontEmSize, ushort glyphIndex, bool isSideways, const D2D1_MATRIX_3X2_F *worldTransform, float dpiX, float dpiY, D2D1_MATRIX_3X2_F *glyphTransform, ID2D1Image *glyphImage);
    HRESULT GetSvgGlyphImage(D2D1_POINT_2F glyphOrigin, IDWriteFontFace fontFace, float fontEmSize, ushort glyphIndex, bool isSideways, const D2D1_MATRIX_3X2_F *worldTransform, ID2D1Brush defaultFillBrush, ID2D1SvgGlyphStyle svgGlyphStyle, uint colorPaletteIndex, D2D1_MATRIX_3X2_F *glyphTransform, ID2D1CommandList *glyphImage);
}

mixin(uuid!(ID2D1Device4, "d7bdb159-5683-4a46-bc9c-72dc720b858b"));
public interface ID2D1Device4 : ID2D1Device3
{
extern(Windows):
    HRESULT CreateDeviceContext(D2D1_DEVICE_CONTEXT_OPTIONS options, ID2D1DeviceContext4 *deviceContext4);
    ulong GetMaximumColorGlyphCacheMemory();
    void SetMaximumColorGlyphCacheMemory(ulong maximumInBytes);
}

mixin(uuid!(ID2D1Factory5, "c4349994-838e-4b0f-8cab-44997d9eeacc"));
public interface ID2D1Factory5 : ID2D1Factory4
{
extern(Windows):
    HRESULT CreateDevice(IDXGIDevice dxgiDevice, ID2D1Device4 *d2dDevice4);
}

mixin(uuid!(ID2D1CommandSink4, "c78a6519-40d6-4218-b2de-beeeb744bb3e"));
public interface ID2D1CommandSink4 : ID2D1CommandSink3
{
extern(Windows):
    HRESULT SetPrimitiveBlend2(D2D1_PRIMITIVE_BLEND primitiveBlend);
}

mixin(uuid!(ID2D1ColorContext1, "1ab42875-c57f-4be9-bd85-9cd78d6f55ee"));
public interface ID2D1ColorContext1 : ID2D1ColorContext
{
extern(Windows):
    D2D1_COLOR_CONTEXT_TYPE GetColorContextType();
    DXGI_COLOR_SPACE_TYPE GetDXGIColorSpace();
    HRESULT GetSimpleColorProfile(D2D1_SIMPLE_COLOR_PROFILE *simpleProfile);
}

mixin(uuid!(ID2D1DeviceContext5, "7836d248-68cc-4df6-b9e8-de991bf62eb7"));
public interface ID2D1DeviceContext5 : ID2D1DeviceContext4
{
extern(Windows):
    HRESULT CreateColorContextFromDxgiColorSpace(DXGI_COLOR_SPACE_TYPE colorSpace, ID2D1ColorContext1 *colorContext);
    HRESULT CreateColorContextFromSimpleColorProfile(const D2D1_SIMPLE_COLOR_PROFILE *simpleProfile, ID2D1ColorContext1 *colorContext);
    final HRESULT CreateColorContextFromSimpleColorProfile(const D2D1_SIMPLE_COLOR_PROFILE simpleProfile, ID2D1ColorContext1 *colorContext) {
        return CreateColorContextFromSimpleColorProfile(&simpleProfile, colorContext);
    }
    HRESULT CreateSvgDocument(IStream inputXmlStream, D2D1_SIZE_F viewportSize, ID2D1SvgDocument *svgDocument);
    void DrawSvgDocument(ID2D1SvgDocument svgDocument);
}

mixin(uuid!(ID2D1Device5, "d55ba0a4-6405-4694-aef5-08ee1a4358b4"));
public interface ID2D1Device5 : ID2D1Device4
{
extern(Windows):
    HRESULT CreateDeviceContext(D2D1_DEVICE_CONTEXT_OPTIONS options, ID2D1DeviceContext5 *deviceContext5);
}

mixin(uuid!(ID2D1Factory6, "f9976f46-f642-44c1-97ca-da32ea2a2635"));
public interface ID2D1Factory6 : ID2D1Factory5
{
extern(Windows):
    HRESULT CreateDevice(IDXGIDevice dxgiDevice, ID2D1Device5 *d2dDevice5);
}

mixin(uuid!(ID2D1CommandSink5, "7047dd26-b1e7-44a7-959a-8349e2144fa8"));
public interface ID2D1CommandSink5 : ID2D1CommandSink4
{
extern(Windows):
    HRESULT BlendImage(ID2D1Image image, D2D1_BLEND_MODE blendMode, const D2D1_POINT_2F *targetOffset, const D2D1_RECT_F *imageRectangle, D2D1_INTERPOLATION_MODE interpolationMode);
}

mixin(uuid!(ID2D1DeviceContext6, "985f7e37-4ed0-4a19-98a3-15b0edfde306"));
public interface ID2D1DeviceContext6 : ID2D1DeviceContext5
{
extern(Windows):
    void BlendImage(ID2D1Image image, D2D1_BLEND_MODE blendMode, const D2D1_POINT_2F *targetOffset = null, const D2D1_RECT_F *imageRectangle = null, D2D1_INTERPOLATION_MODE interpolationMode = D2D1_INTERPOLATION_MODE.LINEAR);
}

mixin(uuid!(ID2D1Device6, "7bfef914-2d75-4bad-be87-e18ddb077b6d"));
public interface ID2D1Device6 : ID2D1Device5
{
extern(Windows):
    HRESULT CreateDeviceContext(D2D1_DEVICE_CONTEXT_OPTIONS options, ID2D1DeviceContext5 *deviceContext5);
}

mixin(uuid!(ID2D1Factory7, "bdc2bdd3-b96c-4de6-bdf7-99d4745454de"));
public interface ID2D1Factory7 : ID2D1Factory6
{
extern(Windows):
    HRESULT CreateDevice(IDXGIDevice dxgiDevice,ID2D1Device6 *d2dDevice6);
}

///
/// Functions
///

extern(Windows) {
    void D2D1GetGradientMeshInteriorPointsFromCoonsPatch(const D2D1_POINT_2F *pPoint0, const D2D1_POINT_2F *pPoint1, const D2D1_POINT_2F *pPoint2, const D2D1_POINT_2F *pPoint3, const D2D1_POINT_2F *pPoint4, const D2D1_POINT_2F *pPoint5, const D2D1_POINT_2F *pPoint6, const D2D1_POINT_2F *pPoint7, const D2D1_POINT_2F *pPoint8, const D2D1_POINT_2F *pPoint9, const D2D1_POINT_2F *pPoint10, const D2D1_POINT_2F *pPoint11, D2D1_POINT_2F *pTensorPoint11, D2D1_POINT_2F *pTensorPoint12, D2D1_POINT_2F *pTensorPoint21, D2D1_POINT_2F *pTensorPoint22);
}
