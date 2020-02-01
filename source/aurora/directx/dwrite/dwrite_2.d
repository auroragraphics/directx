module aurora.directx.dwrite.dwrite_2;

version(Windows):

public import aurora.directx.com;
public import aurora.directx.dwrite.dwrite_1;

public:

///
/// Constants
///

///
/// Functions
///

///
///	Enumerations
///

enum DWRITE_GRID_FIT_MODE {
	DEFAULT, 
	DISABLED, 
	ENABLED
}

public enum DWRITE_OPTICAL_ALIGNMENT : int { 
	NONE,
	NO_SIDE_BEARINGS,
}

///
/// Structures
///

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

///
/// Interfaces
///

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

mixin(uuid!(IDWriteRenderingParams2, "F9D711C3-9777-40AE-87E8-3E5AF9BF0948"));
interface IDWriteRenderingParams2 : IDWriteRenderingParams1
{
extern(Windows):
    DWRITE_GRID_FIT_MODE GetGridFitMode();
};

