program Image2PDF;

uses
  Vcl.Forms,
  WinAPI.Windows,
  Unit1 in 'Unit1.pas' {Form1};

{$R *.res}
{$WEAKLINKRTTI ON}
{$RTTI EXPLICIT METHODS([]) PROPERTIES([]) FIELDS([])}
{$SETPEFLAGS IMAGE_FILE_RELOCS_STRIPPED}
begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
