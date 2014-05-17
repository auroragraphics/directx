module aurora.directx.d3d;

import std.bitmanip;
import aurora.directx.com;
import aurora.directx.config;

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