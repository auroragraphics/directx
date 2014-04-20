module aurora.dxi.d2d1;

import com;
import std.c.windows.com;
import std.c.windows.windows;

static if(DX11_0 || DX11_1 || DX11_2)
{
}
static if(DX11_1 || DX11_2)
{
}
static if(DX11_2)
{
}

public enum D2D1_FIGURE_BEGIN : int { 
	FILLED  = 0,
	HOLLOW  = 1
};

public enum D2D1_FIGURE_END : int { 
	OPEN    = 0,
	CLOSED  = 1
}

public enum D2D1_FILL_MODE : int { 
	ALTERNATE  = 0,
	WINDING    = 1
}

public enum D2D1_PATH_SEGMENT : int { 
	NONE                   = 0x00000000,
	FORCE_UNSTROKED        = 0x00000001,
	FORCE_ROUND_LINE_JOIN  = 0x00000002
}

public struct D2D_POINT_2F {
	float x;
	float y;
}
alias D2D_POINT_2F D2D1_POINT_2F;

public struct D2D1_BEZIER_SEGMENT {
	D2D1_POINT_2F point1;
	D2D1_POINT_2F point2;
	D2D1_POINT_2F point3;
};

mixin(uuid!(ID2D1SimplifiedGeometrySink, "2cd9069e-12e2-11dc-9fed-001143a055f9"));
public interface ID2D1SimplifiedGeometrySink : IUnknown
{
extern(Windows):
	void AddBeziers(const D2D1_BEZIER_SEGMENT* Beziers, uint Count);
	void AddLines(const D2D_POINT_2F* Points, uint Count);
	void BeginFigure(D2D1_POINT_2F StartPoint, D2D1_FIGURE_BEGIN FigureBegin);
	HRESULT Close();
	void EndFigure(D2D1_FIGURE_END FigureEnd);
	void SetFillMode(D2D1_FILL_MODE FillMode);
	void SetSegmentFlags(D2D1_PATH_SEGMENT VertexFlags);
}