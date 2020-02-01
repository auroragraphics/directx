module aurora.directx.d3d11.d3d11_4;

version(Windows):

public import aurora.directx.d3d11.d3d11_3;

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

///
/// Structures
///

struct D3D11_FEATURE_DATA_D3D11_OPTIONS4
{
    bool ExtendedNV12SharedTextureSupported;
}

///
/// Interfaces
///

mixin(uuid!(ID3D11Device4, "8992ab71-02e6-4b8d-ba48-b056dcda42c4"));
public interface ID3D11Device4 : ID3D11Device3
{
extern(Windows):
	HRESULT RegisterDeviceRemovedEvent(HANDLE hEvent, uint *pdwCookie);
    void UnregisterDeviceRemoved(uint dwCookie);
}

mixin(uuid!(ID3D11Device5, "8ffde202-a0e7-45df-9e01-e837801b5ea0"));
public interface ID3D11Device5 : ID3D11Device4
{
extern(Windows):
	HRESULT CreateFence(ulong InitialValue, D3D11_FENCE_FLAG Flags, REFIID riid, void **ppFence);
    HRESULT OpenSharedFence(HANDLE hFence, REFIID ReturnedInterface, void **ppFence);
}

mixin(uuid!(ID3D11Multithread, "9B7E4E00-342C-4106-A19F-4F2704F689F0"));
public interface ID3D11Multithread : IUnknown
{
extern(Windows):
	void Enter();
    bool GetMultithreadProtected();
    void Leave();
    bool SetMultithreadProtected(bool bMTProtect);
}

mixin(uuid!(ID3D11VideoContext2, "C4E7374C-6243-4D1B-AE87-52B4F740E261"));
public interface ID3D11VideoContext2 : ID3D11VideoContext1
{
extern(Windows):
	HRESULT VideoProcessorGetOutputHDRMetaData(ID3D11VideoProcessor pVideoProcessor, DXGI_HDR_METADATA_TYPE Type, uint Size, const void *pHDRMetaData);
    HRESULT VideoProcessorSetOutputHDRMetaData(ID3D11VideoProcessor pVideoProcessor, DXGI_HDR_METADATA_TYPE Type, uint Size, const void *pHDRMetaData);
    HRESULT VideoProcessorGetStreamHDRMetaData(ID3D11VideoProcessor pVideoProcessor, uint StreamIndex, DXGI_HDR_METADATA_TYPE pType, uint Size, const void *pHDRMetaData);
    HRESULT VideoProcessorSetStreamHDRMetaData(ID3D11VideoProcessor pVideoProcessor, uint StreamIndex, DXGI_HDR_METADATA_TYPE Type, uint Size, const void *pHDRMetaData);
}
