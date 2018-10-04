Aurora DirectX Interface
========================

This is the interface for DirectX used by the Aurora Graphics Library. These interfaces where derived from the Windows SDK version 10.0.17763.0 (Build 1809 - Redstone 5).

The following components of DirectX are supported:

### DirectX 12.1 
* Shaders
* Shader Tracing
* Video
* SDK Layers (Debugging)

### DirectX 11.4
* Shaders
* Shader Tracing
* Video
* SDK Layers (Debugging)

### Direct2D 1.3
* Effects 1.2
* Effect Authoring 1.1
* SVG

### DirectWrite 1.3

### DXGI 1.6

### WIC

Notes
-----
This port is a combination of mechanical and hand conversion. There may be inconsistent or incorrect types in the interfaces.

Most macros are not be supported. 

Pull requests are welcome to correct any errors discovered.