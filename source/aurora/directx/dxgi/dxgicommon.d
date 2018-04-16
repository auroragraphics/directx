module aurora.directx.dxgi.dxgicommon;

public:

struct DXGI_RATIONAL
{
    uint Numerator;
    uint Denominator;
}

enum int DXGI_STANDARD_MULTISAMPLE_QUALITY_PATTERN = 0xffffffff;
enum int DXGI_CENTER_MULTISAMPLE_QUALITY_PATTERN = 0xfffffffe;

struct DXGI_SAMPLE_DESC
{
    uint Count;
    uint Quality;
}

enum DXGI_COLOR_SPACE_TYPE
{
    RGB_FULL_G22_NONE_P709             = 0,
    RGB_FULL_G10_NONE_P709             = 1,
    RGB_STUDIO_G22_NONE_P709           = 2,
    RGB_STUDIO_G22_NONE_P2020          = 3,
    RESERVED                           = 4,
    YCBCR_FULL_G22_NONE_P709_X601      = 5,
    YCBCR_STUDIO_G22_LEFT_P601         = 6,
    YCBCR_FULL_G22_LEFT_P601           = 7,
    YCBCR_STUDIO_G22_LEFT_P709         = 8,
    YCBCR_FULL_G22_LEFT_P709           = 9,
    YCBCR_STUDIO_G22_LEFT_P2020        = 10,
    YCBCR_FULL_G22_LEFT_P2020          = 11,
    RGB_FULL_G2084_NONE_P2020          = 12,
    YCBCR_STUDIO_G2084_LEFT_P2020      = 13,
    RGB_STUDIO_G2084_NONE_P2020        = 14,
    YCBCR_STUDIO_G22_TOPLEFT_P2020     = 15,
    YCBCR_STUDIO_G2084_TOPLEFT_P2020   = 16,
    RGB_FULL_G22_NONE_P2020            = 17,
    YCBCR_STUDIO_GHLG_TOPLEFT_P2020    = 18,
    YCBCR_FULL_GHLG_TOPLEFT_P2020      = 19,
    RGB_STUDIO_G24_NONE_P709           = 20,
    RGB_STUDIO_G24_NONE_P2020          = 21,
    YCBCR_STUDIO_G24_LEFT_P709         = 22,
    YCBCR_STUDIO_G24_LEFT_P2020        = 23,
    YCBCR_STUDIO_G24_TOPLEFT_P2020     = 24,
    CUSTOM                             = 0xFFFFFFFF
}