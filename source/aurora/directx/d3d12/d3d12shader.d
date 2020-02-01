module aurora.directx.d3d12.d3d12shader;

version(Windows):

public import aurora.directx.com;
public import aurora.directx.d3d.d3dcommon;

public:

///
/// Constants
///

alias D3D_RESOURCE_RETURN_TYPE D3D12_RESOURCE_RETURN_TYPE;
alias D3D_CBUFFER_TYPE D3D12_CBUFFER_TYPE;
alias D3D_TESSELLATOR_DOMAIN D3D12_TESSELLATOR_DOMAIN;
alias D3D_TESSELLATOR_PARTITIONING D3D12_TESSELLATOR_PARTITIONING;
alias D3D_TESSELLATOR_OUTPUT_PRIMITIVE D3D12_TESSELLATOR_OUTPUT_PRIMITIVE;

enum uint D3D_SHADER_REQUIRES_DOUBLES = 0x00000001;
enum uint D3D_SHADER_REQUIRES_EARLY_DEPTH_STENCIL = 0x00000002;
enum uint D3D_SHADER_REQUIRES_UAVS_AT_EVERY_STAGE = 0x00000004;
enum uint D3D_SHADER_REQUIRES_64_UAVS = 0x00000008;
enum uint D3D_SHADER_REQUIRES_MINIMUM_PRECISION = 0x00000010;
enum uint D3D_SHADER_REQUIRES_11_1_DOUBLE_EXTENSIONS = 0x00000020;
enum uint D3D_SHADER_REQUIRES_11_1_SHADER_EXTENSIONS = 0x00000040;
enum uint D3D_SHADER_REQUIRES_LEVEL_9_COMPARISON_FILTERING = 0x00000080;
enum uint D3D_SHADER_REQUIRES_TILED_RESOURCES = 0x00000100;
enum uint D3D_SHADER_REQUIRES_STENCIL_REF = 0x00000200;
enum uint D3D_SHADER_REQUIRES_INNER_COVERAGE = 0x00000400;
enum uint D3D_SHADER_REQUIRES_TYPED_UAV_LOAD_ADDITIONAL_FORMATS = 0x00000800;
enum uint D3D_SHADER_REQUIRES_ROVS = 0x00001000;
enum uint D3D_SHADER_REQUIRES_VIEWPORT_AND_RT_ARRAY_INDEX_FROM_ANY_SHADER_FEEDING_RASTERIZER = 0x00002000;

///
/// Functions
///

///
/// Enumerations
///

enum D3D12_SHADER_VERSION_TYPE
{
    PIXEL_SHADER    = 0,
    VERTEX_SHADER   = 1,
    GEOMETRY_SHADER = 2,
    HULL_SHADER     = 3,
    DOMAIN_SHADER   = 4,
    COMPUTE_SHADER  = 5,
    RESERVED0       = 0xFFF0,
}

///
/// Structures
///

struct D3D12_SIGNATURE_PARAMETER_DESC
{
    const char *SemanticName; 
    uint SemanticIndex;
    uint Register;
    D3D_NAME SystemValueType;
    D3D_REGISTER_COMPONENT_TYPE ComponentType;
    ubyte Mask;
    ubyte ReadWriteMask;
    uint Stream;
    D3D_MIN_PRECISION MinPrecision;
}

struct D3D12_SHADER_BUFFER_DESC
{
    const char *SemanticName; 
    D3D_CBUFFER_TYPE Type;
    uint Variables;
    uint Size;
    uint uFlags;
}

struct D3D12_SHADER_VARIABLE_DESC
{
    const char *SemanticName; 
    uint StartOffset;
    uint Size;
    uint uFlags;
    void *DefaultValue;
    uint StartTexture;
    uint TextureSize;
    uint StartSampler;
    uint SamplerSize;
}

struct D3D12_SHADER_TYPE_DESC
{
    D3D_SHADER_VARIABLE_CLASS Class;
    D3D_SHADER_VARIABLE_TYPE Type;
    uint Rows;
    uint Columns;
    uint Elements;
    uint Members;
    uint Offset;
    const char *SemanticName; 
}

struct D3D12_SHADER_DESC
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

struct D3D12_SHADER_INPUT_BIND_DESC
{
    const char *Name;
    D3D_SHADER_INPUT_TYPE Type;
    uint BindPoint;
    uint BindCount;
    uint uFlags;
    D3D_RESOURCE_RETURN_TYPE ReturnType;
    D3D_SRV_DIMENSION Dimension;
    uint NumSamples;
    uint Space;
    uint uID;
}

struct D3D12_LIBRARY_DESC
{
    const char *Creator;
    uint Flags;
    uint FunctionCount;
}

struct D3D12_FUNCTION_DESC
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

struct D3D12_PARAMETER_DESC
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

mixin(uuid!(ID3D12ShaderReflectionType, "E913C351-783D-48CA-A1D1-4F306284AD56"));
public interface ID3D12ShaderReflectionType : IUnknown
{
extern(Windows):
	ID3D12ShaderReflectionType GetBaseClass();
    HRESULT GetDesc(D3D12_SHADER_TYPE_DESC *pDesc);
    ID3D12ShaderReflectionType GetInterfaceByIndex(uint uIndex);
    ID3D12ShaderReflectionType GetMemberTypeByIndex(uint Index);
    ID3D12ShaderReflectionType GetMemberTypeByName(const char *Name);
    const char* GetMemberTypeName(uint Index);
    uint GetNumInterfaces();
    ID3D12ShaderReflectionType GetSubType();
    HRESULT ImplementsInterface(ID3D12ShaderReflectionType pBase);
    HRESULT IsEqual(ID3D12ShaderReflectionType pType);
    HRESULT IsOfType(ID3D12ShaderReflectionType pType);
}

mixin(uuid!(ID3D12ShaderReflectionVariable, "8337A8A6-A216-444A-B2F4-314733A73AEA"));
public interface ID3D12ShaderReflectionVariable : IUnknown
{
extern(Windows):
	ID3D12ShaderReflectionConstantBuffer GetBuffer();
    HRESULT GetDesc(D3D12_SHADER_VARIABLE_DESC *pDesc);
    uint GetInterfaceSlot(uint uArrayIndex);
    ID3D12ShaderReflectionType GetType();
}

mixin(uuid!(ID3D12ShaderReflectionConstantBuffer, "C59598B4-48B3-4869-B9B1-B1618B14A8B7"));
public interface ID3D12ShaderReflectionConstantBuffer : IUnknown
{
extern(Windows):
	HRESULT GetDesc(D3D12_SHADER_BUFFER_DESC *pDesc);
    ID3D12ShaderReflectionVariable GetVariableByIndex(uint Index);
    ID3D12ShaderReflectionVariable GetVariableByName(const char *Name);
}

mixin(uuid!(ID3D12ShaderReflection, "5A58797D-A72C-478D-8BA2-EFC6B0EFE88E"));
public interface ID3D12ShaderReflection : IUnknown
{
extern(Windows):
	uint GetBitwiseInstructionCount();
    ID3D12ShaderReflectionConstantBuffer GetConstantBufferByIndex(uint Index);
    ID3D12ShaderReflectionConstantBuffer GetConstantBufferByName(const char *Name);
    uint GetConversionInstructionCount();
    HRESULT GetDesc(D3D12_SHADER_DESC *pDesc);
    D3D_PRIMITIVE GetGSInputPrimitive();
    HRESULT GetMinFeatureLevel(D3D_FEATURE_LEVEL *pLevel);
    uint GetMovcInstructionCount();
    uint GetMovInstructionCount();
    uint GetNumInterfaceSlots();
    HRESULT GetOutputParameterDesc(uint ParameterIndex, D3D12_SIGNATURE_PARAMETER_DESC *pDesc);
    HRESULT GetPatchConstantParameterDesc(uint ParameterIndex, D3D12_SIGNATURE_PARAMETER_DESC *pDesc);
    ulong GetRequiresFlags();
    HRESULT GetResourceBindingDesc(uint ResourceIndex, D3D12_SHADER_INPUT_BIND_DESC *pDesc);
    HRESULT GetResourceBindingDescByName(const char *Name, D3D12_SHADER_INPUT_BIND_DESC *pDesc);
    uint GetThreadGroupSize(uint *pSizeX, uint *pSizeY, uint *pSizeZ);
    ID3D12ShaderReflectionVariable GetVariableByName(const char *Name);
    bool IsSampleFrequencyShader();
}

mixin(uuid!(ID3D12LibraryReflection, "8E349D19-54DB-4A56-9DC9-119D87BDB804"));
public interface ID3D12LibraryReflection : IUnknown
{
extern(Windows):
	HRESULT GetDesc(D3D12_LIBRARY_DESC *pDesc);
    ID3D12FunctionReflection GetFunctionByIndex(int FunctionIndex);
}

mixin(uuid!(ID3D12FunctionReflection, "1108795C-2772-4BA9-B2A8-D464DC7E2799"));
public interface ID3D12FunctionReflection : IUnknown
{
extern(Windows):
	ID3D12ShaderReflectionConstantBuffer GetConstantBufferByIndex(uint BufferIndex);
    ID3D12ShaderReflectionConstantBuffer GetConstantBufferByName(const char *Name);
    HRESULT GetDesc(D3D12_FUNCTION_DESC *pDesc);
    ID3D12FunctionParameterReflection GetFunctionParameter(int ParameterIndex);
    HRESULT GetResourceBindingDesc(uint ResourceIndex, D3D12_SHADER_INPUT_BIND_DESC *pDesc);
    HRESULT GetResourceBindingDescByName(const char *Name, D3D12_SHADER_INPUT_BIND_DESC *pDesc);
    ID3D12ShaderReflectionVariable GetVariableByName(const char *Name);
}

mixin(uuid!(ID3D12FunctionParameterReflection, "EC25F42D-7006-4F2B-B33E-02CC3375733F"));
public interface ID3D12FunctionParameterReflection : IUnknown
{
extern(Windows):
    HRESULT GetDesc(D3D12_PARAMETER_DESC *pDesc);
}
