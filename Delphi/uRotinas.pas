unit uRotinas;

interface

uses Winapi.UrlMon, System.SysUtils;

procedure DownloadImageURL(url,path: string);

implementation

procedure DownloadImageURL(url,path: string);
var
  v_path: string;
begin
  v_path:= ExtractFileDir(path);

  if DirectoryExists(v_path) then
    URLDownloadToFile(nil,PWideChar(url),PWideChar(path),0,nil);
end;

end.
