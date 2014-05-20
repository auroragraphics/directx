DEBUGOPTS64="-lib -m64 -debug -property -g -gs -gx -c -lib -version=DX11_1 -I../.. -of../lib/libadx1164d.lib"
RELOPTS64="-lib -m64 -O -release -property -inline -c -lib -version=DX11_1 -I../.. -of../lib/libadx1164.lib"
DEBUGOPTS32="-lib -m32 -debug -property -g -gs -gx -c -lib -version=DX11_1 -I../.. -of../lib/libadx1132d.lib"
RELOPTS32="-lib -m32 -O -release -property -inline -c -lib -version=DX11_1 -I../.. -of../lib/libadx1132.lib"
SRCFILES="com.d config.d dxgi.d wic.d"

dmd $SRCFILES $RELOPTS64
dmd $SRCFILES $RELOPTS32
dmd $SRCFILES $DEBUGOPTS64
dmd $SRCFILES $DEBUGOPTS32