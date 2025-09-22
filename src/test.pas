program Test;

uses
  SysUtils,
  uSelectionSort,
  uInsertionSort,
  uBubblesort;

function ArrToStr(AList: TArray<Integer>): String;
var Ndx: Integer;
begin
  Result := '';
  for Ndx := 0 to Length(AList) - 1 do
  begin
    if Ndx > 0 then
      Result := Result + ', ';

    Result := Result + IntToStr(AList[Ndx]);
  end;
end;

procedure FillArrRandom(var AList: TArray<Integer>; maxVal: Integer = 9; allowZero: Boolean = false);
var Ndx: Integer;
begin
  for Ndx := 0 to Length(AList) - 1 do
  begin
    AList[Ndx] := Random(maxVal);
    if ( not(allowZero) ) then
    begin
      while AList[Ndx] = 0 do
        AList[Ndx] := Random(maxVal);
    end;
  end;
end;

var
  nums: TArray<Integer>;
  sorted: TArray<Integer>;
  timeStart, timeEnd: QWord;
begin

  SetLength(nums, Random(100));

  WriteLn('Length is: ' + IntToStr(Length(nums)));
  FillArrRandom(nums, 91, false);


  WriteLn('Before: ' + ArrToStr(nums));

  timeStart := GetTickCount64;
  sorted := SelectionSort(nums);
  timeEnd := GetTickCount64;

  WriteLn('sorted: ' + ArrToStr(sorted));
  WriteLn('took ' + IntToStr(timeEnd - timeStart) + 'ms');

end.
