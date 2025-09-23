unit uQuicksort;

interface

uses
  Generics.Collections,
  Math,
  SysUtils,
  clrBenchmarkArray;

function concat(AConcatList: TArray<TArray<Integer>>): TArray<Integer>;
function Quicksort(AList: TBenchmarkArray): TArray<Integer>;

implementation

function concat(AConcatList: TArray<TArray<Integer>>): TArray<Integer>;
var
  Ndx, Ndx2, TotalLength, Pos: Integer;
begin
  // First, calculate the total length of the resulting array
  TotalLength := 0;
  for Ndx := 0 to Length(AConcatList) - 1 do
    Inc(TotalLength, Length(AConcatList[Ndx]));

  SetLength(Result, TotalLength);

  // Fill the result array
  Pos := 0;
  for Ndx := 0 to Length(AConcatList) - 1 do
    for Ndx2 := 0 to Length(AConcatList[Ndx]) - 1 do
    begin
      Result[Pos] := AConcatList[Ndx][Ndx2];
      Inc(Pos);
    end;
end;

function Quicksort(AList: TBenchmarkArray): TArray<Integer>;
var
  I, Pivot: Integer;
  Left, Right: TArray<Integer>;
  RightBenchmarkArray, LeftBenchmarkArray: TBenchmarkArray;
  temp, swap: Integer;
begin

  if ( AList.Count <= 1 ) then
  begin
    Result := AList.AsArray;
    Exit;
  end;

  // Pivot := AList[Floor(High(AList) / 2)];
  Pivot := AList.Count - 1;

  // 1. Mit Pivot Sortieren
  // 2. In > & < Gruppen aufteilen (Partitionieren)
  // 3. Rekursiv diese Gruppen mit dessen Pivot sortieren

  // 1.
  swap := -1;
  for I := 0 to AList.Count - 1 do
  begin
    if ( AList[I] < AList[Pivot] ) then
    begin
      Inc(swap);
      temp := AList[I];
      AList[I] := AList[swap];
      AList[swap] := temp;
    end;
  end;

  // swap the pivot
  Inc(swap);
  temp := AList[Pivot];
  AList[Pivot] := AList[swap];
  AList[swap] := temp;
  Pivot := swap;

  // 2.
  SetLength(Left, Pivot); // pivot excluded
  for I := 0 to Pivot - 1 do
    Left[I] := AList[I];

  // Right (elements after pivot)
  SetLength(Right, AList.Count - Pivot - 1); // pivot excluded
  for I := Pivot + 1 to AList.Count - 1 do
    Right[I - Pivot - 1] := AList[I]; // shift index to 0

  // 3.
  LeftBenchmarkArray := TBenchmarkArray.Create(Left);
  RightBenchmarkArray := TBenchmarkArray.Create(Right);
  try
    Result := concat( [Quicksort(LeftBenchmarkArray), [AList[Pivot]], Quicksort(RightBenchmarkArray)] );
  finally
    LeftBenchmarkArray.Free;
    RightBenchmarkArray.Free;
  end;
end;


end.
