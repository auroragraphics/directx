module aurora.directx.d3d11.d3d11_2;

public import aurora.directx.d3d11.d3d11_1;

public:

///
/// Constants
///

///
/// Functions
///

///
/// Enumerations
///

enum D3D11_TILE_MAPPING_FLAG : uint
{
    NO_OVERWRITE	= 0x1
}

enum D3D11_TILE_RANGE_FLAG : uint
{
    NULL	= 0x1,
    SKIP	= 0x2,
    REUSE_SINGLE_TILE	= 0x4
}

enum D3D11_CHECK_MULTISAMPLE_QUALITY_LEVELS_FLAG : uint
{
    TILED_RESOURCE	= 0x1
}

enum D3D11_TILE_COPY_FLAG : uint
{
    NO_OVERWRITE	= 0x1,
    LINEAR_BUFFER_TO_SWIZZLED_TILED_RESOURCE	= 0x2,
    SWIZZLED_TILED_RESOURCE_TO_LINEAR_BUFFER	= 0x4
}

///
/// Structures
///

struct D3D11_TILED_RESOURCE_COORDINATE {
	uint X;
	uint Y;
	uint Z;
	uint Subresource;
}

struct D3D11_TILE_REGION_SIZE {
	uint NumTiles;
	bool bUseBox;
	uint Width;
	ushort Height;
	ushort Depth;
}

struct D3D11_SUBRESOURCE_TILING {
	uint WidthInTiles;
	ushort HeightInTiles;
	ushort DepthInTiles;
	uint StartTileIndexInOverallResource;
}

struct D3D11_TILE_SHAPE {
	uint WidthInTexels;
	uint HeightInTexels;
	uint DepthInTexels;
}

struct D3D11_PACKED_MIP_DESC {
	ubyte NumStandardMips;
	ubyte NumPackedMips;
	uint NumTilesForPackedMips;
	uint StartTileIndexInOverallResource;
}

///
/// Interfaces
///

mixin(uuid!(ID3D11DeviceContext2, "420d5b32-b90c-4da4-bef0-359f6a24a83a"));
public interface ID3D11DeviceContext2 : ID3D11DeviceContext1
{
extern(Windows):
	void UpdateTiles(ID3D11Resource pDestTiledResource, const(D3D11_TILED_RESOURCE_COORDINATE) *pDestTileRegionStartCoordinate, const(D3D11_TILE_REGION_SIZE) *pDestTileRegionSize, const(void) *pSourceTileData, uint Flags);
	HRESULT CopyTileMappings(ID3D11Resource pDestTiledResource, const(D3D11_TILED_RESOURCE_COORDINATE) *pDestRegionStartCoord, ID3D11Resource pSourceTiledResource, const(D3D11_TILED_RESOURCE_COORDINATE) *pSourceRegionStartCoord, const(D3D11_TILE_REGION_SIZE) *pTileRegionSize, uint Flags);
	void CopyTiles(ID3D11Resource TiledResource, const(D3D11_TILED_RESOURCE_COORDINATE) *pTileRegionStartCoord, const D3D11_TILE_REGION_SIZE *pTileRegionSize, ID3D11Buffer pBuffer, ulong BufferStartOffsetInBytes, uint Flags);
	HRESULT ResizeTilePool(ID3D11Buffer pTilePool, ulong NewSizeInBytes);
	void TiledResourceBarrier(ID3D11DeviceChild pTiledResourceOrViewAccessBeforeBarrier, ID3D11DeviceChild pTiledResourceOrViewAccessAfterBarrier);
	HRESULT UpdateTileMappings(ID3D11Resource pTiledResource, uint NumTiledResourceRegions, const(D3D11_TILED_RESOURCE_COORDINATE) *pTiledResourceRegionStartCoordinates, const(D3D11_TILE_REGION_SIZE) *pTiledResourceRegionSizes, ID3D11Buffer pTilePool, uint NumRanges, const(uint) *pRangeFlags, const(uint) *pTilePoolStartOffsets, const(uint) *pRangeTileCounts, uint Flags);
}

mixin(uuid!(ID3D11Device2, "9d06dffa-d1e5-4d07-83a8-1bb123f2f841"));
public interface ID3D11Device2 : ID3D11Device1
{
extern(Windows):
	HRESULT CheckMultisampleQualityLevels1(DXGI_FORMAT Format, uint SampleCount, uint Flags, uint* pNumQualityLevels);
	HRESULT CreateDeferredContext2(uint ContextFlags, ID3D11DeviceContext2 *ppDeferredContext);
	void GetImmediateContext2(ID3D11DeviceContext2 *ppImmediateContext);
	void GetResourceTiling(ID3D11Resource pTiledResource, uint *pNumTilesForEntireResource, D3D11_PACKED_MIP_DESC *pPackedMipDesc, D3D11_TILE_SHAPE *pStandardTileShapeForNonPackedMips, uint *pNumSubresourceTilings, uint FirstSubresourceTilingToGet, D3D11_SUBRESOURCE_TILING *pSubresourceTilingsForNonPackedMips);
}

