object FormMensaje_Espera01: TFormMensaje_Espera01
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsNone
  ClientHeight = 71
  ClientWidth = 328
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object RzPanel1: TRzPanel
    Left = 0
    Top = 0
    Width = 328
    Height = 71
    Align = alClient
    GradientColorStyle = gcsCustom
    GradientColorStart = 8451071
    GradientColorStop = clWhite
    GradientDirection = gdVerticalEnd
    TabOrder = 0
    VisualStyle = vsGradient
    object Label1: TLabel
      Left = 16
      Top = 6
      Width = 295
      Height = 29
      Caption = 'Un momento por favor...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
end
