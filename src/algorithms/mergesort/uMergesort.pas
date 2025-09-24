unit uMergesort;

interface

uses
  SysUtils,
  Math,
  clrBenchmarkArray,
  uTypes;

function Merge(ALeft: TArray<Integer>; ARight: TArray<Integer>): TBenchmarkArray;
function Mergesort(AList: TBenchmarkArray): TArray<Integer>;

implementation

function Merge(ALeft: TArray<Integer>; ARight: TArray<Integer>): TBenchmarkArray;
var
  Ndx: ArrIterator;
  LeftNdx: ArrIterator;
  RightNdx: ArrIterator;
  ConcatLength: Integer;
  Reducer: Integer;
  NewList: TArray<Integer>;
begin
  Reducer := 0;

  ConcatLength := Length(ALeft) + Length(ARight);
  SetLength(NewList, ConcatLength);

  Result := TBenchmarkArray.Create(NewList);

  LeftNdx := 0;
  RightNdx := 0;
  for Ndx := 0 to ConcatLength - 1 do
  begin
    if ( Ndx < Length(ALeft) ) then
    begin
      Result[Ndx] := ALeft[LeftNdx];
      Inc(LeftNdx);
    end;

    if ( Ndx < Length(ARight) ) then
    begin
      Result[Ndx] := ARight[RightNdx];
      Inc(RightNdx);
    end;
  end;

end;

function Mergesort(AList: TBenchmarkArray): TArray<Integer>;
var
  Ndx, Half: ArrIterator;
  Left, Right: TArray<Integer>;
  LeftBenchmarkArray, RightBenchmarkArray: TBenchmarkArray;
begin
  if (AList.Count <= 1) then
  begin
    Result := AList.AsArray;
    Exit;
  end;

  Half := Floor(AList.Count / 2);
  SetLength(Left, Half);
  for Ndx := 0 to Half - 1 do
  begin
    Left[Ndx] := AList[Ndx];
  end;

  SetLength(Right, AList.Count - Half - 1);
  for Ndx := Half + 1 to AList.Count - 1 do
  begin
    Right[Ndx - Half - 1] := AList[Ndx];
  end;

  // Result := Right;
  // Exit;


  LeftBenchmarkArray := TBenchmarkArray.Create(Left);
  RightBenchmarkArray := TBenchmarkArray.Create(Right);
  try
    Mergesort(LeftBenchmarkArray);
    Mergesort(RightBenchmarkArray);

    Result := Merge(LeftBenchmarkArray.AsArray, RightBenchmarkArray.AsArray).AsArray;

  finally
    LeftBenchmarkArray.Free;
    RightBenchmarkArray.Free;
  end;


end;


end.
