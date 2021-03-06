module aurora.directx.d2d1.d2d1effects_0;

version(Windows):

public import aurora.directx.com;

public:

const IID CLSID_D2D12DAffineTransform = {0x6AA97485, 0x6354, 0x4cfc, [0x90, 0x8C, 0xE4, 0xA7, 0x4F, 0x62, 0xC9, 0x6C]};
const IID CLSID_D2D13DPerspectiveTransform = {0xC2844D0B, 0x3D86, 0x46e7, [0x85, 0xBA, 0x52, 0x6C, 0x92, 0x40, 0xF3, 0xFB]};
const IID CLSID_D2D13DTransform = {0xe8467b04, 0xec61, 0x4b8a, [0xb5, 0xde, 0xd4, 0xd7, 0x3d, 0xeb, 0xea, 0x5a]};
const IID CLSID_D2D1ArithmeticComposite = {0xfc151437, 0x049a, 0x4784, [0xa2, 0x4a, 0xf1, 0xc4, 0xda, 0xf2, 0x09, 0x87]};
const IID CLSID_D2D1Atlas = {0x913e2be4, 0xfdcf, 0x4fe2, [0xa5, 0xf0, 0x24, 0x54, 0xf1, 0x4f, 0xf4, 0x08]};
const IID CLSID_D2D1BitmapSource = {0x5fb6c24d, 0xc6dd, 0x4231, [0x94, 0x4,  0x50, 0xf4, 0xd5, 0xc3, 0x25, 0x2d]};
const IID CLSID_D2D1Blend = {0x81c5b77b, 0x13f8, 0x4cdd, [0xad, 0x20, 0xc8, 0x90, 0x54, 0x7a, 0xc6, 0x5d]};
const IID CLSID_D2D1Border = {0x2A2D49C0, 0x4ACF, 0x43c7, [0x8C, 0x6A, 0x7C, 0x4A, 0x27, 0x87, 0x4D, 0x27]};
const IID CLSID_D2D1Brightness = {0x8cea8d1e, 0x77b0, 0x4986, [0xb3, 0xb9, 0x2f, 0x0c, 0x0e, 0xae, 0x78, 0x87]};
const IID CLSID_D2D1ColorManagement = {0x1A28524C, 0xFDD6, 0x4AA4, [0xAE, 0x8F, 0x83, 0x7E, 0xB8, 0x26, 0x7B, 0x37]};
const IID CLSID_D2D1ColorMatrix = {0x921F03D6, 0x641C, 0x47DF, [0x85, 0x2D, 0xB4, 0xBB, 0x61, 0x53, 0xAE, 0x11]};
const IID CLSID_D2D1Composite = {0x48fc9f51, 0xf6ac, 0x48f1, [0x8b, 0x58, 0x3b, 0x28, 0xac, 0x46, 0xf7, 0x6d]};
const IID CLSID_D2D1ConvolveMatrix = {0x407f8c08, 0x5533, 0x4331, [0xa3, 0x41, 0x23, 0xcc, 0x38, 0x77, 0x84, 0x3e]};
const IID CLSID_D2D1Crop = {0xE23F7110, 0x0E9A, 0x4324, [0xAF, 0x47, 0x6A, 0x2C, 0x0C, 0x46, 0xF3, 0x5B]};
const IID CLSID_D2D1DirectionalBlur = {0x174319a6, 0x58e9, 0x49b2, [0xbb, 0x63, 0xca, 0xf2, 0xc8, 0x11, 0xa3, 0xdb]};
const IID CLSID_D2D1DiscreteTransfer = {0x90866fcd, 0x488e, 0x454b, [0xaf, 0x06, 0xe5, 0x04, 0x1b, 0x66, 0xc3, 0x6c]};
const IID CLSID_D2D1DisplacementMap = {0xedc48364, 0x417,  0x4111, [0x94, 0x50, 0x43, 0x84, 0x5f, 0xa9, 0xf8, 0x90]};
const IID CLSID_D2D1DistantDiffuse = {0x3e7efd62, 0xa32d, 0x46d4, [0xa8, 0x3c, 0x52, 0x78, 0x88, 0x9a, 0xc9, 0x54]};
const IID CLSID_D2D1DistantSpecular = {0x428c1ee5, 0x77b8, 0x4450, [0x8a, 0xb5, 0x72, 0x21, 0x9c, 0x21, 0xab, 0xda]};
const IID CLSID_D2D1DpiCompensation = {0x6c26c5c7, 0x34e0, 0x46fc, [0x9c, 0xfd, 0xe5, 0x82, 0x37, 0x6,  0xe2, 0x28]};
const IID CLSID_D2D1Flood = {0x61c23c20, 0xae69, 0x4d8e, [0x94, 0xcf, 0x50, 0x07, 0x8d, 0xf6, 0x38, 0xf2]};
const IID CLSID_D2D1GammaTransfer = {0x409444c4, 0xc419, 0x41a0, [0xb0, 0xc1, 0x8c, 0xd0, 0xc0, 0xa1, 0x8e, 0x42]};
const IID CLSID_D2D1GaussianBlur = {0x1feb6d69, 0x2fe6, 0x4ac9, [0x8c, 0x58, 0x1d, 0x7f, 0x93, 0xe7, 0xa6, 0xa5]};
const IID CLSID_D2D1Scale = {0x9daf9369, 0x3846, 0x4d0e, [0xa4, 0x4e, 0xc,  0x60, 0x79, 0x34, 0xa5, 0xd7]};
const IID CLSID_D2D1Histogram = {0x881db7d0, 0xf7ee, 0x4d4d, [0xa6, 0xd2, 0x46, 0x97, 0xac, 0xc6, 0x6e, 0xe8]};
const IID CLSID_D2D1HueRotation = {0x0f4458ec, 0x4b32, 0x491b, [0x9e, 0x85, 0xbd, 0x73, 0xf4, 0x4d, 0x3e, 0xb6]};
const IID CLSID_D2D1LinearTransfer = {0xad47c8fd, 0x63ef, 0x4acc, [0x9b, 0x51, 0x67, 0x97, 0x9c, 0x03, 0x6c, 0x06]};
const IID CLSID_D2D1LuminanceToAlpha = {0x41251ab7, 0x0beb, 0x46f8, [0x9d, 0xa7, 0x59, 0xe9, 0x3f, 0xcc, 0xe5, 0xde]};
const IID CLSID_D2D1Morphology = {0xeae6c40d, 0x626a, 0x4c2d, [0xbf, 0xcb, 0x39, 0x10, 0x01, 0xab, 0xe2, 0x02]};
const IID CLSID_D2D1OpacityMetadata = {0x6c53006a, 0x4450, 0x4199, [0xaa, 0x5b, 0xad, 0x16, 0x56, 0xfe, 0xce, 0x5e]};
const IID CLSID_D2D1PointDiffuse = {0xb9e303c3, 0xc08c, 0x4f91, [0x8b, 0x7b, 0x38, 0x65, 0x6b, 0xc4, 0x8c, 0x20]};
const IID CLSID_D2D1PointSpecular = {0x09c3ca26, 0x3ae2, 0x4f09, [0x9e, 0xbc, 0xed, 0x38, 0x65, 0xd5, 0x3f, 0x22]};
const IID CLSID_D2D1Premultiply = {0x06eab419, 0xdeed, 0x4018, [0x80, 0xd2, 0x3e, 0x1d, 0x47, 0x1a, 0xde, 0xb2]};
const IID CLSID_D2D1Saturation = {0x5cb2d9cf, 0x327d, 0x459f, [0xa0, 0xce, 0x40, 0xc0, 0xb2, 0x08, 0x6b, 0xf7]};
const IID CLSID_D2D1Shadow = {0xC67EA361, 0x1863, 0x4e69, [0x89, 0xDB, 0x69, 0x5D, 0x3E, 0x9A, 0x5B, 0x6B]};
const IID CLSID_D2D1SpotDiffuse = {0x818a1105, 0x7932, 0x44f4, [0xaa, 0x86, 0x08, 0xae, 0x7b, 0x2f, 0x2c, 0x93]};
const IID CLSID_D2D1SpotSpecular = {0xedae421e, 0x7654, 0x4a37, [0x9d, 0xb8, 0x71, 0xac, 0xc1, 0xbe, 0xb3, 0xc1]};
const IID CLSID_D2D1TableTransfer = {0x5bf818c3, 0x5e43, 0x48cb, [0xb6, 0x31, 0x86, 0x83, 0x96, 0xd6, 0xa1, 0xd4]};
const IID CLSID_D2D1Tile = {0xB0784138, 0x3B76, 0x4bc5, [0xB1, 0x3B, 0x0F, 0xA2, 0xAD, 0x02, 0x65, 0x9F]};
const IID CLSID_D2D1Turbulence = {0xCF2BB6AE, 0x889A, 0x4ad7, [0xBA, 0x29, 0xA2, 0xFD, 0x73, 0x2C, 0x9F, 0xC9]};
const IID CLSID_D2D1UnPremultiply = {0xfb9ac489, 0xad8d, 0x41ed, [0x99, 0x99, 0xbb, 0x63, 0x47, 0xd1, 0x10, 0xf7]};

enum D2D1_BORDER_MODE
{
    SOFT = 0,
    HARD = 1,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_CHANNEL_SELECTOR
{
    R = 0,
    G = 1,
    B = 2,
    A = 3,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_BITMAPSOURCE_ORIENTATION
{
    DEFAULT = 1,
    FLIP_HORIZONTAL = 2,
    ROTATE_CLOCKWISE180 = 3,
    ROTATE_CLOCKWISE180_FLIP_HORIZONTAL = 4,
    ROTATE_CLOCKWISE270_FLIP_HORIZONTAL = 5,
    ROTATE_CLOCKWISE90 = 6,
    ROTATE_CLOCKWISE90_FLIP_HORIZONTAL = 7,
    ROTATE_CLOCKWISE270 = 8,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_GAUSSIANBLUR_PROP
{
    STANDARD_DEVIATION = 0,
    OPTIMIZATION = 1,
    BORDER_MODE = 2,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_GAUSSIANBLUR_OPTIMIZATION
{
    SPEED = 0,
    BALANCED = 1,
    QUALITY = 2,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_DIRECTIONALBLUR_PROP
{
    STANDARD_DEVIATION = 0,
    ANGLE = 1,
    OPTIMIZATION = 2,
    BORDER_MODE = 3,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_DIRECTIONALBLUR_OPTIMIZATION
{
    SPEED = 0,
    BALANCED = 1,
    QUALITY = 2,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_SHADOW_PROP
{
    BLUR_STANDARD_DEVIATION = 0,
    COLOR = 1,
    OPTIMIZATION = 2,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_SHADOW_OPTIMIZATION
{
    SPEED = 0,
    BALANCED = 1,
    QUALITY = 2,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_BLEND_PROP
{
    MODE = 0,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_BLEND_MODE
{
    MULTIPLY = 0,
    SCREEN = 1,
    DARKEN = 2,
    LIGHTEN = 3,
    DISSOLVE = 4,
    COLOR_BURN = 5,
    LINEAR_BURN = 6,
    DARKER_COLOR = 7,
    LIGHTER_COLOR = 8,
    COLOR_DODGE = 9,
    LINEAR_DODGE = 10,
    OVERLAY = 11,
    SOFT_LIGHT = 12,
    HARD_LIGHT = 13,
    VIVID_LIGHT = 14,
    LINEAR_LIGHT = 15,
    PIN_LIGHT = 16,
    HARD_MIX = 17,
    DIFFERENCE = 18,
    EXCLUSION = 19,
    HUE = 20,
    SATURATION = 21,
    COLOR = 22,
    LUMINOSITY = 23,
    SUBTRACT = 24,
    DIVISION = 25,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_SATURATION_PROP
{
    SATURATION = 0,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_HUEROTATION_PROP
{
    ANGLE = 0,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_COLORMATRIX_PROP
{
    COLOR_MATRIX = 0,
    ALPHA_MODE = 1,
    CLAMP_OUTPUT = 2,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_COLORMATRIX_ALPHA_MODE
{
    PREMULTIPLIED = 1,
    STRAIGHT = 2,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_BITMAPSOURCE_PROP
{
    WIC_BITMAP_SOURCE = 0,
    SCALE = 1,
    INTERPOLATION_MODE = 2,
    ENABLE_DPI_CORRECTION = 3,
    ALPHA_MODE = 4,
    ORIENTATION = 5,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_BITMAPSOURCE_INTERPOLATION_MODE
{
    NEAREST_NEIGHBOR = 0,
    LINEAR = 1,
    CUBIC = 2,
    FANT = 6,
    MIPMAP_LINEAR = 7,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_BITMAPSOURCE_ALPHA_MODE
{
    PREMULTIPLIED = 1,
    STRAIGHT = 2,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_COMPOSITE_PROP
{
    MODE = 0,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_3DTRANSFORM_PROP
{
    INTERPOLATION_MODE = 0,
    BORDER_MODE = 1,
    TRANSFORM_MATRIX = 2,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_3DTRANSFORM_INTERPOLATION_MODE
{
    NEAREST_NEIGHBOR = 0,
    LINEAR = 1,
    CUBIC = 2,
    MULTI_SAMPLE_LINEAR = 3,
    ANISOTROPIC = 4,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_3DPERSPECTIVETRANSFORM_PROP
{
    INTERPOLATION_MODE = 0,
    BORDER_MODE = 1,
    DEPTH = 2,
    PERSPECTIVE_ORIGIN = 3,
    LOCAL_OFFSET = 4,
    GLOBAL_OFFSET = 5,
    ROTATION_ORIGIN = 6,
    ROTATION = 7,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_3DPERSPECTIVETRANSFORM_INTERPOLATION_MODE
{
    NEAREST_NEIGHBOR = 0,
    LINEAR = 1,
    CUBIC = 2,
    MULTI_SAMPLE_LINEAR = 3,
    ANISOTROPIC = 4,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_2DAFFINETRANSFORM_PROP
{
    INTERPOLATION_MODE = 0,
    BORDER_MODE = 1,
    TRANSFORM_MATRIX = 2,
    SHARPNESS = 3,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_2DAFFINETRANSFORM_INTERPOLATION_MODE
{
    NEAREST_NEIGHBOR = 0,
    LINEAR = 1,
    CUBIC = 2,
    MULTI_SAMPLE_LINEAR = 3,
    ANISOTROPIC = 4,
    HIGH_QUALITY_CUBIC = 5,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_DPICOMPENSATION_PROP
{
    INTERPOLATION_MODE = 0,
    BORDER_MODE = 1,
    INPUT_DPI = 2,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_DPICOMPENSATION_INTERPOLATION_MODE
{
    NEAREST_NEIGHBOR = 0,
    LINEAR = 1,
    CUBIC = 2,
    MULTI_SAMPLE_LINEAR = 3,
    ANISOTROPIC = 4,
    HIGH_QUALITY_CUBIC = 5,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_SCALE_PROP
{
    SCALE = 0,
    CENTER_POINT = 1,
    INTERPOLATION_MODE = 2,
    BORDER_MODE = 3,
    SHARPNESS = 4,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_SCALE_INTERPOLATION_MODE
{
    NEAREST_NEIGHBOR = 0,
    LINEAR = 1,
    CUBIC = 2,
    MULTI_SAMPLE_LINEAR = 3,
    ANISOTROPIC = 4,
    HIGH_QUALITY_CUBIC = 5,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_TURBULENCE_PROP
{
    OFFSET = 0,
    SIZE = 1,
    BASE_FREQUENCY = 2,
    NUM_OCTAVES = 3,
    SEED = 4,
    NOISE = 5,
    STITCHABLE = 6,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_TURBULENCE_NOISE
{
    FRACTAL_SUM = 0,
    TURBULENCE = 1,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_DISPLACEMENTMAP_PROP
{
    SCALE = 0,
    X_CHANNEL_SELECT = 1,
    Y_CHANNEL_SELECT = 2,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_COLORMANAGEMENT_PROP
{
    SOURCE_COLOR_CONTEXT = 0,
    SOURCE_RENDERING_INTENT = 1,
    DESTINATION_COLOR_CONTEXT = 2,
    DESTINATION_RENDERING_INTENT = 3,
    ALPHA_MODE = 4,
    QUALITY = 5,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_COLORMANAGEMENT_ALPHA_MODE
{
    PREMULTIPLIED = 1,
    STRAIGHT = 2,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_COLORMANAGEMENT_QUALITY
{
    PROOF = 0,
    NORMAL = 1,
    BEST = 2,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_COLORMANAGEMENT_RENDERING_INTENT
{
    PERCEPTUAL = 0,
    RELATIVE_COLORIMETRIC = 1,
    SATURATION = 2,
    ABSOLUTE_COLORIMETRIC = 3,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_HISTOGRAM_PROP
{
    NUM_BINS = 0,
    CHANNEL_SELECT = 1,
    HISTOGRAM_OUTPUT = 2,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_POINTSPECULAR_PROP
{
    LIGHT_POSITION = 0,
    SPECULAR_EXPONENT = 1,
    SPECULAR_CONSTANT = 2,
    SURFACE_SCALE = 3,
    COLOR = 4,
    KERNEL_UNIT_LENGTH = 5,
    SCALE_MODE = 6,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_POINTSPECULAR_SCALE_MODE
{
    NEAREST_NEIGHBOR = 0,
    LINEAR = 1,
    CUBIC = 2,
    MULTI_SAMPLE_LINEAR = 3,
    ANISOTROPIC = 4,
    HIGH_QUALITY_CUBIC = 5,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_SPOTSPECULAR_PROP
{
    LIGHT_POSITION = 0,
    POINTS_AT = 1,
    FOCUS = 2,
    LIMITING_CONE_ANGLE = 3,
    SPECULAR_EXPONENT = 4,
    SPECULAR_CONSTANT = 5,
    SURFACE_SCALE = 6,
    COLOR = 7,
    KERNEL_UNIT_LENGTH = 8,
    SCALE_MODE = 9,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_SPOTSPECULAR_SCALE_MODE
{
    NEAREST_NEIGHBOR = 0,
    LINEAR = 1,
    CUBIC = 2,
    MULTI_SAMPLE_LINEAR = 3,
    ANISOTROPIC = 4,
    HIGH_QUALITY_CUBIC = 5,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_DISTANTSPECULAR_PROP
{
    AZIMUTH = 0,
    ELEVATION = 1,
    SPECULAR_EXPONENT = 2,
    SPECULAR_CONSTANT = 3,
    SURFACE_SCALE = 4,
    COLOR = 5,
    KERNEL_UNIT_LENGTH = 6,
    SCALE_MODE = 7,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_DISTANTSPECULAR_SCALE_MODE
{
    NEAREST_NEIGHBOR = 0,
    LINEAR = 1,
    CUBIC = 2,
    MULTI_SAMPLE_LINEAR = 3,
    ANISOTROPIC = 4,
    HIGH_QUALITY_CUBIC = 5,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_POINTDIFFUSE_PROP
{
    LIGHT_POSITION = 0,
    DIFFUSE_CONSTANT = 1,
    SURFACE_SCALE = 2,
    COLOR = 3,
    KERNEL_UNIT_LENGTH = 4,
    SCALE_MODE = 5,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_POINTDIFFUSE_SCALE_MODE
{
    NEAREST_NEIGHBOR = 0,
    LINEAR = 1,
    CUBIC = 2,
    MULTI_SAMPLE_LINEAR = 3,
    ANISOTROPIC = 4,
    HIGH_QUALITY_CUBIC = 5,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_SPOTDIFFUSE_PROP
{
    LIGHT_POSITION = 0,
    POINTS_AT = 1,
    FOCUS = 2,
    LIMITING_CONE_ANGLE = 3,
    DIFFUSE_CONSTANT = 4,
    SURFACE_SCALE = 5,
    COLOR = 6,
    KERNEL_UNIT_LENGTH = 7,
    SCALE_MODE = 8,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_SPOTDIFFUSE_SCALE_MODE
{
    NEAREST_NEIGHBOR = 0,
    LINEAR = 1,
    CUBIC = 2,
    MULTI_SAMPLE_LINEAR = 3,
    ANISOTROPIC = 4,
    HIGH_QUALITY_CUBIC = 5,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_DISTANTDIFFUSE_PROP
{
    AZIMUTH = 0,
    ELEVATION = 1,
    DIFFUSE_CONSTANT = 2,
    SURFACE_SCALE = 3,
    COLOR = 4,
    KERNEL_UNIT_LENGTH = 5,
    SCALE_MODE = 6,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_DISTANTDIFFUSE_SCALE_MODE
{
    NEAREST_NEIGHBOR = 0,
    LINEAR = 1,
    CUBIC = 2,
    MULTI_SAMPLE_LINEAR = 3,
    ANISOTROPIC = 4,
    HIGH_QUALITY_CUBIC = 5,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_FLOOD_PROP
{
    COLOR = 0,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_LINEARTRANSFER_PROP
{
    RED_Y_INTERCEPT = 0,
    RED_SLOPE = 1,
    RED_DISABLE = 2,
    GREEN_Y_INTERCEPT = 3,
    GREEN_SLOPE = 4,
    GREEN_DISABLE = 5,
    BLUE_Y_INTERCEPT = 6,
    BLUE_SLOPE = 7,
    BLUE_DISABLE = 8,
    ALPHA_Y_INTERCEPT = 9,
    ALPHA_SLOPE = 10,
    ALPHA_DISABLE = 11,
    CLAMP_OUTPUT = 12,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_GAMMATRANSFER_PROP
{
    RED_AMPLITUDE = 0,
    RED_EXPONENT = 1,
    RED_OFFSET = 2,
    RED_DISABLE = 3,
    GREEN_AMPLITUDE = 4,
    GREEN_EXPONENT = 5,
    GREEN_OFFSET = 6,
    GREEN_DISABLE = 7,
    BLUE_AMPLITUDE = 8,
    BLUE_EXPONENT = 9,
    BLUE_OFFSET = 10,
    BLUE_DISABLE = 11,
    ALPHA_AMPLITUDE = 12,
    ALPHA_EXPONENT = 13,
    ALPHA_OFFSET = 14,
    ALPHA_DISABLE = 15,
    CLAMP_OUTPUT = 16,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_TABLETRANSFER_PROP
{
    RED_TABLE = 0,
    RED_DISABLE = 1,
    GREEN_TABLE = 2,
    GREEN_DISABLE = 3,
    BLUE_TABLE = 4,
    BLUE_DISABLE = 5,
    ALPHA_TABLE = 6,
    ALPHA_DISABLE = 7,
    CLAMP_OUTPUT = 8,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_DISCRETETRANSFER_PROP
{
    RED_TABLE = 0,
    RED_DISABLE = 1,
    GREEN_TABLE = 2,
    GREEN_DISABLE = 3,
    BLUE_TABLE = 4,
    BLUE_DISABLE = 5,
    ALPHA_TABLE = 6,
    ALPHA_DISABLE = 7,
    CLAMP_OUTPUT = 8,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_CONVOLVEMATRIX_PROP
{
    KERNEL_UNIT_LENGTH = 0,
    SCALE_MODE = 1,
    KERNEL_SIZE_X = 2,
    KERNEL_SIZE_Y = 3,
    KERNEL_MATRIX = 4,
    DIVISOR = 5,
    BIAS = 6,
    KERNEL_OFFSET = 7,
    PRESERVE_ALPHA = 8,
    BORDER_MODE = 9,
    CLAMP_OUTPUT = 10,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_CONVOLVEMATRIX_SCALE_MODE
{
    NEAREST_NEIGHBOR = 0,
    LINEAR = 1,
    CUBIC = 2,
    MULTI_SAMPLE_LINEAR = 3,
    ANISOTROPIC = 4,
    HIGH_QUALITY_CUBIC = 5,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_BRIGHTNESS_PROP
{
    WHITE_POINT = 0,
    BLACK_POINT = 1,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_ARITHMETICCOMPOSITE_PROP
{
    D2D1_ARITHMETICCOMPOSITE_PROP_COEFFICIENTS = 0,
    D2D1_ARITHMETICCOMPOSITE_PROP_CLAMP_OUTPUT = 1,
    D2D1_ARITHMETICCOMPOSITE_PROP_FORCE_DWORD = 0xffffffff
}

enum D2D1_CROP_PROP
{
    RECT = 0,
    BORDER_MODE = 1,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_BORDER_PROP
{
    EDGE_MODE_X = 0,
    EDGE_MODE_Y = 1,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_BORDER_EDGE_MODE
{
    CLAMP = 0,
    WRAP = 1,
    MIRROR = 2,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_MORPHOLOGY_PROP
{
    MODE = 0,
    WIDTH = 1,
    HEIGHT = 2,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_MORPHOLOGY_MODE
{
    ERODE = 0,
    DILATE = 1,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_TILE_PROP
{
    RECT = 0,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_ATLAS_PROP
{
    INPUT_RECT = 0,
    INPUT_PADDING_RECT = 1,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_OPACITYMETADATA_PROP
{
    INPUT_OPAQUE_RECT = 0,
    FORCE_DWORD = 0xffffffff
}
