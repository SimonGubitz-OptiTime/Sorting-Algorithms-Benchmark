unit clrHeap;

interface

uses
  Math,
  SysUtils;

type
  THeapType = (MAX_HEAP, MIN_HEAP);
  THeap = class
    private
      FSize: Integer;
      FItems: TArray<Integer>; // TODO: Change this to a TBenchmarkArray to still capture access data


      // procedure IncreaseKey();
      // procedure DecreaseKey();

      procedure SiftUp(ANdx: Integer);
      procedure SiftDown(ANdx: Integer);

      function GetParentIndex(ANdx: Integer): Integer;
      function GetLeftIndex(ANdx: Integer): Integer;
      function GetRightIndex(ANdx: Integer): Integer;

    public
      constructor Create(AList: TArray<Integer>; AType: THeapType = THeapType.MAX_HEAP);
      destructor  Destroy();

      procedure heapify(AList: TArray<Integer>; ASize: Integer; ANdx: Integer; AType: THeapType = THeapType.MAX_HEAP);

      procedure Push(ANodeVal: Integer);
      procedure Pop(ANdx: Integer);

      function  GetIsEmpty(): Boolean;

      property Size: Integer read FSize;
      property IsEmpty: Boolean read GetIsEmpty;

      property AsArray: TArray<Integer> read FItems;
  end;

implementation

constructor THeap.Create(AList: TArray<Integer>; AType: THeapType = THeapType.MAX_HEAP);
var
  leaf_start, leaves_size: Integer;
  size: Integer;
  Ndx: Integer;
begin
  FSize := Length(AList);
  SetLength(FItems, FSize);

  // leaves -> arr[Floor(size/2) + 1] to arr[size]
  size := Length(AList);
  leaf_start := Floor(size/2) + 1;
  leaves_size := leaf_start - (size - 1);
  for Ndx := leaves_size - 1 downto 0 do
  begin
    heapify(AList, size, Ndx);
  end;

  inherited Create;
end;

destructor THeap.Destroy();
begin
  inherited Destroy;
end;

procedure THeap.heapify(AList: TArray<Integer>; ASize: Integer; ANdx: Integer; AType: THeapType = THeapType.MAX_HEAP);
var
  Ndx: Integer;
  l, r, largest: Integer;
  size: Integer;
  temp: Integer;
begin

  size := Length(AList) - 1;
  l := GetLeftIndex(ANdx);
  r := GetRightIndex(ANdx);

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

  if ( largest = ANdx ) then
  begin
    temp := AList[ANdx];
    AList[ANdx] := AList[largest];
    AList[largest] := AList[ANdx];

    heapify(AList, size, largest, AType);
  end;

end;

procedure THeap.Push(ANodeVal: Integer);
var
  CurrentNdx, ParentNdx: Integer;
begin
  SetLength(FItems, Length(FItems) + 1);
  CurrentNdx := High(FItems);
  ParentNdx := Floor((CurrentNdx - 1) / 2);
  FItems[CurrentNdx] := ANodeVal;

  while FItems[CurrentNdx] > FItems[ParentNdx] do
  begin
    SiftUp(CurrentNdx);
  end;
end;

procedure THeap.SiftUp(ANdx: Integer);
var
  ParentNdx: Integer;
  Swap: Integer;
begin
  ParentNdx := Floor((ANdx - 1) / 2);
  Swap := FItems[ParentNdx];
  FItems[ParentNdx] := FItems[ANdx];
  FItems[ANdx] := Swap;
end;

procedure THeap.SiftDown(ANdx: Integer);
var
  ChildNdx: Integer;
  Swap: Integer;
begin
  
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

procedure THeap.Pop(ANdx: Integer);
begin
  // is
end;

function THeap.GetIsEmpty(): Boolean;
begin
  Result := false;
  if ( Size = 0 ) then
  begin
    Result := true;
  end;
end;


end.
