unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, SynPDF, Vcl.StdCtrls, Vcl.ExtDlgs,
  Vcl.Imaging.GIFImg, Vcl.Imaging.jpeg, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.ComCtrls, Winapi.ShellApi, System.IOUtils, System.Types;

type
  TForm1 = class(TForm)
    OpenPictureDialog1: TOpenPictureDialog;
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    Edit2: TEdit;
    Label2: TLabel;
    ListBox1: TListBox;
    Button3: TButton;
    Image1: TImage;
    Button4: TButton;
    Button5: TButton;
    SaveDialog1: TSaveDialog;
    ComboBox1: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    Button6: TButton;
    Button7: TButton;
    ProgressBar1: TProgressBar;
    Button8: TButton;
    Button9: TButton;
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
  protected
    procedure WMDropFiles(var Msg: TWMDropFiles); message WM_DROPFILES;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  OpenPictureDialog1.Execute;
  Edit1.Text := OpenPictureDialog1.FileName;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  // SaveDialog1.InitialDir := GetCurrentdir;
  SaveDialog1.Filter := 'PDF Files (*.pdf)|*.pdf';
  if SaveDialog1.Execute then
  begin
    if ExtractFileext(SaveDialog1.FileName) = '.pdf' then
      Edit2.Text := SaveDialog1.FileName
    else
      Edit2.Text := SaveDialog1.FileName + '.pdf';
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  lPDF: TPdfDocument;
  lPage: array of TPdfPage;
  pdfimage: array of TPdfImage;
  i: integer;
begin
  if TDirectory.Exists(Extractfiledir(Edit2.Text)) and
    (ListBox1.Items.Count >= 1) then
  begin
    ProgressBar1.Min := 0;
    ProgressBar1.Max := ListBox1.Items.Count - 1;
    lPDF := TPdfDocument.Create;
    if ComboBox1.ItemIndex = -1 then
      lPDF.DefaultPaperSize := psA4
    else
      lPDF.DefaultPaperSize := TPDFPaperSize(ComboBox1.ItemIndex);
    lPDF.DefaultPageLandscape := CheckBox2.Checked;
    if not CheckBox1.Checked then
      lPDF.CompressionMethod := cmnone;
    setlength(lPage, ListBox1.Items.Count);
    setlength(pdfimage, ListBox1.Items.Count);

    for i := 0 to ListBox1.Items.Count - 1 do
    begin
      lPage[i] := lPDF.AddPage;
      Image1.Picture.LoadFromFile(ListBox1.Items[i]);
      pdfimage[i] := TPdfImage.Create(lPDF, Image1.Picture.Graphic, true);
      lPDF.AddXObject('Image' + inttostr(i), pdfimage[i]);
      if CheckBox3.Checked then
        Image1.Picture.bitmap.SetSize(lPage[i].PageWidth, lPage[i].PageHeight)
      else
      begin
        lPage[i].PageHeight := Image1.Picture.Height;
        lPage[i].PageWidth := Image1.Picture.width;
      end;
      lPDF.Canvas.DrawXObject(0, 0, Image1.Picture.width, Image1.Picture.Height,
        'Image' + inttostr(i));
      ProgressBar1.Position := i;
    end;
    lPDF.SaveToFile(Edit2.Text);
    lPDF.Free;
    Showmessage('PDF Generated');
  end;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  ListBox1.Items.Add(Edit1.Text);
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  ListBox1.Items.Delete(ListBox1.ItemIndex);
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  if ListBox1.ItemIndex > 0 then
    ListBox1.Items.Move(ListBox1.ItemIndex, ListBox1.ItemIndex - 1);
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  if ListBox1.ItemIndex < ListBox1.Items.Count - 1 then
    ListBox1.Items.Move(ListBox1.ItemIndex, ListBox1.ItemIndex + 1);
end;

procedure TForm1.Button8Click(Sender: TObject);
var
  List: TStringDYnArray;
  i: integer;
  LSearchOption: TSearchOption;
begin
  LSearchOption := TSearchOption.soTopDirectoryOnly;
  List := TDirectory.GetFilesystementries(Extractfiledir(Edit1.Text),
    LSearchOption, nil);
  for i := 0 to Length(List) - 1 do
    if (ExtractFileext(List[i]) = ExtractFileext(Edit1.Text)) then
      ListBox1.Items.Add(List[i]);
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
  ListBox1.Items.Clear;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DragAcceptFiles(Handle, false);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  DragAcceptFiles(Handle, true);
end;

procedure TForm1.WMDropFiles(var Msg: TWMDropFiles);
var
  i, fileCount: integer;
  FileName: array [0 .. MAX_PATH] of char;
begin
  fileCount := DragQueryFile(Msg.Drop, $FFFFFFFF, FileName, MAX_PATH);
  for i := 0 to fileCount - 1 do
  begin
    DragQueryFile(Msg.Drop, i, FileName, MAX_PATH);
    if (ExtractFileext(FileName) = '.jpg') or
      (ExtractFileext(FileName) = '.jpeg') or
      (ExtractFileext(FileName) = '.png') or (ExtractFileext(FileName) = '.bmp')
    then
      ListBox1.Items.Add(FileName);
  end;
  DragFinish(Msg.Drop);
end;

end.
