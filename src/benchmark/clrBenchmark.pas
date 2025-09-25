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

      function RepeatStr(AStr: String; ATimes: Integer): String; inline;
      function FormatToHumanReadable(Val: Int64): String;

    public
      constructor Create();
      destructor  Destroy();

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

function TBenchmark.RepeatStr(AStr: String; ATimes: Integer): String;
var
  Ndx: Integer;
begin

  Result := '';

  for Ndx := 0 to ATimes do
  begin
    Result := Result + AStr[Ndx];
  end;
end;

function TBenchmark.FormatToHumanReadable(Val: Int64): String;
var
  Rounded: Double;
const
  FormatString: ShortString = '%.1f';
begin
  if Val >= 1000000000 then
  begin
    Rounded := Val / 1000000000;
    Result := Format(String(FormatString) + ' B', [Rounded]);
  end
  else if Val >= 1000000 then
  begin
    Rounded := Val / 1000000;
    Result := Format(String(FormatString) + ' M', [Rounded]);
  end
  else if Val >= 1000 then
  begin
    Rounded := Val / 1000;
    Result := Format(String(FormatString) + ' K', [Rounded]);
  end
  else
    Result := IntToStr(Val);
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


end;


end.
