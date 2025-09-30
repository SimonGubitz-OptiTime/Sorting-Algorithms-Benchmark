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

var
  nums: TArray<Integer>;
  Benchmark: TBenchmark;
const
  NumLength: Integer = 15000;
  MaxVal: Integer = 100;
  AllowZero: Boolean = false;
begin

  // FillArrExample(nums);
  FillArrRandom(nums, NumLength, MaxVal, AllowZero);

  Benchmark := TBenchmark.Create;
  try
    try
      Benchmark.RunBenchmark(nums, Bubblesort);
      Benchmark.DisplayResults('Bubblesort');

      Benchmark.RunBenchmark(nums, Heapsort);
      Benchmark.DisplayResults('Heapsort');

      Benchmark.RunBenchmark(nums, InsertionSort);
      Benchmark.DisplayResults('Insertion Sort');

      Benchmark.RunBenchmark(nums, Mergesort);
      Benchmark.DisplayResults('Mergesort');

      Benchmark.RunBenchmark(nums, Quicksort);
      Benchmark.DisplayResults('Quicksort');

      Benchmark.RunBenchmark(nums, SelectionSort);
      Benchmark.DisplayResults('Selection Sort');

    finally
      Benchmark.Free;
    end;
  except
    on E: Exception do
      WriteLn(E.Message);
  end;
end.
