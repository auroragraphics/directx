module aurora.directx.config;

version(DX11_0)
{
	enum bool DX110 = true;
	enum bool DX111 = false;
	enum bool DX112 = false;
}
else version(DX11_1)
{
	enum bool DX110 = true;
	enum bool DX111 = true;
	enum bool DX112 = false;
}
else version(DX11_2)
{
	enum bool DX110 = true;
	enum bool DX111 = true;
	enum bool DX112 = true;
}
else
{
	static assert(0);
}