unit uBubblesort;

interface

uses
  SysUtils,
  Generics.Collections,
  clrBenchmarkArray;


// function Bubblesort(var AList: List<Integer>);
function Bubblesort(AList: TBenchmarkArray): TArray<Integer>;

implementation

function Bubblesort(AList: TBenchmarkArray): TArray<Integer>;
var
  I, J, temp, Neighbor: Integer;
begin

  for I := 0 to AList.Count - 1 do
  begin
    for J := AList.Count - 2 downto I do
    begin
      if ( AList[J] > AList[J + 1] ) then
      begin
        temp := AList[J + 1];
        AList[J + 1] := AList[J];
        AList[J] := temp;
      end;
    end;
  end;

  Result := AList.AsArray;
end;

end.
