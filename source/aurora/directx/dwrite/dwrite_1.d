module aurora.directx.dwrite.dwrite_1;

public import aurora.directx.com;
public import aurora.directx.dwrite.dwrite_0;

///
/// Constants
///

///
/// Functions
///

///
/// Enumerations
///

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

///
/// Structures
///

public struct DWRITE_CARET_METRICS {
	short slopeRise;
	short slopeRun;
	short offset;
}

public union DWRITE_PANOSE {
	ubyte[10] values;
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

///
/// Interfaces
///

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
