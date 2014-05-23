DEBUGOPTS64="-lib -m64 -debug -property -g -gs -gx -c -lib -version=DX11_1 -I../.. -of../lib/libaurora_directx64d.lib"
RELOPTS64="-lib -m64 -O -release -property -inline -c -lib -version=DX11_1 -I../.. -of../lib/libaurora_directx64.lib"
DEBUGOPTS32="-lib -m32 -debug -property -g -gs -gx -c -lib -version=DX11_1 -I../.. -of../lib/libaurora_directx32d.lib"
RELOPTS32="-lib -m32 -O -release -property -inline -c -lib -version=DX11_1 -I../.. -of../lib/libaurora_directx32.lib"
SRCFILES="com.d dxgi.d d2d1.d dwrite.d config.d d3d11.d d3dx11.d package.d wic.d"

dmd $RELOPTS64 $SRCFILES
dmd $RELOPTS32 $SRCFILES
dmd $DEBUGOPTS64 $SRCFILES
dmd $DEBUGOPTS32 $SRCFILES