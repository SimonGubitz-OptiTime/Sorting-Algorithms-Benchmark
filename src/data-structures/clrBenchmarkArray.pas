unit clrBenchmarkArray;

interface

uses
  Generics.Collections;

type
  TBenchmarkArray = class
    private
      FItems: TArray<Integer>;
      FReadAccess: UInt64;
      FWriteAccess: UInt64;

      procedure ResetAccessCounters();

    public
      constructor Create(AList: TArray<Integer>);
      destructor Destroy();

      function  GetItem(AIndex: Integer): Integer;
      procedure SetItem(AIndex: Integer; AVal: Integer);

      function  GetCount(): Integer;

      property Count: Integer read GetCount;
      // same as https://docwiki.embarcadero.com/Libraries/Athens/de/System.Generics.Collections.TList.Items
      property Items[Index: Integer]: Integer read GetItem write SetItem; default;
      property AsArray: TArray<Integer> read FItems;

      property ReadAccess: UInt64 read FReadAccess;
      property WriteAccess: UInt64 read FWriteAccess;
  end;


implementation

constructor TBenchmarkArray.Create(AList: TArray<Integer>);
begin
  inherited Create;

  FItems := AList;
  ResetAccessCounters();
end;

destructor TBenchmarkArray.Destroy();
begin
  inherited Free;
end;

procedure TBenchmarkArray.ResetAccessCounters();
begin
  FReadAccess := 0;
  FWriteAccess := 0;
end;

function TBenchmarkArray.GetItem(AIndex: Integer): Integer;
begin
  Inc(FReadAccess);
  Result := FItems[AIndex];
end;

procedure TBenchmarkArray.SetItem(AIndex: Integer; AVal: Integer);
begin
  Inc(FWriteAccess);
  FItems[AIndex] := AVal;
end;

function TBenchmarkArray.GetCount(): Integer;
begin
  Result := Length(FItems);
end;

end.