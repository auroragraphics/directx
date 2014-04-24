module aurora.dx11.config;

version(DX11_0)
{
	enum bool DX11_0 = true;
}
else version(DX11_1)
{
	enum bool DX11_1 = true;
}
else version(DX11_2)
{
	enum bool DX11_2 = true;
}
else
{
	static assert(0);
}