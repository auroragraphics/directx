module aurora.directx.d2d1.d2d1effectauthor_1;

version(Windows):

public import aurora.directx.com;
public import aurora.directx.d2d1.d2d1_3;
public import aurora.directx.d2d1.d2d1effectauthor_0;

mixin(uuid!(ID2D1EffectContext1, "84ab595a-fc81-4546-bacd-e8ef4d8abe7a"));
public interface ID2D1EffectContext1 : ID2D1EffectContext
{
extern(Windows):
    HRESULT CreateLookupTable3D(D2D1_BUFFER_PRECISION precision, const ubyte *extents, const ubyte *data, uint dataCount, const uint *strides, ID2D1LookupTable3D *lookupTable);
}

mixin(uuid!(ID2D1EffectContext2, "577ad2a0-9fc7-4dda-8b18-dab810140052"));
public interface ID2D1EffectContext2 : ID2D1EffectContext1
{
extern(Windows):
    HRESULT CreateColorContextFromDxgiColorSpace(DXGI_COLOR_SPACE_TYPE colorSpace, ID2D1ColorContext1 *colorContext);
    HRESULT CreateColorContextFromSimpleColorProfile(const D2D1_SIMPLE_COLOR_PROFILE *simpleProfile, ID2D1ColorContext1 *colorContext);
}
