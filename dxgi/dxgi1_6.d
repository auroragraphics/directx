module aurora.directx.dxgi.dxgi1_6;

import aurora.directx.com;
public import aurora.directx.dxgi.dxgi1_5;

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

enum DXGI_ADAPTER_FLAG3
{
    NONE = 0,
    REMOTE = 1,
    SOFTWARE = 2,
    ACG_COMPATIBLE = 4,
    SUPPORT_MONITORED_FENCES = 8,
    SUPPORT_NON_MONITORED_FENCES = 0x10,
    KEYED_MUTEX_CONFORMANCE	= 0x20,
    FORCE_DWORD	= 0xffffffff
}

enum DXGI_HARDWARE_COMPOSITION_SUPPORT_FLAGS
{
    FULLSCREEN= 1,
    WINDOWED = 2,
    CURSOR_STRETCHED = 4
}

///
/// Structures
///

struct DXGI_ADAPTER_DESC3
{
    wchar[128] Description;
    uint VendorId;
    uint DeviceId;
    uint SubSysId;
    uint Revision;
    size_t DedicatedVideoMemory;
    size_t DedicatedSystemMemory;
    size_t SharedSystemMemory;
    LUID AdapterLuid;
    DXGI_ADAPTER_FLAG3 Flags;
    DXGI_GRAPHICS_PREEMPTION_GRANULARITY GraphicsPreemptionGranularity;
    DXGI_COMPUTE_PREEMPTION_GRANULARITY ComputePreemptionGranularity;
}

struct DXGI_OUTPUT_DESC1
{
    wchar[32] DeviceName;
    RECT DesktopCoordinates;
    bool AttachedToDesktop;
    DXGI_MODE_ROTATION Rotation;
    HMONITOR Monitor;
    uint BitsPerColor;
    DXGI_COLOR_SPACE_TYPE ColorSpace;
    float[2] RedPrimary;
    float[2] GreenPrimary;
    float[2] BluePrimary;
    float[2] WhitePoint;
    float MinLuminance;
    float MaxLuminance;
    float MaxFullFrameLuminance;
}

///
/// Interfaces
///

mixin(uuid!(IDXGIAdapter4, "3c8d99d1-4fbf-4181-a82c-af66bf7bd24e"));
public interface IDXGIAdapter4 : IDXGIAdapter3
{
extern(Windows):
    HRESULT GetDesc3(DXGI_ADAPTER_DESC3 *pDesc);
}

mixin(uuid!(IDXGIOutput6, "068346e8-aaec-4b84-add7-137f513f77a1"));
public interface IDXGIOutput6 : IDXGIOutput5
{
extern(Windows):
    HRESULT GetDesc1(DXGI_OUTPUT_DESC1 *pDesc);
}
