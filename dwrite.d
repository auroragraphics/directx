module aurora.directx.dwrite;

import std.bitmanip;
import aurora.directx.com;
import aurora.directx.config;
import aurora.directx.d2d1;
import aurora.directx.d3d11;

alias ID2D1SimplifiedGeometrySink IDWriteGeometrySink;

//
//	Enumerations
//

//
//	Structures
//

//static if(DX110)
//{
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

	public struct LOGFONTW {
		long lfHeight;
		long lfWidth;
		long lfEscapement;
		long lfOrientation;
		long lfWeight;
		ubyte lfItalic;
		ubyte lfUnderline;
		ubyte lfStrikeOut;
		ubyte lfCharSet;
		ubyte lfOutPrecision;
		ubyte lfClipPrecision;
		ubyte lfQuality;
		ubyte lfPitchAndFamily;
		wchar lfFaceName[32];
	}
	
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
		BOOL isSideways;
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
		BOOL   isText;
		BOOL   isTrimmed;
	}
	
	public struct DWRITE_INLINE_OBJECT_METRICS {
		float width;
		float height;
		float baseline;
		BOOL  supportsSideways;
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
		BOOL   isTrimmed;
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
		HRESULT GetInformationalStrings(DWRITE_INFORMATIONAL_STRING_ID InformationalStringID, IDWriteLocalizedStrings* InformationalStrings, BOOL* Exists);
		HRESULT GetMetrics(DWRITE_FONT_METRICS* FontMetrics);
		DWRITE_FONT_SIMULATIONS GetSimulations();
		DWRITE_FONT_STRETCH GetStretch();
		DWRITE_FONT_STYLE GetStyle();
		DWRITE_FONT_WEIGHT GetWeight();
		HRESULT HasCharacter(uint UnicodeValue, BOOL* Exists);
		BOOL IsSymbolFont();
	}
	
	mixin(uuid!(IDWriteFontCollection, "a84cee02-3eea-4eee-a827-87c1a02a0fcc"));
	public interface IDWriteFontCollection : IUnknown
	{
	extern(Windows):
		HRESULT FindFamilyName(const wchar* FamilyName, uint* Index, BOOL* Exists);
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
		HRESULT GetDesignGlyphMetrics(const(uint*) Indices, uint Count, DWRITE_GLYPH_METRICS* Metrics, BOOL IsSideways);
		HRESULT GetFiles(uint* NumberOfFiles, IDWriteFontFile* Files = null);
		HRESULT GetGdiCompatibleGlyphMetrics(float EMSize, float PixelsPerDIP, const(DWRITE_MATRIX*) Transform, BOOL UseGDINatural, const(ushort*) Indices, uint Count, DWRITE_GLYPH_METRICS* Metrics, BOOL IsSideways);	
		HRESULT GetGdiCompatibleMetrics(float EMSize, float PixelsPerDIP, const(DWRITE_MATRIX*) Transform, DWRITE_FONT_METRICS* FontFaceMetrics);
		ushort GetGlyphCount();
		// Bug with static if prevents this from working
		HRESULT GetGlyphRunOutline(float EMSize, ushort* Indices, float* Advances, DWRITE_GLYPH_OFFSET* Offsets, uint Count, BOOL IsSideways, BOOL RightToLeft, IDWriteGeometrySink GeometrySink);
		uint GetIndex();
		void GetMetrics(DWRITE_FONT_METRICS* FontFaceMetrics);
		HRESULT GetRecommendedRenderingMode(float EMSize, float PixelsPerDIP, DWRITE_MEASURING_MODE MeasuringMode, IDWriteRenderingParams RenderingParams, DWRITE_RENDERING_MODE* RenderingMode);
		DWRITE_FONT_SIMULATIONS GetSimulations();
		DWRITE_FONT_FACE_TYPE GetType();
		BOOL IsSymbolFont();
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
		HRESULT Analyse(BOOL* IsSupportedFontType, DWRITE_FONT_FILE_TYPE FileType, DWRITE_FONT_FACE_TYPE FaceType, uint NumberOfFaces);
		HRESULT GetLoader(IDWriteFontFileLoader* Loader);
		HRESULT GetReferenceKey(const(void**) Key, uint KeySize);
	}
	
	mixin(uuid!(IDWriteFontFileEnumerator, "72755049-5ff7-435d-8348-4be97cfa6c7c"));
	public interface IDWriteFontFileEnumerator : IUnknown
	{
	extern(Windows):
		HRESULT GetCurrentFontFile(IDWriteFontFile* FontFile);
		HRESULT MoveNext(BOOL* HasCurrentFile);
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
		HRESULT ConvertFontToLOGFONT(IDWriteFont Font, LOGFONTW* LogFont, BOOL* IsSystemFont);
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
		HRESULT Draw(void* ClientDrawingContext, IDWriteTextRenderer* Renderer, float OriginX, float OriginY, BOOL IsSideways, BOOL IsRightToLeft, IUnknown ClientDrawingEffect);
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
		HRESULT FindLocaleName(const wchar* LocaleName, uint* Index, BOOL* Exists);
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
		HRESULT IsPixelSnappingEnabled(void* ClientDrawingContext, BOOL* IsDisabled);
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
		HRESULT GetGdiCompatibleGlyphPlacements(const wchar* TextString, const ushort* ClusterMap, DWRITE_SHAPING_TEXT_PROPERTIES *TextProps, uint TextLength, const ushort * GlyphIndices, const DWRITE_SHAPING_GLYPH_PROPERTIES * GlyphProps, uint GlyphCount, IDWriteFontFace FontFace, float FontEmSize, float PixelsPerDip, const DWRITE_MATRIX *Transform, BOOL UseGdiNatural, BOOL IsSideways, BOOL IsRightToLeft, const DWRITE_SCRIPT_ANALYSIS *ScriptAnalysis, const wchar *LocaleName, const DWRITE_TYPOGRAPHIC_FEATURES **Features, const uint *FeatureRangeLengths, uint FeatureRanges, float * GlyphAdvances, DWRITE_GLYPH_OFFSET * GlyphOffsets);
		HRESULT GetGlyphPlacements(const wchar* TextString, const ushort* ClusterMap, DWRITE_SHAPING_TEXT_PROPERTIES *TextProps, uint TextLength, const ushort * GlyphIndices, const DWRITE_SHAPING_GLYPH_PROPERTIES * GlyphProps, uint GlyphCount, IDWriteFontFace FontFace, float FontEmSize, BOOL IsSideways, BOOL IsRightToLeft, const DWRITE_SCRIPT_ANALYSIS *ScriptAnalysis, const wchar *LocaleName, const DWRITE_TYPOGRAPHIC_FEATURES **Features, const uint *FeatureRangeLengths, uint FeatureRanges, float *GlyphAdvances, DWRITE_GLYPH_OFFSET * GlyphOffsets);
		HRESULT GetGlyphs(const wchar * TextString, uint TextLength, IDWriteFontFace FontFace, BOOL IsSideways, BOOL IsRightToLeft, const DWRITE_SCRIPT_ANALYSIS * ScriptAnalysis, const wchar * LocaleName, IDWriteNumberSubstitution NumberSubstitution, const DWRITE_TYPOGRAPHIC_FEATURES **Features, const uint *FeatureRangeLengths, uint FeatureRanges, uint MaxGlyphCount, ushort *ClusterMap, DWRITE_SHAPING_TEXT_PROPERTIES *TextProps, ushort *GlyphIndices, DWRITE_SHAPING_GLYPH_PROPERTIES *GlyphProps, uint *ActualGlyphCount);
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
		HRESULT GetStrikethrough(uint CurrentPosition, BOOL *HasStrikethrough, DWRITE_TEXT_RANGE *TextRange);
		HRESULT GetTypography(uint CurrentPosition, IDWriteTypography *Typography, DWRITE_TEXT_RANGE *TextRange);
		HRESULT GetUnderline(uint CurrentPosition, BOOL *HasUnderline, DWRITE_TEXT_RANGE *TextRange);
		HRESULT HitTestPoint(float PointX, float PointY, BOOL *IsTrailingHit, BOOL *IsInside, DWRITE_HIT_TEST_METRICS *HitTestMetrics);
		HRESULT HitTestTextPosition(uint TextPosition, BOOL IsTrailingHit, float *PointX, float *PointY, DWRITE_HIT_TEST_METRICS *HitTestMetrics);
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
		HRESULT SetStrikethrough(BOOL HasStrikethrough, DWRITE_TEXT_RANGE TextRange);
		HRESULT SetTypography(IDWriteTypography Typography, DWRITE_TEXT_RANGE TextRange);
		HRESULT SetUnderline(BOOL HasUnderline, DWRITE_TEXT_RANGE TextRange);
	}
	
	mixin(uuid!(IDWriteTextRenderer, "ef8a8135-5cc6-45fe-8825-c5a0724eb819"));
	public interface IDWriteTextRenderer : IDWritePixelSnapping
	{
	extern(Windows):
		HRESULT DrawGlyphRun(void *ClientDrawingContext, float BaselineOriginX, float BaselineOriginY,DWRITE_MEASURING_MODE MeasuringMode, const DWRITE_GLYPH_RUN *GlyphRun, const DWRITE_GLYPH_RUN_DESCRIPTION *GlyphRunDescription, IUnknown ClientDrawingEffect);
		HRESULT DrawInlineObject(void *ClientDrawingContext, float OriginX, float OriginY, IDWriteInlineObject *InlineObject, BOOL IsSideways, BOOL IsRightToLeft, IUnknown *ClientDrawingEffect);
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
		HRESULT CreateGdiCompatibleTextLayout(const wchar *String, uint StringLength, IDWriteTextFormat *TextFormat, float LayoutWidth, float LayoutHeight, float PixelsPerDip, const DWRITE_MATRIX *Transform, BOOL UseGdiNatural, IDWriteTextLayout *TextLayout);
		HRESULT CreateGlyphRunAnalysis(const DWRITE_GLYPH_RUN *GlyphRun, float PixelsPerDip, const DWRITE_MATRIX * Transform, DWRITE_RENDERING_MODE RenderingMode, DWRITE_MEASURING_MODE MeasuringMode, float BaselineOriginX, float BaselineOriginY, IDWriteGlyphRunAnalysis *GlyphRunAnalysis);
		HRESULT CreateMonitorRenderingParams(long Monitor, IDWriteRenderingParams *RenderingParams);
		HRESULT CreateNumberSubstitution(DWRITE_NUMBER_SUBSTITUTION_METHOD SubstitutionMethod, const wchar *LocaleName, BOOL IgnoreUserOverride, IDWriteNumberSubstitution *NumberSubstitution);
		HRESULT CreateRenderingParams(IDWriteRenderingParams *RenderingParams);
		HRESULT CreateTextAnalyzer(IDWriteTextAnalyzer *TextAnalyzer);
		HRESULT CreateTextFormat(const wchar *FontFamilyName, IDWriteFontCollection FontCollection, DWRITE_FONT_WEIGHT FontWeight, DWRITE_FONT_STYLE FontStyle, DWRITE_FONT_STRETCH FontStretch, float FontSize, const wchar *LocaleName, IDWriteTextFormat *TextFormat);
		HRESULT CreateTextLayout(const wchar *String, uint StringLength, IDWriteTextFormat TextFormat, float MaxWidth, float MaxHeight, IDWriteTextLayout *TextLayout);
		HRESULT CreateTypography(IDWriteTypography *Typography);
		HRESULT GetGdiInterop(IDWriteGdiInterop *GDIInterop);
		HRESULT GetSystemFontCollection(IDWriteFontCollection *FontCollection, BOOL CheckForUpdates);
		HRESULT RegisterFontCollectionLoader(IDWriteFontCollectionLoader FontCollectionLoader);
		HRESULT RegisterFontFileLoader(IDWriteFontFileLoader FontFileLoader);
		HRESULT UnregisterFontCollectionLoader(IDWriteFontCollectionLoader FontCollectionLoader);
		HRESULT UnregisterFontFileLoader(IDWriteFontFileLoader FontFileLoader);
	}
	
//}

//static if(DX111)
//{

	public enum DWRITE_BASELINE : int {  
		DEFAULT, 
		ROMAN, 
		CENTRAL, 
		MATH, 
		HANGING, 
		IDEOGRAPHIC_BOTTOM, 
		IDEOGRAPHIC_TOP, 
		MINIMUM, 
		MAXIMUM,		
	}

	public enum DWRITE_PANOSE_FAMILY : ubyte {  
		ANY           = 0, 
		NO_FIT        = 1, 
		TEXT_DISPLAY  = 2, 
		SCRIPT        = 3, 
		DECORATIVE    = 4, 
		SYMBOL        = 5, 
		PICTORIAL     = SYMBOL 
	}
	
	public enum DWRITE_PANOSE_SERIF_STYLE : ubyte {  
		ANY                 = 0, 
		NO_FIT              = 1, 
		COVE                = 2, 
		OBTUSE_COVE         = 3, 
		SQUARE_COVE         = 4, 
		OBTUSE_SQUARE_COVE  = 5, 
		SQUARE              = 6, 
		THIN                = 7, 
		OVAL                = 8, 
		EXAGGERATED         = 9, 
		TRIANGLE            = 10, 
		NORMAL_SANS         = 11, 
		OBTUSE_SANS         = 12, 
		PERPENDICULAR_SANS  = 13, 
		FLARED              = 14, 
		ROUNDED             = 15, 
		SCRIPT              = 16, 
		PERP_SANS           = PERPENDICULAR_SANS, 
		BONE                = OVAL,	
	}
	
	public enum DWRITE_PANOSE_WEIGHT : ubyte {  
		ANY          = 0, 
		NO_FIT       = 1, 
		VERY_LIGHT   = 2, 
		LIGHT        = 3, 
		THIN         = 4, 
		BOOK         = 5, 
		MEDIUM       = 6, 
		DEMI         = 7, 
		BOLD         = 8, 
		HEAVY        = 9, 
		BLACK        = 10, 
		EXTRA_BLACK  = 11, 
		NORD         = EXTRA_BLACK,	
	}
	
	public enum DWRITE_PANOSE_SYMBOL_ASPECT_RATIO : ubyte {  
		ANY                 = 0, 
		NO_FIT              = 1, 
		NO_WIDTH            = 2, 
		EXCEPTIONALLY_WIDE  = 3, 
		SUPER_WIDE          = 4, 
		VERY_WIDE           = 5, 
		WIDE                = 6, 
		NORMAL              = 7, 
		NARROW              = 8, 
		VERY_NARROW         = 9,	
	}
	
	public enum DWRITE_PANOSE_PROPORTION : ubyte {  
		ANY             = 0, 
		NO_FIT          = 1, 
		OLD_STYLE       = 2, 
		MODERN          = 3, 
		EVEN_WIDTH      = 4, 
		EXPANDED        = 5, 
		CONDENSED       = 6, 
		VERY_EXPANDED   = 7, 
		VERY_CONDENSED  = 8, 
		MONOSPACED      = 9,	
	}
	
	public enum DWRITE_PANOSE_CONTRAST : ubyte {  
		ANY                = 0, 
		NO_FIT             = 1, 
		NONE               = 2, 
		VERY_LOW           = 3, 
		LOW                = 4, 
		MEDIUM_LOW         = 5, 
		MEDIUM             = 6, 
		MEDIUM_HIGH        = 7, 
		HIGH               = 8, 
		VERY_HIGH          = 9, 
		HORIZONTAL_LOW     = 10, 
		HORIZONTAL_MEDIUM  = 11, 
		HORIZONTAL_HIGH    = 12, 
		BROKEN             = 13,	
	}
	
	public enum DWRITE_PANOSE_STROKE_VARIATION : ubyte {  
		ANY                   = 0, 
		NO_FIT                = 1, 
		NO_VARIATION          = 2, 
		GRADUAL_DIAGONAL      = 3, 
		GRADUAL_TRANSITIONAL  = 4, 
		GRADUAL_VERTICAL      = 5, 
		GRADUAL_HORIZONTAL    = 6, 
		RAPID_VERTICAL        = 7, 
		RAPID_HORIZONTAL      = 8, 
		INSTANT_VERTICAL      = 9, 
		INSTANT_HORIZONTAL    = 10,	
	}
	
	public enum DWRITE_PANOSE_ARM_STYLE : ubyte {  
		ANY                            = 0, 
		NO_FIT                         = 1, 
		STRAIGHT_ARMS_HORIZONTAL       = 2, 
		STRAIGHT_ARMS_WEDGE            = 3, 
		STRAIGHT_ARMS_VERTICAL         = 4, 
		STRAIGHT_ARMS_SINGLE_SERIF     = 5, 
		STRAIGHT_ARMS_DOUBLE_SERIF     = 6, 
		NONSTRAIGHT_ARMS_HORIZONTAL    = 7, 
		NONSTRAIGHT_ARMS_WEDGE         = 8, 
		NONSTRAIGHT_ARMS_VERTICAL      = 9, 
		NONSTRAIGHT_ARMS_SINGLE_SERIF  = 10, 
		NONSTRAIGHT_ARMS_DOUBLE_SERIF  = 11, 
		STRAIGHT_ARMS_HORZ             = STRAIGHT_ARMS_HORIZONTAL, 
		STRAIGHT_ARMS_VERT             = STRAIGHT_ARMS_VERTICAL, 
		BENT_ARMS_HORZ                 = NONSTRAIGHT_ARMS_HORIZONTAL, 
		BENT_ARMS_WEDGE                = NONSTRAIGHT_ARMS_WEDGE, 
		BENT_ARMS_VERT                 = NONSTRAIGHT_ARMS_VERTICAL, 
		BENT_ARMS_SINGLE_SERIF         = NONSTRAIGHT_ARMS_SINGLE_SERIF, 
		BENT_ARMS_DOUBLE_SERIF         = NONSTRAIGHT_ARMS_DOUBLE_SERIF,	
	}
	
	public enum DWRITE_PANOSE_LETTERFORM : ubyte {  
		ANY                 = 0, 
		NO_FIT              = 1, 
		NORMAL_CONTACT      = 2, 
		NORMAL_WEIGHTED     = 3, 
		NORMAL_BOXED        = 4, 
		NORMAL_FLATTENED    = 5, 
		NORMAL_ROUNDED      = 6, 
		NORMAL_OFF_CENTER   = 7, 
		NORMAL_SQUARE       = 8, 
		OBLIQUE_CONTACT     = 9, 
		OBLIQUE_WEIGHTED    = 10, 
		OBLIQUE_BOXED       = 11, 
		OBLIQUE_FLATTENED   = 12, 
		OBLIQUE_ROUNDED     = 13, 
		OBLIQUE_OFF_CENTER  = 14, 
		OBLIQUE_SQUARE      = 15,	
	}
	
	public enum DWRITE_PANOSE_MIDLINE : ubyte {  
		ANY               = 0, 
		NO_FIT            = 1, 
		STANDARD_TRIMMED  = 2, 
		STANDARD_POINTED  = 3, 
		STANDARD_SERIFED  = 4, 
		HIGH_TRIMMED      = 5, 
		HIGH_POINTED      = 6, 
		HIGH_SERIFED      = 7, 
		CONSTANT_TRIMMED  = 8, 
		CONSTANT_POINTED  = 9, 
		CONSTANT_SERIFED  = 10, 
		LOW_TRIMMED       = 11, 
		LOW_POINTED       = 12, 
		LOW_SERIFED       = 13,	
	}
	
	public enum DWRITE_PANOSE_XHEIGHT : ubyte {  
		ANY                = 0, 
		NO_FIT             = 1, 
		CONSTANT_SMALL     = 2, 
		CONSTANT_STANDARD  = 3, 
		CONSTANT_LARGE     = 4, 
		DUCKING_SMALL      = 5, 
		DUCKING_STANDARD   = 6, 
		DUCKING_LARGE      = 7, 
		CONSTANT_STD       = CONSTANT_STANDARD, 
		DUCKING_STD        = DUCKING_STANDARD,	
	}
	
	enum DWRITE_PANOSE_TOOL_KIND : ubyte {  
		ANY                 = 0, 
		NO_FIT              = 1, 
		FLAT_NIB            = 2, 
		PRESSURE_POINT      = 3, 
		ENGRAVED            = 4, 
		BALL                = 5, 
		BRUSH               = 6, 
		ROUGH               = 7, 
		FELT_PEN_BRUSH_TIP  = 8, 
		WILD_BRUSH          = 9,	
	}
	
	enum DWRITE_PANOSE_SPACING : ubyte {  
		ANY                  = 0, 
		NO_FIT               = 1, 
		PROPORTIONAL_SPACED  = 2, 
		MONOSPACE            = 3,	
	}
	
	public enum DWRITE_PANOSE_ASPECT_RATIO : ubyte {  
		ANY             = 0, 
		NO_FIT          = 1, 
		VERY_CONDENSED  = 2, 
		CONDENSED       = 3, 
		NORMAL          = 4, 
		EXPANDED        = 5, 
		VERY_EXPANDED   = 6,	
	}
	
	public enum DWRITE_PANOSE_SCRIPT_TOPOLOGY : ubyte {  
		ANY                       = 0, 
		NO_FIT                    = 1, 
		ROMAN_DISCONNECTED        = 2, 
		ROMAN_TRAILING            = 3, 
		ROMAN_CONNECTED           = 4, 
		CURSIVE_DISCONNECTED      = 5, 
		CURSIVE_TRAILING          = 6, 
		CURSIVE_CONNECTED         = 7, 
		BLACKLETTER_DISCONNECTED  = 8, 
		BLACKLETTER_TRAILING      = 9, 
		BLACKLETTER_CONNECTED     = 10,	
	}
	
	public enum DWRITE_PANOSE_SCRIPT_FORM : ubyte {  
		ANY                           = 0, 
		NO_FIT                        = 1, 
		UPRIGHT_NO_WRAPPING           = 2, 
		UPRIGHT_SOME_WRAPPING         = 3, 
		UPRIGHT_MORE_WRAPPING         = 4, 
		UPRIGHT_EXTREME_WRAPPING      = 5, 
		OBLIQUE_NO_WRAPPING           = 6, 
		OBLIQUE_SOME_WRAPPING         = 7, 
		OBLIQUE_MORE_WRAPPING         = 8, 
		OBLIQUE_EXTREME_WRAPPING      = 9, 
		EXAGGERATED_NO_WRAPPING       = 10, 
		EXAGGERATED_SOME_WRAPPING     = 11, 
		EXAGGERATED_MORE_WRAPPING     = 12, 
		EXAGGERATED_EXTREME_WRAPPING  = 13,	
	}
	
	public enum DWRITE_PANOSE_FINIALS : ubyte {  
		ANY                   = 0, 
		NO_FIT                = 1, 
		NONE_NO_LOOPS         = 2, 
		NONE_CLOSED_LOOPS     = 3, 
		NONE_OPEN_LOOPS       = 4, 
		SHARP_NO_LOOPS        = 5, 
		SHARP_CLOSED_LOOPS    = 6, 
		SHARP_OPEN_LOOPS      = 7, 
		TAPERED_NO_LOOPS      = 8, 
		TAPERED_CLOSED_LOOPS  = 9, 
		TAPERED_OPEN_LOOPS    = 10, 
		ROUND_NO_LOOPS        = 11, 
		ROUND_CLOSED_LOOPS    = 12, 
		ROUND_OPEN_LOOPS      = 13,	
	}
	
	public enum DWRITE_PANOSE_XASCENT : ubyte {  
		ANY        = 0, 
		NO_FIT     = 1, 
		VERY_LOW   = 2, 
		LOW        = 3, 
		MEDIUM     = 4, 
		HIGH       = 5, 
		VERY_HIGH  = 6,	
	}
	
	public enum DWRITE_PANOSE_DECORATIVE_CLASS : ubyte {  
		ANY                   = 0, 
		NO_FIT                = 1, 
		DERIVATIVE            = 2, 
		NONSTANDARD_TOPOLOGY  = 3, 
		NONSTANDARD_ELEMENTS  = 4, 
		NONSTANDARD_ASPECT    = 5, 
		INITIALS              = 6, 
		CARTOON               = 7, 
		PICTURE_STEMS         = 8, 
		ORNAMENTED            = 9, 
		TEXT_AND_BACKGROUND   = 10, 
		COLLAGE               = 11, 
		MONTAGE               = 12,	
	}
	
	public enum DWRITE_PANOSE_ASPECT : ubyte {  
		ANY              = 0, 
		NO_FIT           = 1, 
		SUPER_CONDENSED  = 2, 
		VERY_CONDENSED   = 3, 
		CONDENSED        = 4, 
		NORMAL           = 5, 
		EXTENDED         = 6, 
		VERY_EXTENDED    = 7, 
		SUPER_EXTENDED   = 8, 
		MONOSPACED       = 9,	
	}
	
	public enum DWRITE_PANOSE_FILL : ubyte {  
		ANY                  = 0, 
		NO_FIT               = 1, 
		STANDARD_SOLID_FILL  = 2, 
		NO_FILL              = 3, 
		PATTERNED_FILL       = 4, 
		COMPLEX_FILL         = 5, 
		SHAPED_FILL          = 6, 
		DRAWN_DISTRESSED     = 7,	
	}
	
	public enum DWRITE_PANOSE_LINING : ubyte {  
		ANY       = 0, 
		NO_FIT    = 1, 
		NONE      = 2, 
		INLINE    = 3, 
		OUTLINE   = 4, 
		ENGRAVED  = 5, 
		SHADOW    = 6, 
		RELIEF    = 7, 
		BACKDROP  = 8,	
	}
	
	public enum DWRITE_PANOSE_DECORATIVE_TOPOLOGY : ubyte {  
		ANY                       = 0, 
		NO_FIT                    = 1, 
		STANDARD                  = 2, 
		SQUARE                    = 3, 
		MULTIPLE_SEGMENT          = 4, 
		ART_DECO                  = 5, 
		UNEVEN_WEIGHTING          = 6, 
		DIVERSE_ARMS              = 7, 
		DIVERSE_FORMS             = 8, 
		LOMBARDIC_FORMS           = 9, 
		UPPER_CASE_IN_LOWER_CASE  = 10, 
		IMPLIED_TOPOLOGY          = 11, 
		HORSESHOE_E_AND_A         = 12, 
		CURSIVE                   = 13, 
		BLACKLETTER               = 14, 
		SWASH_VARIANCE            = 15,	
	}
	
	public enum DWRITE_PANOSE_CHARACTER_RANGES : ubyte {  
		ANY                  = 0, 
		NO_FIT               = 1, 
		EXTENDED_COLLECTION  = 2, 
		LITERALS             = 3, 
		NO_LOWER_CASE        = 4, 
		SMALL_CAPS           = 5,	
	}
	
	public enum DWRITE_PANOSE_SYMBOL_KIND : ubyte {  
		ANY                = 0, 
		NO_FIT             = 1, 
		MONTAGES           = 2, 
		PICTURES           = 3, 
		SHAPES             = 4, 
		SCIENTIFIC         = 5, 
		MUSIC              = 6, 
		EXPERT             = 7, 
		PATTERNS           = 8, 
		BOARDERS           = 9, 
		ICONS              = 10, 
		LOGOS              = 11, 
		INDUSTRY_SPECIFIC  = 12,	
	}

	public enum DWRITE_GLYPH_ORIENTATION_ANGLE {  
		ANGLE_0_DEGREES, 
		ANGLE_90_DEGREES, 
		ANGLE_180_DEGREES, 
		ANGLE_270_DEGREES,		
	}

	public enum DWRITE_OUTLINE_THRESHOLD : int {  
		ANTIALIASED, 
		ALIASED,	
	}

	public enum DWRITE_TEXT_ANTIALIAS_MODE : int {  
		CLEARTYPE, 
		GRAYSCALE,	
	}

	public enum DWRITE_VERTICAL_GLYPH_ORIENTATION : int {  
		DEFAULT, 
		STACKED,	
	}

	public struct DWRITE_CARET_METRICS {
		short slopeRise;
		short slopeRun;
		short offset;
	}
	
	public union DWRITE_PANOSE {
		ubyte values[10];
		DWRITE_PANOSE_FAMILY familyKind;
		union {
			struct text {
				ubyte familyKind;
				DWRITE_PANOSE_SERIF_STYLE serifStyle;
				DWRITE_PANOSE_WEIGHT weight;
				DWRITE_PANOSE_PROPORTION proportion;
				DWRITE_PANOSE_CONTRAST contrast;
				DWRITE_PANOSE_STROKE_VARIATION strokeVariation;
				DWRITE_PANOSE_ARM_STYLE armStyle;
				DWRITE_PANOSE_LETTERFORM letterform;
				DWRITE_PANOSE_MIDLINE midline;
				DWRITE_PANOSE_XHEIGHT xHeight;
			};
			struct script {
				ubyte familyKind;
				DWRITE_PANOSE_TOOL_KIND toolKind;
				DWRITE_PANOSE_WEIGHT weight;
				DWRITE_PANOSE_SPACING spacing;
				DWRITE_PANOSE_ASPECT_RATIO aspectRatio;
				DWRITE_PANOSE_CONTRAST contrast;
				DWRITE_PANOSE_SCRIPT_TOPOLOGY scriptTopology;
				DWRITE_PANOSE_SCRIPT_FORM scriptForm;
				DWRITE_PANOSE_FINIALS finials;
				DWRITE_PANOSE_XASCENT xAscent;
			};
			struct decorative {
				ubyte familyKind;
				DWRITE_PANOSE_DECORATIVE_CLASS decorativeClass;
				DWRITE_PANOSE_WEIGHT weight;
				DWRITE_PANOSE_ASPECT aspect;
				DWRITE_PANOSE_CONTRAST contrast;
				ubyte serifVariant;
				DWRITE_PANOSE_FILL fill;
				DWRITE_PANOSE_LINING lining;
				DWRITE_PANOSE_DECORATIVE_TOPOLOGY decorativeTopology;
				DWRITE_PANOSE_CHARACTER_RANGES characterRange;
			};
			struct symbol {
				ubyte familyKind;
				DWRITE_PANOSE_SYMBOL_KIND symbolKind;
				DWRITE_PANOSE_WEIGHT weight;
				DWRITE_PANOSE_SPACING spacing;
				DWRITE_PANOSE_SYMBOL_ASPECT_RATIO aspectRatioAndContrast;
				DWRITE_PANOSE_SYMBOL_ASPECT_RATIO aspectRatio94;
				DWRITE_PANOSE_SYMBOL_ASPECT_RATIO aspectRatio119;
				DWRITE_PANOSE_SYMBOL_ASPECT_RATIO aspectRatio157;
				DWRITE_PANOSE_SYMBOL_ASPECT_RATIO aspectRatio163;
				DWRITE_PANOSE_SYMBOL_ASPECT_RATIO aspectRatio211;
			}
		}
	}
	
	public struct DWRITE_FONT_METRICS1 {
		int glyphBoxLeft;
		int glyphBoxTop;
		int glyphBoxRight;
		int glyphBoxBottom;
		int subscriptPositionX;
		int subscriptPositionY;
		int subscriptSizeX;
		int subscriptSizeY;
		int superscriptPositionX;
		int superscriptPositionY;
		int superscriptSizeX;
		int superscriptSizeY;
		BOOL hasTypographicMetrics;
	}
	
	public struct DWRITE_JUSTIFICATION_OPPORTUNITY {
		float expansionMinimum;
		float expansionMaximum;
		float compressionMaximum;
		mixin(bitfields!(
			uint, "expansionPriority", 8,
			uint, "compressionPriority", 8,
			uint, "allowResidualExpansion", 1,
			uint, "allowResidualCompression", 1,
			uint, "applyToLeadingEdge", 1,
			uint, "applyToTrailingEdge", 1,
			uint, "reserved", 12));
	}
	
	public struct DWRITE_SCRIPT_PROPERTIES {
		uint isoScriptCode;
		uint isoScriptNumber;
		uint clusterLookahead;
		uint justificationCharacter;
		mixin(bitfields!(
			uint, "restrictCaretToClusters", 1,
			uint, "usesWordDividers", 1,
			uint, "isDiscreteWriting", 1,
			uint, "isBlockWriting", 1,
			uint, "isDistributedWithinCluster", 1,
			uint, "isConnectedWriting", 1,
			uint, "isCursiveWriting", 1,
			uint, "reserved", 25));
	}
	
	public struct DWRITE_UNICODE_RANGE {
		uint first;
		uint last;
	}
	
	mixin(uuid!(IDWriteBitmapRenderTarget1, "791e8298-3ef3-4230-9880-c9bdecc42064"));
	public interface IDWriteBitmapRenderTarget1 : IDWriteBitmapRenderTarget
	{
	extern(Windows):
		DWRITE_TEXT_ANTIALIAS_MODE GetTextAntialiasMode();
		HRESULT SetTextAntialiasMode(DWRITE_TEXT_ANTIALIAS_MODE AntialiasMode);
	}
	
	mixin(uuid!(IDWriteFont1, "acd16696-8c14-4f5d-877e-fe3fc1d32738"));
	public interface IDWriteFont1 : IDWriteFont
	{
	extern(Windows):
		void GetMetrics(DWRITE_FONT_METRICS1* FontMetrics);
		void GetPanose(DWRITE_PANOSE* Panose);
		HRESULT GetUnicodeRanges(uint MaxRangeCount, DWRITE_UNICODE_RANGE* UnicodeRanges, uint* RangeCount);
		BOOL IsMonospacedFont();
	}
	
	mixin(uuid!(IDWriteFontFace1, "a71efdb4-9fdb-4838-ad90-cfc3be8c3daf"));
	public interface IDWriteFontFace1 : IDWriteFontFace
	{
	extern(Windows):
		void GetCaretMetrics(DWRITE_CARET_METRICS* CaretMetrics);
		HRESULT GetDesignGlyphAdvances(uint Count, const short* Indices, int* Advances, BOOL IsSideways = FALSE);
		HRESULT GetGdiCompatibleGlyphAdvances(float EMSize, float PixelsPerDIP, const DWRITE_MATRIX* Transform, BOOL UseGDINatural, BOOL IsSideways, uint Count, ushort Indices, const int* Advances);
		HRESULT GetGdiCompatibleMetrics(float EMSize, float PixelsPerDIP, const DWRITE_MATRIX* Transform, DWRITE_FONT_METRICS1* FontMetrics);
		HRESULT GetKerningPairAdjustments(uint Count, const ushort* Indices, int* AdvanceAdjustments);
		void GetMetrics(DWRITE_FONT_METRICS1* FontMetrics);
		HRESULT GetRecommendedRenderingMode(float EMSize, float DIPX, float DIPY, const DWRITE_MATRIX* Transform, BOOL IsSideways, DWRITE_OUTLINE_THRESHOLD OutlineThreshold, DWRITE_MEASURING_MODE MeasuringMode, DWRITE_RENDERING_MODE* RenderingMode);
		HRESULT GetUnicodeRanges(uint MaxRangeCount, DWRITE_UNICODE_RANGE* UnicodeRanges, uint* RangeCount);
		HRESULT GetVerticalGlyphVariants(uint Count, const ushort* NominalGlyphIndices, ushort VerticalGlyphIndices);
		BOOL HasKerningPairs();
		BOOL HasVerticalGlyphVariants();
		BOOL IsMonospacedFont();
	}
	
	mixin(uuid!(IDWriteRenderingParams1, "94413cf4-a6fc-4248-8b50-6674348fcad3"));
	public interface IDWriteRenderingParams1 : IDWriteRenderingParams
	{
	extern(Windows):
		float GetGrayscaleEnhancedContrast();
	}
	
	mixin(uuid!(IDWriteTextAnalysisSink1, "B0D941A0-85E7-4D8B-9FD3-5CED9934482A"));
	public interface IDWriteTextAnalysisSink1 : IDWriteTextAnalysisSink
	{
	extern(Windows):
		HRESULT SetGlyphOrientation(uint TextPosition, uint TextLength, DWRITE_GLYPH_ORIENTATION_ANGLE GlyphOrientationAngle, ubyte AdjustedBidiLevel, BOOL IsSideways, BOOL IsRightToLeft);
	}
	
	mixin(uuid!(IDWriteTextAnalysisSource1, "639CFAD8-0FB4-4B21-A58A-067920120009"));
	public interface IDWriteTextAnalysisSource1 : IDWriteTextAnalysisSource
	{
	extern(Windows):
		HRESULT GetVerticalGlyphOrientation(uint TextPosition, uint *TextLength, DWRITE_VERTICAL_GLYPH_ORIENTATION *GlyphOrientation, ubyte *BidiLevel);
	}
	
	mixin(uuid!(IDWriteTextAnalyzer1, "80DAD800-E21F-4E83-96CE-BFCCE500DB7C"));
	public interface IDWriteTextAnalyzer1 : IDWriteTextAnalyzer
	{
	extern(Windows):
		HRESULT AnalyzeVerticalGlyphOrientation(IDWriteTextAnalysisSource AnalysisSource, uint TextPosition, uint TextLength, IDWriteTextAnalysisSink AnalysisSink);
		HRESULT ApplyCharacterSpacing(float LeadingSpacing, float TrailingSpacing, float MinimumAdvanceWidth, uint TextLength, uint GlyphCount, const ushort *ClusterMap, const float *GlyphAdvances, const DWRITE_GLYPH_OFFSET *GlyphOffsets, const DWRITE_SHAPING_GLYPH_PROPERTIES *GlyphProperties, float *ModifiedGlyphAdvances, DWRITE_GLYPH_OFFSET *ModifiedGlyphOffsets);
		HRESULT GetBaseline(IDWriteFontFace FontFace, DWRITE_BASELINE Baseline, BOOL IsVertical, BOOL IsSimulationAllowed, DWRITE_SCRIPT_ANALYSIS ScriptAnalysis, const wchar *LocaleName, int *BaselineCoordinate, BOOL *Exists);
		HRESULT GetGlyphOrientationTransform(DWRITE_GLYPH_ORIENTATION_ANGLE GlyphOrientationAngle, BOOL IsSideways, DWRITE_MATRIX *Transform);
		HRESULT GetJustificationOpportunities(IDWriteFontFace FontFace, float FontEmSize, DWRITE_SCRIPT_ANALYSIS ScriptAnalysis, uint TextLength, uint GlyphCount, const wchar *TextString, const ushort *ClusterMap, const DWRITE_SHAPING_GLYPH_PROPERTIES *GlyphProperties, DWRITE_JUSTIFICATION_OPPORTUNITY *JustificationOpportunities);
		HRESULT GetJustifiedGlyphs(IDWriteFontFace FontFace, float FontEmSize, DWRITE_SCRIPT_ANALYSIS ScriptAnalysis, uint TextLength, uint GlyphCount, uint MaxGlyphCount, const ushort *ClusterMap, const ushort *GlyphIndices, const float *GlyphAdvances, const float *JustifiedGlyphAdvances, const DWRITE_GLYPH_OFFSET *JustifiedGlyphOffsets, const DWRITE_SHAPING_GLYPH_PROPERTIES *GlyphProperties, uint *ActualGlyphCount, ushort *ModifiedClusterMap, ushort *ModifiedGlyphIndices, float *ModifiedGlyphAdvances, DWRITE_GLYPH_OFFSET *ModifiedGlyphOffsets);
		HRESULT GetScriptProperties(DWRITE_SCRIPT_ANALYSIS ScriptAnalysis, DWRITE_SCRIPT_PROPERTIES *ScriptProperties);
		HRESULT GetTextComplexity(const wchar *TextString, uint TextLength, IDWriteFontFace FontFace, BOOL *IsTextSimple, uint *TextLengthRead, ushort *GlyphIndices);
		HRESULT JustifyGlyphAdvances(float LineWidth, uint GlyphCount, const DWRITE_JUSTIFICATION_OPPORTUNITY *JustificationOpportunities, const float *GlyphAdvances, const DWRITE_GLYPH_OFFSET *GlyphOffsets, float *JustifiedGlyphAdvances, DWRITE_GLYPH_OFFSET *JustifiedGlyphOffsets);
	}
	
	mixin(uuid!(IDWriteTextLayout1, "9064D822-80A7-465C-A986-DF65F78B8FEB"));
	public interface IDWriteTextLayout1 : IDWriteTextLayout
	{
	extern(Windows):
		HRESULT GetCharacterSpacing(uint CurrentPosition, float *LeadingSpacing, float *TrailingSpacing, float *MinimumAdvanceWidth, DWRITE_TEXT_RANGE *TextRange = null);
		HRESULT GetPairKerning(uint CurrentPosition, BOOL *IsPairKerningEnabled, DWRITE_TEXT_RANGE *TextRange = null);
		HRESULT SetCharacterSpacing(float LeadingSpacing, float TrailingSpacing, float MinimumAdvanceWidth, DWRITE_TEXT_RANGE TextRange);
		HRESULT SetPairKerning(BOOL IsPairKerningEnabled, DWRITE_TEXT_RANGE TextRange);
	}
	
	mixin(uuid!(IDWriteFactory1, "30572f99-dac6-41db-a16e-0486307e606a"));
	public interface IDWriteFactory1 : IDWriteFactory
	{
	extern(Windows):
		HRESULT CreateCustomRenderingParams(float Gamma, float EnhancedContrast, float EnhancedContrastGrayscale, float ClearTypeLevel, DWRITE_PIXEL_GEOMETRY PixelGeometry, DWRITE_RENDERING_MODE RenderingMode, IDWriteRenderingParams1 *RenderingParams);
		HRESULT GetEudcFontCollection(IDWriteFontCollection *FontCollection, BOOL CheckForUpdates = FALSE);
	}
	
//}

//static if(DX112)
//{

	public enum DWRITE_OPTICAL_ALIGNMENT : int { 
		NONE,
		NO_SIDE_BEARINGS,
	}

	alias D3DCOLORVALUE DWRITE_COLOR_F;

	public struct DWRITE_COLOR_GLYPH_RUN {
		DWRITE_GLYPH_RUN             glyphRun;
		DWRITE_GLYPH_RUN_DESCRIPTION *glyphRunDescription;
		float                        baselineOriginX;
		float                        baselineOriginY;
		DWRITE_COLOR_F               runColor;
		uint                       paletteIndex;
	}

	public struct DWRITE_TEXT_METRICS1  {
		DWRITE_TEXT_METRICS base;
		alias base this;
		float heightIncludingTrailingWhitespace;
	}

	mixin(uuid!(IDWriteFont2, "29748ed6-8c9c-4a6a-be0b-d912e8538944"));
	public interface IDWriteFont2 : IDWriteFont1
	{
	extern(Windows):
		BOOL IsColorFont();
	}

	mixin(uuid!(IDWriteColorGlyphRunEnumerator, "d31fbe17-f157-41a2-8d24-cb779e0560e8"));
	public interface IDWriteColorGlyphRunEnumerator : IUnknown
	{
	extern(Windows):
		HRESULT GetCurrentRun(DWRITE_COLOR_GLYPH_RUN **ColorGlyphRun);
		HRESULT MoveNext(BOOL *HaveRun);
	}

	mixin(uuid!(IDWriteFontFace2, "d8b768ff-64bc-4e66-982b-ec8e87f693f7"));
	public interface IDWriteFontFace2 : IDWriteFontFace1
	{
	extern(Windows):
		uint GetColorPaletteCount();
		HRESULT GetPaletteEntries(uint ColorPaletteIndex, uint FirstEntryIndex, uint EntryCount, DWRITE_COLOR_F *PaletteEntries);
		uint GetPaletteEntryCount();
		BOOL IsColorFont();
	}

	mixin(uuid!(IDWriteFontFallback, "EFA008F9-F7A1-48BF-B05C-F224713CC0FF"));
	public interface IDWriteFontFallback : IUnknown
	{
	extern(Windows):
		HRESULT MapCharacters(IDWriteTextAnalysisSource Source, uint TextPosition, uint TextLength, IDWriteFontCollection BaseFontCollection, const wchar *BaseFamilyName, DWRITE_FONT_WEIGHT BaseWeight, DWRITE_FONT_STYLE BaseStyle, DWRITE_FONT_STRETCH BaseStretch, uint *MappedLength, IDWriteFont *MappedFont, float *Scale);
	}

	mixin(uuid!(IDWriteFontFallbackBuilder, "FD882D06-8ABA-4FB8-B849-8BE8B73E14DE"));
	public interface IDWriteFontFallbackBuilder : IUnknown
	{
	extern(Windows):
		HRESULT AddMapping(DWRITE_UNICODE_RANGE *Ranges, uint RangesCount, const wchar **TargetFamilyNames, uint targetFamilyNamesCount, IDWriteFontCollection FontCollection = null, const wchar *LocaleName = null, const WCHAR *BaseFamilyName = null, float Scale = 1);
		HRESULT AddMappings(IDWriteFontFallback FontFallback);
		HRESULT CreateFontFallback(IDWriteFontFallback *FontFallback);
	}

	mixin(uuid!(IDWriteTextAnalyzer2, "553A9FF3-5693-4DF7-B52B-74806F7F2EB9"));
	public interface IDWriteTextAnalyzer2 : IDWriteTextAnalyzer1
	{
	extern(Windows):
		HRESULT CheckTypographicFeature(DWRITE_SCRIPT_ANALYSIS ScriptAnalysis, const WCHAR *LocaleName, DWRITE_FONT_FEATURE_TAG Tag, uint GlyphCount, const ushort *GlyphIndices, ubyte *FeatureApplies);
		HRESULT GetGlyphOrientationTransform(DWRITE_GLYPH_ORIENTATION_ANGLE GlyphOrientationAngle, BOOL IsSideways, float OriginX, float OriginY, DWRITE_MATRIX *Transform);
		HRESULT GetTypographicFeatures(DWRITE_SCRIPT_ANALYSIS ScriptAnalysis, const wchar *LocaleName, uint MaxTagCount, uint *ActualTagCount, DWRITE_FONT_FEATURE_TAG *Tags);
	}

	mixin(uuid!(IDWriteTextFormat1, "5F174B49-0D8B-4CFB-8BCA-F1CCE9D06C67"));
	public interface IDWriteTextFormat1 : IDWriteTextFormat
	{
	extern(Windows):
		HRESULT GetFontFallback(IDWriteFontFallback *FontFallback);
		HRESULT SetFontFallback(IDWriteFontFallback FontFallback);
		HRESULT SetOpticalAlignment(DWRITE_OPTICAL_ALIGNMENT OpticalAlignment);
		HRESULT SetVerticalGlyphOrientation(DWRITE_VERTICAL_GLYPH_ORIENTATION GlyphOrientation);
		HRESULT SetWrapOnLastLine(BOOL IsLastLineWrappingEnabled);
	}

	mixin(uuid!(IDWriteTextLayout2, "1093C18F-8D5E-43F0-B064-0917311B525E"));
	public interface IDWriteTextLayout2 : IDWriteTextLayout1
	{
	extern(Windows):
		HRESULT GetFontFallback(IDWriteFontFallback *FontFallback);
		BOOL GetLastLineWrapping();
		HRESULT GetMetrics(DWRITE_TEXT_METRICS1 *TextMetrics);
		DWRITE_OPTICAL_ALIGNMENT GetOpticalAlignment();
		DWRITE_VERTICAL_GLYPH_ORIENTATION GetVerticalGlyphOrientation();
		HRESULT SetFontFallback(IDWriteFontFallback FontFallback);
		HRESULT SetLastLineWrapping(BOOL IsLastLineWrappingEnabled);
		HRESULT SetOpticalAlignment(DWRITE_OPTICAL_ALIGNMENT OpticalAlignment);
		HRESULT SetVerticalGlyphOrientation(DWRITE_VERTICAL_GLYPH_ORIENTATION GlyphOrientation);
	}

	mixin(uuid!(IDWriteTextRenderer1, "D3E0E934-22A0-427E-AAE4-7D9574B59DB1"));
	public interface IDWriteTextRenderer1 : IDWriteTextRenderer
	{
	extern(Windows):
		HRESULT SetCurrentOrientation(void *ClientDrawingContext, DWRITE_GLYPH_ORIENTATION_ANGLE Orientation);	
	}

	mixin(uuid!(IDWriteFactory2, "0439fc60-ca44-4994-8dee-3a9af7b732ec"));
	public interface IDWriteFactory2 : IDWriteFactory1
	{
	extern(Windows):
		HRESULT CreateFontFallbackBuilder(IDWriteFontFallbackBuilder *FontFallbackBuilder);
		HRESULT GetSystemFontFallback(IDWriteFontFallback *FontFallback);
		HRESULT TranslateColorGlyphRun(float BaselineOriginX, float BaselineOriginY, const DWRITE_GLYPH_RUN *GlyphRun, const DWRITE_GLYPH_RUN_DESCRIPTION *GlyphRunDescription, DWRITE_MEASURING_MODE MeasuringMode, const DWRITE_MATRIX *WorldToDeviceTransform, uint ColorPaletteIndex, IDWriteColorGlyphRunEnumerator *ColorLayers);
	}

//}

public extern(C) HRESULT DWriteCreateFactory(DWRITE_FACTORY_TYPE FactoryType, GUID IID, IUnknown* Factory);
