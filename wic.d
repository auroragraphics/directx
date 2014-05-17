module aurora.directx.wic;

import aurora.directx.com;
import aurora.directx.config;

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

public struct WICRect 
{
	int X;
	int Y;
	int Width;
	int Height;
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
