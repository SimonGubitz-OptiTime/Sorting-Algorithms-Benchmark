unit uInsertionSort;

interface

uses
  SysUtils,
  Generics.Collections,
  clrBenchmarkArray,
  uTypes;


// procedure InsertionSort(var AList: TArray<Integer>);
function InsertionSort(AList: TBenchmarkArray): TArray<Integer>;

implementation

function InsertionSort(AList: TBenchmarkArray): TArray<Integer>;
var
  Ndx, Ndx2: TArrIterator;
  Key: Integer;
begin
  for Ndx := 1 to AList.Count -1  do
  begin
    Key := AList[Ndx];
    Ndx2 := Ndx - 1;

    while ( (Ndx2 >= 0)
      and (Key < AList[Ndx2]) ) do
    begin
      AList[Ndx2 + 1] := AList[Ndx2];
      Ndx2 := Ndx2 - 1;
    end;

    AList[Ndx2 + 1] := Key;
  end;

  Result := AList.AsArray;

end;


end.
