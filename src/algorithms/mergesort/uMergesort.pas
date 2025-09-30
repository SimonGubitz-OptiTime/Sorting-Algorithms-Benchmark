unit uMergesort;

interface

uses
  SysUtils,
  Math,
  clrBenchmarkArray,
  uTypes;

function Merge(ALeft: TBenchmarkArray; ARight: TBenchmarkArray): TBenchmarkArray;
function Mergesort(AList: TBenchmarkArray): TArray<Integer>;

implementation

function Merge(ALeft: TBenchmarkArray; ARight: TBenchmarkArray): TBenchmarkArray;
var
  Ndx: TArrIterator;
  LeftNdx: TArrIterator;
  RightNdx: TArrIterator;
  ConcatLength: Integer;
  NewList: TArray<Integer>;

begin
  ConcatLength := ALeft.Count + ARight.Count;
  SetLength(NewList, ConcatLength);

  Result := TBenchmarkArray.Create(NewList);

  LeftNdx := 0;
  RightNdx := 0;
  Ndx := 0;

  while (LeftNdx < ALeft.Count) and (RightNdx < ARight.Count) do
  begin
    if ALeft[LeftNdx] <= ARight[RightNdx] then
    begin
      Result[Ndx] := ALeft[LeftNdx];
      Inc(LeftNdx);
    end
    else
    begin
      Result[Ndx] := ARight[RightNdx];
      Inc(RightNdx);
    end;
    Inc(Ndx);
  end;


  // copy any remaining elements
  while LeftNdx < ALeft.Count do
  begin
    Result[Ndx] := ALeft[LeftNdx];
    Inc(LeftNdx);
    Inc(Ndx);
  end;

  while RightNdx < ARight.Count do
  begin
    Result[Ndx] := ARight[RightNdx];
    Inc(RightNdx);
    Inc(Ndx);
  end;

end;

function Mergesort(AList: TBenchmarkArray): TArray<Integer>;
var
  Ndx, Half: TArrIterator;
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
  LeftBenchmarkArray := TBenchmarkArray.Create(Left);
  SetLength(Right, AList.Count - Half);
  RightBenchmarkArray := TBenchmarkArray.Create(Right);
  try
    for Ndx := 0 to Half - 1 do
    begin
      LeftBenchmarkArray[Ndx] := AList[Ndx];
    end;

    for Ndx := Half to AList.Count - 1 do
    begin
      RightBenchmarkArray[Ndx - Half] := AList[Ndx];
    end;

    LeftBenchmarkArray.FromArray(Mergesort(LeftBenchmarkArray));
    RightBenchmarkArray.FromArray(Mergesort(RightBenchmarkArray));

    Result := Merge(LeftBenchmarkArray, RightBenchmarkArray).AsArray;

  finally
    LeftBenchmarkArray.Free;
    RightBenchmarkArray.Free;
  end;


end;


end.
