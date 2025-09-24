unit uSelectionSort;

interface

uses
  SysUtils,
  Generics.Collections,
  clrBenchmarkArray,
  uTypes;


// function SelectionSort(var AList: List<Integer>);
function SelectionSort(AList: TBenchmarkArray): TArray<Integer>;

implementation

// function SelectionSort(var AList: List<Integer>);
function SelectionSort(AList: TBenchmarkArray): TArray<Integer>;
var
  I, J: ArrIterator;
  MinNdx: ArrIterator;
  Temp: Integer;
begin
  MinNdx := 0;

  for I := 0 to AList.Count - 1 do
  begin
    // search the MinNdx
    MinNdx := I;

    for J := I to AList.Count - 1 do
    begin
      if (AList[J] < AList[MinNdx]) then
      begin
        MinNdx := J;
      end;
    end;

    if ( AList[MinNdx] < AList[I] ) then
    begin
      Temp := AList[MinNdx];
      AList[MinNdx] := AList[I];
      AList[I] := Temp;
    end;
  end;

  Result := AList.AsArray;

end;

end.
