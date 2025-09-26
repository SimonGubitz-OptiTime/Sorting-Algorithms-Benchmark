unit clrBenchmarkArray;

interface

uses
  Generics.Collections,
  SysUtils,
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

  if ( AIndex >= Length(FItems) ) then
    raise ERangeError.CreateFmt('Trying to Get out of bounds in TBenchmarkArray. Length: %d, Requested Get on Index: %d.', [ Length(FItems), AIndex ]);

  Inc(TBenchmarkArray.FReadAccess);
  Result := FItems[AIndex];
end;

procedure TBenchmarkArray.SetItem(AIndex: Integer; AVal: Integer);
begin

  if ( AIndex >= Length(FItems) ) then
    raise ERangeError.CreateFmt('Trying to Set out of bounds in TBenchmarkArray. Length: %d, Requested Set on Index: %d.', [ Length(FItems), AIndex ]);

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