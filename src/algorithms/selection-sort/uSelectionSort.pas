unit uSelectionSort;

interface

uses
  SysUtils;
  // System.Generics.Collections;


// function SelectionSort(var AList: List<Integer>);
function SelectionSort(AList: TArray<Integer>): TArray<Integer>;

implementation

// function SelectionSort(var AList: List<Integer>);
function SelectionSort(AList: TArray<Integer>): TArray<Integer>;
var
  I, J: Integer;
  minNdx: Integer;
  temp: Integer;
begin
  minNdx := 0;

  Result := AList;

  for I := 0 to Length(Result) - 1 do
  begin
    // search the minNdx
    minNdx := I;

    for J := I to Length(Result) - 1 do
    begin
      if (Result[J] < Result[minNdx]) then
      begin
        minNdx := J;
      end;
    end;

    if ( Result[minNdx] < Result[I] ) then
    begin
      WriteLn('now changing at index: ' + IntToStr(minNdx) + ' from: ' + IntToStr(Result[I]) + ' to: ' + IntToStr(Result[minNdx]));
      temp := Result[minNdx];
      Result[minNdx] := Result[I];
      Result[I] := temp;
    end;

  end;
end;

end.
