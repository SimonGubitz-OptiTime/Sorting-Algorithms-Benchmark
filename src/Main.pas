unit Main;

interface

uses
  System.Classes,
  System.SysUtils,
  System.Variants,
  Vcl.Controls,
  Vcl.Dialogs,
  Vcl.Forms,
  Vcl.Graphics,
  Vcl.StdCtrls,
  Winapi.Messages,
  Winapi.Windows,
  clrHeap,
  clrBenchmark,
  uBubblesort,
  uHeapsort,
  uInsertionSort,
  uMergesort,
  uQuicksort,
  uSelectionSort;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

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

procedure TForm1.Button1Click(Sender: TObject);
var
  nums: TArray<Integer>;
  Benchmark: TBenchmark;
  Heap: THeap;
const
  NumLength: Integer = 100000;
  MaxVal: Integer = 100;
  AllowZero: Boolean = false;
begin

  FillArrExample(nums);
  // FillArrRandom(nums, NumLength, MaxVal, AllowZero);

  Heap := THeap.Create(nums);
  ShowMessage(ArrToStr(Heap.AsArray));

  Benchmark := TBenchmark.Create;
  try
    try
      Benchmark.RunBenchmark(nums, Quicksort);
      // Benchmark.DisplayResults('Quicksort');
    finally
      Benchmark.Free;
    end;
  except
    on E: Exception do
      ShowMessage('Error: ' + E.Message);
  end;
end;

end.
