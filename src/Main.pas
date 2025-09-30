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
  uSelectionSort,
  uStrUtils;

type
  TForm1 = class(TForm)
    StartButton: TButton;
    AmountInput: TEdit;
    Label1: TLabel;
    BubblesortHeading: TLabel;
    HeapsortHeading: TLabel;
    InsertionSortHeading: TLabel;
    MergesortHeading: TLabel;
    QuicksortHeading: TLabel;
    SelectionSortHeading: TLabel;
    BubblesortTimeLabel: TLabel;
    BubblesortReadAccessLabel: TLabel;
    BubblesortWriteAccessLabel: TLabel;
    BubblesortTotalAccessLabel: TLabel;
    HeapsortTimeLabel: TLabel;
    HeapsortReadAccessLabel: TLabel;
    HeapsortWriteAccessLabel: TLabel;
    HeapsortTotalAccessLabel: TLabel;
    InsertionSortTimeLabel: TLabel;
    InsertionSortReadAccessLabel: TLabel;
    InsertionSortWriteAccessLabel: TLabel;
    InsertionSortTotalAccessLabel: TLabel;
    MergesortTimeLabel: TLabel;
    MergesortReadAccessLabel: TLabel;
    MergesortWriteAccessLabel: TLabel;
    MergesortTotalAccessLabel: TLabel;
    QuicksortTimeLabel: TLabel;
    QuicksortReadAccessLabel: TLabel;
    QuicksortWriteAccessLabel: TLabel;
    QuicksortTotalAccessLabel: TLabel;
    SelectionSortTimeLabel: TLabel;
    SelectionSortReadAccessLabel: TLabel;
    SelectionSortWriteAccessLabel: TLabel;
    SelectionSortTotalAccessLabel: TLabel;
    procedure StartButtonClick(Sender: TObject);
    procedure AmountInputChange(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

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

procedure TForm1.StartButtonClick(Sender: TObject);
var
  nums: TArray<Integer>;
  Benchmark: TBenchmark;
  InputAmount: Integer;
  ReadStr: String;
  WriteStr: String;
  TotalStr: String;
const
  MaxVal: Integer = 100;
  AllowZero: Boolean = false;
begin


  if ( not(TryStrToInt(AmountInput.Text, InputAmount)) ) then
  begin
    ShowMessage('Bitte nur richtige Zahlen eingeben.');
    Exit;
  end;

  FillArrRandom(nums, InputAmount, MaxVal, AllowZero);

  Benchmark := TBenchmark.Create;
  try
    try
      Benchmark.RunBenchmark(nums, Bubblesort);
      ReadStr := FormatToHumanReadable(Benchmark.ReadArrayAccess);
      WriteStr := FormatToHumanReadable(Benchmark.WriteArrayAccess);
      TotalStr := FormatToHumanReadable(Benchmark.TotalArrayAccess);
      BubblesortTimeLabel.Caption := '- Took: ' + IntToStr(Benchmark.TimeSpent) + 'ms';
      BubblesortReadAccessLabel.Caption := '- Read Accesses:        '         + ReadStr  + '  Raw: ' + IntToStr(Benchmark.ReadArrayAccess);
      BubblesortWriteAccessLabel.Caption := '- Write Accesses:       '        + WriteStr + '  Raw: ' + IntToStr(Benchmark.WriteArrayAccess);
      BubblesortTotalAccessLabel.Caption := '- Total Array Accesses: '        + TotalStr + '  Raw: ' + IntToStr(Benchmark.TotalArrayAccess);

      Benchmark.RunBenchmark(nums, Heapsort);
      ReadStr := FormatToHumanReadable(Benchmark.ReadArrayAccess);
      WriteStr := FormatToHumanReadable(Benchmark.WriteArrayAccess);
      TotalStr := FormatToHumanReadable(Benchmark.TotalArrayAccess);
      HeapsortTimeLabel.Caption := '- Took: ' + IntToStr(Benchmark.TimeSpent) + 'ms';
      HeapsortReadAccessLabel.Caption := '- Read Accesses:        '   + ReadStr  + '  Raw: ' + IntToStr(Benchmark.ReadArrayAccess);
      HeapsortWriteAccessLabel.Caption := '- Write Accesses:       '  + WriteStr + '  Raw: ' + IntToStr(Benchmark.WriteArrayAccess);
      HeapsortTotalAccessLabel.Caption := '- Total Array Accesses: '  + TotalStr + '  Raw: ' + IntToStr(Benchmark.TotalArrayAccess);

      Benchmark.RunBenchmark(nums, InsertionSort);
      ReadStr := FormatToHumanReadable(Benchmark.ReadArrayAccess);
      WriteStr := FormatToHumanReadable(Benchmark.WriteArrayAccess);
      TotalStr := FormatToHumanReadable(Benchmark.TotalArrayAccess);
      InsertionSortTimeLabel.Caption := '- Took: ' + IntToStr(Benchmark.TimeSpent) + 'ms';
      InsertionSortReadAccessLabel.Caption := '- Read Accesses:        '        + ReadStr  + '  Raw: ' + IntToStr(Benchmark.ReadArrayAccess);
      InsertionSortWriteAccessLabel.Caption := '- Write Accesses:       '       + WriteStr + '  Raw: ' + IntToStr(Benchmark.WriteArrayAccess);
      InsertionSortTotalAccessLabel.Caption := '- Total Array Accesses: '       + TotalStr + '  Raw: ' + IntToStr(Benchmark.TotalArrayAccess);

      Benchmark.RunBenchmark(nums, Mergesort);
      ReadStr := FormatToHumanReadable(Benchmark.ReadArrayAccess);
      WriteStr := FormatToHumanReadable(Benchmark.WriteArrayAccess);
      TotalStr := FormatToHumanReadable(Benchmark.TotalArrayAccess);
      MergesortTimeLabel.Caption := '- Took: ' + IntToStr(Benchmark.TimeSpent) + 'ms';
      MergesortReadAccessLabel.Caption := '- Read Accesses:        '        + ReadStr  + '  Raw: ' + IntToStr(Benchmark.ReadArrayAccess);
      MergesortWriteAccessLabel.Caption := '- Write Accesses:       '       + WriteStr + '  Raw: ' + IntToStr(Benchmark.WriteArrayAccess);
      MergesortTotalAccessLabel.Caption := '- Total Array Accesses: '       + TotalStr + '  Raw: ' + IntToStr(Benchmark.TotalArrayAccess);

      Benchmark.RunBenchmark(nums, Quicksort);
      ReadStr := FormatToHumanReadable(Benchmark.ReadArrayAccess);
      WriteStr := FormatToHumanReadable(Benchmark.WriteArrayAccess);
      TotalStr := FormatToHumanReadable(Benchmark.TotalArrayAccess);
      QuicksortTimeLabel.Caption := '- Took: ' + IntToStr(Benchmark.TimeSpent) + 'ms';
      QuicksortReadAccessLabel.Caption := '- Read Accesses:        '        + ReadStr  + '  Raw: ' + IntToStr(Benchmark.ReadArrayAccess);
      QuicksortWriteAccessLabel.Caption := '- Write Accesses:       '       + WriteStr + '  Raw: ' + IntToStr(Benchmark.WriteArrayAccess);
      QuicksortTotalAccessLabel.Caption := '- Total Array Accesses: '       + TotalStr + '  Raw: ' + IntToStr(Benchmark.TotalArrayAccess);

      Benchmark.RunBenchmark(nums, SelectionSort);
      ReadStr := FormatToHumanReadable(Benchmark.ReadArrayAccess);
      WriteStr := FormatToHumanReadable(Benchmark.WriteArrayAccess);
      TotalStr := FormatToHumanReadable(Benchmark.TotalArrayAccess);
      SelectionSortTimeLabel.Caption := '- Took: ' + IntToStr(Benchmark.TimeSpent) + 'ms';
      SelectionSortReadAccessLabel.Caption := '- Read Accesses:        '  + ReadStr  + '  Raw: ' + IntToStr(Benchmark.ReadArrayAccess);
      SelectionSortWriteAccessLabel.Caption := '- Write Accesses:       ' + WriteStr + '  Raw: ' + IntToStr(Benchmark.WriteArrayAccess);
      SelectionSortTotalAccessLabel.Caption := '- Total Array Accesses: ' + TotalStr + '  Raw: ' + IntToStr(Benchmark.TotalArrayAccess);


    finally
      Benchmark.Free;
    end;
  except
    on E: Exception do
      ShowMessage('Error: ' + E.Message);
  end;
end;

procedure TForm1.AmountInputChange(Sender: TObject);
begin
  StartButton.Enabled := Length(AmountInput.Text) <> 0;
end;

end.
