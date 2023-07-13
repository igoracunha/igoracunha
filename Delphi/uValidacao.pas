unit uValidacao;

interface

uses System.SysUtils;

function ValidaSmallDateTime(Data: TDateTime):Boolean;

implementation

function ValidaSmallDateTime(Data: TDateTime):Boolean;
begin
  Result := ((Data >= StrToDate('01/01/1900')) and (Data <= StrToDate('06/06/2079')));
end;

end.
