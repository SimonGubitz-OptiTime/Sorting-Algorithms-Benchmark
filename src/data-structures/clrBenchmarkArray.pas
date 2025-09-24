unit clrBenchmarkArray;

interface

uses
  Generics.Collections,
  uTypes;

type
  TBenchmarkArray = class
    private
      FItems: TArray<Integer>;
      class var FReadAccess: UInt64;
      class var FWriteAccess: UInt64;

    public
      constructor Create(AList: TArray<Integer>);
      destructor Destroy();

      function  GetItem(AIndex: Integer): Integer;
      procedure SetItem(AIndex: Integer; AVal: Integer);
      function  GetCount(): Integer;

      procedure FromArray(AList: TArray<TArrIterator>);

      property Count: Integer read GetCount;
      // same as https://docwiki.embarcadero.com/Libraries/Athens/de/System.Generics.Collections.TList.Items
      property Items[Index: Integer]: Integer read GetItem write SetItem; default;
      property AsArray: TArray<Integer> read FItems;

      class property ReadAccess: UInt64 read FReadAccess;
      class property WriteAccess: UInt64 read FWriteAccess;
  end;


implementation

constructor TBenchmarkArray.Create(AList: TArray<Integer>);
begin
  inherited Create;

  FromArray(AList);
end;

destructor TBenchmarkArray.Destroy();
begin
  inherited Free;
end;

function TBenchmarkArray.GetItem(AIndex: Integer): Integer;
begin
  Inc(TBenchmarkArray.FReadAccess);
  Result := FItems[AIndex];
end;

procedure TBenchmarkArray.SetItem(AIndex: Integer; AVal: Integer);
begin
  Inc(TBenchmarkArray.FWriteAccess);
  FItems[AIndex] := AVal;
end;

function TBenchmarkArray.GetCount(): Integer;
begin
  Result := Length(FItems);
end;

procedure TBenchmarkArray.FromArray(AList: TArray<TArrIterator>);
begin
  FItems := AList;
end;

end.