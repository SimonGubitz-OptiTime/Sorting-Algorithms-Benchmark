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


      function GetParentIndex(ANdx: Integer): Integer;
      function GetLeftIndex(ANdx: Integer): Integer;
      function GetRightIndex(ANdx: Integer): Integer;

    public
      constructor Create(AList: TArray<Integer>; AType: THeapType = THeapType.MAX_HEAP); overload;
      constructor Create(AList: TBenchmarkArray; AType: THeapType = THeapType.MAX_HEAP); overload;
      destructor  Destroy();

      procedure heapify(AList: TBenchmarkArray; ASize: Integer; ANdx: Integer; AType: THeapType = THeapType.MAX_HEAP);
      function  GetAsArray():  TArray<Integer>;

      property Size: Integer read FSize;
      property AsArray: TArray<Integer> read GetAsArray;
  end;

implementation

constructor THeap.Create(AList: TArray<Integer>; AType: THeapType = THeapType.MAX_HEAP);
var
  Ndx: Integer;
begin
  FItems := TBenchmarkArray.Create([]);
  FSize := Length(AList) + 1;
  FItems.SetCapacity(FSize);
  FItems[0] := 0;
  for Ndx := 1 to FSize -1 do
  begin
    FItems[Ndx] := AList[Ndx - 1];
  end;


  // leaves -> arr[Floor(size/2) + 1] to arr[size]
  for Ndx := Floor(FSize/2) downto 1 do // ignore the leaves
  begin
    heapify(FItems, FSize, Ndx);
  end;

  inherited Create;
end;

constructor THeap.Create(AList: TBenchmarkArray; AType: THeapType = THeapType.MAX_HEAP);
var
  Ndx: Integer;
begin
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
    heapify(FItems, FSize, Ndx);
  end;

  inherited Create;
end;

destructor THeap.Destroy();
begin
  inherited Destroy;
end;

procedure THeap.heapify(AList: TBenchmarkArray; ASize: Integer; ANdx: Integer; AType: THeapType = THeapType.MAX_HEAP);
var
  Ndx: Integer;
  l, r, largest: Integer;
  size: Integer;
  temp: Integer;
begin

  size := AList.Count - 1;
  l := GetLeftIndex(ANdx);
  r := GetRightIndex(ANdx);
  largest := ANdx;

  if ( (l < size)
    and (AList[l] > AList[ANdx]) ) then
  begin
    largest := l;
  end;

  if ( (r < size)
    and (AList[r] > AList[largest]) ) then
  begin
    largest := r;
  end;

  if ( largest <> ANdx ) then
  begin
    temp := AList[ANdx];
    AList[ANdx] := AList[largest];
    AList[largest] := temp;

    heapify(AList, size, largest, AType);
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
begin
  Result := Copy(FItems.AsArray, 1, FItems.Count - 1);
end;


end.
