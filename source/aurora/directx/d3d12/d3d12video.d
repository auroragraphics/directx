module aurora.directx.d3d12.d3d12video;

public import aurora.directx.com;
public import aurora.directx.dxgi.dxgicommon;
public import aurora.directx.d3d12.d3d12;

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

enum D3D12_VIDEO_FIELD_TYPE
{
    D3D12_VIDEO_FIELD_TYPE_NONE	= 0,
    D3D12_VIDEO_FIELD_TYPE_INTERLACED_TOP_FIELD_FIRST	= 1,
    D3D12_VIDEO_FIELD_TYPE_INTERLACED_BOTTOM_FIELD_FIRST	= 2
}

enum D3D12_VIDEO_FRAME_STEREO_FORMAT
{
    NONE	= 0,
    MONO	= 1,
    HORIZONTAL	= 2,
    VERTICAL	= 3,
    SEPARATE	= 4
}

enum D3D12_VIDEO_FRAME_CODED_INTERLACE_TYPE
{
    NONE	= 0,
    FIELD_BASED	= 1
}

enum D3D12_FEATURE_VIDEO
{
    DECODE_SUPPORT	= 0,
    DECODE_PROFILES	= 1,
    DECODE_FORMATS	= 2,
    DECODE_CONVERSION_SUPPORT	= 3,
    PROCESS_SUPPORT	= 5,
    PROCESS_MAX_INPUT_STREAMS	= 6,
    PROCESS_REFERENCE_INFO	= 7,
    DECODER_HEAP_SIZE	= 8,
    PROCESSOR_SIZE	= 9,
    DECODE_PROFILE_COUNT	= 10,
    DECODE_FORMAT_COUNT	= 11,
    ARCHITECTURE	= 17
}

enum D3D12_BITSTREAM_ENCRYPTION_TYPE
{
    NONE	= 0
}

enum D3D12_VIDEO_PROCESS_FILTER
{
    BRIGHTNESS	= 0,
    CONTRAST	= 1,
    HUE	= 2,
    SATURATION	= 3,
    NOISE_REDUCTION	= 4,
    EDGE_ENHANCEMENT	= 5,
    ANAMORPHIC_SCALING	= 6,
    STEREO_ADJUSTMENT	= 7
}

enum D3D12_VIDEO_PROCESS_FILTER_FLAGS
{
    RANGE_UINT64NONE	= 0,
    RANGE_UINT64BRIGHTNESS	= ( 1 << D3D12_VIDEO_PROCESS_FILTER.BRIGHTNESS ) ,
    RANGE_UINT64CONTRAST	= ( 1 << D3D12_VIDEO_PROCESS_FILTER.CONTRAST ) ,
    RANGE_UINT64HUE	= ( 1 << D3D12_VIDEO_PROCESS_FILTER.HUE ) ,
    RANGE_UINT64SATURATION	= ( 1 << D3D12_VIDEO_PROCESS_FILTER.SATURATION ) ,
    RANGE_UINT64NOISE_REDUCTION	= ( 1 << D3D12_VIDEO_PROCESS_FILTER.NOISE_REDUCTION ) ,
    RANGE_UINT64EDGE_ENHANCEMENT	= ( 1 << D3D12_VIDEO_PROCESS_FILTER.EDGE_ENHANCEMENT ) ,
    RANGE_UINT64ANAMORPHIC_SCALING	= ( 1 << D3D12_VIDEO_PROCESS_FILTER.ANAMORPHIC_SCALING ) ,
    RANGE_UINT64STEREO_ADJUSTMENT	= ( 1 << D3D12_VIDEO_PROCESS_FILTER.STEREO_ADJUSTMENT ) 
}

enum D3D12_VIDEO_PROCESS_DEINTERLACE_FLAGS
{
    NONE	= 0,
    BOB	= 0x1,
    CUSTOM	= 0x80000000
}

enum D3D12_VIDEO_PROCESS_ALPHA_FILL_MODE
{
    OPAQUE	= 0,
    BACKGROUND	= 1,
    DESTINATION	= 2,
    SOURCE_STREAM	= 3
}

enum D3D12_VIDEO_DECODE_TIER
{
    TIER_NOT_SUPPORTED	= 0,
    TIER_1	= 1,
    TIER_2	= 2,
    TIER_3	= 3
}

enum D3D12_VIDEO_DECODE_SUPPORT_FLAGS
{
    NONE	= 0,
    SUPPORTED	= 0x1
}

enum D3D12_VIDEO_DECODE_CONFIGURATION_FLAGS
{
    NONE	= 0,
    HEIGHT_ALIGNMENT_MULTIPLE_32_REQUIRED	= 0x1,
    POST_PROCESSING_SUPPORTED	= 0x2,
    REFERENCE_ONLY_ALLOCATIONS_REQUIRED	= 0x4,
    ALLOW_RESOLUTION_CHANGE_ON_NON_KEY_FRAME	= 0x8
}

enum D3D12_VIDEO_DECODE_STATUS
{
    OK	= 0,
    CONTINUE	= 1,
    CONTINUE_SKIP_DISPLAY	= 2,
    RESTART	= 3
}

enum D3D12_VIDEO_DECODE_ARGUMENT_TYPE
{
    PICTURE_PARAMETERS	= 0,
    INVERSE_QUANTIZATION_MATRIX	= 1,
    SLICE_CONTROL	= 2,
    MAX_VALID	= 3
}

enum D3D12_VIDEO_DECODE_CONVERSION_SUPPORT_FLAGS
{
    NONE	= 0,
    SUPPORTED	= 0x1
}

enum D3D12_VIDEO_SCALE_SUPPORT_FLAGS
{
    NONE	= 0,
    POW2_ONLY	= 0x1,
    EVEN_DIMENSIONS_ONLY	= 0x2
}

enum D3D12_VIDEO_PROCESS_FEATURE_FLAGS
{
    NONE	= 0,
    ALPHA_FILL	= 0x1,
    LUMA_KEY	= 0x2,
    STEREO	= 0x4,
    ROTATION	= 0x8,
    FLIP	= 0x10,
    ALPHA_BLENDING	= 0x20,
    PIXEL_ASPECT_RATIO	= 0x40
}

enum D3D12_VIDEO_PROCESS_AUTO_PROCESSING_FLAGS
{
    NONE	= 0,
    DENOISE	= 0x1,
    DERINGING	= 0x2,
    EDGE_ENHANCEMENT	= 0x4,
    COLOR_CORRECTION	= 0x8,
    FLESH_TONE_MAPPING	= 0x10,
    IMAGE_STABILIZATION	= 0x20,
    SUPER_RESOLUTION	= 0x40,
    ANAMORPHIC_SCALING	= 0x80,
    CUSTOM	= 0x80000000
}

enum D3D12_VIDEO_PROCESS_ORIENTATION
{
    DEFAULT	= 0,
    FLIP_HORIZONTAL	= 1,
    CLOCKWISE_90	= 2,
    CLOCKWISE_90_FLIP_HORIZONTAL	= 3,
    CLOCKWISE_180	= 4,
    FLIP_VERTICAL	= 5,
    CLOCKWISE_270	= 6,
    CLOCKWISE_270_FLIP_HORIZONTAL	= 7
}

enum D3D12_VIDEO_PROCESS_INPUT_STREAM_FLAGS
{
    NONE	= 0,
    FRAME_DISCONTINUITY	= 0x1,
    D3D12_VIDEO_PROCESS_INPUT_STREAM_FLAG_FRAME_REPEAT	= 0x2
}

enum D3D12_VIDEO_PROCESS_SUPPORT_FLAGS
{
    NONE	= 0,
    SUPPORTED	= 0x1
}

///
/// Structures
///

struct D3D12_VIDEO_FORMAT
{
    DXGI_FORMAT Format;
    DXGI_COLOR_SPACE_TYPE ColorSpace;
}

struct D3D12_VIDEO_SAMPLE
{
    uint Width;
    uint Height;
    D3D12_VIDEO_FORMAT Format;
}

struct D3D12_VIDEO_DECODE_CONFIGURATION
{
    GUID DecodeProfile;
    D3D12_BITSTREAM_ENCRYPTION_TYPE BitstreamEncryption;
    D3D12_VIDEO_FRAME_CODED_INTERLACE_TYPE InterlaceType;
}

struct D3D12_VIDEO_DECODER_DESC
{
    uint NodeMask;
    D3D12_VIDEO_DECODE_CONFIGURATION Configuration;
}

struct D3D12_VIDEO_DECODER_HEAP_DESC
{
    uint NodeMask;
    D3D12_VIDEO_DECODE_CONFIGURATION Configuration;
    uint DecodeWidth;
    uint DecodeHeight;
    DXGI_FORMAT Format;
    DXGI_RATIONAL FrameRate;
    uint BitRate;
    uint MaxDecodePictureBufferCount;
}

struct D3D12_VIDEO_SIZE_RANGE
{
    uint MaxWidth;
    uint MaxHeight;
    uint MinWidth;
    uint MinHeight;
}

struct D3D12_VIDEO_PROCESS_ALPHA_BLENDING
{
    bool Enable;
    float Alpha;
}

struct D3D12_VIDEO_PROCESS_LUMA_KEY
{
    bool Enable;
    float Lower;
    float Upper;
}

struct D3D12_VIDEO_PROCESS_INPUT_STREAM_DESC
{
    DXGI_FORMAT Format;
    DXGI_COLOR_SPACE_TYPE ColorSpace;
    DXGI_RATIONAL SourceAspectRatio;
    DXGI_RATIONAL DestinationAspectRatio;
    DXGI_RATIONAL FrameRate;
    D3D12_VIDEO_SIZE_RANGE SourceSizeRange;
    D3D12_VIDEO_SIZE_RANGE DestinationSizeRange;
    bool EnableOrientation;
    D3D12_VIDEO_PROCESS_FILTER_FLAGS FilterFlags;
    D3D12_VIDEO_FRAME_STEREO_FORMAT StereoFormat;
    D3D12_VIDEO_FIELD_TYPE FieldType;
    D3D12_VIDEO_PROCESS_DEINTERLACE_FLAGS DeinterlaceMode;
    bool EnableAlphaBlending;
    D3D12_VIDEO_PROCESS_LUMA_KEY LumaKey;
    uint NumPastFrames;
    uint NumFutureFrames;
    bool EnableAutoProcessing;
}

struct D3D12_VIDEO_PROCESS_OUTPUT_STREAM_DESC
{
    DXGI_FORMAT Format;
    DXGI_COLOR_SPACE_TYPE ColorSpace;
    D3D12_VIDEO_PROCESS_ALPHA_FILL_MODE AlphaFillMode;
    uint AlphaFillModeSourceStreamIndex;
    float[4] BackgroundColor;
    DXGI_RATIONAL FrameRate;
    bool EnableStereo;
}

struct D3D12_FEATURE_DATA_VIDEO_DECODE_SUPPORT
{
    uint NodeIndex;
    D3D12_VIDEO_DECODE_CONFIGURATION Configuration;
    uint Width;
    uint Height;
    DXGI_FORMAT DecodeFormat;
    DXGI_RATIONAL FrameRate;
    uint BitRate;
    D3D12_VIDEO_DECODE_SUPPORT_FLAGS SupportFlags;
    D3D12_VIDEO_DECODE_CONFIGURATION_FLAGS ConfigurationFlags;
    D3D12_VIDEO_DECODE_TIER DecodeTier;
}

struct D3D12_FEATURE_DATA_VIDEO_DECODE_PROFILE_COUNT
{
    uint NodeIndex;
    uint ProfileCount;
}

struct D3D12_FEATURE_DATA_VIDEO_DECODE_PROFILES
{
    uint NodeIndex;
    uint ProfileCount;
    GUID *pProfiles;
}

struct D3D12_FEATURE_DATA_VIDEO_DECODE_FORMAT_COUNT
{
    uint NodeIndex;
    D3D12_VIDEO_DECODE_CONFIGURATION Configuration;
    uint FormatCount;
}

struct D3D12_FEATURE_DATA_VIDEO_DECODE_FORMATS
{
    uint NodeIndex;
    D3D12_VIDEO_DECODE_CONFIGURATION Configuration;
    uint FormatCount;
    DXGI_FORMAT *pOutputFormats;
}

struct D3D12_FEATURE_DATA_VIDEO_ARCHITECTURE
{
    bool IOCoherent;
}

struct D3D12_VIDEO_SCALE_SUPPORT
{
    D3D12_VIDEO_SIZE_RANGE OutputSizeRange;
    D3D12_VIDEO_SCALE_SUPPORT_FLAGS Flags;
}

struct D3D12_FEATURE_DATA_VIDEO_DECODE_CONVERSION_SUPPORT
{
    uint NodeIndex;
    D3D12_VIDEO_DECODE_CONFIGURATION Configuration;
    D3D12_VIDEO_SAMPLE DecodeSample;
    D3D12_VIDEO_FORMAT OutputFormat;
    DXGI_RATIONAL FrameRate;
    uint BitRate;
    D3D12_VIDEO_DECODE_CONVERSION_SUPPORT_FLAGS SupportFlags;
    D3D12_VIDEO_SCALE_SUPPORT ScaleSupport;
}

struct D3D12_FEATURE_DATA_VIDEO_DECODER_HEAP_SIZE
{
    D3D12_VIDEO_DECODER_HEAP_DESC VideoDecoderHeapDesc;
    ulong MemoryPoolL0Size;
    ulong MemoryPoolL1Size;
}

struct D3D12_FEATURE_DATA_VIDEO_PROCESSOR_SIZE
{
    uint NodeMask;
    const D3D12_VIDEO_PROCESS_OUTPUT_STREAM_DESC *pOutputStreamDesc;
    uint NumInputStreamDescs;
    const D3D12_VIDEO_PROCESS_INPUT_STREAM_DESC *pInputStreamDescs;
    ulong MemoryPoolL0Size;
    ulong MemoryPoolL1Size;
}

struct D3D12_QUERY_DATA_VIDEO_DECODE_STATISTICS
{
    ulong Status;
    ulong NumMacroblocksAffected;
    DXGI_RATIONAL FrameRate;
    uint BitRate;
}

struct D3D12_VIDEO_DECODE_SUB_SAMPLE_MAPPING_BLOCK
{
    uint ClearSize;
    uint EncryptedSize;
}

struct D3D12_VIDEO_DECODE_FRAME_ARGUMENT
{
    D3D12_VIDEO_DECODE_ARGUMENT_TYPE Type;
    uint Size;
    void *pData;
}

struct D3D12_VIDEO_DECODE_REFERENCE_FRAMES
{
    uint NumTexture2Ds;
    ID3D12Resource *ppTexture2Ds;
    uint *pSubresources;
    ID3D12VideoDecoderHeap *ppHeaps;
}

struct D3D12_VIDEO_DECODE_COMPRESSED_BITSTREAM
{
    ID3D12Resource pBuffer;
    ulong Offset;
    ulong Size;
}

struct D3D12_VIDEO_DECODE_CONVERSION_ARGUMENTS
{
    bool Enable;
    ID3D12Resource pReferenceTexture2D;
    uint ReferenceSubresource;
    DXGI_COLOR_SPACE_TYPE OutputColorSpace;
    DXGI_COLOR_SPACE_TYPE DecodeColorSpace;
}

struct D3D12_VIDEO_DECODE_INPUT_STREAM_ARGUMENTS
{
    uint NumFrameArguments;
    D3D12_VIDEO_DECODE_FRAME_ARGUMENT[10] FrameArguments;
    D3D12_VIDEO_DECODE_REFERENCE_FRAMES ReferenceFrames;
    D3D12_VIDEO_DECODE_COMPRESSED_BITSTREAM CompressedBitstream;
    ID3D12VideoDecoderHeap pHeap;
}

struct D3D12_VIDEO_DECODE_OUTPUT_STREAM_ARGUMENTS
{
    ID3D12Resource pOutputTexture2D;
    uint OutputSubresource;
    D3D12_VIDEO_DECODE_CONVERSION_ARGUMENTS ConversionArguments;
}

struct D3D12_VIDEO_PROCESS_FILTER_RANGE
{
    int Minimum;
    int Maximum;
    int Default;
    float Multiplier;
}

struct D3D12_FEATURE_DATA_VIDEO_PROCESS_SUPPORT
{
    uint NodeIndex;
    D3D12_VIDEO_SAMPLE InputSample;
    D3D12_VIDEO_FIELD_TYPE InputFieldType;
    D3D12_VIDEO_FRAME_STEREO_FORMAT InputStereoFormat;
    DXGI_RATIONAL InputFrameRate;
    D3D12_VIDEO_FORMAT OutputFormat;
    D3D12_VIDEO_FRAME_STEREO_FORMAT OutputStereoFormat;
    DXGI_RATIONAL OutputFrameRate;
    D3D12_VIDEO_PROCESS_SUPPORT_FLAGS SupportFlags;
    D3D12_VIDEO_SCALE_SUPPORT ScaleSupport;
    D3D12_VIDEO_PROCESS_FEATURE_FLAGS FeatureSupport;
    D3D12_VIDEO_PROCESS_DEINTERLACE_FLAGS DeinterlaceSupport;
    D3D12_VIDEO_PROCESS_AUTO_PROCESSING_FLAGS AutoProcessingSupport;
    D3D12_VIDEO_PROCESS_FILTER_FLAGS FilterSupport;
    D3D12_VIDEO_PROCESS_FILTER_RANGE[32] FilterRangeSupport;
}

struct D3D12_FEATURE_DATA_VIDEO_PROCESS_MAX_INPUT_STREAMS
{
    uint NodeIndex;
    uint MaxInputStreams;
}

struct D3D12_FEATURE_DATA_VIDEO_PROCESS_REFERENCE_INFO
{
    uint NodeIndex;
    D3D12_VIDEO_PROCESS_DEINTERLACE_FLAGS DeinterlaceMode;
    D3D12_VIDEO_PROCESS_FILTER_FLAGS Filters;
    D3D12_VIDEO_PROCESS_FEATURE_FLAGS FeatureSupport;
    DXGI_RATIONAL InputFrameRate;
    DXGI_RATIONAL OutputFrameRate;
    bool EnableAutoProcessing;
    uint PastFrames;
    uint FutureFrames;
}

struct D3D12_VIDEO_PROCESS_REFERENCE_SET
{
    uint NumPastFrames;
    ID3D12Resource *ppPastFrames;
    uint *pPastSubresources;
    uint NumFutureFrames;
    ID3D12Resource *ppFutureFrames;
    uint *pFutureSubresources;
}

struct D3D12_VIDEO_PROCESS_TRANSFORM
{
    D3D12_RECT SourceRectangle;
    D3D12_RECT DestinationRectangle;
    D3D12_VIDEO_PROCESS_ORIENTATION Orientation;
}

struct D3D12_VIDEO_PROCESS_INPUT_STREAM_RATE
{
    uint OutputIndex;
    uint InputFrameOrField;
}

struct D3D12_VIDEO_PROCESS_INPUT_STREAM
{
    ID3D12Resource pTexture2D;
    uint Subresource;
    D3D12_VIDEO_PROCESS_REFERENCE_SET ReferenceSet;
}

struct D3D12_VIDEO_PROCESS_INPUT_STREAM_ARGUMENTS
{
    D3D12_VIDEO_PROCESS_INPUT_STREAM[2] InputStream;
    D3D12_VIDEO_PROCESS_TRANSFORM Transform;
    D3D12_VIDEO_PROCESS_INPUT_STREAM_FLAGS Flags;
    D3D12_VIDEO_PROCESS_INPUT_STREAM_RATE RateInfo;
    int[32] FilterLevels;
    D3D12_VIDEO_PROCESS_ALPHA_BLENDING AlphaBlending;
}

struct D3D12_VIDEO_PROCESS_OUTPUT_STREAM
{
    ID3D12Resource pTexture2D;
    uint Subresource;
}

struct D3D12_VIDEO_PROCESS_OUTPUT_STREAM_ARGUMENTS
{
    D3D12_VIDEO_PROCESS_OUTPUT_STREAM[2] OutputStream;
    D3D12_RECT TargetRectangle;
}

///
/// Interfaces
///

mixin(uuid!(ID3D12VideoDecoderHeap, "0946B7C9-EBF6-4047-BB73-8683E27DBB1F"));
public interface ID3D12VideoDecoderHeap : ID3D12Pageable
{
extern(Windows):
    D3D12_VIDEO_DECODER_HEAP_DESC GetDesc();
}

mixin(uuid!(ID3D12VideoDevice, "1F052807-0B46-4ACC-8A89-364F793718A4"));
public interface ID3D12VideoDevice : IUnknown
{
extern(Windows):
    HRESULT CheckFeatureSupport(D3D12_FEATURE_VIDEO FeatureVideo, void *pFeatureSupportData, uint FeatureSupportDataSize);
    HRESULT CreateVideoDecoder(const D3D12_VIDEO_DECODER_DESC *pDesc, REFIID riid, void **ppVideoDecoder);
    HRESULT CreateVideoDecoderHeap(const D3D12_VIDEO_DECODER_HEAP_DESC *pVideoDecoderHeapDesc, REFIID riid, void **ppVideoDecoderHeap);
    HRESULT CreateVideoProcessor(uint NodeMask, const D3D12_VIDEO_PROCESS_OUTPUT_STREAM_DESC *pOutputStreamDesc, uint NumInputStreamDescs, const D3D12_VIDEO_PROCESS_INPUT_STREAM_DESC *pInputStreamDescs, REFIID riid, void **ppVideoProcessor);
}

mixin(uuid!(ID3D12VideoDecoder, "C59B6BDC-7720-4074-A136-17A156037470"));
public interface ID3D12VideoDecoder : ID3D12Pageable
{
extern(Windows):
    D3D12_VIDEO_DECODER_DESC GetDesc();
}

mixin(uuid!(ID3D12VideoProcessor, "304FDB32-BEDE-410A-8545-943AC6A46138"));
public interface ID3D12VideoProcessor : ID3D12Pageable
{
extern(Windows):
    uint GetNodeMask();
    uint GetNumInputStreamDescs();
    HRESULT GetInputStreamDescs(uint NumInputStreamDescs, D3D12_VIDEO_PROCESS_INPUT_STREAM_DESC *pInputStreamDescs);
    D3D12_VIDEO_PROCESS_OUTPUT_STREAM_DESC GetOutputStreamDesc();
}

mixin(uuid!(ID3D12VideoDecodeCommandList, "3B60536E-AD29-4E64-A269-F853837E5E53"));
public interface ID3D12VideoDecodeCommandList : ID3D12CommandList
{
extern(Windows):
    HRESULT Close();
    HRESULT Reset(ID3D12CommandAllocator pAllocator);
    void ClearState();
    void ResourceBarrier( uint NumBarriers, const D3D12_RESOURCE_BARRIER *pBarriers);
    void DiscardResource(ID3D12Resource pResource, const D3D12_DISCARD_REGION *pRegion);
    void BeginQuery(ID3D12QueryHeap pQueryHeap, D3D12_QUERY_TYPE Type, uint Index);
    void EndQuery(ID3D12QueryHeap pQueryHeap, D3D12_QUERY_TYPE Type, uint Index);
    void ResolveQueryData(ID3D12QueryHeap pQueryHeap, D3D12_QUERY_TYPE Type, uint StartIndex, uint NumQueries, ID3D12Resource pDestinationBuffer, ulong AlignedDestinationBufferOffset);
    void SetPredication(ID3D12Resource pBuffer, ulong AlignedBufferOffset, D3D12_PREDICATION_OP Operation);
    void SetMarker(uint Metadata, const void *pData, uint Size);
    void BeginEvent(uint Metadata, const void *pData, uint Size);
    void EndEvent();
    void DecodeFrame(ID3D12VideoDecoder pDecoder, const D3D12_VIDEO_DECODE_OUTPUT_STREAM_ARGUMENTS *pOutputArguments, const D3D12_VIDEO_DECODE_INPUT_STREAM_ARGUMENTS *pInputArguments);
    void WriteBufferImmediate(uint Count, const D3D12_WRITEBUFFERIMMEDIATE_PARAMETER *pParams, const D3D12_WRITEBUFFERIMMEDIATE_MODE *pModes);
}

mixin(uuid!(ID3D12VideoProcessCommandList, "AEB2543A-167F-4682-ACC8-D159ED4A6209"));
public interface ID3D12VideoProcessCommandList : ID3D12CommandList
{
extern(Windows):
    HRESULT Close();
    HRESULT Reset(ID3D12CommandAllocator pAllocator);
    void ClearState();
    void ResourceBarrier(uint NumBarriers, const D3D12_RESOURCE_BARRIER *pBarriers);
    void DiscardResource(ID3D12Resource pResource, const D3D12_DISCARD_REGION *pRegion);
    void BeginQuery(ID3D12QueryHeap pQueryHeap, D3D12_QUERY_TYPE Type, uint Index);
    void EndQuery(ID3D12QueryHeap pQueryHeap, D3D12_QUERY_TYPE Type, uint Index);
    void ResolveQueryData(ID3D12QueryHeap pQueryHeap, D3D12_QUERY_TYPE Type, uint StartIndex, uint NumQueries, ID3D12Resource pDestinationBuffer, ulong AlignedDestinationBufferOffset);
    void SetPredication(ID3D12Resource pBuffer, ulong AlignedBufferOffset, D3D12_PREDICATION_OP Operation);
    void SetMarker(uint Metadata, const void *pData, uint Size);
    void BeginEvent(uint Metadata, const void *pData, uint Size);
    void EndEvent();
    void ProcessFrames(ID3D12VideoProcessor pVideoProcessor, const D3D12_VIDEO_PROCESS_OUTPUT_STREAM_ARGUMENTS *pOutputArguments, uint NumInputStreams, const D3D12_VIDEO_PROCESS_INPUT_STREAM_ARGUMENTS *pInputArguments);
    void WriteBufferImmediate(uint Count, const D3D12_WRITEBUFFERIMMEDIATE_PARAMETER *pParams, const D3D12_WRITEBUFFERIMMEDIATE_MODE *pModes);
}
