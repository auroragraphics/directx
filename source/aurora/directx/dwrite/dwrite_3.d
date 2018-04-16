module aurora.directx.dwrite.dwrite_3;

public import aurora.directx.com;
public import aurora.directx.dwrite.dwrite_2;

public:

///
/// Constants
///

alias DWRITE_MAKE_OPENTYPE_TAG DWRITE_MAKE_FONT_AXIS_TAG;

enum DWRITE_E_REMOTEFONT = 0x8898500DL;
enum DWRITE_E_DOWNLOADCANCELLED = 0x8898500EL;
enum DWRITE_E_DOWNLOADFAILED = 0x8898500FL;
enum DWRITE_E_TOOMANYDOWNLOADS = 0x88985010L;

///
/// Functions
///

///
/// Enumerations
///

enum DWRITE_FONT_PROPERTY_ID : int
{
    NONE,
    WEIGHT_STRETCH_STYLE_FAMILY_NAME,
    TYPOGRAPHIC_FAMILY_NAME,
    WEIGHT_STRETCH_STYLE_FACE_NAME,
    FULL_NAME,
    WIN32_FAMILY_NAME,
    POSTSCRIPT_NAME,
    DESIGN_SCRIPT_LANGUAGE_TAG,
    SUPPORTED_SCRIPT_LANGUAGE_TAG,
    SEMANTIC_TAG,
    WEIGHT,
    STRETCH,
    STYLE,
    TYPOGRAPHIC_FACE_NAME,
    TOTAL = STYLE + 1,
    TOTAL_RS3 = TYPOGRAPHIC_FACE_NAME + 1,

    // Obsolete aliases kept to avoid breaking existing code.
    PREFERRED_FAMILY_NAME = TYPOGRAPHIC_FAMILY_NAME,
    FAMILY_NAME = WEIGHT_STRETCH_STYLE_FAMILY_NAME,
    FACE_NAME = WEIGHT_STRETCH_STYLE_FACE_NAME,
}

enum DWRITE_LOCALITY : int
{
    REMOTE,
    PARTIAL,
    LOCAL,
}

enum DWRITE_RENDERING_MODE1 : int
{
    DEFAULT = DWRITE_RENDERING_MODE.DEFAULT,
    ALIASED = DWRITE_RENDERING_MODE.ALIASED,
    GDI_CLASSIC = DWRITE_RENDERING_MODE.GDI_CLASSIC,
    GDI_NATURAL = DWRITE_RENDERING_MODE.GDI_NATURAL,
    NATURAL = DWRITE_RENDERING_MODE.NATURAL,
    NATURAL_SYMMETRIC = DWRITE_RENDERING_MODE.NATURAL_SYMMETRIC,
    OUTLINE = DWRITE_RENDERING_MODE.OUTLINE,
    NATURAL_SYMMETRIC_DOWNSAMPLED,
}

enum DWRITE_FONT_LINE_GAP_USAGE : int
{
    DEFAULT,
    DISABLED,
    ENABLED
}

enum DWRITE_CONTAINER_TYPE : int
{
    UNKNOWN,
    WOFF,
    WOFF2
}

enum DWRITE_FONT_AXIS_TAG : uint
{
    WEIGHT         = DWRITE_MAKE_FONT_AXIS_TAG('w','g','h','t'),
    WIDTH          = DWRITE_MAKE_FONT_AXIS_TAG('w','d','t','h'),
    SLANT          = DWRITE_MAKE_FONT_AXIS_TAG('s','l','n','t'),
    OPTICAL_SIZE   = DWRITE_MAKE_FONT_AXIS_TAG('o','p','s','z'),
    ITALIC         = DWRITE_MAKE_FONT_AXIS_TAG('i','t','a','l'),
}

enum DWRITE_FONT_FAMILY_MODEL : int
{
    TYPOGRAPHIC,
    WEIGHT_STRETCH_STYLE,
}

enum DWRITE_AUTOMATIC_FONT_AXES : int
{
    NONE = 0x0000,
    OPTICAL_SIZE = 0x0001,
}

enum DWRITE_FONT_AXIS_ATTRIBUTES : int
{
    NONE = 0x0000,
    VARIABLE = 0x0001,
    HIDDEN = 0x0002,
}

enum DWRITE_GLYPH_IMAGE_FORMATS : int
{ 
  NONE = 0x00000000,
  TRUETYPE = 0x00000001,
  CFF = 0x00000002,
  COLR = 0x00000004,
  SVG = 0x00000008,
  PNG = 0x00000010,
  JPEG = 0x00000020,
  TIFF = 0x00000040,
  PREMULTIPLIED_B8G8R8A8  = 0x00000080
}

///
/// Structures
///

struct DWRITE_FONT_PROPERTY
{
    DWRITE_FONT_PROPERTY_ID propertyId;
    const wchar* propertyValue;
	const wchar* localeName;
}

struct DWRITE_LINE_SPACING
{
    DWRITE_LINE_SPACING_METHOD method;
    float height;
    float baseline;
    float leadingBefore;
    DWRITE_FONT_LINE_GAP_USAGE fontLineGapUsage;
}

struct DWRITE_LINE_METRICS1
{
	uint length;
	uint trailingWhitespaceLength;
	uint newlineLength;
	float height;
	float baseline;
	bool isTrimmed;
    float leadingBefore;
    float leadingAfter;
}

struct DWRITE_COLOR_GLYPH_RUN1
{
 	DWRITE_GLYPH_RUN glyphRun;
	DWRITE_GLYPH_RUN_DESCRIPTION *glyphRunDescription;
	float baselineOriginX;
	float baselineOriginY;
	DWRITE_COLOR_F runColor;
	uint paletteIndex;
    DWRITE_GLYPH_IMAGE_FORMATS glyphImageFormat;
    DWRITE_MEASURING_MODE measuringMode;
}

struct DWRITE_GLYPH_IMAGE_DATA
{
    const void *imageData;
    uint imageDataSize;
    uint uniqueDataId;
    uint pixelsPerEm;
    D2D1_SIZE_U pixelSize;
    D2D1_POINT_2L horizontalLeftOrigin;
    D2D1_POINT_2L horizontalRightOrigin;
    D2D1_POINT_2L verticalTopOrigin;
    D2D1_POINT_2L verticalBottomOrigin;
}

struct DWRITE_FILE_FRAGMENT
{
    ulong fileOffset;
    ulong fragmentSize;
}

struct DWRITE_FONT_AXIS_VALUE
{
    DWRITE_FONT_AXIS_TAG axisTag;
    float value;
}

struct DWRITE_FONT_AXIS_RANGE
{
    DWRITE_FONT_AXIS_TAG axisTag;
    float minValue;
    float maxValue;
}

///
/// Interfaces
///

mixin(uuid!(IDWriteRenderingParams3, "B7924BAA-391B-412A-8C5C-E44CC2D867DC"));
public interface IDWriteRenderingParams3 : IDWriteRenderingParams2
{
extern(Windows):
	DWRITE_RENDERING_MODE1 GetRenderingMode1();
}

mixin(uuid!(IDWriteFactory3, "9A1B41C3-D3BB-466A-87FC-FE67556A3B65"));
public interface IDWriteFactory3 : IDWriteFactory2
{
extern(Windows):
	HRESULT CreateCustomRenderingParams(float gamma, float enhancedContrast, float grayscaleEnhancedContrast, float clearTypeLevel, DWRITE_PIXEL_GEOMETRY pixelGeometry, DWRITE_RENDERING_MODE1 renderingMode, DWRITE_GRID_FIT_MODE gridFitMode, IDWriteRenderingParams3 *renderingParams);
    HRESULT CreateFontCollectionFromFontSet(IDWriteFontSet fontset, IDWriteFontCollection1 *fontCollection);
    HRESULT CreateFontFaceReference(const wchar* filePath, const FILETIME* lastWriteTime, uint faceIndex, DWRITE_FONT_SIMULATIONS fontSimulations, IDWriteFontFaceReference *fontFaceReference);
    HRESULT CreateFontFaceReference(IDWriteFontFile fontFile, uint faceIndex, DWRITE_FONT_SIMULATIONS fontSimulations, IDWriteFontFaceReference *fontFaceReference);
    HRESULT CreateFontSetBuilder(IDWriteFontSetBuilder *fontSetBuilder);
    HRESULT CreateGlyphRunAnalysis(const DWRITE_GLYPH_RUN *glyphRun, const DWRITE_MATRIX *transform, DWRITE_RENDERING_MODE1 renderingMode, DWRITE_MEASURING_MODE measuringMode, DWRITE_GRID_FIT_MODE gridFitMode, DWRITE_TEXT_ANTIALIAS_MODE antialiasMode, float baselineOriginX, float baselineOriginY, IDWriteGlyphRunAnalysis *glyphRunAnalysis);
    HRESULT GetSystemFontCollection(bool includeDownloadableFonts, IDWriteFontCollection1 *fontCollection, bool includeDownloadableFonts = false);
    HRESULT GetFontDownloadQueue(IDWriteFontDownloadQueue *fontDownloadQueue);
    HRESULT GetSystemFontSet(IDWriteFontSet *fontSet);
}

mixin(uuid!(IDWriteFontSet, "53585141-D9F8-4095-8321-D73CF6BD116B"));
public interface IDWriteFontSet : IUnknown
{
extern(Windows):
    uint GetFontCount();
    HRESULT GetFontFaceReference(uint listIndex, IDWriteFontFaceReference *fontFaceReference);
	HRESULT FindFontFace(IDWriteFontFace fontFace, uint *listIndex, bool *exists);
    HRESULT FindFontFaceReference(IDWriteFontFaceReference fontFaceReference, uint *listIndex, bool *exists);
    HRESULT GetPropertyValues(uint listIndex, DWRITE_FONT_PROPERTY_ID propertyId, bool *exists, IDWriteLocalizedStrings *values);
    HRESULT GetPropertyValues(DWRITE_FONT_PROPERTY_ID propertyId, const wchar *preferredLocaleNames, IDWriteStringList *values);
    HRESULT GetPropertyValues(DWRITE_FONT_PROPERTY_ID propertyId, IDWriteStringList *values);
    HRESULT GetPropertyOccurrenceCount(const DWRITE_FONT_PROPERTY *property, uint *propertyOccurrenceCount);
    HRESULT GetMatchingFonts(const wchar *familyName, DWRITE_FONT_WEIGHT fontWeight, DWRITE_FONT_STRETCH fontStretch, DWRITE_FONT_STYLE fontStyle, IDWriteFontSet *filteredSet);
}

mixin(uuid!(IDWriteFontSetBuilder, "2F642AFE-9C68-4F40-B8BE-457401AFCB3D"));
public interface IDWriteFontSetBuilder : IUnknown
{
extern(Windows):
    HRESULT AddFontFaceReference(IDWriteFontFaceReference fontFaceReference);
    HRESULT AddFontFaceReference(IDWriteFontFaceReference fontFaceReference, const DWRITE_FONT_PROPERTY *properties, uint propertyCount);
    HRESULT AddFontSet(IDWriteFontSet fontSet);
    HRESULT CreateFontSet(IDWriteFontSet *fontSet);
}

mixin(uuid!(IDWriteFontCollection1, "53585141-D9F8-4095-8321-D73CF6BD116C"));
public interface IDWriteFontCollection1 : IDWriteFontCollection
{
extern(Windows):
    HRESULT GetFontSet(IDWriteFontSet *fontSet);
    HRESULT GetFontFamily(uint index, IDWriteFontFamily1* fontFamily);
}

mixin(uuid!(IDWriteFontFamily1, "DA20D8EF-812A-4C43-9802-62EC4ABD7ADF"));
public interface IDWriteFontFamily1 : IDWriteFontFamily
{
extern(Windows):
    HRESULT GetFont(uint listIndex, IDWriteFont3 *font);
    DWRITE_LOCALITY GetFontLocality(uint listIndex);
    HRESULT GetFontFaceReference(uint listIndex, IDWriteFontFaceReference *fontFaceReference);
}

mixin(uuid!(IDWriteFontList1, "DA20D8EF-812A-4C43-9802-62EC4ABD7ADE"));
public interface IDWriteFontList1 : IDWriteFontList
{
extern(Windows):
    HRESULT GetFont(uint listIndex, IDWriteFont3 *font);
    DWRITE_LOCALITY GetFontLocality(uint listIndex);
    HRESULT GetFontFaceReference(uint listIndex, IDWriteFontFaceReference *fontFaceReference);
}

mixin(uuid!(IDWriteFontFaceReference, "5E7FA7CA-DDE3-424C-89F0-9FCD6FED58CD"));
public interface IDWriteFontFaceReference : IUnknown
{
extern(Windows):
    HRESULT CreateFontFace(IDWriteFontFace3 *fontFace);
    HRESULT CreateFontFaceWithSimulations(DWRITE_FONT_SIMULATIONS fontFaceSimulationFlags, IDWriteFontFace3 *fontFace);
    HRESULT EnqueueCharacterDownloadRequest(const wchar *characters, uint characterCount);
    HRESULT EnqueueFileFragmentDownloadRequest(ulong fileOffset, ulong fragmentSize);
    HRESULT EnqueueFontDownloadRequest();
    HRESULT EnqueueGlyphDownloadRequest(const ushort *glyphIndices, uint glyphCount);
    ulong GetFileSize();
    HRESULT GetFileTime(FILETIME *lastWriteTime);
    uint GetFontFaceIndex();
    HRESULT GetFontFile(IDWriteFontFile *fontFile);
    ulong GetLocalFileSize();
    DWRITE_LOCALITY GetLocality();
    DWRITE_FONT_SIMULATIONS GetSimulations();
}

mixin(uuid!(IDWriteFont3, "DA20D8EF-812A-4C43-9802-62EC4ABD7ADE"));
public interface IDWriteFont3 : IDWriteFont2
{
extern(Windows):
    HRESULT CreateFontFace(IDWriteFontFace3 *fontFace);
    bool Equals(IDWriteFont font);
    HRESULT GetFontFaceReference(IDWriteFontFaceReference *fontFaceReference);
    DWRITE_LOCALITY GetLocality();
}

mixin(uuid!(IDWriteFontFace3, "D37D7598-09BE-4222-A236-2081341CC1F2"));
public interface IDWriteFontFace3 : IDWriteFontFace2
{
extern(Windows):
    HRESULT AreCharactersLocal(const wchar* characters, uint characterCount, bool enqueueIfNotLocal, bool *isLocal);
    HRESULT AreGlyphsLocal(const ushort* glyphIndices, uint glyphCount, bool enqueueIfNotLocal, bool *isLocal);
    HRESULT GetFontFaceReference(IDWriteFontFaceReference *fontFaceReference);
    void GetPanose(DWRITE_PANOSE *panose);
    DWRITE_FONT_WEIGHT GetWeight();
    DWRITE_FONT_STRETCH GetStretch();
    DWRITE_FONT_STYLE GetStyle();
    HRESULT GetFamilyNames(IDWriteLocalizedStrings *names);
    HRESULT GetFaceNames(IDWriteLocalizedStrings *names);
    HRESULT GetInformationalStrings(DWRITE_INFORMATIONAL_STRING_ID informationalStringID, IDWriteLocalizedStrings *informationalStrings, bool *exists);
    bool HasCharacter(uint unicodeValue);
    HRESULT GetRecommendedRenderingMode(float fontEmSize, float dpiX, float dpiY, const DWRITE_MATRIX *transform, bool isSideways, DWRITE_OUTLINE_THRESHOLD outlineThreshold, DWRITE_MEASURING_MODE measuringMode, IDWriteRenderingParams *renderingParams, DWRITE_RENDERING_MODE1 *renderingMode, DWRITE_GRID_FIT_MODE *gridFitMode);
    bool IsCharacterLocal(uint unicodeValue);
    bool IsGlyphLocal(ushort glyphId);
}

mixin(uuid!(IDWriteStringList, "CFEE3140-1157-47CA-8B85-31BFCF3F2D0E"));
public interface IDWriteStringList : IUnknown
{
extern(Windows):
    uint GetCount();
    HRESULT GetLocaleName(uint listIndex, wchar *localeName, uint size);
    HRESULT GetLocaleNameLength(uint listIndex, uint *length);
    HRESULT GetString(uint listIndex, wchar *stringBuffer, uint stringBufferSize);
    HRESULT GetStringLength(uint listIndex, uint *length);
}

mixin(uuid!(IDWriteFontDownloadListener, "B06FE5B9-43EC-4393-881B-DBE4DC72FDA7"));
public interface IDWriteFontDownloadListener : IUnknown
{
extern(Windows):
    void DownloadCompleted(IDWriteFontDownloadQueue downloadQueue, IUnknown context, HRESULT downloadResult);
}

mixin(uuid!(IDWriteFontDownloadQueue, "B71E6052-5AEA-4FA3-832E-F60D431F7E91"));
public interface IDWriteFontDownloadQueue : IUnknown
{
extern(Windows):
    HRESULT AddListener(IDWriteFontDownloadListener listener, uint *token);
    HRESULT BeginDownload(IUnknown context = null);
    HRESULT CancelDownload();
    ulong GetGenerationCount();
    bool IsEmpty();
    HRESULT RemoveListener(uint token);
}

mixin(uuid!(IDWriteGdiInterop1, "4556BE70-3ABD-4F70-90BE-421780A6F515"));
public interface IDWriteGdiInterop1 : IDWriteGdiInterop
{
extern(Windows):
    HRESULT CreateFontFromLOGFONT(LOGFONTW logFont, IDWriteFontCollection fontCollection, IDWriteFont *font);
    HRESULT GetMatchingFontsByLOGFONT(LOGFONT logFont, IDWriteFontSet fontSet, IDWriteFontSet *filteredSet);
    HRESULT GetFontSignature(IDWriteFont font, FONTSIGNATURE *fontSignature);
    HRESULT GetFontSignature(IDWriteFontFace fontFace, FONTSIGNATURE *fontSignature);
}

mixin(uuid!(IDWriteTextFormat2, "F67E0EDD-9E3D-4ECC-8C32-4183253DFE70"));
public interface IDWriteTextFormat2 : IDWriteTextFormat1
{
extern(Windows):
    HRESULT GetLineSpacing(DWRITE_LINE_SPACING *lineSpacingMethod);
    HRESULT SetLineSpacing(const DWRITE_LINE_SPACING *lineSpacingOptions);
}

mixin(uuid!(IDWriteTextLayout3, "07DDCD52-020E-4DE8-AC33-6C953D83F92D"));
public interface IDWriteTextLayout3 : IDWriteTextLayout2
{
extern(Windows):
    HRESULT GetLineMetrics(DWRITE_LINE_METRICS1 *lineMetrics, uint maxLineCount, uint *actualLineCount);
    HRESULT GetLineSpacing(DWRITE_LINE_SPACING *lineSpacingOptions);
    HRESULT InvalidateLayout();
    HRESULT SetLineSpacing(const DWRITE_LINE_SPACING *lineSpacingOptions);
}

mixin(uuid!(IDWriteColorGlyphRunEnumerator1, "7C5F86DA-C7A1-4F05-B8E1-55A179FE5A35"));
public interface IDWriteColorGlyphRunEnumerator1 : IDWriteColorGlyphRunEnumerator
{
extern(Windows):
    HRESULT GetCurrentRun(DWRITE_COLOR_GLYPH_RUN1 colorGlyphRun);
}

mixin(uuid!(IDWriteFontFace4, "27F2A904-4EB8-441D-9678-0563F53E3E2F"));
public interface IDWriteFontFace4 : IDWriteFontFace3
{
extern(Windows):
    HRESULT GetGlyphImageData(ushort glyphId, uint pixelsPerEm, DWRITE_GLYPH_IMAGE_FORMATS glyphImageFormat, DWRITE_GLYPH_IMAGE_DATA *glyphData, void **glyphDataContext);
    DWRITE_GLYPH_IMAGE_FORMATS GetGlyphImageFormats();
    HRESULT GetGlyphImageFormats(ushort glyphId, uint pixelsPerEmFirst, uint pixelsPerEmLast, DWRITE_GLYPH_IMAGE_FORMATS *glyphImageFormats);
    void ReleaseGlyphImageData(void *glyphDataContext);
}

mixin(uuid!(IDWriteFactory4, "4B0B5BD3-0797-4549-8AC5-FE915CC53856"));
public interface IDWriteFactory4 : IDWriteFactory3
{
extern(Windows):
    HRESULT ComputeGlyphOrigins(DWRITE_GLYPH_RUN glyphRun, DWRITE_MEASURING_MODE measuringMode, D2D1_POINT_2F baselineOrigin, DWRITE_MATRIX worldAndDpiTransform, D2D1_POINT_2F *glyphOrigins);
    HRESULT ComputeGlyphOrigins(DWRITE_GLYPH_RUN glyphRun, D2D1_POINT_2F baselineOrigin, D2D1_POINT_2F *glyphOrigins);
    HRESULT TranslateColorGlyphRun(D2D1_POINT_2F baselineOrigin, DWRITE_GLYPH_RUN glyphRun, DWRITE_GLYPH_RUN_DESCRIPTION glyphRunDescription, DWRITE_GLYPH_IMAGE_FORMATS desiredGlyphImageFormats, DWRITE_MEASURING_MODE measuringMode, DWRITE_MATRIX worldAndDpiTransform, uint colorPaletteIndex, IDWriteColorGlyphRunEnumerator1 *colorLayers);
}

mixin(uuid!(IDWriteFontSetBuilder1, "3FF7715F-3CDC-4DC6-9B72-EC5621DCCAFD"));
public interface IDWriteFontSetBuilder1 : IDWriteFontSetBuilder
{
extern(Windows):
    HRESULT AddFontFile(IDWriteFontFile fontFile);
}

mixin(uuid!(IDWriteAsyncResult, "CE25F8FD-863B-4D13-9651-C1F88DC73FE2"));
public interface IDWriteAsyncResult : IUnknown
{
extern(Windows):
    HRESULT GetResult();
    HANDLE GetWaitHandle();
}

mixin(uuid!(IDWriteRemoteFontFileStream, "4DB3757A-2C72-4ED9-B2B6-1ABABE1AFF9C"));
public interface IDWriteRemoteFontFileStream : IDWriteFontFileStream
{
extern(Windows):
    HRESULT BeginDownload(UUID downloadOperationID, DWRITE_FILE_FRAGMENT fileFragments, uint fragmentCount, IDWriteAsyncResult* asyncResult);
    HRESULT GetFileFragmentLocality(ulong fileOffset, ulong fragmentSize, bool *isLocal, ulong *partialSize);
    HRESULT GetLocalFileSize(ulong *localFileSize);
    DWRITE_LOCALITY GetLocality();
}

mixin(uuid!(IDWriteRemoteFontFileLoader, "68648C83-6EDE-46C0-AB46-20083A887FDE"));
public interface IDWriteRemoteFontFileLoader : IDWriteFontFileLoader
{
extern(Windows):
    HRESULT CreateFontFileReferenceFromUrl(IDWriteFactory factory, const wchar* baseUrl, const wchar* fontFileUrl, IDWriteFontFile *fontFile);
    HRESULT CreateRemoteStreamFromKey(const void *fontFileReferenceKey, uint fontFileReferenceKeySize, IDWriteRemoteFontFileStream *fontFileStream);
    HRESULT GetLocalityFromKey(const void *fontFileReferenceKey, uint fontFileReferenceKeySize, DWRITE_LOCALITY *locality);
}

mixin(uuid!(IDWriteInMemoryFontFileLoader, "DC102F47-A12D-4B1C-822D-9E117E33043F"));
public interface IDWriteInMemoryFontFileLoader : IDWriteFontFileLoader
{
extern(Windows):
    HRESULT CreateInMemoryFontFileReference(IDWriteFactory factory, const void *fontData, uint fontDataSize, IUnknown ownerObject, IDWriteFontFile *fontFile);
    uint GetFileCount();
}

mixin(uuid!(IDWriteFactory5, "958DB99A-BE2A-4F09-AF7D-65189803D1D3"));
public interface IDWriteFactory5 : IDWriteFactory4
{
extern(Windows):
    DWRITE_CONTAINER_TYPE AnalyzeContainerType(void *fileData, uint fileDataSize);
    HRESULT CreateFontSetBuilder(IDWriteFontSetBuilder1 *fontSetBuilder);
    HRESULT CreateHttpFontFileLoader(const wchar *referrerUrl, const wchar *extraHeaders, IDWriteRemoteFontFileLoader *newLoader);
    HRESULT CreateInMemoryFontFileLoader(IDWriteInMemoryFontFileLoader *newLoader);
    HRESULT UnpackFontFile(DWRITE_CONTAINER_TYPE containerType, void *fileData, uint fileDataSize, IDWriteFontFileStream *unpackedFontStream);
}

mixin(uuid!(IDWriteFactory6, "F3744D80-21F7-42EB-B35D-995BC72FC223"));
interface IDWriteFactory6 : IDWriteFactory5
{
    HRESULT CreateFontFaceReference(IDWriteFontFile fontFile, uint faceIndex, DWRITE_FONT_SIMULATIONS fontSimulations, const DWRITE_FONT_AXIS_VALUE* fontAxisValues, uint fontAxisValueCount, IDWriteFontFaceReference1* fontFaceReference);
    HRESULT CreateFontResource(IDWriteFontFile fontFile, uint faceIndex, IDWriteFontResource* fontResource);
    HRESULT GetSystemFontSet(bool includeDownloadableFonts, IDWriteFontSet1* fontSet);
    HRESULT GetSystemFontCollection( bool includeDownloadableFonts, DWRITE_FONT_FAMILY_MODEL fontFamilyModel, IDWriteFontCollection2* fontCollection);
    HRESULT CreateFontCollectionFromFontSet(IDWriteFontSet* fontSet, DWRITE_FONT_FAMILY_MODEL fontFamilyModel, IDWriteFontCollection2* fontCollection);
    HRESULT CreateFontSetBuilder(IDWriteFontSetBuilder2* fontSetBuilder);
    HRESULT CreateTextFormat(const wchar* fontFamilyName, IDWriteFontCollection fontCollection, const DWRITE_FONT_AXIS_VALUE* fontAxisValues, uint fontAxisValueCount, float fontSize, const wchar* localeName, IDWriteTextFormat3* textFormat);
}


mixin(uuid!(IDWriteFontFace5, "98EFF3A5-B667-479A-B145-E2FA5B9FDC29"));
interface IDWriteFontFace5 : IDWriteFontFace4
{
    uint GetFontAxisValueCount();
    HRESULT GetFontAxisValues(DWRITE_FONT_AXIS_VALUE* fontAxisValues, uint fontAxisValueCount);
    bool HasVariations();
    HRESULT GetFontResource(IDWriteFontResource* fontResource);
    bool Equals(IDWriteFontFace* fontFace);
}

mixin(uuid!(IDWriteFontResource, "1F803A76-6871-48E8-987F-B975551C50F2"));
interface IDWriteFontResource : IUnknown
{
    HRESULT GetFontFile(IDWriteFontFile* fontFile);
    uint GetFontFaceIndex();
    uint GetFontAxisCount();
    HRESULT GetDefaultFontAxisValues(DWRITE_FONT_AXIS_VALUE* fontAxisValues, uint fontAxisValueCount);
    HRESULT GetFontAxisRanges(DWRITE_FONT_AXIS_RANGE* fontAxisRanges, uint fontAxisRangeCount);
    DWRITE_FONT_AXIS_ATTRIBUTES GetFontAxisAttributes(uint axisIndex);
    HRESULT GetAxisNames(uint axisIndex, IDWriteLocalizedStrings* names);
    uint GetAxisValueNameCount(uint axisIndex);
    HRESULT GetAxisValueNames(uint axisIndex, uint axisValueIndex, DWRITE_FONT_AXIS_RANGE* fontAxisRange, IDWriteLocalizedStrings* names);
    bool HasVariations();
    HRESULT CreateFontFace( DWRITE_FONT_SIMULATIONS fontSimulations, const DWRITE_FONT_AXIS_VALUE* fontAxisValues, uint fontAxisValueCount, IDWriteFontFace5* fontFace);
    HRESULT CreateFontFaceReference(DWRITE_FONT_SIMULATIONS fontSimulations, const DWRITE_FONT_AXIS_VALUE* fontAxisValues, uint fontAxisValueCount, IDWriteFontFaceReference1* fontFaceReference );
}

mixin(uuid!(IDWriteFontFaceReference1, "C081FE77-2FD1-41AC-A5A3-34983C4BA61A"));
interface IDWriteFontFaceReference1 : IDWriteFontFaceReference
{
    HRESULT CreateFontFace(IDWriteFontFace5* fontFace);
    uint GetFontAxisValueCount();
    HRESULT GetFontAxisValues(DWRITE_FONT_AXIS_VALUE* fontAxisValues, uint fontAxisValueCount);
}

mixin(uuid!(IDWriteFontSetBuilder2, "EE5BA612-B131-463C-8F4F-3189B9401E45"));
interface IDWriteFontSetBuilder2 : IDWriteFontSetBuilder1
{
    HRESULT AddFont(IDWriteFontFile fontFile, uint fontFaceIndex, DWRITE_FONT_SIMULATIONS fontSimulations, const DWRITE_FONT_AXIS_VALUE* fontAxisValues, uint fontAxisValueCount, const DWRITE_FONT_AXIS_RANGE* fontAxisRanges, uint fontAxisRangeCount, const DWRITE_FONT_PROPERTY* properties, uint propertyCount);
    HRESULT AddFontFile(const wchar* filePath);
}


mixin(uuid!(IDWriteFontSet1, "7E9FDA85-6C92-4053-BC47-7AE3530DB4D3"));
interface IDWriteFontSet1 : IDWriteFontSet
{
    HRESULT GetMatchingFonts(const DWRITE_FONT_PROPERTY* fontProperty, const DWRITE_FONT_AXIS_VALUE* fontAxisValues, uint fontAxisValueCount, IDWriteFontSet1* matchingFonts);
    HRESULT GetFirstFontResources(IDWriteFontSet1* filteredFontSet);
    HRESULT GetFilteredFonts(const DWRITE_FONT_PROPERTY* properties, uint propertyCount, bool selectAnyProperty, IDWriteFontSet1* filteredFontSet);
    HRESULT GetFilteredFonts(const DWRITE_FONT_AXIS_RANGE* fontAxisRanges, uint fontAxisRangeCount, bool selectAnyRange, IDWriteFontSet1* filteredFontSet);
    HRESULT GetFilteredFonts(const uint* indices, uint indexCount, IDWriteFontSet1* filteredFontSet);
    HRESULT GetFilteredFontIndices(const DWRITE_FONT_PROPERTY* properties, uint propertyCount, bool selectAnyProperty, uint* indices, uint maxIndexCount, uint* actualIndexCount);
    HRESULT GetFilteredFontIndices(const DWRITE_FONT_AXIS_RANGE* fontAxisRanges, uint fontAxisRangeCount, bool selectAnyRange, uint* indices, uint maxIndexCount, uint* actualIndexCount);
    HRESULT GetFontAxisRanges(DWRITE_FONT_AXIS_RANGE* fontAxisRanges, uint maxFontAxisRangeCount, uint* actualFontAxisRangeCount);
    HRESULT GetFontAxisRanges(uint listIndex, DWRITE_FONT_AXIS_RANGE* fontAxisRanges, uint maxFontAxisRangeCount, uint* actualFontAxisRangeCount);
    HRESULT GetFontFaceReference(uint listIndex, IDWriteFontFaceReference1* fontFaceReference);
    HRESULT CreateFontResource(uint listIndex, IDWriteFontResource* fontResource );
    HRESULT CreateFontFace(uint listIndex, IDWriteFontFace5* fontFace);
    DWRITE_LOCALITY GetFontLocality(uint listIndex);
}

mixin(uuid!(IDWriteFontList2, "C0763A34-77AF-445A-B735-08C37B0A5BF5"));
interface IDWriteFontList2 : IDWriteFontList1
{
    HRESULT GetFontSet(IDWriteFontSet1* fontSet);
}

mixin(uuid!(IDWriteFontFamily2, "3ED49E77-A398-4261-B9CF-C126C2131EF3"));
interface IDWriteFontFamily2 : IDWriteFontFamily1
{
    HRESULT GetMatchingFonts(const DWRITE_FONT_AXIS_VALUE* fontAxisValues, uint fontAxisValueCount, IDWriteFontList2* matchingFonts);
    HRESULT GetFontSet(IDWriteFontSet1* fontSet);
}

mixin(uuid!(IDWriteFontCollection2, "514039C6-4617-4064-BF8B-92EA83E506E0"));
interface IDWriteFontCollection2 : IDWriteFontCollection1
{
    HRESULT GetFontFamily(uint index, IDWriteFontFamily2* fontFamily);
    HRESULT GetMatchingFonts(const wchar* familyName, const DWRITE_FONT_AXIS_VALUE* fontAxisValues, uint fontAxisValueCount, IDWriteFontList2* fontList);
    DWRITE_FONT_FAMILY_MODEL GetFontFamilyModel();
    HRESULT GetFontSet(IDWriteFontSet1* fontSet);
}

mixin(uuid!(IDWriteTextLayout4, "05A9BF42-223F-4441-B5FB-8263685F55E9"));
interface IDWriteTextLayout4 : IDWriteTextLayout3
{
    HRESULT SetFontAxisValues(const DWRITE_FONT_AXIS_VALUE* fontAxisValues, uint fontAxisValueCount, DWRITE_TEXT_RANGE textRange);
    uint GetFontAxisValueCount(uint currentPosition);
    HRESULT GetFontAxisValues(uint currentPosition, DWRITE_FONT_AXIS_VALUE* fontAxisValues, uint fontAxisValueCount, DWRITE_TEXT_RANGE* textRange = null);
    HRESULT SetAutomaticFontAxes(DWRITE_AUTOMATIC_FONT_AXES automaticFontAxes);
}

mixin(uuid!(IDWriteTextFormat3, "6D3B5641-E550-430D-A85B-B7BF48A93427"));
interface IDWriteTextFormat3 : IDWriteTextFormat2
{
    HRESULT SetFontAxisValues(const DWRITE_FONT_AXIS_VALUE* fontAxisValues, uint fontAxisValueCount);
    uint GetFontAxisValueCount();
    HRESULT GetFontAxisValues(DWRITE_FONT_AXIS_VALUE* fontAxisValues, uint fontAxisValueCount);
    DWRITE_AUTOMATIC_FONT_AXES GetAutomaticFontAxes();
    HRESULT SetAutomaticFontAxes(DWRITE_AUTOMATIC_FONT_AXES automaticFontAxes);
}

mixin(uuid!(IDWriteFontFallback1, "2397599D-DD0D-4681-BD6A-F4F31EAADE77"));
interface IDWriteFontFallback1 : IDWriteFontFallback
{
    HRESULT MapCharacters(IDWriteTextAnalysisSource analysisSource, uint textPosition, uint textLength, IDWriteFontCollection baseFontCollection, const wchar* baseFamilyName, const DWRITE_FONT_AXIS_VALUE* fontAxisValues, uint fontAxisValueCount, uint* mappedLength, float* scale, IDWriteFontFace5* mappedFontFace);
}