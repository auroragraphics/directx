module aurora.directx.d2d1.d2d1effectauthor_0;

public import aurora.directx.com;
public import aurora.directx.d2d1.d2d1_1;

//Callabcks
alias PD2D1_PROPERTY_SET_FUNCTION = extern(Windows) HRESULT delegate(IUnknown effect, const ubyte *data, uint dataSize);
alias PD2D1_PROPERTY_GET_FUNCTION = extern(Windows) HRESULT delegate(const IUnknown effect, ubyte *data, uint dataSize, uint *actualSize);

enum D2D1_CHANGE_TYPE
{
    D2D1_CHANGE_TYPE_NONE = 0,
    D2D1_CHANGE_TYPE_PROPERTIES = 1,
    D2D1_CHANGE_TYPE_CONTEXT = 2,
    D2D1_CHANGE_TYPE_GRAPH = 3,
    D2D1_CHANGE_TYPE_FORCE_DWORD = 0xffffffff
}

enum D2D1_PIXEL_OPTIONS
{
    D2D1_PIXEL_OPTIONS_NONE = 0,
    D2D1_PIXEL_OPTIONS_TRIVIAL_SAMPLING = 1,
    D2D1_PIXEL_OPTIONS_FORCE_DWORD = 0xffffffff
}

enum D2D1_VERTEX_OPTIONS
{
    D2D1_VERTEX_OPTIONS_NONE = 0,
    D2D1_VERTEX_OPTIONS_DO_NOT_CLEAR = 1,
    D2D1_VERTEX_OPTIONS_USE_DEPTH_BUFFER = 2,
    D2D1_VERTEX_OPTIONS_ASSUME_NO_OVERLAP = 4,
    D2D1_VERTEX_OPTIONS_FORCE_DWORD = 0xffffffff
}

enum D2D1_VERTEX_USAGE
{
    D2D1_VERTEX_USAGE_STATIC = 0,
    D2D1_VERTEX_USAGE_DYNAMIC = 1,
    D2D1_VERTEX_USAGE_FORCE_DWORD = 0xffffffff
}

enum D2D1_BLEND_OPERATION
{
    D2D1_BLEND_OPERATION_ADD = 1,
    D2D1_BLEND_OPERATION_SUBTRACT = 2,
    D2D1_BLEND_OPERATION_REV_SUBTRACT = 3,
    D2D1_BLEND_OPERATION_MIN = 4,
    D2D1_BLEND_OPERATION_MAX = 5,
    D2D1_BLEND_OPERATION_FORCE_DWORD = 0xffffffff
}

enum D2D1_BLEND
{
    D2D1_BLEND_ZERO = 1,
    D2D1_BLEND_ONE = 2,
    D2D1_BLEND_SRC_COLOR = 3,
    D2D1_BLEND_INV_SRC_COLOR = 4,
    D2D1_BLEND_SRC_ALPHA = 5,
    D2D1_BLEND_INV_SRC_ALPHA = 6,
    D2D1_BLEND_DEST_ALPHA = 7,
    D2D1_BLEND_INV_DEST_ALPHA = 8,
    D2D1_BLEND_DEST_COLOR = 9,
    D2D1_BLEND_INV_DEST_COLOR = 10,
    D2D1_BLEND_SRC_ALPHA_SAT = 11,
    D2D1_BLEND_BLEND_FACTOR = 14,
    D2D1_BLEND_INV_BLEND_FACTOR = 15,
    D2D1_BLEND_FORCE_DWORD = 0xffffffff
}

enum D2D1_CHANNEL_DEPTH
{
    D2D1_CHANNEL_DEPTH_DEFAULT = 0,
    D2D1_CHANNEL_DEPTH_1 = 1,
    D2D1_CHANNEL_DEPTH_4 = 4,
    D2D1_CHANNEL_DEPTH_FORCE_DWORD = 0xffffffff
}

enum D2D1_FILTER
{
    D2D1_FILTER_MIN_MAG_MIP_POINT = 0x00,
    D2D1_FILTER_MIN_MAG_POINT_MIP_LINEAR = 0x01,
    D2D1_FILTER_MIN_POINT_MAG_LINEAR_MIP_POINT = 0x04,
    D2D1_FILTER_MIN_POINT_MAG_MIP_LINEAR = 0x05,
    D2D1_FILTER_MIN_LINEAR_MAG_MIP_POINT = 0x10,
    D2D1_FILTER_MIN_LINEAR_MAG_POINT_MIP_LINEAR = 0x11,
    D2D1_FILTER_MIN_MAG_LINEAR_MIP_POINT = 0x14,
    D2D1_FILTER_MIN_MAG_MIP_LINEAR = 0x15,
    D2D1_FILTER_ANISOTROPIC = 0x55,
    D2D1_FILTER_FORCE_DWORD = 0xffffffff
}

enum D2D1_FEATURE
{
    D2D1_FEATURE_DOUBLES = 0,
    D2D1_FEATURE_D3D10_X_HARDWARE_OPTIONS = 1,
    D2D1_FEATURE_FORCE_DWORD = 0xffffffff
}

struct D2D1_PROPERTY_BINDING
{
    const wchar *propertyName;
    PD2D1_PROPERTY_SET_FUNCTION setFunction;
    PD2D1_PROPERTY_GET_FUNCTION getFunction;
}

struct D2D1_RESOURCE_TEXTURE_PROPERTIES
{
    const uint *extents;
    uint dimensions;
    D2D1_BUFFER_PRECISION bufferPrecision;
    D2D1_CHANNEL_DEPTH channelDepth;
    D2D1_FILTER filter;
    const D2D1_EXTEND_MODE *extendModes;
}

struct D2D1_INPUT_ELEMENT_DESC
{
    const char *semanticName;
    uint semanticIndex;
    DXGI_FORMAT format;
    uint inputSlot;
    uint alignedByteOffset;
}

enum D2D1_APPEND_ALIGNED_ELEMENT = 0xffffffff;

struct D2D1_VERTEX_BUFFER_PROPERTIES
{
    uint inputCount;
    D2D1_VERTEX_USAGE usage;
    const ubyte *data;
    uint byteWidth;
}

struct D2D1_CUSTOM_VERTEX_BUFFER_PROPERTIES
{
    const byte *shaderBufferWithInputSignature;
    uint shaderBufferSize;
    const D2D1_INPUT_ELEMENT_DESC *inputElements;
    uint elementCount;
    uint stride;
}

struct D2D1_VERTEX_RANGE
{
    uint startVertex;
    uint vertexCount;
}

struct D2D1_BLEND_DESCRIPTION
{
    D2D1_BLEND sourceBlend;
    D2D1_BLEND destinationBlend;
    D2D1_BLEND_OPERATION blendOperation;
    D2D1_BLEND sourceBlendAlpha;
    D2D1_BLEND destinationBlendAlpha;
    D2D1_BLEND_OPERATION blendOperationAlpha;
    float[4] blendFactor;
}

struct D2D1_INPUT_DESCRIPTION
{
    D2D1_FILTER filter;
    uint levelOfDetailCount;
}

struct D2D1_FEATURE_DATA_DOUBLES
{
    bool doublePrecisionFloatShaderOps;
}

struct D2D1_FEATURE_DATA_D3D10_X_HARDWARE_OPTIONS
{
    bool computeShaders_Plus_RawAndStructuredBuffers_Via_Shader_4_x;
}

mixin(uuid!(ID2D1VertexBuffer, "9b8b1336-00a5-4668-92b7-ced5d8bf9b7b"));
public interface ID2D1VertexBuffer : IUnknown
{
extern(Windows):
    HRESULT Map(ubyte **data, uint bufferSize);    
    HRESULT Unmap();
}

mixin(uuid!(ID2D1ResourceTexture, "688d15c3-02b0-438d-b13a-d1b44c32c39a"));
public interface ID2D1ResourceTexture : IUnknown
{
extern(Windows):
    HRESULT Update(const uint *minimumExtents, const uint *maximimumExtents, const uint *strides, uint dimensions, const ubyte *data, uint dataCount);
}

mixin(uuid!(ID2D1RenderInfo, "519ae1bd-d19a-420d-b849-364f594776b7"));
public interface ID2D1RenderInfo : IUnknown
{
extern(Windows):
    HRESULT SetInputDescription(uint inputIndex, D2D1_INPUT_DESCRIPTION inputDescription);
    HRESULT SetOutputBuffer(D2D1_BUFFER_PRECISION bufferPrecision, D2D1_CHANNEL_DEPTH channelDepth);
    void SetCached(bool isCached);
    void SetInstructionCountHint(uint instructionCount);
}

mixin(uuid!(ID2D1DrawInfo, "693ce632-7f2f-45de-93fe-18d88b37aa21"));
public interface ID2D1DrawInfo : IUnknown
{
extern(Windows):
    HRESULT SetPixelShaderConstantBuffer(const ubyte *buffer, uint bufferCount);
    HRESULT SetResourceTexture(uint textureIndex, ID2D1ResourceTexture resourceTexture);
    HRESULT SetVertexShaderConstantBuffer(const ubyte *buffer, uint bufferCount);
    HRESULT SetPixelShader(REFGUID shaderId, D2D1_PIXEL_OPTIONS pixelOptions = D2D1_PIXEL_OPTIONS.D2D1_PIXEL_OPTIONS_NONE);
    HRESULT SetVertexProcessing(ID2D1VertexBuffer vertexBuffer, D2D1_VERTEX_OPTIONS vertexOptions, const D2D1_BLEND_DESCRIPTION *blendDescription = NULL, const D2D1_VERTEX_RANGE *vertexRange = NULL, const GUID *vertexShader = null);
}

mixin(uuid!(ID2D1ComputeInfo, "5598b14b-9fd7-48b7-9bdb-8f0964eb38bc"));
public interface ID2D1ComputeInfo : ID2D1RenderInfo
{
extern(Windows):
    HRESULT SetComputeShaderConstantBuffer(const ubyte *buffer, uint bufferCount);
    HRESULT SetComputeShader(REFGUID shaderId);
    HRESULT SetResourceTexture(uint textureIndex, ID2D1ResourceTexture resourceTexture);
}

mixin(uuid!(ID2D1TransformNode, "b2efe1e7-729f-4102-949f-505fa21bf666"));
public interface ID2D1TransformNode : IUnknown
{
extern(Windows):
    uint GetInputCount();
}

mixin(uuid!(ID2D1TransformGraph, "13d29038-c3e6-4034-9081-13b53a417992"));
public interface ID2D1TransformGraph : IUnknown
{
extern(Windows):
    uint GetInputCount();
    HRESULT SetSingleTransformNode(ID2D1TransformNode node);
    HRESULT AddNode(ID2D1TransformNode node);
    HRESULT RemoveNode(ID2D1TransformNode node);
    HRESULT SetOutputNode(ID2D1TransformNode node);
    HRESULT ConnectNode(ID2D1TransformNode fromNode, ID2D1TransformNode toNode, uint toNodeInputIndex);
    HRESULT ConnectToEffectInput(uint toEffectInputIndex, ID2D1TransformNode node, uint toNodeInputIndex);
    void Clear();
    HRESULT SetPassthroughGraph(uint effectInputIndex);
}

mixin(uuid!(ID2D1Transform, "ef1a287d-342a-4f76-8fdb-da0d6ea9f92b"));
public interface ID2D1Transform : ID2D1TransformNode
{
extern(Windows):
    const HRESULT MapOutputRectToInputRects(const D2D1_RECT_L *outputRect, D2D1_RECT_L *inputRects, uint inputRectsCount);
    HRESULT MapInputRectsToOutputRect(const D2D1_RECT_L *inputRects, const D2D1_RECT_L *inputOpaqueSubRects, uint inputRectCount, D2D1_RECT_L *outputRect, D2D1_RECT_L *outputOpaqueSubRect);
    const HRESULT MapInvalidRect(uint inputIndex, D2D1_RECT_L invalidInputRect, D2D1_RECT_L *invalidOutputRect);
}

mixin(uuid!(ID2D1DrawTransform, "36bfdcb6-9739-435d-a30d-a653beff6a6f"));
public interface ID2D1DrawTransform : ID2D1Transform
{
extern(Windows):
    HRESULT SetDrawInfo(ID2D1DrawInfo drawInfo);
}

mixin(uuid!(ID2D1ComputeTransform, "0d85573c-01e3-4f7d-bfd9-0d60608bf3c3"));
public interface ID2D1ComputeTransform : ID2D1Transform
{
extern(Windows):
    HRESULT SetComputeInfo(ID2D1ComputeInfo computeInfo);
    HRESULT CalculateThreadgroups(const D2D1_RECT_L *outputRect, uint *dimensionX, uint *dimensionY, uint *dimensionZ);
}

mixin(uuid!(ID2D1AnalysisTransform, "0359dc30-95e6-4568-9055-27720d130e93"));
public interface ID2D1AnalysisTransform : IUnknown
{
extern(Windows):
    HRESULT ProcessAnalysisResults(const ubyte *analysisData, uint analysisDataCount);
}

mixin(uuid!(ID2D1SourceTransform, "db1800dd-0c34-4cf9-be90-31cc0a5653e1"));
public interface ID2D1SourceTransform : ID2D1Transform
{
extern(Windows):
    HRESULT SetRenderInfo(ID2D1RenderInfo renderInfo);
    HRESULT Draw(ID2D1Bitmap1 target, const D2D1_RECT_L *drawRect, D2D1_POINT_2U targetOrigin);
}

mixin(uuid!(ID2D1ConcreteTransform, "1a799d8a-69f7-4e4c-9fed-437ccc6684cc"));
public interface ID2D1ConcreteTransform : ID2D1TransformNode
{
extern(Windows):
    HRESULT SetOutputBuffer(D2D1_BUFFER_PRECISION bufferPrecision, D2D1_CHANNEL_DEPTH channelDepth);
    void SetCached(bool isCached);
}

mixin(uuid!(ID2D1BlendTransform, "63ac0b32-ba44-450f-8806-7f4ca1ff2f1b"));
public interface ID2D1BlendTransform : ID2D1ConcreteTransform
{
extern(Windows):
    void SetDescription(const D2D1_BLEND_DESCRIPTION *description);
    const void GetDescription(D2D1_BLEND_DESCRIPTION *description);
}

mixin(uuid!(ID2D1BorderTransform, "4998735c-3a19-473c-9781-656847e3a347"));
public interface ID2D1BorderTransform : ID2D1ConcreteTransform
{
extern(Windows):
    void SetExtendModeX(D2D1_EXTEND_MODE extendMode);
    void SetExtendModeY(D2D1_EXTEND_MODE extendMode);
    const D2D1_EXTEND_MODE GetExtendModeX();
    const D2D1_EXTEND_MODE GetExtendModeY();
}

mixin(uuid!(ID2D1OffsetTransform, "3fe6adea-7643-4f53-bd14-a0ce63f24042"));
public interface ID2D1OffsetTransform : ID2D1TransformNode
{
extern(Windows):
    void SetOffset(D2D1_POINT_2L offset);
    const D2D1_POINT_2L GetOffset();
}

mixin(uuid!(ID2D1BoundsAdjustmentTransform, "90f732e2-5092-4606-a819-8651970baccd"));
public interface ID2D1BoundsAdjustmentTransform : ID2D1TransformNode
{
extern(Windows):
    void SetOutputBounds(const D2D1_RECT_L *outputBounds);
    const void GetOutputBounds(D2D1_RECT_L *outputBounds);
}

mixin(uuid!(ID2D1EffectImpl, "a248fd3f-3e6c-4e63-9f03-7f68ecc91db9"));
public interface ID2D1EffectImpl : IUnknown
{
extern(Windows):
    HRESULT Initialize(ID2D1EffectContext effectContext, ID2D1TransformGraph transformGraph);
    HRESULT PrepareForRender(D2D1_CHANGE_TYPE changeType);
    HRESULT SetGraph(ID2D1TransformGraph transformGraph);
}

mixin(uuid!(ID2D1EffectContext, "3d9f916b-27dc-4ad7-b4f1-64945340f563"));
public interface ID2D1EffectContext : IUnknown
{
extern(Windows):
    const void GetDpi(float *dpiX, float *dpiY);
    HRESULT CreateEffect(REFCLSID effectId, ID2D1Effect *effect);
    const HRESULT GetMaximumSupportedFeatureLevel(const  D3D_FEATURE_LEVEL *featureLevels, uint featureLevelsCount, D3D_FEATURE_LEVEL *maximumSupportedFeatureLevel);
    HRESULT CreateTransformNodeFromEffect(ID2D1Effect effect, ID2D1TransformNode *transformNode);
    HRESULT CreateBlendTransform(uint numInputs, const D2D1_BLEND_DESCRIPTION *blendDescription, ID2D1BlendTransform *transform);
    HRESULT CreateBorderTransform(D2D1_EXTEND_MODE extendModeX, D2D1_EXTEND_MODE extendModeY, ID2D1BorderTransform *transform);
    HRESULT CreateOffsetTransform(D2D1_POINT_2L offset, ID2D1OffsetTransform *transform);
    HRESULT CreateBoundsAdjustmentTransform(const D2D1_RECT_L *outputRectangle, ID2D1BoundsAdjustmentTransform *transform);
    HRESULT LoadPixelShader(REFGUID shaderId, const ubyte *shaderBuffer, uint shaderBufferCount);
    HRESULT LoadVertexShader(REFGUID resourceId, const ubyte *shaderBuffer, uint shaderBufferCount);
    HRESULT LoadComputeShader(REFGUID resourceId, const byte *shaderBuffer, uint shaderBufferCount);
    bool IsShaderLoaded(REFGUID shaderId);
    HRESULT CreateResourceTexture(const GUID *resourceId, const D2D1_RESOURCE_TEXTURE_PROPERTIES *resourceTextureProperties, const ubyte *data, const uint *strides, uint dataSize, ID2D1ResourceTexture *resourceTexture);
    HRESULT FindResourceTexture(const GUID *resourceId, ID2D1ResourceTexture *resourceTexture);
    HRESULT CreateVertexBuffer(const D2D1_VERTEX_BUFFER_PROPERTIES *vertexBufferProperties, const GUID *resourceId, const D2D1_CUSTOM_VERTEX_BUFFER_PROPERTIES *customVertexBufferProperties, ID2D1VertexBuffer *buffer);
    HRESULT FindVertexBuffer(const GUID *resourceId, ID2D1VertexBuffer *buffer);
    HRESULT CreateColorContext(D2D1_COLOR_SPACE space, const ubyte *profile, uint profileSize, ID2D1ColorContext *colorContext);
    HRESULT CreateColorContextFromFilename(const wchar *filename, ID2D1ColorContext *colorContext);
    HRESULT CreateColorContextFromWicColorContext(IWICColorContext wicColorContext, ID2D1ColorContext *colorContext);
    const HRESULT CheckFeatureSupport(D2D1_FEATURE feature, void *featureSupportData, uint featureSupportDataSize);
    const bool IsBufferPrecisionSupported(D2D1_BUFFER_PRECISION bufferPrecision);
}
