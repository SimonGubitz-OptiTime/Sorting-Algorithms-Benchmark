unit clrBenchmark;

interface

uses
  Classes,
  Generics.Collections,
  SysUtils,
  clrBenchmarkArray,
  uStrUtils;

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
      destructor  Destroy(); reintroduce;

      procedure   RunBenchmark(ANums: TArray<Integer>; ABenchmarkFn: TBenchmarkFn);
      procedure   DisplayResults(AName: String);

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

  TBenchmarkArray.ResetBenchmarkNumbers();

  // Einen TBenchmarkArray erstellen
  BenchmarkArray := TBenchmarkArray.Create(ANums);
  try
    TimeStart := TThread.GetTickCount64;
    Sorted := ABenchmarkFn(BenchmarkArray);
    TimeEnd := TThread.GetTickCount64;

    FTimeSpent := TimeEnd - TimeStart;
    FSortedArr := Sorted;
    FReadArrayAccess := BenchmarkArray.ReadAccess;
    FWriteArrayAccess := BenchmarkArray.WriteAccess;
    FTotalArrayAccess := BenchmarkArray.ReadAccess + BenchmarkArray.WriteAccess;
  finally
    BenchmarkArray.Free;
  end;
end;

// TVRec
procedure TBenchmark.DisplayResults(AName: String);
var
  max_length: Integer;
  ReadStr, WriteStr, TotalStr: String;
begin

  WriteLn('-- ' + AName + ' --');
  WriteLn('- For ' + IntToStr(Length(Sorted)) + ' Elements');
  WriteLn('- Time: ' + IntToStr(TimeSpent) + 'ms');

  // ↓ Indenting properly
  ReadStr := FormatToHumanReadable(ReadArrayAccess);
  WriteStr := FormatToHumanReadable(WriteArrayAccess);
  TotalStr := FormatToHumanReadable(TotalArrayAccess);
  max_length := Length(TotalStr);

  WriteLn('- Read Accesses:        ' + RepeatStr(' ', max_length - Length(ReadStr))   + ReadStr  + '  Raw: ' + IntToStr(ReadArrayAccess));
  WriteLn('- Write Accesses:       ' + RepeatStr(' ', max_length - Length(WriteStr))  + WriteStr + '  Raw: ' + IntToStr(WriteArrayAccess));
  WriteLn('- Total Array Accesses: ' + RepeatStr(' ', max_length - Length(TotalStr))  + TotalStr + '  Raw: ' + IntToStr(TotalArrayAccess));

  WriteLn;

end;


end.
