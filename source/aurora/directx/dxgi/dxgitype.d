module aurora.directx.dxgi.dxgitype;

public import aurora.directx.dxgi.dxgiformat;
public import aurora.directx.dxgi.dxgicommon;

public:

enum int DXGI_CPU_ACCESS_NONE = 0;
enum int DXGI_CPU_ACCESS_DYNAMIC = 1;
enum int DXGI_CPU_ACCESS_READ_WRITE = 2;
enum int DXGI_CPU_ACCESS_SCRATCH = 3;
enum int DXGI_CPU_ACCESS_FIELD = 15;

struct DXGI_RGB
{
    float Red;
    float Green;
    float Blue;
}

struct D3DCOLORVALUE {
    float r;
    float g;
    float b;
    float a;
}

alias D3DCOLORVALUE DXGI_RGBA;

struct DXGI_GAMMA_CONTROL
{
    DXGI_RGB       Scale;
    DXGI_RGB       Offset;
    DXGI_RGB[1025] GammaCurve;
}

struct DXGI_GAMMA_CONTROL_CAPABILITIES
{
    bool        ScaleAndOffsetSupported;
    float       MaxConvertedValue;
    float       MinConvertedValue;
    uint        NumGammaControlPoints;
    float[1025] ControlPointPositions;
}

enum DXGI_MODE_SCANLINE_ORDER
{
    UNSPECIFIED        = 0,
    PROGRESSIVE        = 1,
    UPPER_FIELD_FIRST  = 2,
    LOWER_FIELD_FIRST  = 3
}

enum DXGI_MODE_SCALING
{
    UNSPECIFIED   = 0,
    CENTERED      = 1,
    STRETCHED     = 2
}

enum DXGI_MODE_ROTATION
{
    UNSPECIFIED  = 0,
    IDENTITY     = 1,
    ROTATE90     = 2,
    ROTATE180    = 3,
    ROTATE270    = 4
}

struct DXGI_MODE_DESC
{
    uint Width;
    uint Height;
    DXGI_RATIONAL RefreshRate;
    DXGI_FORMAT Format;
    DXGI_MODE_SCANLINE_ORDER ScanlineOrdering;
    DXGI_MODE_SCALING Scaling;
}

struct DXGI_JPEG_DC_HUFFMAN_TABLE
{
    ubyte[12] CodeCounts;
    ubyte[12] CodeValues;
}

struct DXGI_JPEG_AC_HUFFMAN_TABLE
{
    ubyte[16]  CodeCounts;
    ubyte[162] CodeValues;
}

struct DXGI_JPEG_QUANTIZATION_TABLE
{
    ubyte[64] Elements;
}
