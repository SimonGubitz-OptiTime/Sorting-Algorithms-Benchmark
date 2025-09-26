unit clrHeap;

interface

uses
  SysUtils,
  Vcl.Dialogs;

type
  THeapType = (MAX_HEAP, MIN_HEAP);
  THeap = class
    private
      FSize: Integer;
      FItems: TArray<Integer>; // TODO: Change this to a TBenchmarkArray to still capture access data


      // function  GetLevelStartNdx(ALevel: Integer): Integer;

    public
      constructor Create(AFirstVal: Integer; AType: THeapType = THeapType.MAX_HEAP);
      destructor  Destroy();

      class function heapify(AList: TArray<Integer>; AType: THeapType = THeapType.MAX_HEAP): THeap;

      procedure AddNode(ANodeVal: Integer);
      procedure RemoveNode();

      procedure TrimExcess();

      function  GetLast(): Integer;
      procedure SetLast(ANew: Integer);

      property Size: Integer read FSize;
      property Last: Integer read GetLast write SetLast;
      property AsArray: TArray<Integer> read FItems;
  end;

implementation

constructor THeap.Create(AFirstVal: Integer; AType: THeapType = THeapType.MAX_HEAP);
begin
  FSize := 1;

  SetLength(FItems, 1);
  FItems[0] := AFirstVal;

  inherited Create;
end;

destructor THeap.Destroy();
begin
  inherited Destroy;
end;

class function THeap.heapify(AList: TArray<Integer>; AType: THeapType = THeapType.MAX_HEAP): THeap;
var
  Ndx: Integer;
  max_val: Integer;
  Ndx2: Integer;
begin
  max_val := 0;

  if ( AType = THeapType.MAX_HEAP ) then
  begin

    for Ndx := 0 to Length(AList) - 1 do
    begin
      if ( AList[Ndx] > max_val ) then
      begin
        max_val := AList[Ndx];
      end;
    end;

    // Remove max_val from the List
    for Ndx := 0 to Length(AList) - 1 do
    begin
      if ( AList[Ndx] = max_val ) then
      begin

        for Ndx2 := Ndx + 1 to Length(AList) - 1 do
        begin
          AList[Ndx2 - 1] := AList[Ndx2];
        end;

        SetLength(AList, Length(AList)-1);
        break;
      end;
    end;


    Result := THeap.Create(max_val); // 9

    for Ndx := 1 to Length(AList) - 1 do
    begin
      Result.AddNode(AList[Ndx]); //
    end;

  end;
end;

procedure THeap.AddNode(ANodeVal: Integer);
var
  Ndx: Integer;
  temp: Integer;
  FoundPlace: Boolean;
begin

  FoundPlace := false;


  Ndx := 0;
  // TODO: Change dependant on Type max or min-heap
  while ( Ndx < FSize ) do
  begin
    if ( ANodeVal > FItems[Ndx] ) then
    begin

      ShowMessage(IntToStr(Ndx) + '. Switching ' + IntToStr(FItems[Ndx]) + ' and ' + IntToStr(ANodeVal));
      temp := FItems[Ndx];
      FItems[Ndx] := ANodeVal;
      AddNode(temp);

      FoundPlace := true;
      break;
    end;
    Inc(Ndx);
  end;

  if ( not(FoundPlace) ) then
  begin
    Inc(FSize);
    SetLength(FItems, FSize);
    FItems[High(FItems)] := ANodeVal;
  end;

  // Last := ANodeVal;

end;

procedure THeap.RemoveNode();
begin
  // is
end;

function THeap.GetLast(): Integer;
begin
  Result := FItems[FSize - 1];
end;

procedure THeap.SetLast(ANew: Integer);
begin
  FItems[FSize - 1] := ANew;
end;

procedure THeap.TrimExcess();
begin
  SetLength(FItems, FSize);
end;


end.
