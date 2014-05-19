module aurora.directx.d3d;

import std.bitmanip;
import aurora.directx.com;
import aurora.directx.config;

public enum D3D_FEATURE_LEVEL : int { 
	D3D_FEATURE_LEVEL_9_1   = 0x9100,
	D3D_FEATURE_LEVEL_9_2   = 0x9200,
	D3D_FEATURE_LEVEL_9_3   = 0x9300,
	D3D_FEATURE_LEVEL_10_0  = 0xa000,
	D3D_FEATURE_LEVEL_10_1  = 0xa100,
	D3D_FEATURE_LEVEL_11_0  = 0xb000,
	D3D_FEATURE_LEVEL_11_1  = 0xb100
}

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