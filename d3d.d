module aurora.dx11.d3d;

import std.bitmanip;
import aurora.dx11.com;
import aurora.dx11.config;

import config;

public struct D3DCOLORVALUE {
	union {
		FLOAT r;
		FLOAT dvR;
	};
	union {
		FLOAT g;
		FLOAT dvG;
	};
	union {
		FLOAT b;
		FLOAT dvB;
	};
	union {
		FLOAT a;
		FLOAT dvA;
	};
}