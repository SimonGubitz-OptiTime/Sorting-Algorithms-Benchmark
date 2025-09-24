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
  NewList: TArray<Integer>;
  iLeft, iRight, k: Integer;  // <--- added indices

begin
  ConcatLength := Length(ALeft) + Length(ARight);
  SetLength(NewList, ConcatLength);

  Result := TBenchmarkArray.Create(NewList);

  iLeft := 0;
  iRight := 0;
  k := 0;

  while (iLeft < Length(ALeft)) and (iRight < Length(ARight)) do
  begin
    if ALeft[iLeft] <= ARight[iRight] then
    begin
      Result[k] := ALeft[iLeft];
      Inc(iLeft);
    end
    else
    begin
      Result[k] := ARight[iRight];
      Inc(iRight);
    end;
    Inc(k);
  end;


  // copy any remaining elements
  while iLeft < Length(ALeft) do
  begin
    Result[k] := ALeft[iLeft];
    Inc(iLeft);
    Inc(k);
  end;

  while iRight < Length(ARight) do
  begin
    Result[k] := ARight[iRight];
    Inc(iRight);
    Inc(k);
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
  LeftBenchmarkArray := TBenchmarkArray.Create(Left);
  for Ndx := 0 to Half - 1 do
  begin
    LeftBenchmarkArray[Ndx] := AList[Ndx];
  end;

  SetLength(Right, AList.Count - Half - 1);
  RightBenchmarkArray := TBenchmarkArray.Create(Right);
  for Ndx := Half + 1 to AList.Count - 1 do
  begin
    RightBenchmarkArray[Ndx - Half - 1] := AList[Ndx];
  end;


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
