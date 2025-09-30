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
  size: Integer;
  Heap: THeap;
begin

  Heap := THeap.Create(AList);
  size := Heap.Size;

  while size > 1 do
  begin
    // swap
    Heap.Swap(1, size-1);

    // reduce size, which then will be the bound to the next sort
    Dec(size);

    // siftdown, only up to the now reduced size
    Heap.SiftDown(size, 1);
  end;

  Result := Heap.AsArray;
end;


end.
