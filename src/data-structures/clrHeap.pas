unit clrHeap;

interface

uses
  Math,
  SysUtils,
  clrBenchmarkArray;

type
  THeapType = (MAX_HEAP, MIN_HEAP);
  THeap = class
    private
      FSize: Integer;
      FItems: TBenchmarkArray;
      FHeapType: THeapType;

      const nil_symbolizer: Integer = -12983;

      function  GetParentIndex(ANdx: Integer): Integer;
      function  GetLeftIndex(ANdx: Integer): Integer;
      function  GetRightIndex(ANdx: Integer): Integer;

    public
      constructor Create(AList: TArray<Integer>; AType: THeapType = THeapType.MAX_HEAP); overload;
      constructor Create(AList: TBenchmarkArray; AType: THeapType = THeapType.MAX_HEAP); overload;
      destructor  Destroy(); reintroduce;

      procedure Swap(ANdx1, ANdx2: Integer);
      procedure SiftDown(ASize: Integer; ANdx: Integer; AType: THeapType = THeapType.MAX_HEAP);
      // procedure SiftUp(AList: TBenchmarkArray);


      function  GetAsArray():  TArray<Integer>;

      property Size: Integer read FSize;
      property AsArray: TArray<Integer> read GetAsArray;
      property HeapType: THeapType read FHeapType;
  end;

implementation

constructor THeap.Create(AList: TArray<Integer>; AType: THeapType = THeapType.MAX_HEAP);
var
  Ndx: Integer;
begin
  FHeapType := AType;
  FItems := TBenchmarkArray.Create([]);
  FSize := Length(AList) + 1;
  FItems.SetCapacity(FSize);
  FItems[0] := nil_symbolizer; // so the root is at 1 and the
  for Ndx := 1 to FSize - 1 do
  begin
    FItems[Ndx] := AList[Ndx - 1];
  end;


  // leaves -> arr[Floor(size/2) + 1] to arr[size]
  for Ndx := Floor(FSize/2) downto 1 do // ignore the leaves
  begin
    SiftDown(FSize, Ndx);
  end;

  inherited Create;
end;

constructor THeap.Create(AList: TBenchmarkArray; AType: THeapType = THeapType.MAX_HEAP);
var
  Ndx: Integer;
begin
  FHeapType := AType;
  FItems := TBenchmarkArray.Create([]);
  FSize := AList.Count + 1;
  FItems.SetCapacity(FSize);
  FItems[0] := 0;
  for Ndx := 1 to FSize -1 do
  begin
    FItems[Ndx] := AList[Ndx - 1];
  end;


  // leaves -> arr[Floor(size/2) + 1] to arr[size]
  for Ndx := Floor(FSize/2) downto 1 do // ignore the leaves
  begin
    SiftDown(FSize, Ndx);
  end;

  inherited Create;
end;

destructor THeap.Destroy();
begin
  inherited Destroy;
end;

procedure THeap.Swap(ANdx1, ANdx2: Integer);
var
  temp: Integer;
begin
  temp := FItems[ANdx1];
  FItems[ANdx1] := FItems[ANdx2];
  FItems[ANdx2] := temp;
end;

procedure THeap.SiftDown(ASize: Integer; ANdx: Integer; AType: THeapType = THeapType.MAX_HEAP);
var
  l, r, largest: Integer;
begin

  l := GetLeftIndex(ANdx);
  r := GetRightIndex(ANdx);
  largest := ANdx;

  if ( (l < ASize)
    and (FItems[l] > FItems[ANdx]) ) then
  begin
    largest := l;
  end;

  if ( (r < ASize)
    and (FItems[r] > FItems[largest]) ) then
  begin
    largest := r;
  end;

  if ( largest <> ANdx ) then
  begin
    Swap(ANdx, largest);
    SiftDown(ASize, largest, AType);
  end;

end;

function THeap.GetParentIndex(ANdx: Integer): Integer;
begin
  Result := Floor(ANdx/2);
end;

function THeap.GetLeftIndex(ANdx: Integer): Integer;
begin
  Result := 2 * ANdx;
end;

function THeap.GetRightIndex(ANdx: Integer): Integer;
begin
  Result := 2 * ANdx + 1;
end;

function THeap.GetAsArray(): TArray<Integer>;
var
  Ndx, Ndx2: Integer;
begin
  Ndx2 := 0;
  SetLength(Result, FItems.Count - 1);
  for Ndx := 0 to Length(Result) - 1 do
  begin
    if ( FItems[Ndx] <> nil_symbolizer ) then
    begin
      Result[Ndx2] := FItems[Ndx];
      Inc(Ndx2);
    end;
  end;
end;


end.
