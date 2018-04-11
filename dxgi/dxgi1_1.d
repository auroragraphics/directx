module aurora.directx.dxgi.dxgi1_1;

import aurora.directx.com;
public import aurora.directx.dxgi.dxgi1_0;

public:

//
//	Constants
//

//DXGI_ENUM_MODES
enum DXGI_ENUM_MODES_STEREO          = (4U);
enum DXGI_ENUM_MODES_DISABLED_STEREO = (8U);

//DXGI_PRESENT
enum DXGI_PRESENT_DO_NOT_WAIT           = (0x00000008U);
enum DXGI_PRESENT_STEREO_PREFER_RIGHT   = (0x00000010U);
enum DXGI_PRESENT_STEREO_TEMPORARY_MONO = (0x00000020U);
enum DXGI_PRESENT_RESTRICT_TO_OUTPUT    = (0x00000040U);

//
//	Enumerations
//

public enum DXGI_ALPHA_MODE : int { 
	UNSPECIFIED    = 0,
	PREMULTIPLIED  = 1,
	STRAIGHT       = 2,
	IGNORE         = 3,
	FORCE_DWORD    = 0xffffffff
}

public enum DXGI_COMPUTE_PREEMPTION_GRANULARITY : int { 
	DMA_BUFFER_BOUNDARY    = 0,
	DISPATCH_BOUNDARY      = 1,
	THREAD_GROUP_BOUNDARY  = 2,
	THREAD_BOUNDARY        = 3,
	INSTRUCTION_BOUNDARY   = 4
}

public enum DXGI_DEBUG_RLO_FLAGS : int { 
	SUMMARY  = 0x1,
	DETAIL   = 0x2,
	ALL      = 0x3
}

public enum DXGI_GRAPHICS_PREEMPTION_GRANULARITY : int { 
	DMA_BUFFER_BOUNDARY   = 0,
	PRIMITIVE_BOUNDARY    = 1,
	TRIANGLE_BOUNDARY     = 2,
	PIXEL_BOUNDARY        = 3,
	INSTRUCTION_BOUNDARY  = 4
}

public enum DXGI_INFO_QUEUE_MESSAGE_CATEGORY : int { 
	UNKNOWN                = 0,
	MISCELLANEOUS          = ( UNKNOWN + 1 ),
	INITIALIZATION         = ( MISCELLANEOUS + 1 ),
	CLEANUP                = ( INITIALIZATION + 1 ),
	COMPILATION            = ( CLEANUP + 1 ),
	STATE_CREATION         = ( COMPILATION + 1 ),
	STATE_SETTING          = ( STATE_CREATION + 1 ),
	STATE_GETTING          = ( STATE_SETTING + 1 ),
	RESOURCE_MANIPULATION  = ( STATE_GETTING + 1 ),
	EXECUTION              = ( RESOURCE_MANIPULATION + 1 ),
	SHADER                 = ( EXECUTION + 1 )
}

public enum DXGI_INFO_QUEUE_MESSAGE_SEVERITY : int { 
	CORRUPTION  = 0,
	ERROR       = ( CORRUPTION + 1 ),
	WARNING     = ( ERROR + 1 ),
	INFO        = ( WARNING + 1 ),
	MESSAGE     = ( INFO + 1 )
}

public enum DXGI_OFFER_RESOURCE_PRIORITY : int { 
	LOW     = 1,
	NORMAL  = ( LOW + 1 ),
	HIGH    = ( NORMAL + 1 )
}

public enum DXGI_OUTDUPL_POINTER_SHAPE_TYPE : int { 
	MONOCHROME    = 0x1,
	COLOR         = 0x2,
	MASKED_COLOR  = 0x4
}

public enum DXGI_SCALING : int { 
	STRETCH               = 0,
	NONE                  = 1,
	ASPECT_RATIO_STRETCH  = 2
}

//
//	Structures
//

public struct DXGI_ADAPTER_DESC2 {
	wchar[128] Description;
	uint VendorId;
	uint DeviceId;
	uint SubSysId;
	uint Revision;
	size_t DedicatedVideoMemory;
	size_t DedicatedSystemMemory;
	size_t SharedSystemMemory;
	LUID AdapterLuid;
	uint Flags;
	DXGI_GRAPHICS_PREEMPTION_GRANULARITY GraphicsPreemptionGranularity;
	DXGI_COMPUTE_PREEMPTION_GRANULARITY  ComputePreemptionGranularity;
}


public struct DXGI_INFO_QUEUE_FILTER {
	DXGI_INFO_QUEUE_FILTER_DESC AllowList;
	DXGI_INFO_QUEUE_FILTER_DESC DenyList;
}

alias int DXGI_INFO_QUEUE_MESSAGE_ID;
public struct DXGI_INFO_QUEUE_FILTER_DESC {
	uint                              NumCategories;
	DXGI_INFO_QUEUE_MESSAGE_CATEGORY *pCategoryList;
	uint                              NumSeverities;
	DXGI_INFO_QUEUE_MESSAGE_SEVERITY *pSeverityList;
	uint                              NumIDs;
	DXGI_INFO_QUEUE_MESSAGE_ID       *pIDList;
}

public struct DXGI_INFO_QUEUE_MESSAGE {
	GUID                             Producer;
	DXGI_INFO_QUEUE_MESSAGE_CATEGORY Category;
	DXGI_INFO_QUEUE_MESSAGE_SEVERITY Severity;
	DXGI_INFO_QUEUE_MESSAGE_ID       ID;
	const char                       *pDescription;
	size_t                           DescriptionByteLength;
}

public struct DXGI_MODE_DESC1 {
	uint                     Width;
	uint                     Height;
	DXGI_RATIONAL            RefreshRate;
	DXGI_FORMAT              Format;
	DXGI_MODE_SCANLINE_ORDER ScanlineOrdering;
	DXGI_MODE_SCALING        Scaling;
	BOOL                     Stereo;
}

public struct DXGI_OUTDUPL_FRAME_INFO {
	LARGE_INTEGER                 LastPresentTime;
	LARGE_INTEGER                 LastMouseUpdateTime;
	uint                          AccumulatedFrames;
	BOOL                          RectsCoalesced;
	BOOL                          ProtectedContentMaskedOut;
	DXGI_OUTDUPL_POINTER_POSITION PointerPosition;
	uint                          TotalMetadataBufferSize;
	uint                          PointerShapeBufferSize;
}

public struct DXGI_OUTDUPL_MOVE_RECT {
	POINT SourcePoint;
	RECT  DestinationRect;
}

public struct DXGI_OUTDUPL_POINTER_POSITION {
	POINT Position;
	BOOL  Visible;
}

public struct DXGI_OUTDUPL_POINTER_SHAPE_INFO {
	uint Type;
	uint Width;
	uint Height;
	uint Pitch;
	POINT HotSpot;
}

public struct DXGI_PRESENT_PARAMETERS {
	uint DirtyRectsCount;
	RECT *pDirtyRects;
	RECT *pScrollRect;
	POINT *pScrollOffset;
}

public struct DXGI_SWAP_CHAIN_DESC1 {
	uint             Width;
	uint             Height;
	DXGI_FORMAT      Format;
	BOOL             Stereo;
	DXGI_SAMPLE_DESC SampleDesc;
	uint       BufferUsage;
	uint             BufferCount;
	DXGI_SCALING     Scaling;
	DXGI_SWAP_EFFECT SwapEffect;
	DXGI_ALPHA_MODE  AlphaMode;
	uint             Flags;
}

public struct DXGI_SWAP_CHAIN_FULLSCREEN_DESC {
	DXGI_RATIONAL            RefreshRate;
	DXGI_MODE_SCANLINE_ORDER ScanlineOrdering;
	DXGI_MODE_SCALING        Scaling;
	BOOL                     Windowed;
}

//
//	Interfaces
//

mixin(uuid!(IDXGIAdapter2, "0AA1AE0A-FA0E-4B84-8644-E05FF8E5ACB5"));
interface IDXGIAdapter2 : IDXGIAdapter1
{
extern(Windows):
	HRESULT GetDesc2(DXGI_ADAPTER_DESC2 *Desc);
}

mixin(uuid!(IDXGIDebug, "119E7452-DE9E-40fe-8806-88F90C12B441"));
interface IDXGIDebug : IUnknown
{
extern(Windows):
	HRESULT ReportLiveObjects(GUID APIID, DXGI_DEBUG_RLO_FLAGS Flags);
}

mixin(uuid!(IDXGIDevice2, "05008617-fbfd-4051-a790-144884b4f6a9"));
interface IDXGIDevice2 : IDXGIDevice1
{
extern(Windows):
	HRESULT EnqueueSetEvent(HANDLE Event);
	HRESULT OfferResources(uint NumResources, const(IDXGIResource) *Resources, DXGI_OFFER_RESOURCE_PRIORITY Priority);
	HRESULT ReclaimResources(uint NumResources, const(IDXGIResource) *Resources, BOOL *Discarded);
}

mixin(uuid!(IDXGIDisplayControl, "ea9dbf1a-c88e-4486-854a-98aa0138f30c"));
interface IDXGIDisplayControl : IUnknown
{
extern(Windows):
	BOOL IsStereoEnabled();
	void SetStereoEnabled(BOOL Enabled);
}

mixin(uuid!(IDXGIFactory2, "50c83a1c-e072-4c48-87b0-3630fa36a6d0"));
interface IDXGIFactory2 : IDXGIFactory1
{
extern(Windows):
	HRESULT CreateSwapChainForComposition(IUnknown Device, const DXGI_SWAP_CHAIN_DESC1 *Desc, IDXGIOutput RestrictToOutput, IDXGISwapChain1 *SwapChain);
	HRESULT CreateSwapChainForCoreWindow(IUnknown Device, IUnknown Window, const DXGI_SWAP_CHAIN_DESC1 *Desc, IDXGIOutput RestrictToOutput, IDXGISwapChain1 *SwapChain);
	HRESULT CreateSwapChainForHwnd(IUnknown Device, HWND hWnd, const DXGI_SWAP_CHAIN_DESC1 *Desc, const DXGI_SWAP_CHAIN_FULLSCREEN_DESC *FullscreenDesc, IDXGIOutput RestrictToOutput, IDXGISwapChain1 *SwapChain);
	HRESULT GetSharedResourceAdapterLuid(HANDLE Resource, LUID *Luid);
	BOOL IsWindowedStereoEnabled();
	HRESULT RegisterOcclusionStatusEvent(HANDLE Event, DWORD *Cookie);
	HRESULT RegisterOcclusionStatusWindow(HWND WindowHandle, uint Msg, DWORD *Cookie);
	HRESULT RegisterStereoStatusEvent(HANDLE Event, DWORD *Cookie);
	HRESULT RegisterStereoStatusWindow(HWND WindowHandle, uint Msg, DWORD *Cookie);
	void UnregisterOcclusionStatus(DWORD Cookie);
	void UnregisterStereoStatus(DWORD Cookie);
}

mixin(uuid!(IDXGIInfoQueue, "D67441C7-672A-476f-9E82-CD55B44949CE"));
interface IDXGIInfoQueue : IUnknown
{
extern(Windows):
	HRESULT AddApplicationMessage(DXGI_INFO_QUEUE_MESSAGE_SEVERITY Severity, const(char)* Description);
	HRESULT AddMessage(GUID Producer, DXGI_INFO_QUEUE_MESSAGE_CATEGORY Category, DXGI_INFO_QUEUE_MESSAGE_SEVERITY Severity, DXGI_INFO_QUEUE_MESSAGE_ID ID, const(char)* Description);
	HRESULT AddRetrievalFilterEntries(GUID Producer, DXGI_INFO_QUEUE_FILTER *Filter);
	HRESULT AddStorageFilterEntries(GUID Producer, DXGI_INFO_QUEUE_FILTER *Filter);
	void ClearRetrievalFilter(GUID Producer);
	void ClearStorageFilter(GUID Producer);
	void ClearStoredMessages(GUID Producer);
	BOOL GetBreakOnCategory(GUID Producer, DXGI_INFO_QUEUE_MESSAGE_CATEGORY Category);
	BOOL GetBreakOnID(GUID Producer, DXGI_INFO_QUEUE_MESSAGE_ID ID);
	BOOL GetBreakOnSeverity(GUID Producer, DXGI_INFO_QUEUE_MESSAGE_SEVERITY Severity);
	HRESULT GetMessage(GUID Producer, ulong MessageIndex, DXGI_INFO_QUEUE_MESSAGE *Message, size_t *MessageByteLength);
	ulong GetMessageCountLimit(GUID Producer);
	BOOL GetMuteDebugOutput(GUID Producer);
	ulong GetNumMessagesAllowedByStorageFilter(GUID Producer);
	ulong GetNumMessagesDeniedByStorageFilter(GUID Producer);
	ulong GetNumMessagesDiscardedByMessageCountLimit(GUID Producer);
	ulong GetNumStoredMessages(GUID Producer);
	ulong GetNumStoredMessagesAllowedByRetrievalFilters(GUID Producer);
	HRESULT GetRetrievalFilter(GUID Producer, DXGI_INFO_QUEUE_FILTER *Filter, size_t *FilterByteLength);
	uint GetRetrievalFilterStackSize(GUID Producer);
	HRESULT GetStorageFilter(GUID Producer, DXGI_INFO_QUEUE_FILTER *Filter, size_t *FilterByteLength);
	uint GetStorageFilterStackSize(GUID Producer);
	void PopRetrievalFilter(GUID Producer);
	void PopStorageFilter(GUID Producer);
	HRESULT PushCopyOfRetrievalFilter(GUID Producer);
	HRESULT PushCopyOfStorageFilter(GUID Producer);
	HRESULT PushDenyAllRetrievalFilter(GUID Producer);
	HRESULT PushDenyAllStorageFilter(GUID Producer);
	HRESULT PushEmptyRetrievalFilter(GUID Producer);
	HRESULT PushEmptyStorageFilter(GUID Producer);
	HRESULT PushRetrievalFilter(GUID Producer, DXGI_INFO_QUEUE_FILTER *Filter);
	HRESULT PushStorageFilter(GUID Producer, DXGI_INFO_QUEUE_FILTER *Filter);
	HRESULT SetBreakOnCategory(GUID Producer, DXGI_INFO_QUEUE_MESSAGE_CATEGORY Category, BOOL Enable);
	HRESULT SetBreakOnID(GUID Producer, DXGI_INFO_QUEUE_MESSAGE_ID ID, BOOL Enable);
	HRESULT SetBreakOnSeverity(GUID Producer, DXGI_INFO_QUEUE_MESSAGE_SEVERITY Severity, BOOL Enable);
	HRESULT SetMessageCountLimit(GUID Producer, ulong MessageCountLimit);
	HRESULT SetMuteDebugOutput(GUID Producer, BOOL Mute);
}

mixin(uuid!(IDXGIOutput1, "00cddea8-939b-4b83-a340-a685226666cc"));
interface IDXGIOutput1 : IDXGIOutput
{
extern(Windows):
	HRESULT DuplicateOutput(IUnknown Device, IDXGIOutputDuplication *OutputDuplication);
	HRESULT FindClosestMatchingMode1(const DXGI_MODE_DESC1 *ModeToMatch, DXGI_MODE_DESC1 *ClosestMatch, IUnknown ConcernedDevice);
	HRESULT GetDisplayModeList1(DXGI_FORMAT EnumFormat, uint Flags, uint *NumModes, DXGI_MODE_DESC1 *Desc);
	HRESULT GetDisplaySurfaceData1(IDXGIResource Destination);
}

mixin(uuid!(IDXGIOutputDuplication, "191cfac3-a341-470d-b26e-a864f428319c"));
interface IDXGIOutputDuplication : IDXGIObject
{
extern(Windows):
	HRESULT AcquireNextFrame(uint TimeoutInMilliseconds, DXGI_OUTDUPL_FRAME_INFO *FrameInfo, IDXGIResource *DesktopResource);
	void GetDesc(DXGI_OUTDUPL_DESC *pDesc);
	HRESULT GetFrameDirtyRects(uint DirtyRectsBufferSize, RECT *DirtyRectsBuffer, uint *DirtyRectsBufferSizeRequired);
	HRESULT GetFrameMoveRects(uint MoveRectsBufferSize, DXGI_OUTDUPL_MOVE_RECT *MoveRectBuffer, uint *MoveRectsBufferSizeRequired);
	HRESULT GetFramePointerShape(uint PointerShapeBufferSize, void *PointerShapeBuffer, uint *PointerShapeBufferSizeRequired, DXGI_OUTDUPL_POINTER_SHAPE_INFO *PointerShapeInfo);
	HRESULT MapDesktopSurface(DXGI_MAPPED_RECT *LockedRect);
	HRESULT ReleaseFrame();
	HRESULT UnMapDesktopSurface();
}

mixin(uuid!(IDXGIResource1, "035f3ab4-482e-4e50-b41f-8a7f8bd8960b"));
interface IDXGIResource1 : IDXGIResource
{
extern(Windows):
	HRESULT CreateSharedHandle(const SECURITY_ATTRIBUTES *Attributes, DWORD Access, const(wchar)* Name, HANDLE *Handle);
	HRESULT CreateSubresourceSurface(uint Index, IDXGISurface2 *Surface);
}

mixin(uuid!(IDXGISurface2, "aba496dd-b617-4cb8-a866-bc44d7eb1fa2"));
interface IDXGISurface2 : IDXGISurface1
{
extern(Windows):
	HRESULT GetResource(GUID* RIID, void **ParentResource, uint *SubresourceIndex);
}

mixin(uuid!(IDXGISwapChain1, "790a45f7-0d42-4876-983a-0a55cfe6f4aa"));
interface IDXGISwapChain1 : IDXGISwapChain
{
extern(Windows):
	HRESULT GetBackgroundColor(DXGI_RGBA *Color);
	HRESULT GetCoreWindow(GUID **RefIID, void **ppUnk);
	HRESULT GetDesc1(DXGI_SWAP_CHAIN_DESC1 *Desc);
	HRESULT GetFullscreenDesc(DXGI_SWAP_CHAIN_FULLSCREEN_DESC *Desc);
	HRESULT GetHwnd(HWND *Hwnd);
	HRESULT GetRestrictToOutput(IDXGIOutput *RestrictToOutput);
	HRESULT GetRotation(DXGI_MODE_ROTATION *Rotation);
	BOOL IsTemporaryMonoSupported();
	HRESULT Present1(uint SyncInterval, uint Flags, const DXGI_PRESENT_PARAMETERS *pPresentParameters);
	HRESULT SetBackgroundColor(const DXGI_RGBA *Color);
	HRESULT SetRotation(const DXGI_MODE_ROTATION Rotation);
}
