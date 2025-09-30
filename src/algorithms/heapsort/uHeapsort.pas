unit uHeapsort;

interface

uses
  Generics.Collections,
  clrBenchmarkArray,
  clrHeap;

function Heapsort(AList: TBenchmarkArray): TArray<Integer>;

implementation

function Heapsort(AList: TBenchmarkArray): TArray<Integer>;
var
  Heap: THeap;
begin

  Heap := THeap.Create(AList);

end;


end.
