module aurora.directx.d3d11.d3d11_1;

version(Windows):

public import aurora.directx.d3d11.d3d11_0;

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

enum D3D11_COPY_FLAGS : uint
{
    NO_OVERWRITE = 0x1,
    DISCARD = 0x2
}

enum D3D11_LOGIC_OP : uint
{
    CLEAR	= 0,
    SET	= ( CLEAR + 1 ) ,
    COPY	= ( SET + 1 ) ,
    COPY_INVERTED	= ( COPY + 1 ) ,
    NOOP	= ( COPY_INVERTED + 1 ) ,
    INVERT	= ( NOOP + 1 ) ,
    AND	= ( INVERT + 1 ) ,
    NAND	= ( AND + 1 ) ,
    OR	= ( NAND + 1 ) ,
    NOR	= ( OR + 1 ) ,
    XOR	= ( NOR + 1 ) ,
    EQUIV	= ( XOR + 1 ) ,
    AND_REVERSE	= ( EQUIV + 1 ) ,
    AND_INVERTED	= ( AND_REVERSE + 1 ) ,
    OR_REVERSE	= ( AND_INVERTED + 1 ) ,
    OR_INVERTED	= ( OR_REVERSE + 1 ) 
}

enum D3D11_1_CREATE_DEVICE_CONTEXT_STATE_FLAG : uint
{
    SINGLETHREADED	= 0x1
}

enum D3D11_VIDEO_DECODER_CAPS : uint
{
    DOWNSAMPLE	= 0x1,
    NON_REAL_TIME	= 0x2,
    DOWNSAMPLE_DYNAMIC	= 0x4,
    DOWNSAMPLE_REQUIRED	= 0x8,
    UNSUPPORTED	= 0x10
}

enum D3D11_VIDEO_PROCESSOR_BEHAVIOR_HINTS : uint
{
    MULTIPLANE_OVERLAY_ROTATION	= 0x1,
    MULTIPLANE_OVERLAY_RESIZE	= 0x2,
    MULTIPLANE_OVERLAY_COLOR_SPACE_CONVERSION	= 0x4,
    TRIPLE_BUFFER_OUTPUT	= 0x8
}

enum D3D11_CRYPTO_SESSION_STATUS : uint
{
    OK	= 0,
    KEY_LOST	= 1,
    KEY_AND_CONTENT_LOST	= 2
}

///
/// Structures
///

struct D3D11_RENDER_TARGET_BLEND_DESC1
{
	bool           BlendEnable;
	bool           LogicOpEnable;
	D3D11_BLEND    SrcBlend;
	D3D11_BLEND    DestBlend;
	D3D11_BLEND_OP BlendOp;
	D3D11_BLEND    SrcBlendAlpha;
	D3D11_BLEND    DestBlendAlpha;
	D3D11_BLEND_OP BlendOpAlpha;
	D3D11_LOGIC_OP LogicOp;
	ubyte          RenderTargetWriteMask;
}

struct D3D11_BLEND_DESC1
{
    bool AlphaToCoverageEnable;
    bool IndependentBlendEnable;
    D3D11_RENDER_TARGET_BLEND_DESC1[8] RenderTarget;
}

struct D3D11_RASTERIZER_DESC1 {
	D3D11_FILL_MODE FillMode;
	D3D11_CULL_MODE CullMode;
	bool            FrontCounterClockwise;
	int             DepthBias;
	float           DepthBiasClamp;
	float           SlopeScaledDepthBias;
	bool            DepthClipEnable;
	bool            ScissorEnable;
	bool            MultisampleEnable;
	bool            AntialiasedLineEnable;
	uint            ForcedSampleCount;
}

struct D3D11_VIDEO_DECODER_SUB_SAMPLE_MAPPING_BLOCK
{
    uint ClearSize;
    uint EncryptedSize;
}

struct D3D11_VIDEO_DECODER_BUFFER_DESC1
{
    D3D11_VIDEO_DECODER_BUFFER_TYPE BufferType;
    uint DataOffset;
    uint DataSize;void *pIV;
    uint IVSize;
    D3D11_VIDEO_DECODER_SUB_SAMPLE_MAPPING_BLOCK *pSubSampleMappingBlock;
    uint SubSampleMappingCount;
}

struct D3D11_VIDEO_DECODER_BEGIN_FRAME_CRYPTO_SESSION
{
    ID3D11CryptoSession pCryptoSession;
    uint BlobSize;void *pBlob;
    GUID *pKeyInfoId;
    uint PrivateDataSize;
    void *pPrivateData;
}

struct D3D11_VIDEO_PROCESSOR_STREAM_BEHAVIOR_HINT
{
    bool Enable;
    uint Width;
    uint Height;
    DXGI_FORMAT Format;
}

struct D3D11_KEY_EXCHANGE_HW_PROTECTION_INPUT_DATA
{
    uint PrivateDataSize;
    uint HWProtectionDataSize;
    ubyte[4] pbInput;
}

struct D3D11_KEY_EXCHANGE_HW_PROTECTION_OUTPUT_DATA
    {
    uint PrivateDataSize;
    uint MaxHWProtectionDataSize;
    uint HWProtectionDataSize;
    ulong TransportTime;
    ulong ExecutionTime;
    ubyte[4] pbOutput;
}

struct D3D11_KEY_EXCHANGE_HW_PROTECTION_DATA
{
    uint HWProtectionFunctionID;
    D3D11_KEY_EXCHANGE_HW_PROTECTION_INPUT_DATA *pInputData;
    D3D11_KEY_EXCHANGE_HW_PROTECTION_OUTPUT_DATA *pOutputData;
    HRESULT Status;
}

struct D3D11_VIDEO_SAMPLE_DESC
{
    uint Width;
    uint Height;
    DXGI_FORMAT Format;
    DXGI_COLOR_SPACE_TYPE ColorSpace;
}

///
/// Interfaces
///

mixin(uuid!(ID3D11BlendState1, "cc86fabe-da55-401d-85e7-e3c9de2877e9"));
public interface ID3D11BlendState1 : ID3D11BlendState
{
extern(Windows):
	void GetDesc1(D3D11_BLEND_DESC1 *pDesc);
}

mixin(uuid!(ID3D11RasterizerState1, "1217d7a6-5039-418c-b042-9cbe256afd6e"));
public interface ID3D11RasterizerState1 : ID3D11RasterizerState
{
extern(Windows):
	void GetDesc1(D3D11_RASTERIZER_DESC1 *pDesc);
}

mixin(uuid!(ID3DDeviceContextState, "5c1e0d8a-7c23-48f9-8c59-a92958ceff11"));
public interface ID3DDeviceContextState : ID3D11DeviceChild
{
extern(Windows):
}

mixin(uuid!(ID3D11DeviceContext1, "bb2c6faa-b5fb-4082-8e6b-388b8cfa90e1"));
public interface ID3D11DeviceContext1 : ID3D11DeviceContext
{
extern(Windows):
	void ClearView(ID3D11View pView, const(float[4]) Color, const(D3D11_RECT) *pRect, uint NumRects);
	void CopySubresourceRegion1(ID3D11Resource pDstResource, uint DstSubresource, uint DstX, uint DstY, uint DstZ, ID3D11Resource pSrcResource, uint SrcSubresource, const(D3D11_BOX) *pSrcBox, uint CopyFlags);
	void CSGetConstantBuffers1(uint StartSlot, uint NumBuffers, ID3D11Buffer *ppConstantBuffers, uint* pFirstConstant, uint* pNumConstants);
	void CSSetConstantBuffers1(uint StartSlot, uint NumBuffers, const(ID3D11Buffer) *ppConstantBuffers, const(uint)*pFirstConstant, const(uint)*pNumConstants);
	void DiscardResource(ID3D11Resource pResource);
	void DiscardView(ID3D11View pResourceView);
	void DiscardView1(ID3D11View pResourceView, const(D3D11_RECT) *pRects, uint NumRects);
	void DSGetConstantBuffers1(uint StartSlot, uint NumBuffers, ID3D11Buffer *ppConstantBuffers, uint* pFirstConstant, uint* pNumConstants);
	void DSSetConstantBuffers1(uint StartSlot, uint NumBuffers, const(ID3D11Buffer) *ppConstantBuffers, const(uint) *pFirstConstant, const(uint) *pNumConstants);
	void GSGetConstantBuffers1(uint StartSlot, uint NumBuffers, ID3D11Buffer *ppConstantBuffers, uint* pFirstConstant, uint* pNumConstants);
	void GSSetConstantBuffers1(uint StartSlot, uint NumBuffers, const(ID3D11Buffer) *ppConstantBuffers, const(uint) *pFirstConstant, const(uint) *pNumConstants);
	void HSGetConstantBuffers1(uint StartSlot, uint NumBuffers, ID3D11Buffer *ppConstantBuffers, uint* pFirstConstant, uint* pNumConstants);
	void HSSetConstantBuffers1(uint StartSlot, uint NumBuffers, const(ID3D11Buffer) *ppConstantBuffers, const(uint) *pFirstConstant, const(uint) *pNumConstants);
	void PSGetConstantBuffers1(uint StartSlot, uint NumBuffers, ID3D11Buffer *ppConstantBuffers, uint* pFirstConstant, uint* pNumConstants);
	void PSSetConstantBuffers1(uint StartSlot, uint NumBuffers, const(ID3D11Buffer) *ppConstantBuffers, const(uint) *pFirstConstant, const(uint) *pNumConstants);
	void SwapDeviceContextState(ID3DDeviceContextState pState, ID3DDeviceContextState *ppPreviousState);
	void UpdateSubresource1(ID3D11Resource pDstResource, uint DstSubresource, const(D3D11_BOX) *pDstBox, const(void) *pSrcData, uint SrcRowPitch, uint SrcDepthPitch, uint CopyFlags);
	void VSGetConstantBuffers1(uint StartSlot, uint NumBuffers, ID3D11Buffer *ppConstantBuffers, uint* pFirstConstant, uint* pNumConstants);
	void VSSetConstantBuffers1(uint StartSlot, uint NumBuffers, const(ID3D11Buffer) *ppConstantBuffers, const(uint) *pFirstConstant, const(uint) *pNumConstants);
}

mixin(uuid!(ID3D11VideoContext1, "A7F026DA-A5F8-4487-A564-15E34357651E"));
public interface ID3D11VideoContext1 : ID3D11VideoContext
{
extern(Windows):
    HRESULT CheckCryptoSessionStatus(ID3D11CryptoSession pCryptoSession, D3D11_CRYPTO_SESSION_STATUS *pStatus);
    HRESULT DecoderEnableDownsampling(ID3D11VideoDecoder pDecoder, DXGI_COLOR_SPACE_TYPE InputColorSpace, const D3D11_VIDEO_SAMPLE_DESC *pOutputDesc, uint ReferenceFrameCount);
    HRESULT DecoderUpdateDownsampling(ID3D11VideoDecoder pDecoder, const D3D11_VIDEO_SAMPLE_DESC *pOutputDesc);
    HRESULT GetDataForNewHardwareKey(ID3D11CryptoSession pCryptoSession, uint PrivateInputSize, const void *pPrivatInputData, ulong *pPrivateOutputData);
    HRESULT SubmitDecoderBuffers1(ID3D11VideoDecoder pDecoder, uint NumBuffers, const D3D11_VIDEO_DECODER_BUFFER_DESC1 *pBufferDesc);
    HRESULT VideoProcessorGetBehaviorHints(ID3D11VideoProcessor pVideoProcessor, uint OutputWidth, uint OutputHeight, DXGI_FORMAT OutputFormat, uint StreamCount, const D3D11_VIDEO_PROCESSOR_STREAM_BEHAVIOR_HINT *pStreams, uint *pBehaviorHints);
    void VideoProcessorGetOutputColorSpace1(ID3D11VideoProcessor pVideoProcessor, DXGI_COLOR_SPACE_TYPE *pColorSpace);
    void VideoProcessorGetOutputShaderUsage(ID3D11VideoProcessor pVideoProcessor, bool *pShaderUsage);
    void VideoProcessorGetStreamColorSpace1(ID3D11VideoProcessor pVideoProcessor, uint StreamIndex, DXGI_COLOR_SPACE_TYPE *pColorSpace);
    void VideoProcessorGetStreamMirror(ID3D11VideoProcessor pVideoProcessor, uint StreamIndex, bool *pEnable, bool *pFlipHorizontal, bool *pFlipVertical);
    void VideoProcessorSetOutputColorSpace1(ID3D11VideoProcessor pVideoProcessor, DXGI_COLOR_SPACE_TYPE ColorSpace);
    void VideoProcessorSetOutputShaderUsage(ID3D11VideoProcessor pVideoProcessor, bool ShaderUsage);
    void VideoProcessorSetStreamColorSpace1(ID3D11VideoProcessor pVideoProcessor, uint StreamIndex, DXGI_COLOR_SPACE_TYPE ColorSpace);
    void VideoProcessorSetStreamMirror(ID3D11VideoProcessor pVideoProcessor, uint StreamIndex, bool Enable, bool FlipHorizontal, bool FlipVertical);
}

mixin(uuid!(ID3D11VideoDevice1, "29DA1D51-1321-4454-804B-F5FC9F861F0F"));
public interface ID3D11VideoDevice1 : ID3D11VideoDevice
{
extern(Windows):
    HRESULT CheckVideoDecoderDownsampling(const D3D11_VIDEO_DECODER_DESC *pInputDesc, DXGI_COLOR_SPACE_TYPE InputColorSpace, const D3D11_VIDEO_DECODER_CONFIG *pInputConfig, const DXGI_RATIONAL *pFrameRate, const D3D11_VIDEO_SAMPLE_DESC *pOutputDesc, bool *pSupported, bool *pRealTimeHint);
    HRESULT GetCryptoSessionPrivateDataSize(const GUID *pCryptoType, const GUID *pDecoderProfile, const GUID *pKeyExchangeType, uint *pPrivateInputSize, uint *pPrivateOutputSize);
    HRESULT GetVideoDecoderCaps(const GUID *pDecoderProfile, uint SampleWidth, uint SampleHeight, const DXGI_RATIONAL *pFrameRate, uint BitRate, const GUID *pCryptoType, uint *pDecoderCaps);
    HRESULT RecommendVideoDecoderDownsampleParameters(const D3D11_VIDEO_DECODER_DESC *pInputDesc, DXGI_COLOR_SPACE_TYPE InputColorSpace, const D3D11_VIDEO_DECODER_CONFIG *pInputConfig, const DXGI_RATIONAL *pFrameRate, D3D11_VIDEO_SAMPLE_DESC *pRecommendedOutputDesc);
}

mixin(uuid!(ID3D11VideoProcessorEnumerator1, "465217F2-5568-43CF-B5B9-F61D54531CA1"));
public interface ID3D11VideoProcessorEnumerator1 : ID3D11VideoProcessorEnumerator
{
extern(Windows):
    HRESULT CheckVideoProcessorFormatConversion(DXGI_FORMAT InputFormat, DXGI_COLOR_SPACE_TYPE InputColorSpace, DXGI_FORMAT OutputFormat, DXGI_COLOR_SPACE_TYPE OutputColorSpace, bool *pSupported);
}

mixin(uuid!(ID3D11Device1, "a04bfb29-08ef-43d6-a49c-a9bdbdcbe686"));
public interface ID3D11Device1 : ID3D11Device
{
extern(Windows):
	HRESULT CreateBlendState1(const D3D11_BLEND_DESC1 *pBlendStateDesc, ID3D11BlendState1 *ppBlendState);
	HRESULT CreateDeferredContext1(uint ContextFlags, ID3D11DeviceContext1 *ppDeferredContext);
	HRESULT CreateDeviceContextState(uint Flags, const D3D_FEATURE_LEVEL *pFeatureLevels, uint FeatureLevels, uint SDKVersion, IID* EmulatedInterface, D3D_FEATURE_LEVEL *pChosenFeatureLevel, ID3DDeviceContextState *ppContextState);
	HRESULT CreateRasterizerState1(const D3D11_RASTERIZER_DESC1 *pRasterizerDesc, ID3D11RasterizerState1 *ppRasterizerState);
	void GetImmediateContext1(ID3D11DeviceContext1 *ppImmediateContext);
	HRESULT OpenSharedResource1(HANDLE hResource, IID* returnedInterface, void **ppResource);
	HRESULT OpenSharedResourceByName(const(wchar)* lpName, uint dwDesiredAccess, IID* returnedInterface, void **ppResource);
}

mixin(uuid!(ID3DUserDefinedAnnotation, "b2daad8b-03d4-4dbf-95eb-32ab4b63d0ab"));
public interface ID3DUserDefinedAnnotation : IUnknown
{
extern(Windows):
    int BeginEvent(const wchar *Name);
    int EndEvent();
    bool GetStatus();
    void SetMarker(const wchar *Name);
}
