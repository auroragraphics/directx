module aurora.directx.d3d11.d3d11shader;

version(Windows):

import std.bitmanip;
import aurora.directx.com;
import aurora.directx.d3d11;

public:

///
/// Constants
///

enum int D3D_SHADER_REQUIRES_DOUBLES = 0x00000001;
enum int D3D_SHADER_REQUIRES_EARLY_DEPTH_STENCIL = 0x00000002;
enum int D3D_SHADER_REQUIRES_UAVS_AT_EVERY_STAGE = 0x00000004;
enum int D3D_SHADER_REQUIRES_64_UAVS = 0x00000008;
enum int D3D_SHADER_REQUIRES_MINIMUM_PRECISION = 0x00000010;
enum int D3D_SHADER_REQUIRES_11_1_DOUBLE_EXTENSIONS = 0x00000020;
enum int D3D_SHADER_REQUIRES_11_1_SHADER_EXTENSIONS = 0x00000040;
enum int D3D_SHADER_REQUIRES_LEVEL_9_COMPARISON_FILTERING = 0x00000080;
enum int D3D_SHADER_REQUIRES_TILED_RESOURCES = 0x00000100;

alias D3D_RESOURCE_RETURN_TYPE D3D11_RESOURCE_RETURN_TYPE;
alias D3D_CBUFFER_TYPE D3D11_CBUFFER_TYPE;
alias D3D_TESSELLATOR_DOMAIN D3D11_TESSELLATOR_DOMAIN;
alias D3D_TESSELLATOR_PARTITIONING D3D11_TESSELLATOR_PARTITIONING;
alias D3D_TESSELLATOR_OUTPUT_PRIMITIVE D3D11_TESSELLATOR_OUTPUT_PRIMITIVE;

///
/// Functions
///

///
/// Enumerations
///

enum D3D11_SHADER_VERSION_TYPE
{
    PIXEL_SHADER    = 0,
    VERTEX_SHADER   = 1,
    GEOMETRY_SHADER = 2,
    
    // D3D11 Shaders
    HULL_SHADER     = 3,
    DOMAIN_SHADER   = 4,
    COMPUTE_SHADER  = 5,

    RESERVED0       = 0xFFF0,
}

///
/// Structures
///

struct D3D11_SIGNATURE_PARAMETER_DESC
{
    const char *SemanticName;
    uint SemanticIndex;
    uint Register;
    D3D_NAME SystemValueType;
    D3D_REGISTER_COMPONENT_TYPE ComponentType;
    byte Mask;
    byte ReadWriteMask;
    uint Stream;
    D3D_MIN_PRECISION MinPrecision;
}

struct D3D11_SHADER_BUFFER_DESC
{
    const char *Name;
    D3D_CBUFFER_TYPE Type;
    uint Variables;
    uint Size;
    uint uFlags;
}

struct D3D11_SHADER_VARIABLE_DESC
{
    const char *Name;
    uint StartOffset;
    uint Size;
    uint uFlags;
    void *DefaultValue;
    uint StartTexture;
    uint TextureSize;
    uint StartSampler;
    uint SamplerSize;
}

struct D3D11_SHADER_TYPE_DESC
{
    D3D_SHADER_VARIABLE_CLASS Class;
    D3D_SHADER_VARIABLE_TYPE Type;
    uint Rows;
    uint Columns;
    uint Elements;
    uint Members;
    uint Offset; 
    const char *Name;
}

struct D3D11_SHADER_DESC
{
    uint Version;
    const char *Creator;
    uint Flags;
    uint ConstantBuffers;
    uint BoundResources;
    uint InputParameters;
    uint OutputParameters;
    uint InstructionCount;
    uint TempRegisterCount;
    uint TempArrayCount;
    uint DefCount;
    uint DclCount;
    uint TextureNormalInstructions;
    uint TextureLoadInstructions;
    uint TextureCompInstructions;
    uint TextureBiasInstructions;
    uint TextureGradientInstructions;
    uint FloatInstructionCount;
    uint IntInstructionCount;
    uint UintInstructionCount;
    uint StaticFlowControlCount;
    uint DynamicFlowControlCount;
    uint MacroInstructionCount;
    uint ArrayInstructionCount;
    uint CutInstructionCount;
    uint EmitInstructionCount;
    D3D_PRIMITIVE_TOPOLOGY GSOutputTopology;
    uint GSMaxOutputVertexCount;
    D3D_PRIMITIVE InputPrimitive;
    uint PatchConstantParameters;
    uint cGSInstanceCount;
    uint cControlPoints;
    D3D_TESSELLATOR_OUTPUT_PRIMITIVE HSOutputPrimitive;
    D3D_TESSELLATOR_PARTITIONING HSPartitioning;
    D3D_TESSELLATOR_DOMAIN TessellatorDomain;
    uint cBarrierInstructions;
    uint cInterlockedInstructions;
    uint cTextureStoreInstructions;
}

struct D3D11_SHADER_INPUT_BIND_DESC
{
    const char *Name;
    D3D_SHADER_INPUT_TYPE Type;
    uint BindPoint;
    uint BindCount;
    uint uFlags;
    D3D_RESOURCE_RETURN_TYPE ReturnType;
    D3D_SRV_DIMENSION Dimension;
    uint NumSamples;
}

struct D3D11_LIBRARY_DESC
{
    const char *Creator;
    uint Flags;
    uint FunctionCount;
}

struct D3D11_FUNCTION_DESC
{
    uint Version;
    const char *Creator;
    uint Flags;
    uint ConstantBuffers;
    uint BoundResources;
    uint InstructionCount;
    uint TempRegisterCount;
    uint TempArrayCount;
    uint DefCount;
    uint DclCount;
    uint TextureNormalInstructions;
    uint TextureLoadInstructions;
    uint TextureCompInstructions;
    uint TextureBiasInstructions;
    uint TextureGradientInstructions;
    uint FloatInstructionCount;
    uint IntInstructionCount;
    uint UintInstructionCount;
    uint StaticFlowControlCount;
    uint DynamicFlowControlCount;
    uint MacroInstructionCount;
    uint ArrayInstructionCount;
    uint MovInstructionCount;
    uint MovcInstructionCount;
    uint ConversionInstructionCount;
    uint BitwiseInstructionCount;
    D3D_FEATURE_LEVEL MinFeatureLevel;
    ulong RequiredFeatureFlags;
    const char *Name;
    int FunctionParameterCount;
    bool HasReturn;
    bool Has10Level9VertexShader;
    bool Has10Level9PixelShader;
}

struct D3D11_PARAMETER_DESC
{
    const char *Name;
    const char *SemanticName;
    D3D_SHADER_VARIABLE_TYPE Type;
    D3D_SHADER_VARIABLE_CLASS Class;
    uint Rows;
    uint Columns;
    D3D_INTERPOLATION_MODE InterpolationMode;
    D3D_PARAMETER_FLAGS Flags;
    uint FirstInRegister;
    uint FirstInComponent;
    uint FirstOutRegister;
    uint FirstOutComponent;
}

///
/// Interfaces
///

mixin(uuid!(ID3D11ShaderReflectionType, "6E6FFA6A-9BAE-4613-A51E-91652D508C21"));
public interface ID3D11ShaderReflectionType : IUnknown
{
extern(Windows):
    ID3D11ShaderReflectionType GetBaseClass();
    HRESULT GetDesc(D3D11_SHADER_TYPE_DESC *pDesc);
    ID3D11ShaderReflectionType GetInterfaceByIndex(uint uIndex);
    ID3D11ShaderReflectionType* GetMemberTypeByIndex(uint Index);
    ID3D11ShaderReflectionType* GetMemberTypeByName(const char *Name);
    const char* GetMemberTypeName(uint Index);
    uint GetNumInterfaces();
    ID3D11ShaderReflectionType GetSubType();
    HRESULT ImplementsInterface(ID3D11ShaderReflectionType pBase);
    HRESULT IsEqual(ID3D11ShaderReflectionType pType);
    HRESULT IsOfType(ID3D11ShaderReflectionType pType);
}

mixin(uuid!(ID3D11ShaderReflectionVariable, "51F23923-F3E5-4BD1-91CB-606177D8DB4C"));
public interface ID3D11ShaderReflectionVariable : IUnknown
{
extern(Windows):
    ID3D11ShaderReflectionConstantBuffer GetBuffer();
    HRESULT GetDesc(D3D11_SHADER_VARIABLE_DESC pDesc);
    uint GetInterfaceSlot(uint uArrayIndex);
    ID3D11ShaderReflectionType GetType();
}

mixin(uuid!(ID3D11ShaderReflectionConstantBuffer, "EB62D63D-93DD-4318-8AE8-C6F83AD371B8"));
public interface ID3D11ShaderReflectionConstantBuffer : IUnknown
{
extern(Windows):
    HRESULT GetDesc(D3D11_SHADER_BUFFER_DESC *pDesc);
    ID3D11ShaderReflectionVariable GetVariableByIndex(uint Index);
    ID3D11ShaderReflectionVariable* GetVariableByName(const char *Name);
}

mixin(uuid!(ID3D11ShaderReflection, "8d536ca1-0cca-4956-a837-786963755584"));
public interface ID3D11ShaderReflection : IUnknown
{
extern(Windows):
    uint GetBitwiseInstructionCount();
    ID3D11ShaderReflectionConstantBuffer GetConstantBufferByIndex(uint Index);
    ID3D11ShaderReflectionConstantBuffer GetConstantBufferByName(const char *Name);
    uint GetConversionInstructionCount();
    HRESULT GetDesc(D3D11_SHADER_DESC *pDesc);
    D3D_PRIMITIVE GetGSInputPrimitive();
    HRESULT GetInputParameterDesc(uint ParameterIndex, D3D11_SIGNATURE_PARAMETER_DESC *pDesc);
    HRESULT GetMinFeatureLevel(D3D_FEATURE_LEVEL *pLevel);
    uint GetMovInstructionCount();
    uint GetMovcInstructionCount();
    uint GetNumInterfaceSlots();
    HRESULT GetOutputParameterDesc(uint ParameterIndex, D3D11_SIGNATURE_PARAMETER_DESC *pDesc);
    HRESULT GetPatchConstantParameterDesc(uint ParameterIndex, D3D11_SIGNATURE_PARAMETER_DESC *pDesc);
    ulong GetRequiresFlags();
    HRESULT GetResourceBindingDesc(uint ResourceIndex, D3D11_SHADER_INPUT_BIND_DESC *pDesc);
    HRESULT GetResourceBindingDescByName(const char *Name, D3D11_SHADER_INPUT_BIND_DESC *pDesc);
    uint GetThreadGroupSize(uint *pSizeX, uint *pSizeY, uint *pSizeZ);
    ID3D11ShaderReflectionVariable* GetVariableByName(const char *Name);
    bool IsSampleFrequencyShader();
}

mixin(uuid!(ID3D11LibraryReflection, "54384F1B-5B3E-4BB7-AE01-60BA3097CBB6"));
public interface ID3D11LibraryReflection : IUnknown
{
extern(Windows):
    HRESULT GetDesc(D3D11_LIBRARY_DESC *pDesc);
    ID3D11FunctionReflection GetFunctionByIndex(int FunctionIndex);
}

mixin(uuid!(ID3D11FunctionReflection, "207BCECB-D683-4A06-A8A3-9B149B9F73A4"));
public interface ID3D11FunctionReflection : IUnknown
{
extern(Windows):
    ID3D11ShaderReflectionConstantBuffer GetConstantBufferByIndex(uint BufferIndex);
    ID3D11ShaderReflectionConstantBuffer GetConstantBufferByName(const char *Name);
    HRESULT GetDesc(D3D11_FUNCTION_DESC *pDesc);
    ID3D11FunctionParameterReflection GetFunctionParameter(int ParameterIndex);
    HRESULT GetResourceBindingDesc(uint ResourceIndex, D3D11_SHADER_INPUT_BIND_DESC *pDesc);
    HRESULT GetResourceBindingDescByName(const char *Name, D3D11_SHADER_INPUT_BIND_DESC *pDesc);
    ID3D11ShaderReflectionVariable* GetVariableByName(const char *Name);
}

mixin(uuid!(ID3D11FunctionParameterReflection, "42757488-334F-47FE-982E-1A65D08CC462"));
public interface ID3D11FunctionParameterReflection : IUnknown
{
extern(Windows):
    HRESULT GetDesc(D3D11_PARAMETER_DESC *pDesc);
}

mixin(uuid!(ID3D11Module, "CAC701EE-80FC-4122-8242-10B39C8CEC34"));
public interface ID3D11Module : IUnknown
{
extern(Windows):
    HRESULT CreateInstance(const char *pNamespace, ID3D11ModuleInstance *ppModuleInstance);
}

mixin(uuid!(ID3D11ModuleInstance, "469E07F7-045A-48D5-AA12-68A478CDF75D"));
public interface ID3D11ModuleInstance : IUnknown
{
extern(Windows):
    HRESULT BindConstantBuffer(uint uSrcSlot, uint uDstSlot, uint cbDstOffset);
    HRESULT BindConstantBufferByName(const char *pName, uint uDstSlot, uint cbDstOffset);
    HRESULT BindResource(uint uSrcSlot, uint uDstSlot, uint uCount);
    HRESULT BindResourceAsUnorderedAccessView(uint uSrcSrvSlot, uint uDstUavSlot, uint uCount);
    HRESULT BindResourceAsUnorderedAccessViewByName(const char *pSrvName, uint uDstUavSlot, uint uCount);
    HRESULT BindResourceByName(const char *pName, uint uDstSlot, uint uCount);
    HRESULT BindSampler(uint uSrcSlot, uint uDstSlot, uint uCount);
    HRESULT BindSamplerByName(const char *pName, uint uDstSlot, uint uCount);
    HRESULT BindUnorderedAccessView(uint uSrcSlot, uint uDstSlot, uint uCount);
    HRESULT BindUnorderedAccessViewByName(const char *pName, uint uDstSlot, uint uCount);
}

mixin(uuid!(ID3D11Linker, "59A6CD0E-E10D-4C1F-88C0-63ABA1DAF30E"));
public interface ID3D11Linker : IUnknown
{
extern(Windows):
    HRESULT AddClipPlaneFromCBuffer(uint uCBufferSlot, uint uCBufferEntry);
    HRESULT Link(ID3D11ModuleInstance pEntry, const char *pEntryName, const char *pTargetName, uint uFlags, ID3DBlob *ppShaderBlob, ID3DBlob *ppErrorBuffer);
    HRESULT UseLibrary(ID3D11ModuleInstance pLibraryMI);
}

mixin(uuid!(ID3D11LinkingNode, "D80DD70C-8D2F-4751-94A1-03C79B3556DB"));
public interface ID3D11LinkingNode : IUnknown
{
extern(Windows):
}

mixin(uuid!(ID3D11FunctionLinkingGraph, "54133220-1CE8-43D3-8236-9855C5CEECFF"));
public interface ID3D11FunctionLinkingGraph : IUnknown
{
extern(Windows):
    HRESULT CallFunction(const char *pModuleInstanceNamespace, ID3D11Module pModuleWithFunctionPrototype, const char *pFunctionName, ID3D11LinkingNode *ppCallNode);
    HRESULT CreateModuleInstance(ID3D11ModuleInstance *ppModuleInstance, ID3DBlob *ppErrorBuffer);
    HRESULT GenerateHlsl(uint uFlags, ID3DBlob *ppBuffer);
    HRESULT GetLastError(ID3DBlob *ppErrorBuffer);
    HRESULT PassValue(ID3D11LinkingNode pSrcNode, int SrcParameterIndex, ID3D11LinkingNode pDstNode, int DstParameterIndex);
    HRESULT PassValueWithSwizzle(ID3D11LinkingNode pSrcNode, int SrcParameterIndex, const char *pSrcSwizzle, ID3D11LinkingNode pDstNode, int DstParameterIndex, const char *pDstSwizzle);
    HRESULT SetInputSignature(const D3D11_PARAMETER_DESC *pInputParameters, uint  cInputParameters, ID3D11LinkingNode *ppInputNode);
    HRESULT SetOutputSignature(const D3D11_PARAMETER_DESC *pOutputParameters, uint cOutputParameters, ID3D11LinkingNode *ppOutputNode);
}
