unit uRotinas;

interface

uses Winapi.UrlMon;

procedure DownloadImageURL(url,path);

implementation

procedure DownloadImageURL(url,path);
begin
  URLDownloadToFile(nil,PWideChar(url),PWideChar(path),0,nil);
end;

end.
