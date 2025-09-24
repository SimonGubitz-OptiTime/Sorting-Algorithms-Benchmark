program SortingAlgorithmsBenchmark;

uses
  Vcl.Forms,
  Main in 'Main.pas' {Form1},
  clrBenchmark in 'benchmark\clrBenchmark.pas',
  clrBenchmarkArray in 'data-structures\clrBenchmarkArray.pas',
  clrHeap in 'data-structures\clrHeap.pas',
  uBubblesort in 'algorithms\bubblesort\uBubblesort.pas',
  uHeapsort in 'algorithms\heapsort\uHeapsort.pas',
  uInsertionSort in 'algorithms\insertion-sort\uInsertionSort.pas',
  uMergesort in 'algorithms\mergesort\uMergesort.pas',
  uQuicksort in 'algorithms\quicksort\uQuicksort.pas',
  uSelectionSort in 'algorithms\selection-sort\uSelectionSort.pas',
  uTypes in 'data-structures\uTypes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
