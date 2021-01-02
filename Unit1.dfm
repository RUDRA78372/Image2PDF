object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Image2PDF'
  ClientHeight = 510
  ClientWidth = 771
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 48
    Width = 80
    Height = 13
    Caption = 'Open Image file:'
  end
  object Label2: TLabel
    Left = 8
    Top = 75
    Width = 67
    Height = 13
    Caption = 'Save PDF file:'
  end
  object Image1: TImage
    Left = 488
    Top = 8
    Width = 32
    Height = 31
    Visible = False
  end
  object Label3: TLabel
    Left = 677
    Top = 489
    Width = 86
    Height = 13
    Caption = 'Created by Rudra'
  end
  object Label4: TLabel
    Left = 0
    Top = 0
    Width = 771
    Height = 33
    Align = alTop
    Alignment = taCenter
    Caption = 'Image to PDF Converter'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ExplicitWidth = 287
  end
  object Edit1: TEdit
    Left = 94
    Top = 45
    Width = 588
    Height = 21
    TabOrder = 0
  end
  object Button1: TButton
    Left = 688
    Top = 42
    Width = 75
    Height = 25
    Caption = 'Browse...'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 688
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Browse...'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Edit2: TEdit
    Left = 94
    Top = 72
    Width = 588
    Height = 21
    TabOrder = 3
  end
  object ListBox1: TListBox
    Left = 8
    Top = 176
    Width = 755
    Height = 307
    ItemHeight = 13
    TabOrder = 4
  end
  object Button3: TButton
    Left = 674
    Top = 145
    Width = 89
    Height = 25
    Caption = 'Create PDF'
    TabOrder = 5
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 8
    Top = 99
    Width = 75
    Height = 25
    Caption = 'Add'
    TabOrder = 6
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 171
    Top = 99
    Width = 75
    Height = 25
    Caption = 'Remove'
    TabOrder = 7
    OnClick = Button5Click
  end
  object ComboBox1: TComboBox
    Left = 252
    Top = 99
    Width = 79
    Height = 21
    TabOrder = 8
    Text = 'PageSize'
    Items.Strings = (
      'A4'
      'A5'
      'A3'
      'A2'
      'A1'
      'A0'
      'Letter'
      'Legal')
  end
  object CheckBox1: TCheckBox
    Left = 337
    Top = 99
    Width = 66
    Height = 17
    Caption = 'Compress'
    Checked = True
    State = cbChecked
    TabOrder = 9
  end
  object CheckBox2: TCheckBox
    Left = 409
    Top = 99
    Width = 74
    Height = 17
    Caption = 'Landscape'
    TabOrder = 10
  end
  object CheckBox3: TCheckBox
    Left = 489
    Top = 99
    Width = 97
    Height = 17
    Caption = 'Resize Images'
    Checked = True
    State = cbChecked
    TabOrder = 11
  end
  object Button6: TButton
    Left = 8
    Top = 145
    Width = 25
    Height = 25
    Caption = 'Up'
    TabOrder = 12
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 39
    Top = 145
    Width = 36
    Height = 25
    Caption = 'Down'
    TabOrder = 13
    OnClick = Button7Click
  end
  object ProgressBar1: TProgressBar
    Left = 119
    Top = 145
    Width = 549
    Height = 25
    TabOrder = 14
  end
  object Button8: TButton
    Left = 90
    Top = 99
    Width = 75
    Height = 25
    Caption = 'Add dir'
    TabOrder = 15
    OnClick = Button8Click
  end
  object Button9: TButton
    Left = 81
    Top = 145
    Width = 32
    Height = 25
    Caption = 'Clear'
    TabOrder = 16
    OnClick = Button9Click
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Left = 216
  end
  object SaveDialog1: TSaveDialog
    Left = 176
  end
end
