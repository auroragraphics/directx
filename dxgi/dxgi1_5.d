module aurora.directx.dxgi.dxgi1_5;

import aurora.directx.com;
public import aurora.directx.dxgi.dxgi1_4;

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

enum DXGI_OUTDUPL_FLAG
{
    COMPOSITED_UI_CAPTURE_ONLY= 1
}

enum DXGI_HDR_METADATA_TYPE
{
    NONE = 0,
    HDR10 = 1
}

enum _DXGI_OFFER_RESOURCE_FLAGS
{
    ALLOW_DECOMMIT= 0x1
}

enum _DXGI_RECLAIM_RESOURCE_RESULTS
{
    OK	= 0,
    DISCARDED	= 1,
    NOT_COMMITTED	= 2
}

enum DXGI_FEATURE
{
    PRESENT_ALLOW_TEARING	= 0
}

///
/// Structures
///

struct DXGI_HDR_METADATA_HDR10
{
    ushort[2] RedPrimary;
    ushort[2] GreenPrimary;
    ushort[2] BluePrimary;
    ushort[2] WhitePoint;
    uint MaxMasteringLuminance;
    uint MinMasteringLuminance;
    ushort MaxContentLightLevel;
    ushort MaxFrameAverageLightLevel;
}

///
/// Interfaces
///

mixin(uuid!(IDXGISwapChain4, "3D585D5A-BD4A-489E-B1F4-3DBCB6452FFB"));
public interface IDXGISwapChain4 : IDXGISwapChain3
{
extern(Windows):
    HRESULT SetHDRMetaData(DXGI_HDR_METADATA_TYPE Type, uint Size, void *pMetaData);
}

mixin(uuid!(IDXGIDevice4, "95B4F95F-D8DA-4CA4-9EE6-3B76D5968A10"));
public interface IDXGIDevice4 : IDXGIDevice3
{
extern(Windows):
    HRESULT OfferResources1(uint NumResources, const(IDXGIResource) *ppResources, DXGI_OFFER_RESOURCE_PRIORITY Priority, uint Flags);
    HRESULT ReclaimResources1(uint NumResources, const(IDXGIResource) *ppResources, DXGI_RECLAIM_RESOURCE_RESULTS *pResults);
}

mixin(uuid!(IDXGIFactory5, "7632e1f5-ee65-4dca-87fd-84cd75f8838d"));
public interface IDXGIFactory5 : IDXGIFactory4
{
extern(Windows):
    HRESULT CheckFeatureSupport(DXGI_FEATURE Feature, void *pFeatureSupportData, uint FeatureSupportDataSize);
}
