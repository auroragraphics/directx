module aurora.directx.dwrite.dwrite_0;

version(Windows):

public import std.bitmanip;
public import aurora.directx.com;
public import aurora.directx.d2d1;

///
/// Constants
///

///
/// Functions
///

public extern(C) HRESULT DWriteCreateFactory(DWRITE_FACTORY_TYPE FactoryType, GUID IID, IUnknown* Factory);

uint DWRITE_MAKE_OPENTYPE_TAG(char a, char b, char c, char d) {
	return ((cast(uint)(cast(ubyte)d) << 24) | (cast(uint)(cast(ubyte)c) << 16) | (cast(uint)(cast(ubyte)b) << 8) | cast(uint)(cast(ubyte)a));
}
alias DWRITE_MAKE_OPENTYPE_TAG DWRITE_MAKE_FONT_FEATURE_TAG;

///
/// Enumerations
///

public enum DWRITE_BREAK_CONDITION : int {  
	NEUTRAL        = 0, 
	CAN_BREAK      = 1, 
	MAY_NOT_BREAK  = 2, 
	MUST_BREAK     = 3,	
}

public enum DWRITE_FACTORY_TYPE : int { 
	SHARED,
	ISOLATED,
}

public enum DWRITE_FLOW_DIRECTION {  
	TOP_TO_BOTTOM, 
	FORWARD, 
	BACKWARD       = FORWARD, 
	LEFT_TO_RIGHT  = FORWARD, 
	RIGHT_TO_LEFT  = BACKWARD,		
}

public enum DWRITE_FONT_FACE_TYPE : int {  
	CFF, 
	RAW_CFF, 
	TRUETYPE, 
	TRUETYPE_COLLECTION, 
	TYPE1, 
	VECTOR, 
	BITMAP, 
	UNKNOWN,	
}

public enum DWRITE_FONT_FEATURE_TAG : int {  
	DEFAULT                           = 0x746c6664, 
	VERTICAL_WRITING                  = 0x74726576, 
	VERTICAL_ALTERNATES_AND_ROTATION  = 0x32747276, 
	ALTERNATIVE_FRACTIONS             = 0x63726661, 
	PETITE_CAPITALS_FROM_CAPITALS     = 0x63703263, 
	SMALL_CAPITALS_FROM_CAPITALS      = 0x63733263, 
	CONTEXTUAL_ALTERNATES             = 0x746c6163, 
	CASE_SENSITIVE_FORMS              = 0x65736163, 
	GLYPH_COMPOSITION_DECOMPOSITION   = 0x706d6363, 
	CONTEXTUAL_LIGATURES              = 0x67696c63, 
	CAPITAL_SPACING                   = 0x70737063, 
	CONTEXTUAL_SWASH                  = 0x68777363, 
	CURSIVE_POSITIONING               = 0x73727563, 
	DISCRETIONARY_LIGATURES           = 0x67696c64, 
	EXPERT_FORMS                      = 0x74707865, 
	FRACTIONS                         = 0x63617266, 
	FULL_WIDTH                        = 0x64697766, 
	HALF_FORMS                        = 0x666c6168, 
	HALANT_FORMS                      = 0x6e6c6168, 
	ALTERNATE_HALF_WIDTH              = 0x746c6168, 
	HISTORICAL_FORMS                  = 0x74736968, 
	HORIZONTAL_KANA_ALTERNATES        = 0x616e6b68, 
	HISTORICAL_LIGATURES              = 0x67696c68, 
	HALF_WIDTH                        = 0x64697768, 
	HOJO_KANJI_FORMS                  = 0x6f6a6f68, 
	JIS04_FORMS                       = 0x3430706a, 
	JIS78_FORMS                       = 0x3837706a, 
	JIS83_FORMS                       = 0x3338706a, 
	JIS90_FORMS                       = 0x3039706a, 
	KERNING                           = 0x6e72656b, 
	STANDARD_LIGATURES                = 0x6167696c, 
	LINING_FIGURES                    = 0x6d756e6c, 
	LOCALIZED_FORMS                   = 0x6c636f6c, 
	MARK_POSITIONING                  = 0x6b72616d, 
	MATHEMATICAL_GREEK                = 0x6b72676d, 
	MARK_TO_MARK_POSITIONING          = 0x6b6d6b6d, 
	ALTERNATE_ANNOTATION_FORMS        = 0x746c616e, 
	NLC_KANJI_FORMS                   = 0x6b636c6e, 
	OLD_STYLE_FIGURES                 = 0x6d756e6f, 
	ORDINALS                          = 0x6e64726f, 
	PROPORTIONAL_ALTERNATE_WIDTH      = 0x746c6170, 
	PETITE_CAPITALS                   = 0x70616370, 
	PROPORTIONAL_FIGURES              = 0x6d756e70, 
	PROPORTIONAL_WIDTHS               = 0x64697770, 
	QUARTER_WIDTHS                    = 0x64697771, 
	REQUIRED_LIGATURES                = 0x67696c72, 
	RUBY_NOTATION_FORMS               = 0x79627572, 
	STYLISTIC_ALTERNATES              = 0x746c6173, 
	SCIENTIFIC_INFERIORS              = 0x666e6973, 
	SMALL_CAPITALS                    = 0x70636d73, 
	SIMPLIFIED_FORMS                  = 0x6c706d73, 
	STYLISTIC_SET_1                   = 0x31307373, 
	STYLISTIC_SET_2                   = 0x32307373, 
	STYLISTIC_SET_3                   = 0x33307373, 
	STYLISTIC_SET_4                   = 0x34307373, 
	STYLISTIC_SET_5                   = 0x35307373, 
	STYLISTIC_SET_6                   = 0x36307373, 
	STYLISTIC_SET_7                   = 0x37307373, 
	STYLISTIC_SET_8                   = 0x38307373, 
	STYLISTIC_SET_9                   = 0x39307373, 
	STYLISTIC_SET_10                  = 0x30317373, 
	STYLISTIC_SET_11                  = 0x31317373, 
	STYLISTIC_SET_12                  = 0x32317373, 
	STYLISTIC_SET_13                  = 0x33317373, 
	STYLISTIC_SET_14                  = 0x34317373, 
	STYLISTIC_SET_15                  = 0x35317373, 
	STYLISTIC_SET_16                  = 0x36317373, 
	STYLISTIC_SET_17                  = 0x37317373, 
	STYLISTIC_SET_18                  = 0x38317373, 
	STYLISTIC_SET_19                  = 0x39317373, 
	STYLISTIC_SET_20                  = 0x30327373, 
	SUBSCRIPT                         = 0x73627573, 
	SUPERSCRIPT                       = 0x73707573, 
	SWASH                             = 0x68737773, 
	TITLING                           = 0x6c746974, 
	TRADITIONAL_NAME_FORMS            = 0x6d616e74, 
	TABULAR_FIGURES                   = 0x6d756e74, 
	TRADITIONAL_FORMS                 = 0x64617274, 
	THIRD_WIDTHS                      = 0x64697774, 
	UNICASE                           = 0x63696e75, 
	SLASHED_ZERO                      = 0x6f72657a,		
}

public enum DWRITE_FONT_FILE_TYPE : int {  
	UNKNOWN, 
	CFF, 
	TRUETYPE, 
	TRUETYPE_COLLECTION, 
	TYPE1_PFM, 
	TYPE1_PFB, 
	VECTOR, 
	BITMAP,
}

public enum DWRITE_FONT_SIMULATIONS : int {  
	NONE     = 0x0000, 
	BOLD     = 0x0001, 
	OBLIQUE  = 0x0002,	
}

public enum DWRITE_FONT_STRETCH : int {  
	UNDEFINED        = 0, 
	ULTRA_CONDENSED  = 1, 
	EXTRA_CONDENSED  = 2, 
	CONDENSED        = 3, 
	SEMI_CONDENSED   = 4, 
	NORMAL           = 5, 
	MEDIUM           = 5, 
	SEMI_EXPANDED    = 6, 
	EXPANDED         = 7, 
	EXTRA_EXPANDED   = 8, 
	ULTRA_EXPANDED   = 9,	
}

public enum DWRITE_FONT_STYLE : int {  
	NORMAL, 
	OBLIQUE, 
	ITALIC,	
}

public enum DWRITE_FONT_WEIGHT : int {  
	THIN         = 100, 
	EXTRA_LIGHT  = 200, 
	ULTRA_LIGHT  = 200, 
	LIGHT        = 300, 
	SEMI_LIGHT   = 350, 
	NORMAL       = 400, 
	REGULAR      = 400, 
	MEDIUM       = 500, 
	DEMI_BOLD    = 600, 
	SEMI_BOLD    = 600, 
	BOLD         = 700, 
	EXTRA_BOLD   = 800, 
	ULTRA_BOLD   = 800, 
	BLACK        = 900, 
	HEAVY        = 900, 
	EXTRA_BLACK  = 950, 
	ULTRA_BLACK  = 950,	
}

public enum DWRITE_INFORMATIONAL_STRING_ID : int {  
	NONE, 
	COPYRIGHT_NOTICE, 
	VERSION_STRINGS, 
	TRADEMARK, 
	MANUFACTURER, 
	DESIGNER, 
	DESIGNER_URL, 
	DESCRIPTION, 
	FONT_VENDOR_URL, 
	FULL_NAME, 
	LICENSE_DESCRIPTION, 
	LICENSE_INFO_URL, 
	WIN32_FAMILY_NAMES, 
	WIN32_SUBFAMILY_NAMES, 
	PREFERRED_FAMILY_NAMES, 
	PREFERRED_SUBFAMILY_NAMES, 
	SAMPLE_TEXT, 
	POSTSCRIPT_NAME, 
	POSTSCRIPT_CID_NAME,	
}

public enum DWRITE_LINE_SPACING_METHOD : int {  
	DEFAULT, 
	UNIFORM,		
}

public enum DWRITE_MEASURING_MODE : int {  
	NATURAL, 
	GDI_CLASSIC, 
	GDI_NATURAL,	
}

public enum DWRITE_NUMBER_SUBSTITUTION_METHOD {  
	FROM_CULTURE, 
	CONTEXTUAL, 
	NONE, 
	NATIONAL, 
	TRADITIONAL,	
}

public enum DWRITE_PARAGRAPH_ALIGNMENT : int {  
	NEAR, 
	FAR, 
	CENTER,	
}

public enum DWRITE_PIXEL_GEOMETRY : int {  
	FLAT, 
	RGB, 
	BGR,	
}

public enum DWRITE_READING_DIRECTION : int {  
	LEFT_TO_RIGHT, 
	RIGHT_TO_LEFT, 
	TOP_TO_BOTTOM, 
	BOTTOM_TO_TOP,		
}

public enum DWRITE_RENDERING_MODE : int {  
	DEFAULT, 
	ALIASED, 
	GDI_CLASSIC, 
	GDI_NATURAL, 
	NATURAL, 
	NATURAL_SYMMETRIC, 
	CLEARTYPE_GDI_CLASSIC = GDI_CLASSIC, 
	CLEARTYPE_GDI_NATURAL = GDI_NATURAL, 
	CLEARTYPE_NATURAL = NATURAL, 
	CLEARTYPE_NATURAL_SYMMETRIC = NATURAL_SYMMETRIC, 
	OUTLINE,	
}

public enum DWRITE_SCRIPT_SHAPES : int {  
	DEFAULT    = 0, 
	NO_VISUAL  = 1,	
}

public enum DWRITE_TEXT_ALIGNMENT : int {  
	LEADING, 
	TRAILING, 
	CENTER, 
	JUSTIFIED,	
}

public enum DWRITE_TEXTURE_TYPE : int {  
	DWRITE_TEXTURE_ALIASED_1x1, 
	DWRITE_TEXTURE_CLEARTYPE_3x1,	
}

public enum DWRITE_TRIMMING_GRANULARITY : int {  
	NONE, 
	CHARACTER, 
	WORD,	
}

public enum DWRITE_WORD_WRAPPING : int {  
	WRAP, 
	NO_WRAP, 
	EMERGENCY_BREAK, 
	WHOLE_WORD, 
	CHARACTER,	
}

///
/// Structures
///

public struct DWRITE_CLUSTER_METRICS {
	float  width;
	ushort length;
	mixin(bitfields!(
		ushort, "canWrapLineAfter", 1,
		ushort, "isWhitespace", 1,
		ushort, "isNewline", 1,
		ushort, "isSoftHyphen", 1,
		ushort, "isRightToLeft", 1,
		ushort, "padding", 11));
}

public struct DWRITE_FONT_FEATURE {
	DWRITE_FONT_FEATURE_TAG nameTag;
	uint                  parameter;
}

public struct DWRITE_FONT_METRICS {
	ushort designUnitsPerEm;
	ushort ascent;
	ushort descent;
	short  lineGap;
	ushort capHeight;
	ushort xHeight;
	short  underlinePosition;
	ushort underlineThickness;
	short  strikethroughPosition;
	ushort strikethroughThickness;
}

public struct DWRITE_GLYPH_METRICS {
	int  leftSideBearing;
	uint advanceWidth;
	int  rightSideBearing;
	int  topSideBearing;
	uint advanceHeight;
	int  bottomSideBearing;
	int  verticalOriginY;
}

public struct DWRITE_GLYPH_OFFSET {
	float advanceOffset;
	float ascenderOffset;
}

public struct DWRITE_GLYPH_RUN {
	IDWriteFontFace fontFace;
	float fontEmSize;
	uint glyphCount;
	const ushort *glyphIndices;
	const float *glyphAdvances;
	const DWRITE_GLYPH_OFFSET *glyphOffsets;
	bool isSideways;
	uint bidiLevel;
}

public struct DWRITE_GLYPH_RUN_DESCRIPTION {
	const wchar  *localeName;
	const wchar  *string;
	uint       stringLength;
	const short *clusterMap;
	uint       textPosition;
}

public struct DWRITE_HIT_TEST_METRICS {
	uint textPosition;
	uint length;
	float  left;
	float  top;
	float  width;
	float  height;
	uint bidiLevel;
	bool   isText;
	bool   isTrimmed;
}

public struct DWRITE_INLINE_OBJECT_METRICS {
	float width;
	float height;
	float baseline;
	bool  supportsSideways;
}

public struct DWRITE_LINE_BREAKPOINT {
	mixin(bitfields!(
		ubyte, "breakConditionBefore", 2,
		ubyte, "breakConditionAfter", 2,
		ubyte, "isWhitespace", 1,
		ubyte, "isSoftHyphen", 1,
		ubyte, "padding", 2));
}

public struct DWRITE_LINE_METRICS {
	uint length;
	uint trailingWhitespaceLength;
	uint newlineLength;
	float height;
	float baseline;
	bool   isTrimmed;
}

public struct DWRITE_MATRIX {
	float m11;
	float m12;
	float m21;
	float m22;
	float dx;
	float dy;
}

public struct DWRITE_OVERHANG_METRICS {
	float left;
	float top;
	float right;
	float bottom;
}

public struct DWRITE_SCRIPT_ANALYSIS {
	ushort               script;
	DWRITE_SCRIPT_SHAPES shapes;
}

public struct DWRITE_SHAPING_GLYPH_PROPERTIES {
	mixin(bitfields!(
		ushort, "justification", 4,
		ushort, "isClusterStart", 1,
		ushort, "isDiacritic", 1,
		ushort, "isZeroWidthSpace", 1,
		ushort, "reserved", 9));
}

public struct DWRITE_SHAPING_TEXT_PROPERTIES {
	mixin(bitfields!(
		ushort, "isShapedAlone", 1,
		ushort, "reserved", 15));
}

public struct DWRITE_STRIKETHROUGH {
	float                    width;
	float                    thickness;
	float                    offset;
	DWRITE_READING_DIRECTION readingDirection;
	DWRITE_FLOW_DIRECTION    flowDirection;
	const wchar              *localeName;
	DWRITE_MEASURING_MODE    measuringMode;
}

public struct DWRITE_TEXT_METRICS {
	float left;
	float top;
	float width;
	float widthIncludingTrailingWhitespace;
	float height;
	float layoutWidth;
	float layoutHeight;
	uint maxBidiReorderingDepth;
	uint lineCount;
}

public struct DWRITE_TEXT_RANGE {
	uint startPosition;
	uint length;
}

public struct DWRITE_TRIMMING {
	DWRITE_TRIMMING_GRANULARITY granularity;
	uint                      delimiter;
	uint                      delimiterCount;
}

public struct DWRITE_TYPOGRAPHIC_FEATURES {
	DWRITE_FONT_FEATURE *features;
	uint              featureCount;
}

public struct DWRITE_UNDERLINE {
	float                    width;
	float                    thickness;
	float                    offset;
	float                    runHeight;
	DWRITE_READING_DIRECTION readingDirection;
	DWRITE_FLOW_DIRECTION    flowDirection;
	const wchar              *localeName;
	DWRITE_MEASURING_MODE    measuringMode;
}

///
/// Interfaces
///

alias ID2D1SimplifiedGeometrySink IDWriteGeometrySink;

mixin(uuid!(IDWriteBitmapRenderTarget, "5e5a32a3-8dff-4773-9ff6-0696eab77267"));
public interface IDWriteBitmapRenderTarget : IUnknown
{
extern(Windows):
	HRESULT DrawGlyphRun(float BaselineOriginX, float BaselineOriginY, DWRITE_MEASURING_MODE MeasuringMode, const DWRITE_GLYPH_RUN* GlyphRun, IDWriteRenderingParams RenderingParams, COLORREF TextColor, RECT* BlackBoxRect);
	HRESULT GetCurrentTransform(DWRITE_MATRIX* Transform);
	HDC GetMemoryDC();
	float GetPixelsPerDIP();
	HRESULT GetSize(SIZE* Size);
	HRESULT Resize(uint Width, uint Height);
	HRESULT SetCurrentTransform(const DWRITE_MATRIX* Transform);
	HRESULT SetPixelsPerDIP(float PixelsPerDIP);
}

mixin(uuid!(IDWriteFont, "acd16696-8c14-4f5d-877e-fe3fc1d32737"));
public interface IDWriteFont : IUnknown
{
extern(Windows):
	HRESULT CreateFontFace(IDWriteFontFace* FontFace);
	HRESULT GetFaceNames(IDWriteLocalizedStrings* Names);
	HRESULT GetFontFamily(IDWriteFontFamily* FontFamily);
	HRESULT GetInformationalStrings(DWRITE_INFORMATIONAL_STRING_ID InformationalStringID, IDWriteLocalizedStrings* InformationalStrings, bool* Exists);
	HRESULT GetMetrics(DWRITE_FONT_METRICS* FontMetrics);
	DWRITE_FONT_SIMULATIONS GetSimulations();
	DWRITE_FONT_STRETCH GetStretch();
	DWRITE_FONT_STYLE GetStyle();
	DWRITE_FONT_WEIGHT GetWeight();
	HRESULT HasCharacter(uint UnicodeValue, bool* Exists);
	bool IsSymbolFont();
}

mixin(uuid!(IDWriteFontCollection, "a84cee02-3eea-4eee-a827-87c1a02a0fcc"));
public interface IDWriteFontCollection : IUnknown
{
extern(Windows):
	HRESULT FindFamilyName(const wchar* FamilyName, uint* Index, bool* Exists);
	HRESULT GetFontFamily(uint Index, IDWriteFontFamily* FontFamily);
	uint GetFontFamilyCount();
	HRESULT GetFontFromFontFace(IDWriteFontFace* FontFace, IDWriteFont* Font);
}

mixin(uuid!(IDWriteFontCollectionLoader, "cca920e4-52f0-492b-bfa8-29c72ee0a468"));
public interface IDWriteFontCollectionLoader : IUnknown
{
extern(Windows):
	HRESULT CreateEnumeratorFromKey(IDWriteFactory Factory, const void* CollectionKey, uint CollectionKeySize, IDWriteFontFileEnumerator* FontFileEnumerator);
}

mixin(uuid!(IDWriteFontFace, "5f49804d-7024-4d43-bfa9-d25984f53849"));
public interface IDWriteFontFace : IUnknown
{
extern(Windows):
	HRESULT GetDesignGlyphMetrics(const(uint*) Indices, uint Count, DWRITE_GLYPH_METRICS* Metrics, bool IsSideways);
	HRESULT GetFiles(uint* NumberOfFiles, IDWriteFontFile* Files = null);
	HRESULT GetGdiCompatibleGlyphMetrics(float EMSize, float PixelsPerDIP, const(DWRITE_MATRIX*) Transform, bool UseGDINatural, const(ushort*) Indices, uint Count, DWRITE_GLYPH_METRICS* Metrics, bool IsSideways);	
	HRESULT GetGdiCompatibleMetrics(float EMSize, float PixelsPerDIP, const(DWRITE_MATRIX*) Transform, DWRITE_FONT_METRICS* FontFaceMetrics);
	ushort GetGlyphCount();
	HRESULT GetGlyphRunOutline(float EMSize, ushort* Indices, float* Advances, DWRITE_GLYPH_OFFSET* Offsets, uint Count, bool IsSideways, bool RightToLeft, IDWriteGeometrySink GeometrySink);
	uint GetIndex();
	void GetMetrics(DWRITE_FONT_METRICS* FontFaceMetrics);
	HRESULT GetRecommendedRenderingMode(float EMSize, float PixelsPerDIP, DWRITE_MEASURING_MODE MeasuringMode, IDWriteRenderingParams RenderingParams, DWRITE_RENDERING_MODE* RenderingMode);
	DWRITE_FONT_SIMULATIONS GetSimulations();
	DWRITE_FONT_FACE_TYPE GetType();
	bool IsSymbolFont();
	void ReleaseFontTable(void* TableContext);
}

mixin(uuid!(IDWriteFontFamily, "da20d8ef-812a-4c43-9802-62ec4abd7add"));
public interface IDWriteFontFamily : IUnknown
{
extern(Windows):
	HRESULT GetFamilyNames(IDWriteLocalizedStrings* Names);
	HRESULT GetFirstMatchingFont(DWRITE_FONT_WEIGHT Weight, DWRITE_FONT_STRETCH Stretch, DWRITE_FONT_STYLE Style, IDWriteFont* MatchingFont);
	HRESULT GetMatchingFonts(DWRITE_FONT_WEIGHT Weight, DWRITE_FONT_STRETCH Stretch, DWRITE_FONT_STYLE Style, IDWriteFontList* MatchingFont);
}

mixin(uuid!(IDWriteFontFile, "739d886a-cef5-47dc-8769-1a8b41bebbb0"));
public interface IDWriteFontFile : IUnknown
{
extern(Windows):
	HRESULT Analyse(bool* IsSupportedFontType, DWRITE_FONT_FILE_TYPE FileType, DWRITE_FONT_FACE_TYPE FaceType, uint NumberOfFaces);
	HRESULT GetLoader(IDWriteFontFileLoader* Loader);
	HRESULT GetReferenceKey(const(void**) Key, uint KeySize);
}

mixin(uuid!(IDWriteFontFileEnumerator, "72755049-5ff7-435d-8348-4be97cfa6c7c"));
public interface IDWriteFontFileEnumerator : IUnknown
{
extern(Windows):
	HRESULT GetCurrentFontFile(IDWriteFontFile* FontFile);
	HRESULT MoveNext(bool* HasCurrentFile);
}

mixin(uuid!(IDWriteFontFileLoader, "727cad4e-d6af-4c9e-8a08-d695b11caa49"));
public interface IDWriteFontFileLoader : IUnknown
{
extern(Windows):
	HRESULT CreateStreamFromKey(const(void*) Key, uint KeySize, IDWriteFontFileStream* Stream);
}

mixin(uuid!(IDWriteFontFileStream, "6d4865fe-0ab8-4d91-8f62-5dd6be34a3e0"));
public interface IDWriteFontFileStream : IUnknown
{
extern(Windows):
	HRESULT GetFileSize(ulong* Size);
	HRESULT GetLastWriteTime(ulong* WriteTime);
	HRESULT ReadFileFragment(const(void**) Start, ulong Offset, ulong Size, void** Context);
	HRESULT ReleaseFileFragment(void* Context);
}

mixin(uuid!(IDWriteFontList, "1a0d8438-1d97-4ec1-aef9-a2fb86ed6acb"));
public interface IDWriteFontList : IUnknown
{
extern(Windows):
	HRESULT GetFont(uint Index, IDWriteFont* Font);
	HRESULT GetFontCollection(IDWriteFontCollection* FontCollection);
	uint GetFontCount();
}

mixin(uuid!(IDWriteGdiInterop, "1edd9491-9853-4299-898f-6432983b6f3a"));
public interface IDWriteGdiInterop : IUnknown
{
extern(Windows):
	HRESULT ConvertFontToLOGFONT(IDWriteFont Font, LOGFONTW* LogFont, bool* IsSystemFont);
	HRESULT ConvertFontFaceToLOGFONT(IDWriteFontFace Font, LOGFONTW* LogFont);
	HRESULT CreateBitmapRenderTarget(HDC HDC, uint Width, uint Height, IDWriteBitmapRenderTarget* RenderTarget);
	HRESULT CreateFontFaceFromHdc(HDC HDC, IDWriteFontFace * FontFace);
	HRESULT CreateFontFromLOGFONT(const LOGFONTW* LogFont, IDWriteFont* Font);
}

mixin(uuid!(IDWriteGlyphRunAnalysis, "7d97dbf7-e085-42d4-81e3-6a883bded118"));
public interface IDWriteGlyphRunAnalysis : IUnknown
{
extern(Windows):
	HRESULT CreateAlphaTexture(DWRITE_TEXTURE_TYPE TextureType, const RECT * TextureBounds, ubyte* AlphaValues, uint BufferSize);
	HRESULT GetAlphaBlendParams(IDWriteRenderingParams RenderingParams, float* BlendGamma, float* BlendEnhancedContrast, float* BlendClearTypeLevel);
	HRESULT GetAlphaTextureBounds(DWRITE_TEXTURE_TYPE TextureType, RECT* TextureBounds);
}

mixin(uuid!(IDWriteInlineObject, "8339FDE3-106F-47ab-8373-1C6295EB10B3"));
public interface IDWriteInlineObject : IUnknown
{
extern(Windows):
	HRESULT Draw(void* ClientDrawingContext, IDWriteTextRenderer* Renderer, float OriginX, float OriginY, bool IsSideways, bool IsRightToLeft, IUnknown ClientDrawingEffect);
	HRESULT GetBreakConditions(DWRITE_BREAK_CONDITION* BreakConditionBefore, DWRITE_BREAK_CONDITION* BreakConditionAfter);
	HRESULT GetMetrics(DWRITE_INLINE_OBJECT_METRICS* Metrics);
	HRESULT GetOverhangMetrics(DWRITE_OVERHANG_METRICS* Overhangs);
}

mixin(uuid!(IDWriteLocalFontFileLoader, "b2d9f3ec-c9fe-4a11-a2ec-d86208f7c0a2"));
public interface IDWriteLocalFontFileLoader : IUnknown
{
extern(Windows):
	HRESULT GetFilePathFromKey(const void *FontFileReferenceKey, uint FontFileReferenceKeySize, wchar *FilePath,uint FilePathSize);
	HRESULT GetFilePathLengthFromKey(const void *FontFileReferenceKey, uint FontFileReferenceKeySize, uint *FilePathLength);
	HRESULT GetLastWriteTimeFromKey(const void *FontFileReferenceKey, uint FontFileReferenceKeySize, FILETIME *LastWriteTime);
}

mixin(uuid!(IDWriteLocalizedStrings, "08256209-099a-4b34-b86d-c22b110e7771"));
public interface IDWriteLocalizedStrings : IUnknown
{
extern(Windows):
	HRESULT FindLocaleName(const wchar* LocaleName, uint* Index, bool* Exists);
	uint GetCount();
	HRESULT GetLocaleName(uint Index, wchar* LocaleName, uint Size);
	HRESULT GetLocaleNameSize(uint Index, uint* Length);
	HRESULT GetString(uint Index, wchar* StringBuffer, uint Size);
	HRESULT GetStringLength(uint Index, uint* Length);
}

mixin(uuid!(IDWriteNumberSubstitution, "14885CC9-BAB0-4f90-B6ED-5C366A2CD03D"));
public interface IDWriteNumberSubstitution : IUnknown
{
extern(Windows):
	
}

mixin(uuid!(IDWritePixelSnapping, "eaf3a2da-ecf4-4d24-b644-b34f6842024b"));
public interface IDWritePixelSnapping : IUnknown
{
extern(Windows):
	HRESULT GetCurrentTransform(void* ClientDrawingContext, DWRITE_MATRIX* Transform);
	HRESULT GetPixelsPerDip(void* ClientDrawingContext, float* PixelsPerDip);
	HRESULT IsPixelSnappingEnabled(void* ClientDrawingContext, bool* IsDisabled);
}

mixin(uuid!(IDWriteRenderingParams, "2f0da53a-2add-47cd-82ee-d9ec34688e75"));
public interface IDWriteRenderingParams : IUnknown
{
extern(Windows):
	float GetClearTypeLevel();
	float GetEnhancedContrast();
	float GetGamma();
	DWRITE_PIXEL_GEOMETRY GetPixelGeometry();
	DWRITE_RENDERING_MODE GetRenderingMode();
}

mixin(uuid!(IDWriteTextAnalysisSink, "5810cd44-0ca0-4701-b3fa-bec5182ae4f6"));
public interface IDWriteTextAnalysisSink : IUnknown
{
extern(Windows):
	HRESULT SetBidiLevel(uint TextPosition, uint TextLength, ubyte ExplicitLevel, ubyte ResolvedLevel);
	HRESULT SetLineBreakpoints(uint TextPosition, uint TextLength, DWRITE_LINE_BREAKPOINT *LineBreakpoints);
	HRESULT SetNumberSubstitution(uint TextPosition, uint TextLength, IDWriteNumberSubstitution NumberSubstitution);
	HRESULT SetScriptAnalysis(uint TextPosition, uint TextLength, const DWRITE_SCRIPT_ANALYSIS *ScriptAnalysis);
}

mixin(uuid!(IDWriteTextAnalysisSource, "688e1a58-5094-47c8-adc8-fbcea60ae92b"));
public interface IDWriteTextAnalysisSource : IUnknown
{
extern(Windows):
	HRESULT GetLocaleName(uint TextPosition, uint *TextLength, const wchar **LocaleName);
	HRESULT GetNumberSubstitution(uint TextPosition, uint *TextLength, IDWriteNumberSubstitution *NumberSubstitution);
	DWRITE_READING_DIRECTION GetParagraphReadingDirection();
	HRESULT GetTextAtPosition(uint TextPosition, const wchar **TextString, uint *TextLength);
	HRESULT GetTextBeforePosition(uint TextPosition, const wchar **TextString, uint *TextLength);
}

mixin(uuid!(IDWriteTextAnalyzer, "b7e6163e-7f46-43b4-84b3-e4e6249c365d"));
public interface IDWriteTextAnalyzer : IUnknown
{
extern(Windows):
	HRESULT AnalyzeBidi(IDWriteTextAnalysisSource AnalysisSource, uint TextPosition, uint TextLength, IDWriteTextAnalysisSink AnalysisSink);
	HRESULT AnalyzeLineBreakpoints(IDWriteTextAnalysisSource AnalysisSource, uint TextPosition, uint TextLength, IDWriteTextAnalysisSink AnalysisSink);
	HRESULT AnalyzeNumberSubstitution(IDWriteTextAnalysisSource AnalysisSource, uint TextPosition, uint TextLength, IDWriteTextAnalysisSink AnalysisSink);
	HRESULT AnalyzeScript(IDWriteTextAnalysisSource AnalysisSource, uint TextPosition, uint TextLength, IDWriteTextAnalysisSink AnalysisSink);
	HRESULT GetGdiCompatibleGlyphPlacements(const wchar* TextString, const ushort* ClusterMap, DWRITE_SHAPING_TEXT_PROPERTIES *TextProps, uint TextLength, const ushort * GlyphIndices, const DWRITE_SHAPING_GLYPH_PROPERTIES * GlyphProps, uint GlyphCount, IDWriteFontFace FontFace, float FontEmSize, float PixelsPerDip, const DWRITE_MATRIX *Transform, bool UseGdiNatural, bool IsSideways, bool IsRightToLeft, const DWRITE_SCRIPT_ANALYSIS *ScriptAnalysis, const wchar *LocaleName, const DWRITE_TYPOGRAPHIC_FEATURES **Features, const uint *FeatureRangeLengths, uint FeatureRanges, float * GlyphAdvances, DWRITE_GLYPH_OFFSET * GlyphOffsets);
	HRESULT GetGlyphPlacements(const wchar* TextString, const ushort* ClusterMap, DWRITE_SHAPING_TEXT_PROPERTIES *TextProps, uint TextLength, const ushort * GlyphIndices, const DWRITE_SHAPING_GLYPH_PROPERTIES * GlyphProps, uint GlyphCount, IDWriteFontFace FontFace, float FontEmSize, bool IsSideways, bool IsRightToLeft, const DWRITE_SCRIPT_ANALYSIS *ScriptAnalysis, const wchar *LocaleName, const DWRITE_TYPOGRAPHIC_FEATURES **Features, const uint *FeatureRangeLengths, uint FeatureRanges, float *GlyphAdvances, DWRITE_GLYPH_OFFSET * GlyphOffsets);
	HRESULT GetGlyphs(const wchar * TextString, uint TextLength, IDWriteFontFace FontFace, bool IsSideways, bool IsRightToLeft, const DWRITE_SCRIPT_ANALYSIS * ScriptAnalysis, const wchar * LocaleName, IDWriteNumberSubstitution NumberSubstitution, const DWRITE_TYPOGRAPHIC_FEATURES **Features, const uint *FeatureRangeLengths, uint FeatureRanges, uint MaxGlyphCount, ushort *ClusterMap, DWRITE_SHAPING_TEXT_PROPERTIES *TextProps, ushort *GlyphIndices, DWRITE_SHAPING_GLYPH_PROPERTIES *GlyphProps, uint *ActualGlyphCount);
}

mixin(uuid!(IDWriteTextFormat, "53737037-6d14-410b-9bfe-0b182bb70961"));
public interface IDWriteTextFormat : IUnknown
{
extern(Windows):
	DWRITE_FLOW_DIRECTION GetFlowDirection();
	HRESULT GetFontCollection(IDWriteFontCollection *FontCollection);
	HRESULT GetFontFamilyName(wchar *FontFamilyName, uint NameSize);
	uint GetFontFamilyNameLength();
	float GetFontSize();
	DWRITE_FONT_STRETCH GetFontStretch();
	DWRITE_FONT_STYLE GetFontStyle();
	DWRITE_FONT_WEIGHT GetFontWeight();
	float GetIncrementalTabStop();
	HRESULT GetLineSpacing(DWRITE_LINE_SPACING_METHOD *LineSpacingMethod, float *LineSpacing, float *Baseline);
	HRESULT GetLocaleName(wchar *LocaleName, uint NameSize);
	uint GetLocaleNameLength();
	DWRITE_PARAGRAPH_ALIGNMENT GetParagraphAlignment();
	DWRITE_READING_DIRECTION GetReadingDirection();
	DWRITE_TEXT_ALIGNMENT GetTextAlignment();
	HRESULT GetTrimming(DWRITE_TRIMMING *TrimmingOptions, IDWriteInlineObject *TrimmingSign);
	DWRITE_WORD_WRAPPING GetWordWrapping();
	HRESULT SetFlowDirection(DWRITE_FLOW_DIRECTION FlowDirection);
	HRESULT SetIncrementalTabStop(float IncrementalTabStop);
	HRESULT SetLineSpacing(DWRITE_LINE_SPACING_METHOD LineSpacingMethod, float LineSpacing, float Baseline);
	HRESULT SetParagraphAlignment(DWRITE_PARAGRAPH_ALIGNMENT ParagraphAlignment);
	HRESULT SetReadingDirection(DWRITE_READING_DIRECTION ReadingDirection);
	HRESULT SetTextAlignment(DWRITE_TEXT_ALIGNMENT TextAlignment);
	HRESULT SetTrimming(const DWRITE_TRIMMING *TrimmingOptions, IDWriteInlineObject TrimmingSign);
	HRESULT SetWordWrapping(DWRITE_WORD_WRAPPING WordWrapping);
}

mixin(uuid!(IDWriteTextLayout, "53737037-6d14-410b-9bfe-0b182bb70961"));
public interface IDWriteTextLayout : IUnknown
{
extern(Windows):
	HRESULT DetermineMinWidth(float *MinWidth);
	HRESULT Draw(void *ClientDrawingContext, IDWriteTextRenderer Renderer, float OriginX, float OriginY);
	HRESULT GetClusterMetrics(DWRITE_CLUSTER_METRICS * ClusterMetrics, uint MaxClusterCount, uint *ActualClusterCount);
	HRESULT GetDrawingEffect(uint CurrentPosition, IUnknown *DrawingEffect, DWRITE_TEXT_RANGE * TextRange);
	HRESULT GetFontCollection(uint CurrentPosition, IDWriteFontCollection *FontCollection, DWRITE_TEXT_RANGE *TextRange);
	HRESULT GetFontFamilyName(uint CurrentPosition, wchar *FontFamilyName, uint NameSize, DWRITE_TEXT_RANGE *TextRange);
	HRESULT GetFontFamilyNameLength(uint CurrentPosition, uint *NameLength, DWRITE_TEXT_RANGE *TextRange);
	HRESULT GetFontSize(uint CurrentPosition, float *FontSize, DWRITE_TEXT_RANGE *TextRange);
	HRESULT GetFontStretch(uint CurrentPosition, DWRITE_FONT_STRETCH *FontStretch, DWRITE_TEXT_RANGE *TextRange);
	HRESULT GetFontStyle(uint CurrentPosition, DWRITE_FONT_STYLE *FontStyle, DWRITE_TEXT_RANGE *TextRange);
	HRESULT GetFontWeight(uint CurrentPosition, DWRITE_FONT_WEIGHT *FontWeight, DWRITE_TEXT_RANGE *TextRange);
	HRESULT GetInlineObject(uint CurrentPosition, IDWriteInlineObject *InlineObject, DWRITE_TEXT_RANGE *TextRange);
	HRESULT GetLineMetrics(DWRITE_LINE_METRICS *LineMetrics, uint MaxLineCount, uint *ActualLineCount);
	HRESULT GetLocaleName(uint CurrentPosition, wchar *LocaleName, uint NameSize, DWRITE_TEXT_RANGE *TextRange);
	HRESULT GetLocaleNameLength(uint CurrentPosition,uint *NameLength, DWRITE_TEXT_RANGE *TextRange);
	float GetMaxHeight();
	float GetMaxWidth();
	HRESULT GetMetrics(DWRITE_TEXT_METRICS *TextMetrics);
	HRESULT GetOverhangMetrics(DWRITE_OVERHANG_METRICS *Overhangs);
	HRESULT GetStrikethrough(uint CurrentPosition, bool *HasStrikethrough, DWRITE_TEXT_RANGE *TextRange);
	HRESULT GetTypography(uint CurrentPosition, IDWriteTypography *Typography, DWRITE_TEXT_RANGE *TextRange);
	HRESULT GetUnderline(uint CurrentPosition, bool *HasUnderline, DWRITE_TEXT_RANGE *TextRange);
	HRESULT HitTestPoint(float PointX, float PointY, bool *IsTrailingHit, bool *IsInside, DWRITE_HIT_TEST_METRICS *HitTestMetrics);
	HRESULT HitTestTextPosition(uint TextPosition, bool IsTrailingHit, float *PointX, float *PointY, DWRITE_HIT_TEST_METRICS *HitTestMetrics);
	HRESULT HitTestTextRange(uint TextPosition, uint TextLength, float OriginX, float OriginY, DWRITE_HIT_TEST_METRICS *HitTestMetrics, uint MaxHitTestMetricsCount, uint *ActualHitTestMetricsCount);
	HRESULT SetDrawingEffect(IUnknown DrawingEffect, DWRITE_TEXT_RANGE TextRange);
	HRESULT SetFontCollection(IDWriteFontCollection FontCollection, DWRITE_TEXT_RANGE TextRange);
	HRESULT SetFontFamilyName(const wchar *FontFamilyName, DWRITE_TEXT_RANGE TextRange);
	HRESULT SetFontSize(float FontSize, DWRITE_TEXT_RANGE TextRange);
	HRESULT SetFontStretch(DWRITE_FONT_STRETCH FontStretch, DWRITE_TEXT_RANGE TextRange);
	HRESULT SetFontStyle(DWRITE_FONT_STYLE FontStyle, DWRITE_TEXT_RANGE TextRange);
	HRESULT SetFontWeight(DWRITE_FONT_WEIGHT FontWeight, DWRITE_TEXT_RANGE TextRange);
	HRESULT SetInlineObject(IDWriteInlineObject InlineObject, DWRITE_TEXT_RANGE TextRange);
	HRESULT SetLocaleName(const wchar *LocaleName, DWRITE_TEXT_RANGE TextRange);
	HRESULT SetMaxHeight(float MaxHeight);
	HRESULT SetMaxWidth(float MaxWidth);
	HRESULT SetStrikethrough(bool HasStrikethrough, DWRITE_TEXT_RANGE TextRange);
	HRESULT SetTypography(IDWriteTypography Typography, DWRITE_TEXT_RANGE TextRange);
	HRESULT SetUnderline(bool HasUnderline, DWRITE_TEXT_RANGE TextRange);
}

mixin(uuid!(IDWriteTextRenderer, "ef8a8135-5cc6-45fe-8825-c5a0724eb819"));
public interface IDWriteTextRenderer : IDWritePixelSnapping
{
extern(Windows):
	HRESULT DrawGlyphRun(void *ClientDrawingContext, float BaselineOriginX, float BaselineOriginY,DWRITE_MEASURING_MODE MeasuringMode, const DWRITE_GLYPH_RUN *GlyphRun, const DWRITE_GLYPH_RUN_DESCRIPTION *GlyphRunDescription, IUnknown ClientDrawingEffect);
	HRESULT DrawInlineObject(void *ClientDrawingContext, float OriginX, float OriginY, IDWriteInlineObject *InlineObject, bool IsSideways, bool IsRightToLeft, IUnknown *ClientDrawingEffect);
	HRESULT DrawStrikethrough(void *ClientDrawingContext, float BaselineOriginX, float BaselineOriginY, const DWRITE_STRIKETHROUGH *Strikethrough, IUnknown *ClientDrawingEffect);
	HRESULT DrawUnderline(void *ClientDrawingContext, float BaselineOriginX, float BaselineOriginY, const DWRITE_UNDERLINE *Underline, IUnknown *ClientDrawingEffect);
}

mixin(uuid!(IDWriteTypography, "55f1112b-1dc2-4b3c-9541-f46894ed85b6"));
public interface IDWriteTypography : IUnknown
{
extern(Windows):
	HRESULT AddFontFeature(DWRITE_FONT_FEATURE FontFeature);
	HRESULT GetFontFeature(uint FontFeatureIndex, DWRITE_FONT_FEATURE *FontFeature);
	uint GetFontFeatureCount();
}

mixin(uuid!(IDWriteFactory, "b859ee5a-d838-4b5b-a2e8-1adc7d93db48"));
public interface IDWriteFactory : IUnknown
{
extern(Windows):
	HRESULT CreateCustomFontCollection(IDWriteFontCollectionLoader CollectionLoader, const void *CollectionKey, uint CollectionKeySize, IDWriteFontCollection *FontCollection);
	HRESULT CreateCustomFontFileReference(const void *FontFileReferenceKey, uint FontFileReferenceKeySize, IDWriteFontFileLoader *FontFileLoader, IDWriteFontFile *FontFile);
	HRESULT CreateCustomRenderingParams(float Gamma, float EnhancedContrast, float ClearTypeLevel, DWRITE_PIXEL_GEOMETRY PixelGeometry, DWRITE_RENDERING_MODE RenderingMode, IDWriteRenderingParams *RenderingParams);
	HRESULT CreateEllipsisTrimmingSign(IDWriteTextFormat *TextFormat, IDWriteInlineObject *TrimmingSign);
	HRESULT CreateFontFace(DWRITE_FONT_FACE_TYPE FontFaceType, uint NumberOfFiles, const IDWriteFontFile FontFiles, uint FaceIndex, DWRITE_FONT_SIMULATIONS FontFaceSimulationFlags, IDWriteFontFace *FontFace);
	HRESULT CreateFontFileReference(const wchar *FilePath, const FILETIME *LastWriteTime, IDWriteFontFile *FontFile);
	HRESULT CreateGdiCompatibleTextLayout(const wchar *String, uint StringLength, IDWriteTextFormat *TextFormat, float LayoutWidth, float LayoutHeight, float PixelsPerDip, const DWRITE_MATRIX *Transform, bool UseGdiNatural, IDWriteTextLayout *TextLayout);
	HRESULT CreateGlyphRunAnalysis(const DWRITE_GLYPH_RUN *GlyphRun, float PixelsPerDip, const DWRITE_MATRIX * Transform, DWRITE_RENDERING_MODE RenderingMode, DWRITE_MEASURING_MODE MeasuringMode, float BaselineOriginX, float BaselineOriginY, IDWriteGlyphRunAnalysis *GlyphRunAnalysis);
	HRESULT CreateMonitorRenderingParams(long Monitor, IDWriteRenderingParams *RenderingParams);
	HRESULT CreateNumberSubstitution(DWRITE_NUMBER_SUBSTITUTION_METHOD SubstitutionMethod, const wchar *LocaleName, bool IgnoreUserOverride, IDWriteNumberSubstitution *NumberSubstitution);
	HRESULT CreateRenderingParams(IDWriteRenderingParams *RenderingParams);
	HRESULT CreateTextAnalyzer(IDWriteTextAnalyzer *TextAnalyzer);
	HRESULT CreateTextFormat(const wchar *FontFamilyName, IDWriteFontCollection FontCollection, DWRITE_FONT_WEIGHT FontWeight, DWRITE_FONT_STYLE FontStyle, DWRITE_FONT_STRETCH FontStretch, float FontSize, const wchar *LocaleName, IDWriteTextFormat *TextFormat);
	HRESULT CreateTextLayout(const wchar *String, uint StringLength, IDWriteTextFormat TextFormat, float MaxWidth, float MaxHeight, IDWriteTextLayout *TextLayout);
	HRESULT CreateTypography(IDWriteTypography *Typography);
	HRESULT GetGdiInterop(IDWriteGdiInterop *GDIInterop);
	HRESULT GetSystemFontCollection(IDWriteFontCollection *FontCollection, bool CheckForUpdates);
	HRESULT RegisterFontCollectionLoader(IDWriteFontCollectionLoader FontCollectionLoader);
	HRESULT RegisterFontFileLoader(IDWriteFontFileLoader FontFileLoader);
	HRESULT UnregisterFontCollectionLoader(IDWriteFontCollectionLoader FontCollectionLoader);
	HRESULT UnregisterFontFileLoader(IDWriteFontFileLoader FontFileLoader);
}
