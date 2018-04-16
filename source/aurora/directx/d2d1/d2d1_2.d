module aurora.directx.d2d1.d2d1_2;

public import aurora.directx.d2d1.d2d1_1;

//
//	Enumerations
//

public enum D2D1_RENDERING_PRIORITY : int { 
	NORMAL  = 0,
	LOW     = 1
}

//
//	Interfaces
//

mixin(uuid!(ID2D1CommandSink1, "9eb767fd-4269-4467-b8c2-eb30cb305743"));
public interface ID2D1CommandSink1 : ID2D1CommandSink
{
extern(Windows):
	HRESULT SetPrimitiveBlend1(D2D1_PRIMITIVE_BLEND primitiveBlend);
}

mixin(uuid!(ID2D1Device1, "d21768e1-23a4-4823-a14b-7c3eba85d658"));
public interface ID2D1Device1 : ID2D1Device
{
extern(Windows):
	D2D1_RENDERING_PRIORITY GetRenderingPriority();
	HRESULT SetRenderingPriority(D2D1_RENDERING_PRIORITY renderingPriority);
}

mixin(uuid!(ID2D1DeviceContext1, "d37f57e4-6908-459f-a199-e72f24f79987"));
public interface ID2D1DeviceContext1 : ID2D1DeviceContext
{
extern(Windows):
	HRESULT CreateFilledGeometryRealization(ID2D1Geometry geometry, float flatteningTolerance, ID2D1GeometryRealization *geometryRealization);
	HRESULT CreateStrokedGeometryRealization(ID2D1Geometry geometry, float flatteningTolerance, float strokeWidth, ID2D1StrokeStyle strokeStyle, ID2D1GeometryRealization *geometryRealization);
	HRESULT DrawGeometryRealization(ID2D1GeometryRealization geometryRealization, ID2D1Brush brush);
}

mixin(uuid!(ID2D1Factory2, "94f81a73-9212-4376-9c58-b16a3a0d3992"));
public interface ID2D1Factory2 : ID2D1Factory1
{
extern(Windows):
	HRESULT CreateDevice(IDXGIDevice *dxgiDevice, ID2D1Device1 **d2dDevice1);
}

mixin(uuid!(ID2D1GeometryRealization, "a16907d7-bc02-4801-99e8-8cf7f485f774"));
public interface ID2D1GeometryRealization : ID2D1Resource
{
extern(Windows):
}
