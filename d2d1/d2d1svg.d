module aurora.directx.d2d1.d2d1svg;

public import aurora.directx.d2d1.d2d1_2;

public:

///
/// Enumerations
///

enum D2D1_SVG_PAINT_TYPE : int
{
    NONE = 0,
    COLOR = 1,
    CURRENT_COLOR = 2,
    URI = 3,
    URI_NONE = 4,
    URI_COLOR = 5,
    URI_CURRENT_COLOR = 6,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_SVG_LENGTH_UNITS : int
{
    D2D1_SVG_LENGTH_UNITS_NUMBER = 0,
    D2D1_SVG_LENGTH_UNITS_PERCENTAGE = 1,
    D2D1_SVG_LENGTH_UNITS_FORCE_DWORD = 0xffffffff
}

enum D2D1_SVG_DISPLAY : int
{
    INLINE = 0,
    NONE = 1,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_SVG_VISIBILITY : int
{
    VISIBLE = 0,
    HIDDEN = 1,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_SVG_OVERFLOW : int
{
    VISIBLE = 0,
    HIDDEN = 1,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_SVG_LINE_CAP : int
{
    BUTT = D2D1_CAP_STYLE.FLAT,
    SQUARE = D2D1_CAP_STYLE.SQUARE,
    ROUND = D2D1_CAP_STYLE.ROUND,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_SVG_LINE_JOIN : int
{
    BEVEL = D2D1_LINE_JOIN.BEVEL,
    MITER = D2D1_LINE_JOIN.MITER_OR_BEVEL,
    ROUND = D2D1_LINE_JOIN.ROUND,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_SVG_ASPECT_ALIGN : int
{
    NONE = 0,
    X_MIN_Y_MIN = 1,
    X_MID_Y_MIN = 2,
    X_MAX_Y_MIN = 3,
    X_MIN_Y_MID = 4,
    X_MID_Y_MID = 5,
    X_MAX_Y_MID = 6,
    X_MIN_Y_MAX = 7,
    X_MID_Y_MAX = 8,
    X_MAX_Y_MAX = 9,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_SVG_ASPECT_SCALING : int
{
    MEET = 0,
    SLICE = 1,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_SVG_PATH_COMMAND : int
{
    CLOSE_PATH = 0,
    MOVE_ABSOLUTE = 1,
    MOVE_RELATIVE = 2,
    LINE_ABSOLUTE = 3,
    LINE_RELATIVE = 4,
    CUBIC_ABSOLUTE = 5,
    CUBIC_RELATIVE = 6,
    QUADRADIC_ABSOLUTE = 7,
    QUADRADIC_RELATIVE = 8,
    ARC_ABSOLUTE = 9,
    ARC_RELATIVE = 10,
    HORIZONTAL_ABSOLUTE = 11,
    HORIZONTAL_RELATIVE = 12,
    VERTICAL_ABSOLUTE = 13,
    VERTICAL_RELATIVE = 14,
    CUBIC_SMOOTH_ABSOLUTE = 15,
    CUBIC_SMOOTH_RELATIVE = 16,
    QUADRADIC_SMOOTH_ABSOLUTE = 17,
    QUADRADIC_SMOOTH_RELATIVE = 18,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_SVG_UNIT_TYPE : int
{
    USER_SPACE_ON_USE = 0,
    OBJECT_BOUNDING_BOX = 1,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_SVG_ATTRIBUTE_STRING_TYPE : int
{
    SVG = 0,
    ID = 1,
    FORCE_DWORD = 0xffffffff
}

enum D2D1_SVG_ATTRIBUTE_POD_TYPE : int
{
    FLOAT = 0,
    COLOR = 1,
    FILL_MODE = 2,
    DISPLAY = 3,
    OVERFLOW = 4,
    LINE_CAP = 5,
    LINE_JOIN = 6,
    VISIBILITY = 7,
    MATRIX = 8,
    UNIT_TYPE = 9,
    EXTEND_MODE = 10,
    PRESERVE_ASPECT_RATIO = 11,
    VIEWBOX = 12,
    LENGTH = 13,
    FORCE_DWORD = 0xffffffff
}

///
/// Structures
///

struct D2D1_SVG_LENGTH
{
    float value;
    D2D1_SVG_LENGTH_UNITS units;
}

struct D2D1_SVG_PRESERVE_ASPECT_RATIO
{
    bool defer;
    D2D1_SVG_ASPECT_ALIGN _align;
    D2D1_SVG_ASPECT_SCALING meetOrSlice;
}

struct D2D1_SVG_VIEWBOX
{
    FLOAT x;
    FLOAT y;
    FLOAT width;
    FLOAT height;

}

///
/// Interfaces
///

mixin(uuid!(ID2D1SvgAttribute, "c9cdb0dd-f8c9-4e70-b7c2-301c80292c5e"));
public interface ID2D1SvgAttribute : ID2D1Resource
{
extern(Windows):
    HRESULT Clone(ID2D1SvgAttribute *attribute);
    void GetElement(ID2D1SvgElement *element);
}

mixin(uuid!(ID2D1SvgPaint, "d59bab0a-68a2-455b-a5dc-9eb2854e2490"));
public interface ID2D1SvgPaint : ID2D1SvgAttribute
{
extern(Windows):
    void GetColor(D2D1_COLOR_F *color);
    HRESULT GetId(wchar *id, uint idCount);
    uint GetIdLength();
    D2D1_SVG_PAINT_TYPE GetPaintType();
    HRESULT SetColor(const D2D1_COLOR_F *color);
    final HRESULT SetColor(const D2D1_COLOR_F color) {
        return SetColor(&color);
    }
    HRESULT SetId(const wchar *id);
    HRESULT SetPaintType(D2D1_SVG_PAINT_TYPE paintType);
}

mixin(uuid!(ID2D1SvgStrokeDashArray, "f1c0ca52-92a3-4f00-b4ce-f35691efd9d9"));
public interface ID2D1SvgStrokeDashArray : ID2D1SvgAttribute
{
extern(Windows):
    HRESULT GetDashes(float *dashes, uint dashesCount, uint startIndex = 0);
    HRESULT GetDashes(D2D1_SVG_LENGTH *dashes, uint dashesCount, uint startIndex = 0);
    uint GetDashesCount();
    HRESULT RemoveDashesAtEnd(uint dashesCount);
    HRESULT UpdateDashes(const float *dashes, uint dashesCount, uint startIndex = 0);
    HRESULT UpdateDashes(const D2D1_SVG_LENGTH *dashes, uint dashesCount, uint startIndex = 0);
}

mixin(uuid!(ID2D1SvgPointCollection, "9dbe4c0d-3572-4dd9-9825-5530813bb712"));
public interface ID2D1SvgPointCollection : ID2D1SvgAttribute
{
extern(Windows):
    HRESULT GetPoints(D2D1_POINT_2F *points, uint pointsCount, uint startIndex = 0);
    uint GetPointsCount();
    HRESULT RemovePointsAtEnd(uint pointsCount);
    HRESULT UpdatePoints(const D2D1_POINT_2F *points, uint pointsCount, uint startIndex = 0);
}

mixin(uuid!(ID2D1SvgPathData, "c095e4f4-bb98-43d6-9745-4d1b84ec9888"));
public interface ID2D1SvgPathData : ID2D1SvgAttribute
{
extern(Windows):
    HRESULT CreatePathGeometry(D2D1_FILL_MODE fillMode, ID2D1PathGeometry1 *pathGeometry);
    HRESULT GetCommands(D2D1_SVG_PATH_COMMAND *commands, uint commandsCount, uint startIndex = 0);
    uint GetCommandsCount();
    HRESULT GetSegmentData(float *data, uint dataCount, uint startIndex = 0);
    uint GetSegmentDataCount();
    HRESULT RemoveCommandsAtEnd(uint commandsCount);
    HRESULT RemoveSegmentDataAtEnd(uint dataCount);
    HRESULT UpdateCommands(const D2D1_SVG_PATH_COMMAND *commands, uint commandsCount, uint startIndex = 0);
    HRESULT UpdateSegmentData(const float *data, uint dataCount, uint startIndex = 0);
}

mixin(uuid!(ID2D1SvgElement, "ac7b67a6-183e-49c1-a823-0ebe40b0db29"));
public interface ID2D1SvgElement : ID2D1Resource
{
extern(Windows):
    HRESULT AppendChild(ID2D1SvgElement newChild);
    HRESULT CreateChild(const wchar *tagName, ID2D1SvgElement *newChild);
    HRESULT GetAttributeValueLength(const wchar *name, D2D1_SVG_ATTRIBUTE_STRING_TYPE type, uint *valueLength);
    void GetDocument(ID2D1SvgDocument *document);
    void GetFirstChild(ID2D1SvgElement *child);
    void GetLastChild(ID2D1SvgElement *child);
    HRESULT GetNextChild(ID2D1SvgElement referenceChild, ID2D1SvgElement *nextChild);
    void GetParent(ID2D1SvgElement *parent);
    HRESULT GetPreviousChild(ID2D1SvgElement referenceChild,ID2D1SvgElement *previousChild);
    uint GetSpecifiedAttributeCount();
    HRESULT GetSpecifiedAttributeName(uint index, wchar *name, uint nameCount, bool *inherited = null);
    HRESULT GetSpecifiedAttributeNameLength(uint index, uint *nameLength, bool *inherited = null);
    HRESULT GetTagName(wchar *name, uint nameCount);
    uint GetTagNameLength();
    HRESULT GetTextValue(wchar *name, uint nameCount);
    uint GetTextValueLength();
    bool HasChildren();
    HRESULT InsertChildBefore(ID2D1SvgElement newChild, ID2D1SvgElement referenceChild = null);
    bool IsAttributeSpecified(const wchar *name, bool *inherited = null);
    bool IsTextContent();
    HRESULT RemoveAttribute(const wchar *name);
    HRESULT RemoveChild(ID2D1SvgElement oldChild);
    HRESULT ReplaceChild(ID2D1SvgElement newChild, ID2D1SvgElement oldChild);
    HRESULT SetTextValue(const wchar *name, uint nameCount);

    HRESULT SetAttributeValue(const wchar* name, D2D1_SVG_ATTRIBUTE_STRING_TYPE type, const wchar* value);
    HRESULT GetAttributeValue(const wchar* name, D2D1_SVG_ATTRIBUTE_STRING_TYPE type, wchar* value, uint valueCount);
    HRESULT GetAttributeValueLength(const wchar* name, D2D1_SVG_ATTRIBUTE_STRING_TYPE type, uint *valueLength);
    HRESULT SetAttributeValue(const wchar* name, D2D1_SVG_ATTRIBUTE_POD_TYPE type, const void *value, uint valueSizeInBytes);    
    HRESULT GetAttributeValue(const wchar* name, D2D1_SVG_ATTRIBUTE_POD_TYPE type, void *value, uint valueSizeInBytes);
    HRESULT SetAttributeValue(const wchar* name, ID2D1SvgAttribute value );
    HRESULT GetAttributeValue(const wchar* name, REFIID riid, void **value);

    final HRESULT SetAttributeValue(const wchar *name, float value) {
        return SetAttributeValue(name, D2D1_SVG_ATTRIBUTE_POD_TYPE.FLOAT, &value, value.sizeof);
    }
    final HRESULT GetAttributeValue(const wchar *name, float value) {
        return GetAttributeValue(name, D2D1_SVG_ATTRIBUTE_POD_TYPE.FLOAT, cast(void*)value, cast(uint)value.sizeof);
    }

    final HRESULT SetAttributeValue(const wchar *name, const D2D1_COLOR_F value) {
        return SetAttributeValue(name, D2D1_SVG_ATTRIBUTE_POD_TYPE.COLOR, &value, value.sizeof);
    }    
    final HRESULT GetAttributeValue(const wchar *name, D2D1_COLOR_F *value) {
        return GetAttributeValue(name, D2D1_SVG_ATTRIBUTE_POD_TYPE.COLOR, value, (*value).sizeof);
    }

    final HRESULT SetAttributeValue(const wchar *name, D2D1_FILL_MODE value ) {
        return SetAttributeValue(name, D2D1_SVG_ATTRIBUTE_POD_TYPE.FILL_MODE, &value, value.sizeof);
    }    
    final HRESULT GetAttributeValue(const wchar *name, D2D1_FILL_MODE *value) {
        return GetAttributeValue(name, D2D1_SVG_ATTRIBUTE_POD_TYPE.FILL_MODE, value, (*value).sizeof);
    }
    
    final HRESULT SetAttributeValue(const wchar *name, D2D1_SVG_DISPLAY value) {
        return SetAttributeValue(name, D2D1_SVG_ATTRIBUTE_POD_TYPE.DISPLAY, &value, value.sizeof);
    }
    final HRESULT GetAttributeValue(const wchar *name, D2D1_SVG_DISPLAY *value ) {
        return GetAttributeValue(name, D2D1_SVG_ATTRIBUTE_POD_TYPE.DISPLAY, value, (*value).sizeof);
    }
    
    final HRESULT SetAttributeValue(const wchar *name, D2D1_SVG_OVERFLOW value) {
        return SetAttributeValue(name, D2D1_SVG_ATTRIBUTE_POD_TYPE.OVERFLOW, &value, value.sizeof);
    }
    final HRESULT GetAttributeValue(const wchar *name, D2D1_SVG_OVERFLOW *value) {
        return GetAttributeValue(name, D2D1_SVG_ATTRIBUTE_POD_TYPE.OVERFLOW, value, (*value).sizeof);
    }

    final HRESULT SetAttributeValue(const wchar *name, D2D1_SVG_LINE_JOIN value) {
        return SetAttributeValue(name, D2D1_SVG_ATTRIBUTE_POD_TYPE.LINE_JOIN, &value, value.sizeof);
    }
    final HRESULT GetAttributeValue(const wchar *name, D2D1_SVG_LINE_JOIN *value) {
        return GetAttributeValue(name, D2D1_SVG_ATTRIBUTE_POD_TYPE.LINE_JOIN, value, (*value).sizeof);
    }
    
    final HRESULT SetAttributeValue(const wchar *name, D2D1_SVG_LINE_CAP value) {
       return SetAttributeValue(name, D2D1_SVG_ATTRIBUTE_POD_TYPE.LINE_CAP, &value, value.sizeof);
    }
    final HRESULT GetAttributeValue(const wchar *name, D2D1_SVG_LINE_CAP *value) {
        return GetAttributeValue(name, D2D1_SVG_ATTRIBUTE_POD_TYPE.LINE_CAP, value, (*value).sizeof);
    }
    
    final HRESULT SetAttributeValue(const wchar *name, D2D1_SVG_VISIBILITY value ) {
        return SetAttributeValue(name, D2D1_SVG_ATTRIBUTE_POD_TYPE.VISIBILITY, &value, value.sizeof);
    }
    final HRESULT GetAttributeValue(const wchar *name, D2D1_SVG_VISIBILITY *value) {
        return GetAttributeValue(name, D2D1_SVG_ATTRIBUTE_POD_TYPE.VISIBILITY, value, (*value).sizeof);
    }
    
    final HRESULT SetAttributeValue(const wchar *name, const D2D1_MATRIX_3X2_F value) {
        return SetAttributeValue(name, D2D1_SVG_ATTRIBUTE_POD_TYPE.MATRIX, &value, value.sizeof);
    }
    final HRESULT GetAttributeValue(const wchar *name, D2D1_MATRIX_3X2_F *value) {
        return GetAttributeValue(name, D2D1_SVG_ATTRIBUTE_POD_TYPE.MATRIX, value, (*value).sizeof);
    }
    
    final HRESULT SetAttributeValue(const wchar *name, D2D1_SVG_UNIT_TYPE value ) {
        return SetAttributeValue(name, D2D1_SVG_ATTRIBUTE_POD_TYPE.UNIT_TYPE, &value, value.sizeof);
    }
    final HRESULT GetAttributeValue(const wchar *name, D2D1_SVG_UNIT_TYPE *value) {
        return GetAttributeValue(name, D2D1_SVG_ATTRIBUTE_POD_TYPE.UNIT_TYPE, value, (*value).sizeof);
    }
    
    final HRESULT SetAttributeValue(const wchar *name, D2D1_EXTEND_MODE value) {
        return SetAttributeValue(name, D2D1_SVG_ATTRIBUTE_POD_TYPE.EXTEND_MODE, &value, value.sizeof);
    }    
    final HRESULT GetAttributeValue(const wchar *name, D2D1_EXTEND_MODE *value) {
        return GetAttributeValue(name, D2D1_SVG_ATTRIBUTE_POD_TYPE.EXTEND_MODE, value, (*value).sizeof);
    }
    
    final HRESULT SetAttributeValue(const wchar *name, const D2D1_SVG_PRESERVE_ASPECT_RATIO value) {
        return SetAttributeValue(name, D2D1_SVG_ATTRIBUTE_POD_TYPE.PRESERVE_ASPECT_RATIO, &value, value.sizeof);
    }
    final HRESULT GetAttributeValue(const wchar *name, D2D1_SVG_PRESERVE_ASPECT_RATIO *value) {
        return GetAttributeValue(name, D2D1_SVG_ATTRIBUTE_POD_TYPE.PRESERVE_ASPECT_RATIO, value, (*value).sizeof);
    }
    
    final HRESULT SetAttributeValue(const wchar *name, const D2D1_SVG_LENGTH value) {
        return SetAttributeValue(name, D2D1_SVG_ATTRIBUTE_POD_TYPE.LENGTH, &value, value.sizeof);
    }
    final HRESULT GetAttributeValue(const wchar *name, D2D1_SVG_LENGTH *value) {
        return GetAttributeValue(name, D2D1_SVG_ATTRIBUTE_POD_TYPE.LENGTH, value, (*value).sizeof);
    }
    
    final HRESULT GetAttributeValue(const wchar *name, ID2D1SvgAttribute *value) {
        return GetAttributeValue(name, &IID_ID2D1SvgAttribute, cast(void **)(value));
    }
    final HRESULT GetAttributeValue(const wchar *name, ID2D1SvgPaint *value) {
        return GetAttributeValue(name, &IID_ID2D1SvgPaint, cast(void **)(value));
    }
    final HRESULT GetAttributeValue(const wchar *name, ID2D1SvgStrokeDashArray *value) {
        return GetAttributeValue(name, &IID_ID2D1SvgStrokeDashArray, cast(void **)(value));
    }
    final HRESULT GetAttributeValue(const wchar *name,ID2D1SvgPointCollection *value) {
        return GetAttributeValue(name, &IID_ID2D1SvgPointCollection, cast(void **)(value));
    }
    final HRESULT GetAttributeValue(const wchar *name, ID2D1SvgPathData *value) {
        return GetAttributeValue(name, &IID_ID2D1SvgPathData, cast(void **)(value));
    }
}

mixin(uuid!(ID2D1SvgDocument, "86b88e4d-afa4-4d7b-88e4-68a51c4a0aec"));
public interface ID2D1SvgDocument : ID2D1Resource
{
extern(Windows):
    HRESULT CreatePaint(D2D1_SVG_PAINT_TYPE paintType, const D2D1_COLOR_F *color, const wchar *id, ID2D1SvgPaint *paint);
    final HRESULT CreatePaint(D2D1_SVG_PAINT_TYPE paintType, const D2D1_COLOR_F color, const wchar *id, ID2D1SvgPaint *paint) {
        return CreatePaint(paintType, &color, id, paint);
    }
    HRESULT CreatePathData(const float *segmentData, uint segmentDataCount, const D2D1_SVG_PATH_COMMAND *commands, uint commandsCount, ID2D1SvgPathData *pathData);
    HRESULT CreatePointCollection(const D2D1_POINT_2F *points, uint pointsCount, ID2D1SvgPointCollection *pointCollection);
    HRESULT CreateStrokeDashArray(const D2D1_SVG_LENGTH *dashes, uint dashesCount, ID2D1SvgStrokeDashArray *strokeDashArray);
    HRESULT Deserialize(IStream *inputXmlStream, ID2D1SvgElement *subtree);
    HRESULT FindElementById(const wchar *id, ID2D1SvgElement *svgElement);
    void GetRoot(ID2D1SvgElement *root);
    D2D1_SIZE_F GetViewportSize();
    HRESULT Serialize(IStream *outputXmlStream, ID2D1SvgElement subtree = null);
    HRESULT SetRoot(ID2D1SvgElement root);
    HRESULT SetViewportSize(D2D1_SIZE_F viewportSize);
}
