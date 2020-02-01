module aurora.directx.d3d11.d3d11_3;

version(Windows):

public import aurora.directx.d3d11.d3d11_2;

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

enum D3D11_CONTEXT_TYPE : uint
{
    TYPE_ALL = 0,
    TYPE_3D = 1,
    TYPE_COMPUTE = 2,
    TYPE_COPY = 3,
    TYPE_VIDEO = 4
}

enum D3D11_TEXTURE_LAYOUT : uint
{
    LAYOUT_UNDEFINED = 0,
    LAYOUT_ROW_MAJOR = 1,
    LAYOUT_64K_STANDARD_SWIZZLE = 2
}

enum D3D11_CONSERVATIVE_RASTERIZATION_MODE : uint
{
    OFF = 0,
    ON = 1
}

enum D3D11_FENCE_FLAG : uint
{
    NONE	= 0x1,
    SHARED	= 0x2,
    SHARED_CROSS_ADAPTER	= 0x4
}

///
/// Structures
///

struct D3D11_TEXTURE2D_DESC1
{
    uint Width;
    uint Height;
    uint MipLevels;
    uint ArraySize;
    DXGI_FORMAT Format;
    DXGI_SAMPLE_DESC SampleDesc;
    D3D11_USAGE Usage;
    uint BindFlags;
    uint CPUAccessFlags;
    uint MiscFlags;
    D3D11_TEXTURE_LAYOUT TextureLayout;
}

struct D3D11_TEXTURE3D_DESC1
{
    uint Width;
    uint Height;
    uint Depth;
    uint MipLevels;
    DXGI_FORMAT Format;
    D3D11_USAGE Usage;
    uint BindFlags;
    uint CPUAccessFlags;
    uint MiscFlags;
    D3D11_TEXTURE_LAYOUT TextureLayout;
}

struct D3D11_RASTERIZER_DESC2
{
    D3D11_FILL_MODE FillMode;
    D3D11_CULL_MODE CullMode;
    bool FrontCounterClockwise;
    int DepthBias;
    float DepthBiasClamp;
    float SlopeScaledDepthBias;
    bool DepthClipEnable;
    bool ScissorEnable;
    bool MultisampleEnable;
    bool AntialiasedLineEnable;
    uint ForcedSampleCount;
    D3D11_CONSERVATIVE_RASTERIZATION_MODE ConservativeRaster;
}

struct D3D11_TEX2D_SRV1
{
    uint MostDetailedMip;
    uint MipLevels;
    uint PlaneSlice;
}

struct D3D11_TEX2D_ARRAY_SRV1
{
    uint MostDetailedMip;
    uint MipLevels;
    uint FirstArraySlice;
    uint ArraySize;
    uint PlaneSlice;
}

struct D3D11_SHADER_RESOURCE_VIEW_DESC1
{
    DXGI_FORMAT Format;
    D3D11_SRV_DIMENSION ViewDimension;
    union 
    {
        D3D11_BUFFER_SRV Buffer;
        D3D11_TEX1D_SRV Texture1D;
        D3D11_TEX1D_ARRAY_SRV Texture1DArray;
        D3D11_TEX2D_SRV1 Texture2D;
        D3D11_TEX2D_ARRAY_SRV1 Texture2DArray;
        D3D11_TEX2DMS_SRV Texture2DMS;
        D3D11_TEX2DMS_ARRAY_SRV Texture2DMSArray;
        D3D11_TEX3D_SRV Texture3D;
        D3D11_TEXCUBE_SRV TextureCube;
        D3D11_TEXCUBE_ARRAY_SRV TextureCubeArray;
        D3D11_BUFFEREX_SRV BufferEx;
    };
}

struct D3D11_TEX2D_RTV1
{
    uint MipSlice;
    uint PlaneSlice;
}

struct D3D11_TEX2D_ARRAY_RTV1
{
    uint MipSlice;
    uint FirstArraySlice;
    uint ArraySize;
    uint PlaneSlice;
}

struct D3D11_RENDER_TARGET_VIEW_DESC1
{
    DXGI_FORMAT Format;
    D3D11_RTV_DIMENSION ViewDimension;
    union 
    {
        D3D11_BUFFER_RTV Buffer;
        D3D11_TEX1D_RTV Texture1D;
        D3D11_TEX1D_ARRAY_RTV Texture1DArray;
        D3D11_TEX2D_RTV1 Texture2D;
        D3D11_TEX2D_ARRAY_RTV1 Texture2DArray;
        D3D11_TEX2DMS_RTV Texture2DMS;
        D3D11_TEX2DMS_ARRAY_RTV Texture2DMSArray;
        D3D11_TEX3D_RTV Texture3D;
    };
}

struct D3D11_TEX2D_UAV1
{
    uint MipSlice;
    uint PlaneSlice;
}

struct D3D11_TEX2D_ARRAY_UAV1
{
    uint MipSlice;
    uint FirstArraySlice;
    uint ArraySize;
    uint PlaneSlice;
}

struct D3D11_UNORDERED_ACCESS_VIEW_DESC1
{
    DXGI_FORMAT Format;
    D3D11_UAV_DIMENSION ViewDimension;
    union 
    {
        D3D11_BUFFER_UAV Buffer;
        D3D11_TEX1D_UAV Texture1D;
        D3D11_TEX1D_ARRAY_UAV Texture1DArray;
        D3D11_TEX2D_UAV1 Texture2D;
        D3D11_TEX2D_ARRAY_UAV1 Texture2DArray;
        D3D11_TEX3D_UAV Texture3D;
    };
}

struct D3D11_QUERY_DESC1
{
    D3D11_QUERY Query;
    uint MiscFlags;
    D3D11_CONTEXT_TYPE ContextType;
}

///
/// Interfaces
///

mixin(uuid!(ID3D11Texture2D1, "51218251-1E33-4617-9CCB-4D3A4367E7BB"));
public interface ID3D11Texture2D1 : ID3D11Texture2D
{
extern(Windows):
	void GetDesc1(D3D11_TEXTURE2D_DESC1 *pDesc);
}

mixin(uuid!(ID3D11Texture3D1, "0C711683-2853-4846-9BB0-F3E60639E46A"));
public interface ID3D11Texture3D1 : ID3D11Texture3D
{
extern(Windows):
	void GetDesc1(D3D11_TEXTURE3D_DESC1 *pDesc);
}

mixin(uuid!(ID3D11RasterizerState2, "6fbd02fb-209f-46c4-b059-2ed15586a6ac"));
public interface ID3D11RasterizerState2 : ID3D11RasterizerState1
{
extern(Windows):
	void GetDesc2(D3D11_RASTERIZER_DESC2 *pDesc);
}

mixin(uuid!(ID3D11ShaderResourceView1, "91308b87-9040-411d-8c67-c39253ce3802"));
public interface ID3D11ShaderResourceView1 : ID3D11ShaderResourceView
{
extern(Windows):
	void GetDesc1(D3D11_SHADER_RESOURCE_VIEW_DESC1 *pDesc);
}

mixin(uuid!(ID3D11RenderTargetView1, "ffbe2e23-f011-418a-ac56-5ceed7c5b94b"));
public interface ID3D11RenderTargetView1 : ID3D11RenderTargetView
{
extern(Windows):
	void GetDesc1(D3D11_RENDER_TARGET_VIEW_DESC1 *pDesc);
}

mixin(uuid!(ID3D11UnorderedAccessView1, "7b3b6153-a886-4544-ab37-6537c8500403"));
public interface ID3D11UnorderedAccessView1 : ID3D11UnorderedAccessView
{
extern(Windows):
	void GetDesc1(D3D11_UNORDERED_ACCESS_VIEW_DESC1 *pDesc);
}

mixin(uuid!(ID3D11Query1, "631b4766-36dc-461d-8db6-c47e13e60916"));
public interface ID3D11Query1 : ID3D11Query
{
extern(Windows):
	void GetDesc1(D3D11_QUERY_DESC1 *pDesc);
}

mixin(uuid!(ID3D11DeviceContext3, "b4e3c01d-e79e-4637-91b2-510e9f4c9b8f"));
public interface ID3D11DeviceContext3 : ID3D11DeviceContext2
{
extern(Windows):
	void Flush1(D3D11_CONTEXT_TYPE ContextType, HANDLE hEvent);
    void GetHardwareProtectionState(bool *pHwProtectionEnable);
    void SetHardwareProtectionState(bool HwProtectionEnable);
}

mixin(uuid!(ID3D11Fence, "affde9d1-1df7-4bb7-8a34-0f46251dab80"));
public interface ID3D11Fence : ID3D11DeviceChild
{
extern(Windows):
	HRESULT CreateSharedHandle(const SECURITY_ATTRIBUTES *pAttributes, uint Access, const wchar *Name, HANDLE *pHandle);
    ulong GetCompletedValue();
    HRESULT SetEventOnCompletion(ulong Value, HANDLE hEvent);
}

mixin(uuid!(ID3D11DeviceContext4, "917600da-f58c-4c33-98d8-3e15b390fa24"));
public interface ID3D11DeviceContext4 : ID3D11DeviceContext3
{
extern(Windows):
	HRESULT Signal(ID3D11Fence pFence, ulong Value);
    HRESULT Wait(ID3D11Fence pFence,ulong Value);
}

mixin(uuid!(ID3D11Device3, "A05C8C37-D2C6-4732-B3A0-9CE0B0DC9AE6"));
public interface ID3D11Device3 : ID3D11Device2
{
extern(Windows):
	HRESULT CreateDeferredContext3(uint ContextFlags, ID3D11DeviceContext3 *ppDeferredContext);
    HRESULT CreateQuery1(const D3D11_QUERY_DESC1 *pQueryDesc1, ID3D11Query1 *ppQuery1);
    HRESULT CreateRasterizerState2(const D3D11_RASTERIZER_DESC2 *pRasterizerDesc, ID3D11RasterizerState2 *ppRasterizerState);
    HRESULT CreateRenderTargetView1(ID3D11Resource pResource, const D3D11_RENDER_TARGET_VIEW_DESC1 *pDesc1, ID3D11RenderTargetView1 *ppRTView1);
    HRESULT CreateShaderResourceView1(ID3D11Resource pResource, const D3D11_SHADER_RESOURCE_VIEW_DESC1 *pDesc1, ID3D11ShaderResourceView1 *ppSRView1);
    HRESULT CreateTexture2D1(const D3D11_TEXTURE2D_DESC1 *pDesc1, const D3D11_SUBRESOURCE_DATA *pInitialData, ID3D11Texture2D1 *ppTexture2D);
    HRESULT CreateTexture3D1(const D3D11_TEXTURE3D_DESC1 *pDesc1, const D3D11_SUBRESOURCE_DATA *pInitialData, ID3D11Texture3D1 *ppTexture3D);
    HRESULT CreateUnorderedAccessView1(ID3D11Resource pResource, const D3D11_UNORDERED_ACCESS_VIEW_DESC1 *pDesc1, ID3D11UnorderedAccessView1 *ppUAView1);
    void GetImmediateContext3(ID3D11DeviceContext3 *ppImmediateContext);
    void ReadFromSubresource(void *pDstData, uint DstRowPitch, uint DstDepthPitch, ID3D11Resource *pSrcResource, uint SrcSubresource, const D3D11_BOX *pSrcBox);
    void WriteToSubresource(ID3D11Resource *pDstResource, uint DstSubresource, const D3D11_BOX *pDstBox, const void *pSrcData, uint SrcRowPitch, uint SrcDepthPitch);
}
