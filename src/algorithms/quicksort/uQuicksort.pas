unit uQuicksort;

interface

uses
  Math;

function Quicksort(AList: TArray<Integer>): TArray<Integer>;

implementation

function Quicksort(AList: TArray<Integer>): TArray<Integer>;
var
  I, J, Pivot: Integer;
  LeftList: TArray<Integer>;
  RightList: TArray<Integer>;
begin

  Result := AList;

  Pivot := Floor(Length(Result) / 2);


  for I := 0 to Length(Result) -1 do
  begin

    if ( Result[I] > Result[Pivot] ) then
    begin
      SetLength(LeftList, Length(LeftList) + 1);
      LeftList[High(LeftList)] := Result[I];
    end
    else
    begin
      SetLength(RightList, Length(RightList) + 1);
      RightList[High(RightList)] := Result[I];
    end;

  end;


  Quicksort(LeftList);
  Quicksort(RightList);

end;


end.
