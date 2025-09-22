unit uBubblesort;

interface

uses
  SysUtils;
  // System.Generics.Collections;


// function Bubblesort(var AList: List<Integer>);
function Bubblesort(AList: TArray<Integer>): TArray<Integer>;

implementation

// function Bubblesort(var AList: List<Integer>);
function Bubblesort(AList: TArray<Integer>): TArray<Integer>;
var
  I, J, temp, Neighbor: Integer;
begin

  Result := AList;

  for I := 0 to Length(Result) - 1 do
  begin
    for J := Length(Result) - 2 downto I do
    begin
      if ( Result[J] > Result[J + 1] ) then
      begin
        temp := Result[J + 1];
        Result[J + 1] := Result[J];
        Result[J] := temp;
      end;
    end;
  end;
end;

end.
