program csif;

uses
  Classes,
  SysUtils,
  StrUtils;

var
  sL: TStringList;
  s: string;
  i: integer;
  b: boolean;
  FromText, TextToFind: string;
  fS: TFileStream;
begin
  if Paramcount = 3 then
  begin
    sL := TStringList.Create;
    fS := TFileStream.Create(ParamStr(1), fmOpenRead or fmShareDenyNone);
    sL.LoadFromStream(fS);
    fS.Free;

    FromText := ParamStr(2);
    TextToFind := ParamStr(3);

    i := 0;
    b := False;
    if FromText = '' then
      b := True;
    for s in sL do
    begin
      if not b then
        if AnsiContainsStr(s, FromText) then
          b := True
        else
      else
      if AnsiContainsStr(s, TextToFind) then
        Inc(i);
    end;
    Writeln(i);
  end
  else
    Writeln('Am nevoie de 3 parametri: nume_fisier from_text text_to_find');
end.
