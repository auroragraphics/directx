module aurora.directx.wic;

import aurora.directx.com;

alias uint WICColor;

enum WICColorContextType : int { 
	Uninitialized   = 0x00000000,
	Profile         = 0x00000001,
	ExifColorSpace  = 0x00000002
}

enum WICBitmapPaletteType : int { 
	Custom            = 0x00000000,
	MedianCut         = 0x00000001,
	FixedBW           = 0x00000002,
	FixedHalftone8    = 0x00000003,
	FixedHalftone27   = 0x00000004,
	FixedHalftone64   = 0x00000005,
	FixedHalftone125  = 0x00000006,
	FixedHalftone216  = 0x00000007,
	FixedWebPalette   = FixedHalftone216,
	FixedHalftone252  = 0x00000008,
	FixedHalftone256  = 0x00000009,
	FixedGray4        = 0x0000000A,
	FixedGray16       = 0x0000000B,
	FixedGray256      = 0x0000000C
}

enum WICBitmapCreateCacheOption { 
	NoCache        = 0x00000000,
	CacheOnDemand  = 0x00000001,
	CacheOnLoad    = 0x00000002
}

enum WICBitmapAlphaChannelOption { 
	UseAlpha                         = 0x00000000,
	UsePremultipliedAlpha            = 0x00000001,
	IgnoreAlpha                      = 0x00000002,
	ALPHACHANNELOPTIONS_FORCE_DWORD  = 0xFFFFFFFF,
}

enum WICDecodeOptions { 
	MetadataCacheOnDemand  = 0x00000000,
	MetadataCacheOnLoad    = 0x00000001
}

enum WICBitmapTransformOptions { 
	Rotate0         = 0x00000000,
	Rotate90        = 0x00000001,
	Rotate180       = 0x00000002,
	Rotate270       = 0x00000003,
	FlipHorizontal  = 0x00000008,
	FlipVertical    = 0x00000010
}

enum WICBitmapInterpolationMode { 
	NearestNeighbor  = 0x00000000,
	Linear           = 0x00000001,
	Cubic            = 0x00000002,
	Fant             = 0x00000003
}

enum WICComponentType { 
	Decoder               = 0x00000001,
	Encoder               = 0x00000002,
	PixelFormatConverter  = 0x00000004,
	MetadataReader        = 0x00000008,
	MetadataWriter        = 0x00000010,
	PixelFormat           = 0x00000020,
	AllComponents         = 0x0000003F
}

enum WICComponentSigning { 
	Signed    = 0x00000001,
	Unsigned  = 0x00000002,
	Safe      = 0x00000004,
	Disabled  = 0x80000000
}

enum WICBitmapDecoderCapabilities { 
	SameEncoder           = 0x00000001,
	CanDecodeAllImages    = 0x00000002,
	CanDecodeSomeImages   = 0x00000004,
	CanEnumerateMetadata  = 0x00000008,
	CanDecodeThumbnail    = 0x00000010
}

enum WICBitmapEncoderCacheOption { 
	CacheInMemory  = 0x00000000,
	CacheTempFile  = 0x00000001,
	NoCache        = 0x00000002
}

enum WICBitmapDitherType { 
	None            = 0x00000000,
	Solid           = 0x00000000,
	Ordered4x4      = 0x00000001,
	Ordered8x8      = 0x00000002,
	Ordered16x16    = 0x00000003,
	Spiral4x4       = 0x00000004,
	Spiral8x8       = 0x00000005,
	DualSpiral4x4   = 0x00000006,
	DualSpiral8x8   = 0x00000007,
	ErrorDiffusion  = 0x00000008
}

public struct WICRect 
{
	int X;
	int Y;
	int Width;
	int Height;
}

public struct WICBitmapPattern {
	ULARGE_INTEGER Position;
	ulong Length;
	ubyte *Pattern;
	ubyte *Mask;
	BOOL           EndOfStream;
}

mixin(uuid!(IWICColorContext, "3C613A02-34B2-44ea-9A7C-45AEA9C6FD6D"));
public interface IWICColorContext : IUnknown
{
extern(Windows):
	HRESULT GetExifColorSpace(uint *pValue);
	HRESULT GetProfileBytes(uint cbBuffer, ubyte *pbBuffer, uint *pcbActual);
	HRESULT GetType(WICColorContextType *pType);
	HRESULT InitializeFromExifColorSpace(uint value);
	HRESULT InitializeFromFilename(LPCWSTR wzFilename);
	HRESULT InitializeFromMemory(const(ubyte) *pbBuffer, uint cbBufferSize);
}

mixin(uuid!(IWICPalette , "00000040-a8f2-4877-ba0a-fd2b6645fb94"));
public interface IWICPalette  : IUnknown
{
extern(Windows):
	HRESULT GetColorCount(uint *pcCount);
	HRESULT GetColors(uint colorCount, WICColor *pColors, uint *pcActualColors);
	HRESULT GetType(WICBitmapPaletteType *pePaletteType);
	HRESULT HasAlpha(BOOL *pfHasAlpha);
	HRESULT InitializeCustom(WICColor *pColors, uint colorCount);
	HRESULT InitializeFromBitmap(IWICBitmapSource *pISurface, uint colorCount, BOOL fAddTransparentColor);
	HRESULT InitializeFromPalette(IWICPalette *pIMILPalette);
	HRESULT InitializePredefined(WICBitmapPaletteType ePaletteType, BOOL fAddTransparentColor);
	HRESULT IsBlackWhite(BOOL *pfIsBlackWhite);
	HRESULT IsGrayscale(BOOL *pfIsGrayscale);
}

mixin(uuid!(IWICBitmapLock, "00000123-a8f2-4877-ba0a-fd2b6645fb94"));
public interface IWICBitmapLock : IUnknown
{
extern(Windows):
	HRESULT GetDataPointer(uint *pcbBufferSize, ubyte **ppbData);
	HRESULT GetPixelFormat(GUID *pPixelFormat);
	HRESULT GetSize(uint *pWidth, uint *pHeight);
	HRESULT GetStride(uint *pcbStride);
}

mixin(uuid!(IWICBitmapSource, "00000120-a8f2-4877-ba0a-fd2b6645fb94"));
public interface IWICBitmapSource : IUnknown
{
extern(Windows):
	HRESULT CopyPalette(IWICPalette pIPalette);
	HRESULT CopyPixels(const WICRect *prc, uint cbStride, uint cbBufferSize, ubyte *pbBuffer);
	HRESULT GetPixelFormat(GUID *pPixelFormat);
	HRESULT GetResolution(double *pDpiX, double *pDpiY);
	HRESULT GetSize(uint *puiWidth, uint *puiHeight);
}

mixin(uuid!(IWICBitmap, "00000121-a8f2-4877-ba0a-fd2b6645fb94"));
public interface IWICBitmap : IWICBitmapSource
{
extern(Windows):
	HRESULT Lock(const WICRect *prcLock, DWORD flags, IWICBitmapLock **ppILock);
	HRESULT SetPalette(IWICPalette pIPalette);
	HRESULT SetResolution(double dpiX, double dpiY);
}

mixin(uuid!(IWICImagingFactory , "ec5ec8a9-c395-4314-9c77-54d7a935ff70"));
public interface IWICImagingFactory : IUnknown
{
extern(Windows):
	HRESULT CreateBitmap(uint uiWidth, uint uiHeight, GUID* pixelFormat, WICBitmapCreateCacheOption option, IWICBitmap *ppIBitmap);
	HRESULT CreateBitmapClipper(IWICBitmapClipper **ppIBitmapClipper);
	HRESULT CreateBitmapFlipRotator(IWICBitmapFlipRotator **ppIBitmapFlipRotator);
	HRESULT CreateBitmapFromHBITMAP(HBITMAP hBitmap, HPALETTE hPalette, WICBitmapAlphaChannelOption options, IWICBitmap *ppIBitmap);
	HRESULT CreateBitmapFromHICON(HICON hIcon, IWICBitmap *ppIBitmap);
	HRESULT CreateBitmapFromMemory(uint uiWidth, uint uiHeight, GUID pixelFormat, uint cbStride, uint cbBufferSize, ubyte *pbBuffer, IWICBitmap *ppIBitmap);
	HRESULT CreateBitmapFromSource(IWICBitmapSource pIBitmapSource, WICBitmapCreateCacheOption option, IWICBitmap **ppIBitmap);
	HRESULT CreateBitmapFromSourceRect(IWICBitmapSource pIBitmapSource, uint x, uint y, uint width, uint height, IWICBitmap *ppIBitmap);
	HRESULT CreateBitmapScaler(IWICBitmapScaler *ppIBitmapScaler);
	HRESULT CreateColorContext(IWICColorContext *ppIWICColorContext);
	HRESULT CreateColorTransformer(IWICColorTransform *ppIWICColorTransform);
	HRESULT CreateComponentEnumerator(DWORD componentTypes, DWORD options, IEnumUnknown *ppIEnumUnknown);
	HRESULT CreateComponentInfo(CLSID* clsidComponent, IWICComponentInfo **ppIInfo);
	HRESULT CreateDecoder(GUID* guidContainerFormat, const GUID *pguidVendor, IWICBitmapDecoder **ppIDecoder);
	HRESULT CreateDecoderFromFileHandle(ulong* hFile, const GUID *pguidVendor, WICDecodeOptions metadataOptions, IWICBitmapDecoder *ppIDecoder);
	HRESULT CreateDecoderFromFilename(LPCWSTR wzFilename, const GUID *pguidVendor, DWORD dwDesiredAccess, WICDecodeOptions metadataOptions, IWICBitmapDecoder *ppIDecoder);
	HRESULT CreateDecoderFromStream(IStream *pIStream, const GUID *pguidVendor, WICDecodeOptions metadataOptions, IWICBitmapDecoder *ppIDecoder);
	HRESULT CreateEncoder(GUID* guidContainerFormat, const GUID *pguidVendor, IWICBitmapEncoder *ppIEncoder);
	HRESULT CreateFastMetadataEncoderFromDecoder(IWICBitmapDecoder pIDecoder, IWICFastMetadataEncoder *ppIFastEncoder);
	HRESULT CreateFastMetadataEncoderFromFrameDecode(IWICBitmapFrameDecode pIFrameDecoder, IWICFastMetadataEncoder *ppIFastEncoder);
	HRESULT CreateFormatConverter(IWICFormatConverter *ppIFormatConverter);
	HRESULT CreatePalette(IWICPalette *ppIPalette);
	HRESULT CreateQueryWriter(GUID* guidMetadataFormat, const GUID *pguidVendor, IWICMetadataQueryWriter *ppIQueryWriter);
	HRESULT CreateQueryWriterFromReader(IWICMetadataQueryReader pIQueryReader, const GUID *pguidVendor, IWICMetadataQueryWriter *ppIQueryWriter);
	HRESULT CreateStream(IWICStream *ppIWICStream);
}

mixin(uuid!(IWICBitmapClipper, "E4FBCF03-223D-4e81-9333-D635556DD1B5"));
public interface IWICBitmapClipper : IWICBitmapSource
{
extern(Windows):
	HRESULT Initialize(IWICBitmapSource pISource, const WICRect *prc);
}

mixin(uuid!(IWICBitmapFlipRotator, "5009834F-2D6A-41ce-9E1B-17C5AFF7A782"));
public interface IWICBitmapFlipRotator : IWICBitmapSource
{
extern(Windows):
	HRESULT Initialize(IWICBitmapSource pISource, WICBitmapTransformOptions options);
}

mixin(uuid!(IWICBitmapScaler, "00000302-a8f2-4877-ba0a-fd2b6645fb94"));
public interface IWICBitmapScaler : IWICBitmapSource
{
extern(Windows):
	HRESULT Initialize(IWICBitmapSource *pISource, uint uiWidth, uint uiHeight, WICBitmapInterpolationMode mode);
}

mixin(uuid!(IWICColorTransform, "B66F034F-D0E2-40ab-B436-6DE39E321A94"));
public interface IWICColorTransform : IWICBitmapSource
{
extern(Windows):
	HRESULT Initialize(IWICBitmapSource pIBitmapSource, IWICColorContext pIContextSource, IWICColorContext pIContextDest, GUID pixelFmtDest);
}

mixin(uuid!(IWICComponentInfo , "23BC3F0A-698B-4357-886B-F24D50671334"));
public interface IWICComponentInfo : IUnknown
{
extern(Windows):
	HRESULT GetAuthor(uint cchAuthor, wchar *wzAuthor, uint *pcchActual);
	HRESULT GetCLSID(CLSID *pclsid);
	HRESULT GetComponentType(WICComponentType *pType);
	HRESULT GetFriendlyName(uint cchFriendlyName, wchar *wzFriendlyName, uint *pcchActual);
	HRESULT GetSigningStatus(DWORD *pStatus);
	HRESULT GetSpecVersion(uint cchSpecVersion, wchar *wzSpecVersion, uint *pcchActual);
	HRESULT GetVendorGUID(GUID *pguidVendor);
	HRESULT GetVersion(uint cchVersion, wchar *wzVersion, uint *pcchActual);
}

mixin(uuid!(IWICBitmapDecoder , "9EDDE9E7-8DEE-47ea-99DF-E6FAF2ED44BF"));
public interface IWICBitmapDecoder : IUnknown
{
extern(Windows):
	HRESULT CopyPalette(IWICPalette pIPalette);
	HRESULT GetColorContexts(uint cCount, IWICColorContext *ppIColorContexts, uint *pcActualCount);
	HRESULT GetContainerFormat(GUID *pguidContainerFormat);
	HRESULT GetDecoderInfo(IWICBitmapDecoderInfo *ppIDecoderInfo);
	HRESULT GetFrame(uint index, IWICBitmapFrameDecode *ppIBitmapFrame);
	HRESULT GetFrameCount(uint *pCount);
	HRESULT GetMetadataQueryReader(IWICMetadataQueryReader *ppIMetadataQueryReader);
	HRESULT GetPreview(IWICBitmapSource *ppIBitmapSource);
	HRESULT GetThumbnail(IWICBitmapSource *ppIThumbnail);
	HRESULT Initialize(IStream *pIStream, WICDecodeOptions cacheOptions);
	HRESULT QueryCapability(IStream *pIStream, DWORD *pdwCapability);
}

mixin(uuid!(IWICBitmapDecoderInfo, "D8CD007F-D08F-4191-9BFC-236EA7F0E4B5"));
public interface IWICBitmapDecoderInfo : IWICBitmapCodecInfo
{
extern(Windows):
	HRESULT CreateInstance(IWICBitmapDecoder *ppIBitmapDecoder);
	HRESULT GetPatterns(uint cbSizePatterns, WICBitmapPattern *pPatterns, uint *pcPatterns, uint *pcbPatternsActual);
	HRESULT MatchesPattern(IStream *pIStream, BOOL *pfMatches);
}

mixin(uuid!(IWICBitmapCodecInfo , "E87A44C4-B76E-4c47-8B09-298EB12A2714"));
public interface IWICBitmapCodecInfo : IWICComponentInfo
{
extern(Windows):
	HRESULT DoesSupportAnimation(BOOL *pfSupportAnimation);
	HRESULT DoesSupportChromakey(BOOL *pfSupportChromakey);
	HRESULT DoesSupportLossless(BOOL *pfSupportLossless);
	HRESULT DoesSupportMultiframe(BOOL *pfSupportMultiframe);
	HRESULT GetColorManagementVersion(uint cchColorManagementVersion, wchar *wzColorManagementVersion, uint *pcchActual);
	HRESULT GetContainerFormat(GUID *pguidContainerFormat);
	HRESULT GetDeviceManufacturer(uint cchDeviceManufacturer, wchar *wzDeviceManufacturer, uint *pcchActual);
	HRESULT GetMetadataQueryReader(IWICMetadataQueryReader *ppIMetadataQueryReader);
	HRESULT GetDeviceModels(uint cchDeviceModels, wchar *wzDeviceModels, uint *pcchActual);
	HRESULT GetFileExtensions(uint cchFileExtensions, wchar *wzFileExtensions, uint *pcchActual);
	HRESULT GetMimeTypes(uint cchMimeTypes, wchar *wzMimeTypes, uint *pcchActual);
	HRESULT GetPixelFormats(uint cFormats, GUID *pguidPixelFormats, uint *pcActual);
	HRESULT MatchesMimeType(LPCWSTR wzMimeType, BOOL *pfMatches);
}

mixin(uuid!(IWICBitmapFrameDecode, "3B16811B-6A43-4ec9-A813-3D930C13B940"));
public interface IWICBitmapFrameDecode : IWICBitmapSource
{
extern(Windows):
	HRESULT GetColorContexts(uint cCount, IWICColorContext *ppIColorContexts, uint *pcActualCount);
	HRESULT GetMetadataQueryReader(IWICMetadataQueryReader *ppIMetadataQueryReader);
	HRESULT GetThumbnail(IWICBitmapSource *ppIThumbnail);
}

mixin(uuid!(IWICMetadataQueryReader, "30989668-E1C9-4597-B395-458EEDB808DF"));
public interface IWICMetadataQueryReader : IUnknown
{
extern(Windows):
	HRESULT GetContainerFormat(GUID *pguidContainerFormat);
	HRESULT GetEnumerator(IEnumString *ppIEnumString);
	HRESULT GetLocation(uint cchMaxLength, wchar *wzNamespace, uint *pcchActualLength);
	//PROPVARIANT Requires a complex binding, it can be done later
	//HRESULT GetMetadataByName(LPCWSTR wzName, PROPVARIANT *pvarValue);
}

mixin(uuid!(IWICMetadataQueryWriter, "A721791A-0DEF-4d06-BD91-2118BF1DB10B"));
public interface IWICMetadataQueryWriter : IWICMetadataQueryReader
{
extern(Windows):
	HRESULT RemoveMetadataByName(LPCWSTR wzName);
	//PROPVARIANT Requires a complex binding, it can be done later
	//HRESULT SetMetadataByName(LPCWSTR wzName, const PROPVARIANT *pvarValue);
}

mixin(uuid!(IWICBitmapEncoder, "00000103-a8f2-4877-ba0a-fd2b6645fb94"));
public interface IWICBitmapEncoder : IUnknown
{
extern(Windows):
	HRESULT Commit();
	//IPropertyBag2 Requires a complex binding, it can be done later
	//HRESULT CreateNewFrame(IWICBitmapFrameEncode *ppIFrameEncode, IPropertyBag2 **ppIEncoderOptions);
	HRESULT GetContainerFormat(GUID *pguidContainerFormat);
	HRESULT GetEncoderInfo(IWICBitmapEncoderInfo *ppIEncoderInfo);
	HRESULT GetMetadataQueryWriter(IWICMetadataQueryWriter *ppIMetadataQueryWriter);
	HRESULT Initialize(IStream *pIStream, WICBitmapEncoderCacheOption cacheOption);
	HRESULT SetColorContexts(uint cCount, IWICColorContext *ppIColorContext);
	HRESULT SetPalette(IWICPalette pIPalette);
	HRESULT SetPreview(IWICBitmapSource pIPreview);
	HRESULT SetThumbnail(IWICBitmapSource pIThumbnail);
}

mixin(uuid!(IWICBitmapEncoderInfo, "94C9B4EE-A09F-4f92-8A1E-4A9BCE7E76FB"));
public interface IWICBitmapEncoderInfo : IWICBitmapCodecInfo
{
extern(Windows):
	HRESULT CreateInstance(IWICBitmapEncoder *ppIBitmapEncoder);
}

mixin(uuid!(IWICBitmapFrameEncode, "00000105-a8f2-4877-ba0a-fd2b6645fb94"));
public interface IWICBitmapFrameEncode : IUnknown
{
extern(Windows):
	HRESULT Commit();
	HRESULT GetMetadataQueryWriter(IWICMetadataQueryWriter *ppIMetadataQueryWriter);
	HRESULT Initialize(IStream *pIStream, WICBitmapEncoderCacheOption cacheOption);
	HRESULT SetColorContexts(uint cCount, IWICColorContext *ppIColorContext);
	HRESULT SetPalette(IWICPalette pIPalette);
	HRESULT SetPixelFormat(GUID *pPixelFormat);
	HRESULT SetResolution(double dpiX, double dpiY);
	HRESULT SetSize(uint uiWidth, uint uiHeight);
	HRESULT SetThumbnail(IWICBitmapSource pIThumbnail);
	HRESULT WritePixels(uint lineCount, uint cbStride, uint cbBufferSize, ubyte *pbPixels);
	HRESULT WriteSource(IWICBitmapSource pIBitmapSource, WICRect *prc);
}

mixin(uuid!(IWICFormatConverter, "00000301-a8f2-4877-ba0a-fd2b6645fb94"));
public interface IWICFormatConverter : IWICBitmapSource
{
extern(Windows):
	HRESULT CanConvert(GUID srcPixelFormat, GUID dstPixelFormat, BOOL *pfCanConvert);
	HRESULT Initialize(IWICBitmapSource pISource, GUID* dstFormat, WICBitmapDitherType dither, IWICPalette pIPalette, double alphaThresholdPercent, WICBitmapPaletteType paletteTranslate);
}

mixin(uuid!(IWICStream, "135FF860-22B7-4ddf-B0F6-218F4F299A43"));
public interface IWICStream : IStream
{
extern(Windows):
	HRESULT InitializeFromFilename(LPCWSTR wzFileName, DWORD dwDesiredAccess);
	HRESULT InitializeFromIStream(IStream *pIStream);
	HRESULT InitializeFromIStreamRegion(IStream *pIStream, ULARGE_INTEGER ulOffset, ULARGE_INTEGER ulMaxSize);
	HRESULT InitializeFromMemory(ubyte *pbBuffer, DWORD cbBufferSize);
}

mixin(uuid!(IWICFastMetadataEncoder, "B84E2C09-78C9-4AC4-8BD3-524AE1663A2F"));
public interface IWICFastMetadataEncoder : IUnknown
{
extern(Windows):
	HRESULT Commit();
	HRESULT GetMetadataQueryWriter(IWICMetadataQueryWriter *ppIMetadataQueryWriter);
}
