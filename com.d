module aurora.directx.com;

public import std.c.windows.windows;
public import std.c.windows.com;

mixin(uuid!(IUnknown, "00000000-0000-0000-C000-000000000046"));
mixin(uuid!(IClassFactory,"00000001-0000-0000-C000-000000000046"));

public struct LUID {
	uint LowPart;
	int HighPart;
}

public struct SIZE {
	long X;
	long Y;
}

public template uuid(T, const char[] g) {
	const char [] uuid =
		"const IID IID_"~T.stringof~"={ 0x" ~ g[0..8] ~ ",0x" ~ g[9..13] ~ ",0x" ~ g[14..18] ~ ",[0x" ~ g[19..21] ~ ",0x" ~ g[21..23] ~ ",0x" ~ g[24..26] ~ ",0x" ~ g[26..28] ~ ",0x" ~ g[28..30] ~ ",0x" ~ g[30..32] ~ ",0x" ~ g[32..34] ~ ",0x" ~ g[34..36] ~ "]};"
		"template uuidof(T:"~T.stringof~"){"
		"    const IID uuidof ={ 0x" ~ g[0..8] ~ ",0x" ~ g[9..13] ~ ",0x" ~ g[14..18] ~ ",[0x" ~ g[19..21] ~ ",0x" ~ g[21..23] ~ ",0x" ~ g[24..26] ~ ",0x" ~ g[26..28] ~ ",0x" ~ g[28..30] ~ ",0x" ~ g[30..32] ~ ",0x" ~ g[32..34] ~ ",0x" ~ g[34..36] ~ "]};"
		"}";
}

public struct STATSTG {
	LPOLESTR       pwcsName;
	DWORD          type;
	ULARGE_INTEGER cbSize;
	FILETIME       mtime;
	FILETIME       ctime;
	FILETIME       atime;
	DWORD          grfMode;
	DWORD          grfLocksSupported;
	CLSID          clsid;
	DWORD          grfStateBits;
	DWORD          reserved;
}

mixin(uuid!(ISequentialStream, "0C733A30-2A1C-11CE-ADE5-00AA0044773D"));
public interface ISequentialStream : IUnknown
{
extern(Windows):
	HRESULT Read(void *pv, ULONG cb, ULONG *pcbRead);
	HRESULT Write(void const *pv, ULONG cb, ULONG *pcbWritten);
}

mixin(uuid!(IStream, "0C733A30-2A1C-11CE-ADE5-00AA0044773D"));
public interface IStream : ISequentialStream
{
extern(Windows):
	HRESULT Clone(IStream *ppstm);
	HRESULT Commit(uint grfCommitFlags);
	HRESULT CopyTo(IStream pstm, ULARGE_INTEGER cb, ULARGE_INTEGER *pcbRead, ULARGE_INTEGER *pcbWritten);
	HRESULT LockRegion(ULARGE_INTEGER libOffset, ULARGE_INTEGER cb, uint dwLockType);
	HRESULT Revert();
	HRESULT Seek(LARGE_INTEGER dlibMove, uint dwOrigin, ULARGE_INTEGER *plibNewPosition);
	HRESULT SetSize(ULARGE_INTEGER libNewSize);
	HRESULT Stat(STATSTG *pstatstg, uint grfStatFlag);
	HRESULT UnlockRegion(ULARGE_INTEGER libOffset, ULARGE_INTEGER cb, uint dwLockType);
}
