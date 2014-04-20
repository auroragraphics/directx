module aurora.dxi.d3d;

import com;
import std.c.windows.com;
import std.c.windows.windows;
import std.bitmanip;

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