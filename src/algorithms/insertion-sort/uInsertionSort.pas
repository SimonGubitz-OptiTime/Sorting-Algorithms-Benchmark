unit uInsertionSort;

interface

uses
  SysUtils;
  // System.Generics.Collections;


// procedure InsertionSort(var AList: TList<Integer>);
function InsertionSort(AList: TArray<Integer>): TArray<Integer>;

implementation

// procedure InsertionSort(var AList: TList<Integer>);
function InsertionSort(AList: TArray<Integer>): TArray<Integer>;
var
  Ndx, key, j: Integer;
begin

  Result := AList;

  for Ndx := 1 to Length(Result) -1  do
  begin
    key := Result[Ndx];
    j := Ndx - 1;

    while ( (j >= 0)
      and (key < Result[j]) ) do
    begin
      Result[j + 1] := Result[j];
      j := j - 1;
    end;

    Result[j + 1] := key;
  end;
end;

end.
