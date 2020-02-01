module aurora.directx.d2d1.d2d1effects_1;

version(Windows):

public import aurora.directx.d2d1.d2d1effects_0;

public:

const IID CLSID_D2D1YCbCr = {0x99503cc1, 0x66c7, 0x45c9, [0xa8, 0x75, 0x8a, 0xd8, 0xa7, 0x91, 0x44, 0x01]};

enum D2D1_YCBCR_PROP
{
    CHROMA_SUBSAMPLING = 0,
    TRANSFORM_MATRIX = 1,
    INTERPOLATION_MODE = 2,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_YCBCR_CHROMA_SUBSAMPLING
{
    SUBSAMPLING_AUTO = 0,
    SUBSAMPLING_420 = 1,
    SUBSAMPLING_422 = 2,
    SUBSAMPLING_444 = 3,
    SUBSAMPLING_440 = 4,
    SUBSAMPLING_FORCE_DWORD = 0xffffffff
}

enum D2D1_YCBCR_INTERPOLATION_MODE
{
    NEAREST_NEIGHBOR = 0,
    LINEAR = 1,
    CUBIC = 2,
    MULTI_SAMPLE_LINEAR = 3,
    ANISOTROPIC = 4,
    HIGH_QUALITY_CUBIC = 5,
    FORCE_DWORD = 0xffffffff
}
