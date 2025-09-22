unit clrTimer;

interface

type
  TTimer = class
    private
      Fms: Integer; // max 596,5 Stunden

    public
      constructor Create();
      destructor Destroy();

      function getMs(): Integer;

  end;

implementation


end.
