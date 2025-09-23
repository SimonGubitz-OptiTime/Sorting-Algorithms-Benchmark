program Test;

uses
  Generics.Collections,
  SysUtils,
  clrBenchmark,
  uBubblesort,
  uHeapsort,
  uInsertionSort,
  uMergesort,
  uQuicksort,
  uSelectionSort;

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

procedure FillArrRandom(var AList: TArray<Integer>; ALength: Integer; maxVal: Integer = 9; allowZero: Boolean = false);
var Ndx: Integer;
begin
  SetLength(AList, ALength);
  for Ndx := 0 to ALength - 1 do
  begin
    AList[High(AList)] := Random(maxVal);
    if ( not(allowZero) ) then
    begin
      while AList[Ndx] = 0 do
        AList[Ndx] := Random(maxVal);
    end;
  end;
end;

procedure FillArrExample(var AList: TArray<Integer>);
begin
  SetLength(AList, 9);
  AList[0] := 8;
  AList[1] := 2;
  AList[2] := 4;
  AList[3] := 7;
  AList[4] := 1;
  AList[5] := 3;
  AList[6] := 9;
  AList[7] := 6;
  AList[8] := 5;
end;

function concat(AConcatList: TArray<TArray<Integer>>): TArray<Integer>;
var
  Ndx, Ndx2, TotalLength, Pos: Integer;
begin
  // First, calculate the total length of the resulting array
  TotalLength := 0;
  for Ndx := 0 to Length(AConcatList) - 1 do
    Inc(TotalLength, Length(AConcatList[Ndx]));

  SetLength(Result, TotalLength);

  // Fill the result array
  Pos := 0;
  for Ndx := 0 to Length(AConcatList) - 1 do
    for Ndx2 := 0 to Length(AConcatList[Ndx]) - 1 do
    begin
      Result[Pos] := AConcatList[Ndx][Ndx2];
      Inc(Pos);
    end;
end;

var
  copy, bubble, nums: TArray<Integer>;
  Benchmark: TBenchmark;
const
  NumLength: Integer = 10000;
  MaxVal: Integer = 100;
  AllowZero: Boolean = false;
begin

  FillArrRandom(nums, NumLength, MaxVal, AllowZero);
  bubble := nums;
  copy := nums;

  Benchmark := TBenchmark.Create;
  try
    Benchmark.RunBenchmark(nums, Quicksort);
    // Benchmark.DisplayResults();
    WriteLn('-- Quicksort --');
    WriteLn('- For ' + IntToStr(Length(nums)) + ' Elements');
    WriteLn('- Time: ' + IntToStr(Benchmark.TimeSpent) + 'ms');
    WriteLn('- Read Accesses: ' + IntToStr(Benchmark.ReadArrayAccess));
    WriteLn('- Write Accesses: ' + IntToStr(Benchmark.WriteArrayAccess));
    WriteLn('- Total Array Accesses: ' + IntToStr(Benchmark.TotalArrayAccess));
  finally
    Benchmark.Free;
  end;
end.
