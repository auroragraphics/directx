module aurora.directx.d3d.d3dcompiler;

version(Windows):

public import aurora.directx.com;
public import aurora.directx.d3d.d3dcommon;
public import aurora.directx.d3d11.d3d11shader;

public:

///
/// Constants
///

enum wstring D3DCOMPILER_DLL_W = "d3dcompiler_47.dll";
enum string D3DCOMPILER_DLL_A = "d3dcompiler_47.dll";
enum int D3D_COMPILER_VERSION = 47;

enum int D3DCOMPILE_DEBUG = (1 << 0);
enum int D3DCOMPILE_SKIP_VALIDATION = (1 << 1);
enum int D3DCOMPILE_SKIP_OPTIMIZATION = (1 << 2);
enum int D3DCOMPILE_PACK_MATRIX_ROW_MAJOR = (1 << 3);
enum int D3DCOMPILE_PACK_MATRIX_COLUMN_MAJOR = (1 << 4);
enum int D3DCOMPILE_PARTIAL_PRECISION = (1 << 5);
enum int D3DCOMPILE_FORCE_VS_SOFTWARE_NO_OPT = (1 << 6);
enum int D3DCOMPILE_FORCE_PS_SOFTWARE_NO_OPT = (1 << 7);
enum int D3DCOMPILE_NO_PRESHADER = (1 << 8);
enum int D3DCOMPILE_AVOID_FLOW_CONTROL = (1 << 9);
enum int D3DCOMPILE_PREFER_FLOW_CONTROL = (1 << 10);
enum int D3DCOMPILE_ENABLE_STRICTNESS = (1 << 11);
enum int D3DCOMPILE_ENABLE_BACKWARDS_COMPATIBILITY = (1 << 12);
enum int D3DCOMPILE_IEEE_STRICTNESS = (1 << 13);
enum int D3DCOMPILE_OPTIMIZATION_LEVEL0 = (1 << 14);
enum int D3DCOMPILE_OPTIMIZATION_LEVEL1 = 0;
enum int D3DCOMPILE_OPTIMIZATION_LEVEL2 = ((1 << 14) | (1 << 15));
enum int D3DCOMPILE_OPTIMIZATION_LEVEL3 = (1 << 15);
enum int D3DCOMPILE_RESERVED16 =(1 << 16);
enum int D3DCOMPILE_RESERVED17 = (1 << 17);
enum int D3DCOMPILE_WARNINGS_ARE_ERRORS = (1 << 18);
enum int D3DCOMPILE_RESOURCES_MAY_ALIAS = (1 << 19);
enum int D3DCOMPILE_ENABLE_UNBOUNDED_DESCRIPTOR_TABLES = (1 << 20);
enum int D3DCOMPILE_ALL_RESOURCES_BOUND = (1 << 21);
enum int D3DCOMPILE_DEBUG_NAME_FOR_SOURCE = (1 << 22);
enum int D3DCOMPILE_DEBUG_NAME_FOR_BINARY = (1 << 23);

enum int D3DCOMPILE_EFFECT_CHILD_EFFECT = (1 << 0);
enum int D3DCOMPILE_EFFECT_ALLOW_SLOW_OPS = (1 << 1);

enum int D3DCOMPILE_FLAGS2_FORCE_ROOT_SIGNATURE_LATEST = 0;
enum int D3DCOMPILE_FLAGS2_FORCE_ROOT_SIGNATURE_1_0 = (1 << 4);
enum int D3DCOMPILE_FLAGS2_FORCE_ROOT_SIGNATURE_1_1 = (1 << 5);

enum int D3DCOMPILE_SECDATA_MERGE_UAV_SLOTS = 0x00000001;
enum int D3DCOMPILE_SECDATA_PRESERVE_TEMPLATE_SLOTS = 0x00000002;
enum int D3DCOMPILE_SECDATA_REQUIRE_TEMPLATE_MATCH = 0x00000004;

enum int D3D_DISASM_ENABLE_COLOR_CODE = 0x00000001;
enum int D3D_DISASM_ENABLE_DEFAULT_VALUE_PRINTS = 0x00000002;
enum int D3D_DISASM_ENABLE_INSTRUCTION_NUMBERING = 0x00000004;
enum int D3D_DISASM_ENABLE_INSTRUCTION_CYCLE = 0x00000008;
enum int D3D_DISASM_DISABLE_DEBUG_INFO = 0x00000010;
enum int D3D_DISASM_ENABLE_INSTRUCTION_OFFSET = 0x00000020;
enum int D3D_DISASM_INSTRUCTION_ONLY = 0x00000040;
enum int D3D_DISASM_PRINT_HEX_LITERALS = 0x00000080;

enum int D3D_GET_INST_OFFSETS_INCLUDE_NON_EXECUTABLE = 0x00000001;

enum int D3D_COMPRESS_SHADER_KEEP_ALL_PARTS = 0x00000001;

///
/// Functions
///

extern(Windows) {
    HRESULT D3DReadFileToBlob(const wchar *pFileName, ID3DBlob* ppContents);
    HRESULT D3DWriteBlobToFile(ID3DBlob pBlob, const wchar *pFileName, bool bOverwrite);
    HRESULT D3DCompile(const void *pSrcData, size_t SrcDataSize, const char *pSourceName, const D3D_SHADER_MACRO* pDefines, ID3DInclude pInclude, const char *pEntrypoint, const char *pTarget, uint Flags1, uint Flags2, ID3DBlob* ppCode, ID3DBlob* ppErrorMsgs);
    HRESULT D3DCompile2(const void *pSrcData, size_t SrcDataSize, const char *pSourceName, const D3D_SHADER_MACRO* pDefines, ID3DInclude pInclude, const char *pEntrypoint, const char *pTarget, uint Flags1, uint Flags2, uint SecondaryDataFlags, void *pSecondaryData, size_t SecondaryDataSize, ID3DBlob* ppCode, ID3DBlob* ppErrorMsgs);
    HRESULT D3DCompileFromFile(const wchar *pFileName, const D3D_SHADER_MACRO* pDefines, ID3DInclude pInclude, const char *pEntrypoint, const char *pTarget, uint Flags1, uint Flags2, ID3DBlob* ppCode, ID3DBlob* ppErrorMsgs);
    HRESULT D3DPreprocess(const void *pSrcData, size_t SrcDataSize, const char *pSourceName, const D3D_SHADER_MACRO* pDefines, ID3DInclude pInclude, ID3DBlob* ppCodeText, ID3DBlob* ppErrorMsgs);
    HRESULT D3DGetDebugInfo(const void *pSrcData, size_t SrcDataSize, ID3DBlob* ppDebugInfo);
    HRESULT D3DReflect(const void *pSrcData, size_t SrcDataSize, REFIID pInterface, void** ppReflector);
    HRESULT D3DReflectLibrary(const void *pSrcData, size_t SrcDataSize, REFIID riid, void** ppReflector);
    HRESULT D3DDisassemble(const void *pSrcData, size_t SrcDataSize, uint Flags, const char *szComments, ID3DBlob* ppDisassembly);
    HRESULT D3DDisassembleRegion(const void *pSrcData, size_t SrcDataSize, uint Flags, const char *szComments, size_t StartByteOffset, size_t NumInsts, size_t* pFinishByteOffset, ID3DBlob* ppDisassembly);
    HRESULT D3DCreateLinker(ID3D11Linker *ppLinker);
    HRESULT D3DLoadModule(const void *pSrcData, size_t cbSrcDataSize, ID3D11Module *ppModule);
    HRESULT D3DCreateFunctionLinkingGraph(uint uFlags, ID3D11FunctionLinkingGraph *ppFunctionLinkingGraph);
    HRESULT D3DGetTraceInstructionOffsets(const void *pSrcData, size_t SrcDataSize, uint Flags, size_t StartInstIndex, size_t NumInsts, size_t* pOffsets, size_t* pTotalInsts);
    HRESULT D3DGetInputSignatureBlob(const void *pSrcData, size_t SrcDataSize, ID3DBlob* ppSignatureBlob);
    HRESULT D3DGetOutputSignatureBlob(void *pSrcData, size_t SrcDataSize, ID3DBlob* ppSignatureBlob);
    HRESULT D3DGetInputAndOutputSignatureBlob(const void *pSrcData, size_t SrcDataSize, ID3DBlob* ppSignatureBlob);
    HRESULT D3DStripShader(const void *pShaderBytecode, size_t BytecodeLength, uint uStripFlags, ID3DBlob* ppStrippedBlob);
    HRESULT D3DGetBlobPart(const void *pSrcData, size_t SrcDataSize, D3D_BLOB_PART Part, uint Flags, ID3DBlob* ppPart);
    HRESULT D3DSetBlobPart(const void *pSrcData, size_t SrcDataSize, D3D_BLOB_PART Part, uint Flags, const void *pPart, size_t PartSize, ID3DBlob* ppNewShader);
    HRESULT D3DCreateBlob(size_t Size, ID3DBlob* ppBlob);
    HRESULT D3DCompressShaders(uint uNumShaders, D3D_SHADER_DATA* pShaderData, uint uFlags, ID3DBlob* ppCompressedData);
    HRESULT D3DDecompressShaders(const void *pSrcData, size_t SrcDataSize, uint uNumShaders, uint uStartIndex, uint* pIndices, uint uFlags, ID3DBlob* ppShaders, uint* pTotalShaders);
}

///
/// Enumerations
///

enum D3DCOMPILER_STRIP_FLAGS
{
    REFLECTION_DATA       = 0x00000001,
    DEBUG_INFO            = 0x00000002,
    TEST_BLOBS            = 0x00000004,
    PRIVATE_DATA          = 0x00000008,
    ROOT_SIGNATURE        = 0x00000010,
    FORCE_DWORD           = 0x7fffffff,
}

enum D3D_BLOB_PART
{
    INPUT_SIGNATURE_BLOB,
    OUTPUT_SIGNATURE_BLOB,
    INPUT_AND_OUTPUT_SIGNATURE_BLOB,
    PATCH_CONSTANT_SIGNATURE_BLOB,
    ALL_SIGNATURE_BLOB,
    DEBUG_INFO,
    LEGACY_SHADER,
    XNA_PREPASS_SHADER,
    XNA_SHADER,
    PDB,
    PRIVATE_DATA,
    ROOT_SIGNATURE,
    DEBUG_NAME,
    TEST_ALTERNATE_SHADER = 0x8000,
    TEST_COMPILE_DETAILS,
    TEST_COMPILE_PERF,
    TEST_COMPILE_REPORT,
}

///
/// Structures
///

struct D3D_SHADER_DATA
{
    const void *pBytecode;
    size_t BytecodeLength;
}

///
/// Interfaces
///
