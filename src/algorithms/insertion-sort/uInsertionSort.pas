unit uInsertionSort;

interface

uses
  SysUtils,
  Generics.Collections,
  clrBenchmarkArray;


// procedure InsertionSort(var AList: TArray<Integer>);
function InsertionSort(AList: TBenchmarkArray): TArray<Integer>;

implementation

function InsertionSort(AList: TBenchmarkArray): TArray<Integer>;
var
  Ndx, key, j: Integer;
begin
  for Ndx := 1 to AList.Count -1  do
  begin
    key := AList[Ndx];
    j := Ndx - 1;

    while ( (j >= 0)
      and (key < AList[j]) ) do
    begin
      AList[j + 1] := AList[j];
      j := j - 1;
    end;

    AList[j + 1] := key;
  end;

  Result := AList.AsArray;

end;


end.
