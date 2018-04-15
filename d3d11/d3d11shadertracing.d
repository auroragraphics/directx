module aurora.directx.d3d11.d3d11shadertracing;

public import aurora.directx.d3d.d3dcommon;

public:

///
/// Constants
///

enum int COMPONENT_X = 0x1;
enum int COMPONENT_Y = 0x2;
enum int COMPONENT_Z = 0x4;
enum int COMPONENT_W = 0x8;

enum int D3D11_SHADER_TRACE_FLAG_RECORD_REGISTER_WRITES = 0x1;
enum int D3D11_SHADER_TRACE_FLAG_RECORD_REGISTER_READS = 0x2;

alias ubyte COMPONENT_MASK;

enum int D3D11_TRACE_MISC_GS_EMIT = 0x1;
enum int D3D11_TRACE_MISC_GS_CUT = 0x2; 
enum int D3D11_TRACE_MISC_PS_DISCARD = 0x4; 
enum int D3D11_TRACE_MISC_GS_EMIT_STREAM = 0x8; 
enum int D3D11_TRACE_MISC_GS_CUT_STREAM = 0x10; 
enum int D3D11_TRACE_MISC_HALT = 0x20; 
enum int D3D11_TRACE_MISC_MESSAGE = 0x40; 

alias ushort D3D11_TRACE_MISC_OPERATIONS_MASK;

///
/// Functions
///

extern(Windows) {
    HRESULT D3DDisassemble11Trace(const void *pSrcData, size_t SrcDataSize, ID3D11ShaderTrace pTrace, uint StartStep, uint NumSteps, uint Flags, ID3D10Blob* ppDisassembly);
}

///
/// Enumerations
///

enum D3D11_SHADER_TYPE
{
    D3D11_VERTEX_SHADER	= 1,
    D3D11_HULL_SHADER = 2,
    D3D11_DOMAIN_SHADER	= 3,
    D3D11_GEOMETRY_SHADER = 4,
    D3D11_PIXEL_SHADER = 5,
    D3D11_COMPUTE_SHADER = 6
}

enum GS_INPUT_PRIMITIVE
{
    UNDEFINED	= 0,
    POINT	= 1,
    LINE	= 2,
    TRIANGLE	= 3,
    LINE_ADJ	= 6,
    TRIANGLE_ADJ	= 7
}

enum D3D11_TRACE_REGISTER_TYPE
{
    OUTPUT_NULL_REGISTER	= 0,
    INPUT_REGISTER	= ( OUTPUT_NULL_REGISTER + 1 ) ,
    INPUT_PRIMITIVE_ID_REGISTER	= ( INPUT_REGISTER + 1 ) ,
    IMMEDIATE_CONSTANT_BUFFER	= ( INPUT_PRIMITIVE_ID_REGISTER + 1 ) ,
    TEMP_REGISTER	= ( IMMEDIATE_CONSTANT_BUFFER + 1 ) ,
    INDEXABLE_TEMP_REGISTER	= ( TEMP_REGISTER + 1 ) ,
    OUTPUT_REGISTER	= ( INDEXABLE_TEMP_REGISTER + 1 ) ,
    OUTPUT_DEPTH_REGISTER	= ( OUTPUT_REGISTER + 1 ) ,
    CONSTANT_BUFFER	= ( OUTPUT_DEPTH_REGISTER + 1 ) ,
    IMMEDIATE32	= ( CONSTANT_BUFFER + 1 ) ,
    SAMPLER	= ( IMMEDIATE32 + 1 ) ,
    RESOURCE	= ( SAMPLER + 1 ) ,
    RASTERIZER	= ( RESOURCE + 1 ) ,
    OUTPUT_COVERAGE_MASK	= ( RASTERIZER + 1 ) ,
    STREAM	= ( OUTPUT_COVERAGE_MASK + 1 ) ,
    THIS_POINTER	= ( STREAM + 1 ) ,
    OUTPUT_CONTROL_POINT_ID_REGISTER	= ( THIS_POINTER + 1 ) ,
    INPUT_FORK_INSTANCE_ID_REGISTER	= ( OUTPUT_CONTROL_POINT_ID_REGISTER + 1 ) ,
    INPUT_JOIN_INSTANCE_ID_REGISTER	= ( INPUT_FORK_INSTANCE_ID_REGISTER + 1 ) ,
    INPUT_CONTROL_POINT_REGISTER	= ( INPUT_JOIN_INSTANCE_ID_REGISTER + 1 ) ,
    OUTPUT_CONTROL_POINT_REGISTER	= ( INPUT_CONTROL_POINT_REGISTER + 1 ) ,
    INPUT_PATCH_CONSTANT_REGISTER	= ( OUTPUT_CONTROL_POINT_REGISTER + 1 ) ,
    INPUT_DOMAIN_POINT_REGISTER	= ( INPUT_PATCH_CONSTANT_REGISTER + 1 ) ,
    UNORDERED_ACCESS_VIEW	= ( INPUT_DOMAIN_POINT_REGISTER + 1 ) ,
    THREAD_GROUP_SHARED_MEMORY	= ( UNORDERED_ACCESS_VIEW + 1 ) ,
    INPUT_THREAD_ID_REGISTER	= ( THREAD_GROUP_SHARED_MEMORY + 1 ) ,
    INPUT_THREAD_GROUP_ID_REGISTER	= ( INPUT_THREAD_ID_REGISTER + 1 ) ,
    INPUT_THREAD_ID_IN_GROUP_REGISTER	= ( INPUT_THREAD_GROUP_ID_REGISTER + 1 ) ,
    INPUT_COVERAGE_MASK_REGISTER	= ( INPUT_THREAD_ID_IN_GROUP_REGISTER + 1 ) ,
    INPUT_THREAD_ID_IN_GROUP_FLATTENED_REGISTER	= ( INPUT_COVERAGE_MASK_REGISTER + 1 ) ,
    INPUT_GS_INSTANCE_ID_REGISTER	= ( INPUT_THREAD_ID_IN_GROUP_FLATTENED_REGISTER + 1 ) ,
    OUTPUT_DEPTH_GREATER_EQUAL_REGISTER	= ( INPUT_GS_INSTANCE_ID_REGISTER + 1 ) ,
    OUTPUT_DEPTH_LESS_EQUAL_REGISTER	= ( OUTPUT_DEPTH_GREATER_EQUAL_REGISTER + 1 ) ,
    IMMEDIATE64	= ( OUTPUT_DEPTH_LESS_EQUAL_REGISTER + 1 ) ,
    INPUT_CYCLE_COUNTER_REGISTER	= ( IMMEDIATE64 + 1 ) ,
    INTERFACE_POINTER	= ( INPUT_CYCLE_COUNTER_REGISTER + 1 ) 
}

///
/// Structures
///

struct D3D11_TRACE_REGISTER
{
    D3D11_TRACE_REGISTER_TYPE RegType;
    union 
        {
        ushort Index1D;
        ushort[2] Index2D;
        };
    ubyte OperandIndex;
    ubyte Flags;
}

struct D3D11_VERTEX_SHADER_TRACE_DESC
{
    ulong Invocation;
}

struct D3D11_HULL_SHADER_TRACE_DESC
{
    ulong Invocation;
}

struct D3D11_DOMAIN_SHADER_TRACE_DESC
{
    ulong Invocation;
}

struct D3D11_GEOMETRY_SHADER_TRACE_DESC
{
    ulong Invocation;
}

struct D3D11_PIXEL_SHADER_TRACE_DESC
{
    ulong Invocation;
    int X;
    int Y;
    ulong SampleMask;
}

struct D3D11_COMPUTE_SHADER_TRACE_DESC
{
    ulong Invocation;
    uint[3] ThreadIDInGroup;
    uint[3] ThreadGroupID;
}

struct D3D11_SHADER_TRACE_DESC
{
    D3D11_SHADER_TYPE Type;
    uint Flags;
    union 
    {
        D3D11_VERTEX_SHADER_TRACE_DESC VertexShaderTraceDesc;
        D3D11_HULL_SHADER_TRACE_DESC HullShaderTraceDesc;
        D3D11_DOMAIN_SHADER_TRACE_DESC DomainShaderTraceDesc;
        D3D11_GEOMETRY_SHADER_TRACE_DESC GeometryShaderTraceDesc;
        D3D11_PIXEL_SHADER_TRACE_DESC PixelShaderTraceDesc;
        D3D11_COMPUTE_SHADER_TRACE_DESC ComputeShaderTraceDesc;
    };
}

struct D3D11_TRACE_STATS
{
    D3D11_SHADER_TRACE_DESC TraceDesc;
    ubyte NumInvocationsInStamp;
    ubyte TargetStampIndex;
    uint NumTraceSteps;
    COMPONENT_MASK[32] InputMask;
    COMPONENT_MASK[32] OutputMask;
    ushort NumTemps;
    ushort MaxIndexableTempIndex;
    ushort[4096] IndexableTempSize;
    ushort ImmediateConstantBufferSize;
    uint[4][2] PixelPosition;
    ulong[4] PixelCoverageMask;
    ulong[4] PixelDiscardedMask;
    ulong[4] PixelCoverageMaskAfterShader;
    ulong[4] PixelCoverageMaskAfterA2CSampleMask;
    ulong[4] PixelCoverageMaskAfterA2CSampleMaskDepth;
    ulong[4] PixelCoverageMaskAfterA2CSampleMaskDepthStencil;
    bool PSOutputsDepth;
    bool PSOutputsMask;
    GS_INPUT_PRIMITIVE GSInputPrimitive;
    bool GSInputsPrimitiveID;
    COMPONENT_MASK[32] HSOutputPatchConstantMask;
    COMPONENT_MASK[32] DSInputPatchConstantMask;
}

struct D3D11_TRACE_VALUE
{
    uint[4] Bits;
    COMPONENT_MASK ValidMask;
}

struct D3D11_TRACE_STEP
{
    uint ID;
    bool InstructionActive;
    ubyte NumRegistersWritten;
    ubyte NumRegistersRead;
    D3D11_TRACE_MISC_OPERATIONS_MASK MiscOperations;
    uint OpcodeType;
    ulong CurrentGlobalCycle;
}

///
/// Interfaces
///

mixin(uuid!(ID3D11ShaderTrace, "36b013e6-2811-4845-baa7-d623fe0df104"));
public interface ID3D11ShaderTrace : IUnknown
{
extern(Windows):
    HRESULT GetInitialRegisterContents(D3D11_TRACE_REGISTER *pRegister, D3D11_TRACE_VALUE *pValue);
    HRESULT GetReadRegister(uint stepIndex, uint readRegisterIndex, D3D11_TRACE_REGISTER *pRegister, D3D11_TRACE_VALUE *pValue);
    HRESULT GetStep(uint stepIndex, D3D11_TRACE_STEP *pTraceStep);
    HRESULT GetTraceStats(D3D11_TRACE_STATS *pTraceStats);
    HRESULT GetWrittenRegister(uint stepIndex, uint writtenRegisterIndex, D3D11_TRACE_REGISTER *pRegister, D3D11_TRACE_VALUE *pValue);
    HRESULT PSSelectStamp(uint stampIndex);
    void ResetTrace();
    HRESULT TraceReady(ulong *pTestCount);
}

mixin(uuid!(ID3D11ShaderTraceFactory, "1fbad429-66ab-41cc-9617-667ac10e4459"));
public interface ID3D11ShaderTraceFactory : IUnknown
{
extern(Windows):
    HRESULT CreateShaderTrace(IUnknown pShader, D3D11_SHADER_TRACE_DESC *pTraceDesc, ID3D11ShaderTrace *ppShaderTrace);
}
