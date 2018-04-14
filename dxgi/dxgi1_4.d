module aurora.directx.dxgi.dxgi1_4;

import aurora.directx.com;
public import aurora.directx.dxgi.dxgi1_3;

public:

///
/// Constants
///

///
/// Functions
///

///
/// Enumerations
///

enum DXGI_SWAP_CHAIN_COLOR_SPACE_SUPPORT_FLAG
{
    PRESENT	= 0x1,
    OVERLAY_PRESENT	= 0x2
}

enum DXGI_OVERLAY_COLOR_SPACE_SUPPORT_FLAG
{
    PRESENT	= 0x1
}

enum DXGI_MEMORY_SEGMENT_GROUP
{
    LOCAL	= 0,
    NON_LOCAL	= 1
}

///
/// Structures
///

struct DXGI_QUERY_VIDEO_MEMORY_INFO
{
    ulong Budget;
    ulong CurrentUsage;
    ulong AvailableForReservation;
    ulong CurrentReservation;
}

///
/// Interfaces
///

mixin(uuid!(IDXGISwapChain3, "94d99bdb-f1f8-4ab0-b236-7da0170edab1"));
public interface IDXGISwapChain3 : IDXGISwapChain2
{
extern(Windows):
    uint GetCurrentBackBufferIndex();
    HRESULT CheckColorSpaceSupport(DXGI_COLOR_SPACE_TYPE ColorSpace, uint *pColorSpaceSupport);
    HRESULT ResizeBuffers1(uint BufferCount, uint Width, uint Height, DXGI_FORMAT Format, uint SwapChainFlags, const uint *pCreationNodeMask, const(IUnknown) *ppPresentQueue);
    HRESULT SetColorSpace1(DXGI_COLOR_SPACE_TYPE ColorSpace);
}

mixin(uuid!(IDXGIOutput4, "dc7dca35-2196-414d-9F53-617884032a60"));
public interface IDXGIOutput4 : IDXGIOutput3
{
extern(Windows):
    HRESULT CheckOverlayColorSpaceSupport(DXGI_FORMAT Format, DXGI_COLOR_SPACE_TYPE ColorSpace, IUnknown pConcernedDevice, uint *pFlags);
}

mixin(uuid!(IDXGIFactory4, "1bc6ea02-ef36-464f-bf0c-21ca39e5168a"));
public interface IDXGIFactory4 : IDXGIFactory3
{
extern(Windows):
    HRESULT EnumAdapterByLuid(LUID AdapterLuid, REFIID riid, void **ppvAdapter);
    HRESULT EnumWarpAdapter(REFIID riid, void **ppvAdapter);
}

mixin(uuid!(IDXGIAdapter3, "645967A4-1392-4310-A798-8053CE3E93FD"));
public interface IDXGIAdapter3 : IDXGIAdapter2
{
extern(Windows):
    HRESULT QueryVideoMemoryInfo(uint NodeIndex, DXGI_MEMORY_SEGMENT_GROUP MemorySegmentGroup, DXGI_QUERY_VIDEO_MEMORY_INFO *pVideoMemoryInfo);
    HRESULT RegisterHardwareContentProtectionTeardownStatusEvent(HANDLE hEvent, uint *pdwCookie);
    HRESULT RegisterVideoMemoryBudgetChangeNotificationEvent(HANDLE hEvent, uint *pdwCookie);
    HRESULT SetVideoMemoryReservation(uint NodeIndex, DXGI_MEMORY_SEGMENT_GROUP MemorySegmentGroup, ulong Reservation);
    void UnregisterHardwareContentProtectionTeardownStatus(uint dwCookie);
    void UnregisterVideoMemoryBudgetChangeNotification(uint dwCookie);
}
