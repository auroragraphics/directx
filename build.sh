DEBUGOPTS64="-lib -m64 -debug -g -gs -gx -c -lib -version=DX11_1 -I../.. -of./lib/libaurora_directx64d.lib"
RELOPTS64="-lib -m64 -O -release -inline -c -lib -version=DX11_1 -I../.. -of./lib/libaurora_directx64.lib"
DEBUGOPTS32="-lib -m32_mscoff -debug -g -gs -gx -c -lib -version=DX11_1 -I../.. -of./lib/libaurora_directx32d.lib"
RELOPTS32="-lib -m32_mscoff -O -release -inline -c -lib -version=DX11_1 -I../.. -of./lib/libaurora_directx32.lib"
SRCFILES="com.d dxgi.d d2d1.d dwrite.d d3d11.d d3dx11.d package.d wic.d"

printf "Building the Aurora DirectX x64 (Release) library ... "
dmd $SRCFILES $RELOPTS64
printf "Complete\n\r"

printf "Building the Aurora DirectX x64 (Debug) library ... "
dmd $SRCFILES $DEBUGOPTS64
printf "Complete\n\r"

printf "Building the Aurora DirectX x86 (Release) library ... "
dmd $SRCFILES $RELOPTS32
printf "Complete\n\r"

printf "Building the Aurora DirectX x86 (Debug) library ... "
dmd $SRCFILES $DEBUGOPTS32
printf "Complete\n\r"