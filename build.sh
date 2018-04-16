cd source/aurora/directx

DEBUGOPTS64="-lib -m64 -debug -g -gs -gx -c -lib -I../.. -of./lib/libaurora_directx64d.lib"
RELOPTS64="-lib -m64 -O -release -inline -c -lib -I../.. -of./lib/libaurora_directx64.lib"
DEBUGOPTS32="-lib -m32mscoff -debug -g -gs -gx -c -lib -I../.. -of./lib/libaurora_directx32d.lib"
RELOPTS32="-lib -m32mscoff -O -release -inline -c -lib -I../.. -of./lib/libaurora_directx32.lib"
SRCFILES="./**/*.d"

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

cd ..