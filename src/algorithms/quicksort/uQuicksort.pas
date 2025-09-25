unit uQuicksort;

interface

uses
  Generics.Collections,
  Math,
  SysUtils,
  clrBenchmarkArray,
  uTypes;

function concat(AConcatList: TArray<TArray<Integer>>): TArray<Integer>;
function Quicksort(AList: TBenchmarkArray): TArray<Integer>;

implementation

function concat(AConcatList: TArray<TArray<Integer>>): TArray<Integer>;
var
  Ndx, Ndx2, TotalLength, Pos: Integer;
begin
  Result := nil;

  TotalLength := 0;
  for Ndx := 0 to Length(AConcatList) - 1 do
  begin
    Inc(TotalLength, Length(AConcatList[Ndx]));
  end;

  SetLength(Result, TotalLength);

  Pos := 0;
  for Ndx := 0 to Length(AConcatList) - 1 do
  begin
    for Ndx2 := 0 to Length(AConcatList[Ndx]) - 1 do
    begin
      Result[Pos] := AConcatList[Ndx][Ndx2];
      Inc(Pos);
    end;
  end;
end;

function Quicksort(AList: TBenchmarkArray): TArray<Integer>;
var
  Ndx, PivotNdx: TArrIterator;
  SwapNdx: Integer;
  Left, Right: TArray<Integer>;
  RightBenchmarkArray, LeftBenchmarkArray: TBenchmarkArray;
  temp: Integer;
begin


  if ( AList.Count <= 1 ) then
  begin
    Result := AList.AsArray;
    Exit;
  end;

  // PivotNdx := AList[Floor(High(AList) / 2)];
  PivotNdx := AList.Count - 1;

  // 1. Mit PivotNdx Sortieren
  // 2. In > & < Gruppen aufteilen (Partitionieren)
  // 3. Rekursiv diese Gruppen mit dessen PivotNdx sortieren

  // 1.
  SwapNdx := -1;
  for Ndx := 0 to AList.Count - 1 do
  begin
    if ( AList[Ndx] < AList[PivotNdx] ) then
    begin
      Inc(SwapNdx);
      temp := AList[Ndx];
      AList[Ndx] := AList[SwapNdx];
      AList[SwapNdx] := temp;
    end;
  end;

  // SwapNdx the PivotNdx
  Inc(SwapNdx);
  temp := AList[PivotNdx];
  AList[PivotNdx] := AList[SwapNdx];
  AList[SwapNdx] := temp;
  PivotNdx := SwapNdx;

  // 2.
  SetLength(Left, PivotNdx);
  SetLength(Right, AList.Count - PivotNdx - 1);
  LeftBenchmarkArray := TBenchmarkArray.Create(Left);
  RightBenchmarkArray := TBenchmarkArray.Create(Right);
  try
    if ( PivotNdx > 0 ) then
    begin
      for Ndx := 0 to PivotNdx - 1 do
      begin
        LeftBenchmarkArray[Ndx] := AList[Ndx];
      end;
    end;

    if ( PivotNdx < AList.Count - 1 ) then
    begin
      for Ndx := PivotNdx + 1 to AList.Count - 1 do
      begin
        RightBenchmarkArray[Ndx - PivotNdx - 1] := AList[Ndx];
      end;
    end;

    // 3.
    Result := concat( [Quicksort(LeftBenchmarkArray), [AList[PivotNdx]], Quicksort(RightBenchmarkArray)] );
  finally
    LeftBenchmarkArray.Free;
    RightBenchmarkArray.Free;
  end;
end;


end.
