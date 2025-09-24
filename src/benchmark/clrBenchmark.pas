unit clrBenchmark;

interface

uses
  Classes,
  Generics.Collections,
  SysUtils,
  clrBenchmarkArray;

type
  TBenchmarkFn = function(ANums: TBenchmarkArray): TArray<Integer>;
  TBenchmark = class
    private
      FTimeSpent: UInt64;
      FTotalArrayAccess: UInt64;
      FReadArrayAccess: UInt64;
      FWriteArrayAccess: UInt64;
      FSortedArr: TArray<Integer>;

    public
      constructor Create();
      destructor Destroy();

      procedure   RunBenchmark(ANums: TArray<Integer>; ABenchmarkFn: TBenchmarkFn);

      property TimeSpent: UInt64 read FTimeSpent;
      property Sorted: TArray<Integer> read FSortedArr;
      property TotalArrayAccess: UInt64 read FTotalArrayAccess;
      property ReadArrayAccess: UInt64 read FReadArrayAccess;
      property WriteArrayAccess: UInt64 read FWriteArrayAccess;
  end;

implementation

constructor TBenchmark.Create();
begin
  inherited Create;
end;

destructor TBenchmark.Destroy();
begin
  inherited Free;
end;

procedure TBenchmark.RunBenchmark(ANums: TArray<Integer>; ABenchmarkFn: TBenchmarkFn);
var
  Sorted: TArray<Integer>;
  TimeStart, TimeEnd: UInt64;
  BenchmarkArray: TBenchmarkArray;
begin
  // Einen TBenchmarkArray erstellen
  BenchmarkArray := TBenchmarkArray.Create(ANums);
  try
    TimeStart := TThread.GetTickCount;
    Sorted := ABenchmarkFn(BenchmarkArray);
    TimeEnd := TThread.GetTickCount;

    FTimeSpent := TimeEnd - TimeStart;
    FSortedArr := Sorted;
    FReadArrayAccess := BenchmarkArray.ReadAccess;
    FWriteArrayAccess := BenchmarkArray.WriteAccess;
    FTotalArrayAccess := BenchmarkArray.ReadAccess + BenchmarkArray.WriteAccess;
  finally
    BenchmarkArray.Free;
  end;
end;


end.
