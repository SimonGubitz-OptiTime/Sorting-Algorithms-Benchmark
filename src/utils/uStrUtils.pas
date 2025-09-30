unit uStrUtils;

interface

uses
    SysUtils;


function RepeatStr(AStr: String; ATimes: Integer): String; inline;
function FormatToHumanReadable(Val: Int64): String;

implementation

function RepeatStr(AStr: String; ATimes: Integer): String;
var
  Ndx: Integer;
begin

  Result := '';

  for Ndx := 0 to ATimes do
  begin
    Result := Result + AStr[Ndx];
  end;
end;

function FormatToHumanReadable(Val: Int64): String;
var
  Rounded: Double;
const
  FormatString: ShortString = '%.1f';
begin
  if ( Val >= 1000000000 ) then
  begin
    Rounded := Val / 1000000000;
    Result := Format(String(FormatString) + ' B', [Rounded]);
  end
  else if ( Val >= 1000000 ) then
  begin
    Rounded := Val / 1000000;
    Result := Format(String(FormatString) + ' M', [Rounded]);
  end
  else if ( Val >= 1000 ) then
  begin
    Rounded := Val / 1000;
    Result := Format(String(FormatString) + ' K', [Rounded]);
  end
  else
    Result := IntToStr(Val);
end;


end.
