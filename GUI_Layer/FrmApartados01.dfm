object FormApartados01: TFormApartados01
  Left = 0
  Top = 0
  Caption = 'Apartados'
  ClientHeight = 371
  ClientWidth = 570
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  ShowHint = True
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlEncabezado: TRzPanel
    Left = 0
    Top = 120
    Width = 570
    Height = 53
    Align = alTop
    BorderOuter = fsFlat
    TabOrder = 3
    object Label14: TLabel
      Left = 9
      Top = 7
      Width = 37
      Height = 13
      Caption = 'Cliente:'
    end
    object Label15: TLabel
      Left = 9
      Top = 29
      Width = 50
      Height = 13
      Caption = 'Vendedor:'
    end
    object Label16: TLabel
      Left = 373
      Top = 7
      Width = 69
      Height = 13
      Caption = 'L'#237'mite Cr'#233'dito:'
    end
    object lblFechaVencimiento: TLabel
      Left = 371
      Top = 29
      Width = 96
      Height = 13
      Caption = 'lblFechaVencimiento'
    end
    object cbCliente: TComboBoxEx
      Left = 77
      Top = 4
      Width = 236
      Height = 22
      ItemsEx = <>
      TabOrder = 1
      Text = 'cbCliente'
      OnChange = cbClienteChange
    end
    object cbVendedor: TComboBoxEx
      Left = 77
      Top = 25
      Width = 236
      Height = 22
      ItemsEx = <>
      TabOrder = 3
      Text = 'cbVendedor'
    end
    object edtLimiteCredito: TCurrencyEdit
      Left = 446
      Top = 4
      Width = 112
      Height = 21
      DisplayFormat = ',0.00;-,0.00'
      ReadOnly = True
      TabOrder = 2
    end
    object btnBuscar_Clientes: TBitBtn
      Left = 319
      Top = 2
      Width = 25
      Height = 21
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FF314B62
        AC7D7EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF5084B20F6FE1325F8CB87E7AFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF32A0FE37A1FF
        106FE2325F8BB67D79FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF37A4FE379FFF0E6DDE355F89BB7F79FF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        37A4FE359EFF0F6FDE35608BA67B7FFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF38A5FE329DFF156DCE444F5BFF
        00FF9C6B65AF887BAF887EAA8075FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF3BABFFA1CAE7AD8679A98373E0CFB1FFFFDAFFFFDDFCF8CFCCB2
        9FA1746BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC0917DFC
        E9ACFFFFCCFFFFCFFFFFD0FFFFDEFFFFFAE3D3D1996965FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFB08978FAD192FEF4C2FFFFD0FFFFDAFFFFF6FFFF
        FCFFFFFCB69384FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB08978FEDA97ED
        B478FBEEBBFFFFD3FFFFDCFFFFF4FFFFF4FFFFE2E9DDBCA67B73FF00FFFF00FF
        FF00FFFF00FFFF00FFB18A78FFDE99E9A167F4D199FEFCCCFFFFD5FFFFDAFFFF
        DCFFFFD7EFE6C5A97E75FF00FFFF00FFFF00FFFF00FFFF00FFAA7F73FAE0A4F0
        B778EEBA7BF6DDA6FEFBCCFFFFD3FFFFD1FFFFD7D9C5A7A3756CFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFCEB293FFFEDDF4D1A5EEBA7BF2C78FF8E1ABFCF0
        BAFCFACAA3776FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA1746BE1
        D4D3FFFEEEF7CC8CF0B473F7C788FCE3A5C2A088A5776CFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF986865BA9587EAD7A4EAD59EE0C097A577
        6CA5776CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFA77E70A98073A4786EFF00FFFF00FFFF00FFFF00FF}
      TabOrder = 0
      OnClick = btnBuscar_ClientesClick
    end
    object btnBuscar_Vendedores: TBitBtn
      Left = 319
      Top = 29
      Width = 25
      Height = 21
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FF314B62
        AC7D7EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF5084B20F6FE1325F8CB87E7AFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF32A0FE37A1FF
        106FE2325F8BB67D79FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF37A4FE379FFF0E6DDE355F89BB7F79FF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        37A4FE359EFF0F6FDE35608BA67B7FFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF38A5FE329DFF156DCE444F5BFF
        00FF9C6B65AF887BAF887EAA8075FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF3BABFFA1CAE7AD8679A98373E0CFB1FFFFDAFFFFDDFCF8CFCCB2
        9FA1746BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC0917DFC
        E9ACFFFFCCFFFFCFFFFFD0FFFFDEFFFFFAE3D3D1996965FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFB08978FAD192FEF4C2FFFFD0FFFFDAFFFFF6FFFF
        FCFFFFFCB69384FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB08978FEDA97ED
        B478FBEEBBFFFFD3FFFFDCFFFFF4FFFFF4FFFFE2E9DDBCA67B73FF00FFFF00FF
        FF00FFFF00FFFF00FFB18A78FFDE99E9A167F4D199FEFCCCFFFFD5FFFFDAFFFF
        DCFFFFD7EFE6C5A97E75FF00FFFF00FFFF00FFFF00FFFF00FFAA7F73FAE0A4F0
        B778EEBA7BF6DDA6FEFBCCFFFFD3FFFFD1FFFFD7D9C5A7A3756CFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFCEB293FFFEDDF4D1A5EEBA7BF2C78FF8E1ABFCF0
        BAFCFACAA3776FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA1746BE1
        D4D3FFFEEEF7CC8CF0B473F7C788FCE3A5C2A088A5776CFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF986865BA9587EAD7A4EAD59EE0C097A577
        6CA5776CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFA77E70A98073A4786EFF00FFFF00FFFF00FFFF00FF}
      TabOrder = 4
      OnClick = btnBuscar_VendedoresClick
    end
  end
  object pnlTitulo: TRzPanel
    Left = 0
    Top = 0
    Width = 570
    Height = 30
    Align = alTop
    BorderOuter = fsFlat
    TabOrder = 0
    object pnlTitulo1: TRzPanel
      Left = 1
      Top = 1
      Width = 383
      Height = 28
      Align = alClient
      BorderOuter = fsFlat
      Caption = 'APARTADO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object pnlTitulo2: TRzPanel
      Left = 384
      Top = 1
      Width = 185
      Height = 28
      Align = alRight
      BorderOuter = fsFlat
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
  end
  object pnlEstado: TRzPanel
    Left = 0
    Top = 30
    Width = 570
    Height = 30
    Align = alTop
    BorderOuter = fsFlat
    TabOrder = 1
    object pnlEstado1: TRzPanel
      Left = 1
      Top = 1
      Width = 256
      Height = 28
      Align = alLeft
      BorderOuter = fsFlat
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object pnlEstado2: TRzPanel
      Left = 257
      Top = 1
      Width = 120
      Height = 28
      Align = alLeft
      BorderOuter = fsFlat
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object dtpFecha: TRzDateTimeEdit
        Left = 1
        Top = 1
        Width = 118
        Height = 26
        EditType = etDate
        Align = alClient
        TabOrder = 0
        ExplicitHeight = 27
      end
    end
    object pnlEstado4: TRzPanel
      Left = 497
      Top = 1
      Width = 96
      Height = 28
      Align = alLeft
      BorderOuter = fsFlat
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object pnlEstado3: TRzPanel
      Left = 377
      Top = 1
      Width = 120
      Height = 28
      Align = alLeft
      BorderOuter = fsFlat
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
  end
  object pnlOpciones: TRzPanel
    Left = 0
    Top = 60
    Width = 570
    Height = 60
    Align = alTop
    BorderOuter = fsFlat
    TabOrder = 2
    object pnlOpciones1: TRzPanel
      Left = 1
      Top = 1
      Width = 480
      Height = 58
      Align = alLeft
      BorderOuter = fsFlat
      TabOrder = 0
      object btnImprimir: TRzToolButton
        Left = 241
        Top = 1
        Width = 80
        Height = 56
        DropDownMenu = popImprimir
        ImageIndex = 1
        Images = ImageList1
        Layout = blGlyphTop
        ShowCaption = True
        UseToolbarButtonLayout = False
        UseToolbarButtonSize = False
        UseToolbarShowCaption = False
        ToolStyle = tsDropDown
        Align = alLeft
        Caption = 'Imprimir'
      end
      object btnPagar: TBitBtn
        Left = 81
        Top = 1
        Width = 80
        Height = 56
        Align = alLeft
        Caption = 'Pagar'
        Glyph.Data = {
          1E050000424D1E05000000000000DE0200002800000018000000180000000100
          08000000000040020000120B0000120B0000AA000000AA00000000000000FFFF
          FF002D2C9800FF00FF00AC430F00A5461000A74912009E674100A5673A00954A
          0F00F7A05600FEAB6700DE7F2600E1822900E3842D00E68A3500EB903D00F097
          4800EFA05700F2AA6900FFBB7F00D8842F00EA9E5000FAAB5C00EFA75F00FAB5
          7200D9802100D8802100DE862300DE872600D5812700D9822800D8832800D782
          2800D7832900D8832A00D8842B00DC882D00DC892D00D8842C00E18A2F00D986
          2D00D8872D00EB913200D9872E00DA883000DA893000DE8C3300DA893200DC8A
          3300DC8B3400DD8C3500E1913700DE8E3600DD8E3700E08F3900E2933B00E090
          3A00E1913C00E2923F00E6984100E2934000DA903E00E79A4300E5964300E798
          4500EA9E4800EA9F4B00E79A4A00E3984900EFA55200E38B2600DA882B00DD8C
          2F00DE8F3400E0913600E5973E00E99C4000E99D4600E79C4600AD936900A390
          650030641700035A0600169E350021BA490019B4450019B143001ABA49001AB5
          48001CB84B001DBD4D001CB749001EBC4C001FC14F001FC04E001FBF4E001FBF
          500020C2510020C04F001FBB4E0021C4520021C4530023C9550022C2510024CA
          570024C9560023C6540023C5530022C1520024C5550026CB580027CE5A0027CC
          580026C9560027C9580029D05D0029CF5C0028CC590028CB58002BD560002AD0
          5C002BD15D002CD15D002DD560002DD45F0031DC660034E0690035DE680039E5
          6D003CE9700023CC590027D45E002BD15F002DD963002DD8630035E36C0037EA
          720039E9700038E76F003BEA72003BEA73003EEE750043F77D0042F47A0046FA
          7F004AFF830053FF91002D7EC0003379B100377BB4002C78BB00347AB6003476
          AF001C87FF001480FF001681FF001E87FF000A5FDE000B63E000485A7E00525A
          7500001EF4000018FF00001CF4001524BF001A28B5001D27B0002329A500292A
          9C00030303030303030303030303030303030303030303030303030303030303
          0303030303030303030303030303030303030309090909090909090909090909
          0909090903030303030309464F3C38344A4926484707A6A5A094975109030303
          030309433D3935312C2723201BA9A3A29F9D9C9809030303030309423B37332E
          292421201A02A3A49E9A9B96090303030303094E3A36312D2A22211E1C08A8A7
          A1959950090303030303093F09090909090909091E1D1F152B3E451709030303
          0303093F37322E2924221E1E1E23252F3A411613090303030303093C09090909
          090909090909090909441219090303030303094C33302C2722211E1E222A3139
          40161819090303030303094D4B4A280D0C0C0C0C0D0E0F10110A0B1409525252
          5203030605040909090909090909090909090909588384878952030303030352
          85736E6D61645A5C595656575383777B88520303030303528675716A6B625E5F
          5B5B606053537A7E8B520303030303527C76736E686360605D5D606B54535353
          8C520303030303527852525252525252525260626F5553538E52030303030352
          7A726E6C6263605D5D6060686A7A7F8A90520303030303527952525252525252
          52525252525252819152030303030352756A6C6263605D5D5D60686E767D8082
          9252030303030352787069676B656262666B6F74877F8D8F9352030303030303
          5252525252525252525252525252525252030303030303030303030303030303
          0303030303030303030303030303030303030303030303030303030303030303
          0303}
        Layout = blGlyphTop
        TabOrder = 1
        OnClick = btnPagarClick
      end
      object btnNuevo: TBitBtn
        Left = 1
        Top = 1
        Width = 80
        Height = 56
        Align = alLeft
        Caption = 'Nuevo'
        Glyph.Data = {
          F6060000424DF606000000000000360000002800000018000000180000000100
          180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFA97C79B78183B78183B78183B78183B78183B78183B78183B78183B781
          83B78183B78183B78183B78183B78183B78183B78183B78183B78183FF00FFFF
          00FFFF00FFFF00FFFF00FFAE7781F3DDC4F8E3C6F6DFBFF5DCB8F4D9B2F3D7AC
          F3D4A7F2D2A0F0CF9AF0CE98F0CE98F0CE98F0CE98F0CE98F0CE98F1CF98EFCD
          97B88183FF00FFFF00FFFF00FFFF00FFFF00FFAE7782F2DEC8F7E3CAF5DFC2F4
          DCBCF3DAB6F2D7B1F1D4ABF1D2A5F0CF9FEFCD9AEECC97EECC97EECC97EECC97
          EECC97EFCD97EDCB96B88183FF00FFFF00FFFF00FFFF00FFFF00FFAE7782F2E0
          CEF8E7CFF5E2C8F5DEC2F4DCBCF3DAB7F2D7B1F1D4ABF1D2A5F0CFA0EFCD9AEE
          CC97EECC97EECC97EECC97EFCD97EDCB96B88183FF00FFFF00FFFF00FFFF00FF
          FF00FFAE7782F3E3D2F9E9D4F6E4CDF5E1C7F5DEC1F4DCBCF3D9B6F2D7B0F1D4
          AAF1D2A5F0CFA0EECC99EECC97EECC97EECC97EFCD97EDCB96B88183FF00FFFF
          00FFFF00FFFF00FFFF00FFAE7783F4E6D8FAECDAF8E7D3F6E4CCF5E1C7F5DFC2
          F4DCBCF3D9B6F2D7B0F1D4ABF1D2A6F0CFA0EECD9AEECC97EECC97EFCD97EDCB
          96B88183FF00FFFF00FFFF00FFFF00FFFF00FFAF7883F5E9DDFBEFE0F8EAD9F7
          E6D2F6E4CDF5E1C8F4DEC2F4DCBCF3D9B6F2D7B1F1D4ACF1D2A6F0CFA0EECC99
          EECC97EFCD97EDCB96B88183FF00FFFF00FFFF00FFFF00FFFF00FFB27B85F5EC
          E3FBF2E6F9EDDEF8E9D7F7E7D2F6E4CDF5E1C7F5DFC1F4DCBBF3D9B6F2D7B1F1
          D4ABF1D2A5F0CFA0EECC99EFCD97EDCB96B88183FF00FFFF00FFFF00FFFF00FF
          FF00FFB78086F7EFE8FCF5ECFAEFE4F9ECDDF8E9D8F7E7D3F6E4CDF5E1C7F5DF
          C1F4DCBCF3D9B7F1D7B0F1D4ABF0D2A5F0CF9FEFCD9AEDCA96B88183FF00FFFF
          00FFFF00FFFF00FFFF00FFBB8388F8F2EEFDF8F1FAF3EAF9EFE3F9ECDDF8E9D8
          F7E6D2F6E4CCF5E1C6F4DFC1F4DCBCF3D9B6F2D6B0F1D4AAF0D1A4F0D09FEDCB
          98B88183FF00FFFF00FFFF00FFFF00FFFF00FFBE8689FAF6F4FEFCF8FCF6F0FA
          F2EAFAF0E4F9EDDDF8E9D8F7E7D2F6E4CCF5E1C7F5DEC2F4DCBBF3D9B6F1D7B0
          F1D4AAF1D2A5EECD9EB88184FF00FFFF00FFFF00FFFF00FFFF00FFC2898AFBF8
          F7FFFFFEFEFAF6FCF5EFFAF2EAFAF0E3F9ECDDF9E9D8F8E7D2F6E4CDF5E1C7F5
          DEC1F4DCBCF3D9B6F2D7B0F2D5ABEFCFA4B98285FF00FFFF00FFFF00FFFF00FF
          FF00FFC68D8CFBF8F7FFFFFFFFFEFCFEF9F4FCF6EFFBF3EAFAEFE3F9EDDDF8E9
          D7F8E7D2F6E4CDF5E1C6F5DEC1F4DCBBF3D9B5F2D7B0F0D2A8B98386FF00FFFF
          00FFFF00FFFF00FFFF00FFCA908DFBF8F7FFFFFFFFFFFFFFFDFCFEF9F5FCF6F0
          FAF2EAFAF0E4F9ECDDF8EAD8F8E6D2F6E4CCF6E1C6F5DEC0F4DCBBF4DAB6F1D5
          AEB58286FF00FFFF00FFFF00FFFF00FFFF00FFCD938FFBF8F7FFFFFFFFFFFFFF
          FFFFFFFEFCFEF9F5FCF6EFFBF2EAFAEFE3F9ECDDF8E9D7F8E6D1F6E3CBF5E1C6
          F4DEC0F3DBBAD9C4A7A47E83FF00FFFF00FFFF00FFFF00FFFF00FFD19790FCF9
          F7FFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFEF9F5FCF5EFFBF2E9FAF0E3F9ECDDF8
          E9D7F8E6D1F6E4CCEBD9C0D1C1ABB5A8979C7C81FF00FFFF00FFFF00FFFF00FF
          FF00FFD59A91FCF9F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFCFDFAF5FCF6
          EFFAF2E9FAEFE2FAEDDEFBEEDBE7DBC9C8BDAFBAB0A2B7AC9DA07E83FF00FFFF
          00FFFF00FFFF00FFFF00FFDA9D93FCF9F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFEFCFDF9F4FCF5EEFCF5EBEEDDD1B28176AD8076AA7F76AB7F76AB7F
          76AF7F77FF00FFFF00FFFF00FFFF00FFFF00FFDDA194FCF9F8FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFBFDF9F4FFFBF3E3CEC6B38176E3B585
          E5AD6AE9A654EFA039B88285FF00FFFF00FFFF00FFFF00FFFF00FFE0A395FDFA
          F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFCFFFEF9E5
          D1CBB38176EFC48DF3BB6DF8B450B88285FF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFE0A395FDFAF8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFE5D4D0B38176EFC38CF3BA6CB88285FF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFE0A395FFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9DBD9B38176F1C58BB88285FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDEA78CECD0BEEDD3C1EDD3C1EC
          D1C1EAD0C1E8CEC0E6CCBFE4CBBEE1C9BEDFC7BDDDC5BDCEAEA6B38176B88285
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        Layout = blGlyphTop
        TabOrder = 0
        OnClick = btnNuevoClick
      end
      object btnAnular: TBitBtn
        Left = 161
        Top = 1
        Width = 80
        Height = 56
        Align = alLeft
        Caption = 'Anular'
        Glyph.Data = {
          6A060000424D6A060000000000002A0400002800000018000000180000000100
          08000000000040020000120B0000120B0000FD000000FD00000000000000FFFF
          FF00FF00FF0099330000CE6C0900BA6F1C00EB8C2900F39B3F00FFF0C200988E
          6200D7E0C300D7F2EF00B5E6E400A4FFFF00B5FCFD00BAFFFF00D6F3F300E3FF
          FF00F7FFFF00F8FFFF00FDFFFF00FEFFFF009FFCFF00B6FDFF00D9FEFF00DAFE
          FF00E1FDFE0098FAFF0090ECF20091ECF200C3FAFD008FF6FF008EF2FB0091F6
          FF0092F6FF0093F7FF0095F8FF009AF7FE0095ECF20095EAF100A3F8FF00A4F8
          FF00A7F9FF009EECF200C2FAFF00C4FBFF00D0F2F50088EEFA0089EEF9008EF3
          FF008CEFF9008EF2FC0091F4FF0096F5FF00AEECF200E9FDFF0063D2E20071E3
          F30072E3F20087F0FD0089F1FE008BF2FF00A6F1FC00E7FBFE006ADEF30064CE
          E0007AE9FC0075DBED007BE1F10074D4E30081E9FC0083EAFD0082E9FC0086ED
          FF0085ECFE0087EDFF0086ECFE0089EEFF0083E4F3008DEEFF008DEDFE00BBF4
          FE00CFF3F9005EC8DC0069CFE4007CE7FE007BE7FC007CE7FC007AE1F7007EE6
          FC0080E7FD0081E8FE0081E7FD0080E7FB0082E8FE0084E9FE009CE4F200ADE9
          F500BFEEF80065D9F30076E5FF007BE4FE007DE4FE0081E7FE0088E7FF00A6EE
          FF00A9EEFF00C6F4FF00E9F9FD0043C1E2005ED3F1007CE2FE007CE3FE007DE3
          FE008FE8FF00A7EDFF00B6E6F300BDEEFB00CEEEF700149BC70019A2CF001FA9
          D60052C2E7005ED1F30070DCFF0071DDFE0076DEFE0077DEFE0078DFFF007ADE
          FF007BDFFF007CE1FF0073CBE7008ED2E6009FE9FF00A9E9FE00ADE2F300019A
          CF000198CD000193C800018CC000029BD000069CD0000D9ED1000D9FD10015A1
          D0001DA7D5001FA8D8001FA7D7001FA7D5001B91BA0022ACDD0028B0E00029AC
          D80030B3E30031B1DC0034AFD90045C0ED0049B7DE005CCCF50063D1F90060CA
          EF0065D2F80065CFF5005EC1E20069D1F8006DD8FF006ED8FF006BD3F8006FD8
          FE006FD9FE0070D8FE0071D9FE0073D9FF0073DAFE0074DBFF0075DBFF0076DC
          FF0077DBFF0077DCFF0078DCFF0079DDFF0076C8E50077BFD8008BD4EE0097E4
          FF008FD3EB00BCE9F800018BC0003EB8E9003EB7E50067D3FF0071D8FF0077D5
          FC0099E2FF0055C4F3005FCDFF0064CDFE008BDBFF0002679B005CC8FB004071
          FA004274FF00497AFC00275AFF002C5FFF003664FA00386BFF00174AFD001A4C
          FF001B4DFF001D50FF002355FF002558FF002655FA002E5BF9002D59F400325D
          F1003B66F3000030FC000132FF000134FF000C3CFF00103DFB00103BF4001342
          FF001743F6001847FF001A48F9001A47F8001B46F6001D4BFF001C47F6001D48
          F6001D49F600214EFC00204BF800204CF800224DF800224CF400224DF1002550
          F400002CF800002DF800002CF600002AF300012DF600032BF2000431FE000733
          F600123BF100143EF40000009A00020202020202020202020202020202020202
          0202020202020202898989890202020202020202020202020202020202020290
          B8A89D98898989890202020202020202020202020202028EB687A6B0B3B2A09A
          8D8989898902020202020202020202899CBBA7A9ABABC0AF81B5AD9F97898989
          020202020202028979BAB9AAACACACACACACAEB18281B4B38902020202020289
          9B9E757D7F7F7F7F7F7F7F7E7E7E8083A2890202020202897A9288726F707070
          70707070707066717B89020202020289A193A451555C5A5A5C675B5B5B5B5E5F
          6E4F890202020289A3BE996250474846474A4C4949494B4D6335890202020289
          A5C394841E2032302F3B3C3D3D3D3D3140241B8902020289C1C8BD9574522E10
          0B0C251F2122232439160D6D89020289C6C4C5FCFC8F779178851AFCFC28292A
          4E170F0E89020289C2BFFCD0E0FC050A0996FCF2DBFC2C2D6019181161890289
          867CFCE5D1FAFC0806FCF6DCF5FC3F37761312156C890289696465FCE8D2FBFC
          FCF3DDF7FC898989898989898989028A3E425D58FCE9D3DFF8DCF4FC56575933
          890202020202028B363A444354FCE4E1DEF9FC27261D1C2B890202020202028C
          B745384153FCEBE7E3E2FCBC8C8C8C89020202020202030303030303FCD7CDEE
          ECD4E6FC030303030303030303030707070707FCCECFD8FCFCEFD5EAFC070707
          07070707070708080808FCC9CAD9FC7368FCF0CCEDFC08080808080808080404
          0404FCCBDAFC146B6A34FCF1D6FC04040404040404040202020202FCFCC7C7C7
          C7C7C7FCFC020202020202020202}
        Layout = blGlyphTop
        TabOrder = 2
        OnClick = btnAnularClick
      end
      object btnCerrar: TBitBtn
        Left = 401
        Top = 1
        Width = 80
        Height = 56
        Align = alLeft
        Caption = 'Cerrar'
        Glyph.Data = {
          3E040000424D3E04000000000000FE0100002800000018000000180000000100
          08000000000040020000120B0000120B0000720000007200000000000000FFFF
          FF00FF00FF0069333400CD676800CC666700CF696A00CE686900D06A6B00D26C
          6D00D16B6C00C6666700D46E6F00D36D6E00D6707100D56F7000D7717200D973
          7400D8727300D26F7000DB757600DA747500DD777800DC767700DF797A00DE78
          7900E17B7C00E07A7B00E37D7E00E27C7D00C0696A00E57F8000E47E7F00E781
          8200E6808100E9838400E8828300EB858600EA848500ED878800EC868700B366
          6700EF898A00EE888900B4676800F18B8C00F08A8B00B6696A00F48E8F00F38D
          8E00F28C8D00B0666700F6909100F58F9000E7878800B96C6D00F8929300F791
          9200BB6E6F00FB959600FA949500F9939400FD979800FC969700BE717200AF68
          6900FF999A00FE989900C0737400F9969700C3767700F2939400DF898A00C87B
          7C00C67C7D00C0797A00FEA2A300A76C6D00FDA8A900F3A6A700FCAFB000ECA6
          A700F0AAAB00FBB6B700FABCBD00F5BBBC00F2B9BA00F9C5C600B86B6B00AE66
          6600BD707000C2757500C5787800C77A7A00A7666600CA7D7D00CD808000CC7F
          7F00A3666600A0666600B3737300AD7070009A666600F0B0B000F9C2C200F2D9
          C000FFFFDD00E2F8CC00C7F0BC0073B8760059B2670079DD900060D6810033CB
          6700020202020202020202020266030202020202020202020202020202020202
          02026666625E0302020202020202020202020202020202666663330B05290302
          020202020202020202020202026666411E060704042903596666666666666666
          020202020266130F0C0D090A082C034C4E505354685757660202020202661112
          100E0F0C0D2F036E71717171717157660202020202661714151112100E58036E
          71717171717157660202020202661818191617141537036E7171717171715766
          0202020202661C1D1A1B1819163A036E7171717171715766020202020266221F
          201C1D1A1B5A036E71717171717157660202020202662324212236512040036D
          7171717171715766020202020266272825265601674403696C6F6F7070705766
          0202020202662E2A2B275501525B03696A6A6A6A6B6B57660202020202663132
          2D2E2A4F274603696A6A6A6A6A6A57660202020202663434353031322D5C0369
          6A6A6A6A6A6A57660202020202663C3D38393435305D03696A6A6A6A6A6A5766
          0202020202663E3F3B3C3D38394903696A6A6A6A6A6A57660202020202664242
          433E3E3F3B5F03696A6A6A6A6A6A576602020202026642424242424343610369
          6A6A6A6A6A6A5766020202020266454242424242426003696A6A6A6A6A6A5766
          020202020266664B48424242426003696A6A6A6A6A6A57660202020202020266
          664D4A474260035E666666666666666602020202020202020202666665640302
          0202020202020202020202020202020202020202026603020202020202020202
          0202}
        Layout = blGlyphTop
        TabOrder = 4
        OnClick = btnCerrarClick
      end
      object btnFacturar: TBitBtn
        Left = 321
        Top = 1
        Width = 80
        Height = 56
        Align = alLeft
        Caption = 'Facturar'
        Glyph.Data = {
          7E040000424D7E040000000000003E0200002800000018000000180000000100
          08000000000040020000120B0000120B0000820000008200000000000000FFFF
          FF00FF00FF00B7818300A4747600FFFEFE00A87D7800AA807C00A07A7100B288
          7E00BA8E8200C2968500AE877700CA9C8800A3522800D8754200CEA08900F6CA
          B300D7A78C00D2A38A00DAA48200DEAD8E00DEAD8F00DAAB8D00DCD6D200FEFB
          F900B4ACA600B5AFAA00B4AEA900FAF4EF00F9F3EE00E5DBD200B4ADA700F9F2
          EC00F8F1EB00FECC9A00E3D9CF00B4ACA400F6ECE200F5EBE100F5ECE300E5DE
          D700E6E0DA00F9F3ED00E7E2DD00F9F4EF00DCD8D400FBF7F300FAF6F200FEFB
          F800FDFAF700FCF9F600FBF8F500FEFCFA00FFFEFD00FEFDFC00B0A59900AFA4
          9800FDEFE000B2AAA100B1A9A000F3E9DE00D7CEC400E4DBD100EDE4DA00D8D0
          C700E5DDD400F6EEE500D4C7B700D5C8B900D4C7B800D6CABC00B0A69A00F2E5
          D500F1E4D400D6CBBE00D5CABD00F3E7D900E1D6C900D5CBBF00F4E9DC00F3E8
          DB00E3D9CD00F4EADE00F4EBE000E6E0D900F7F1EA00FAF5EF00F0E2CF00EFE1
          CE00E8DAC800D5C9BA00E1D5C600E1D6C700F3E7D800F2E6D700D6CCBF00F3E8
          DA00E2D8CB00B1A99F00B2ABA200B1AAA100B3ACA300D9D1C700D7CFC500EDE5
          DB00D9D2C900E5DED500F7F0E700F6EFE600D9D3CB00F7F1E900FAF6F100FBF8
          F400F0E3D000F1E4D200B0A79A00B0A89C00B1A99E00B0A89D00D6CDC000E2D9
          CC00D6CEC200E7E2DB00FDFBF800B7B5B100B6B4B000FFFEFC00FEFDFB00FDFC
          FA00020202060303030303030303030303030303030303020202020202065E5E
          5E5E5E5E5E5E585858585858585803020202020202065E5F3A3A3A3A3A3A3A3A
          3A3A3A3A58580302020202020206514D23232323232323232323232358580302
          0202020202065350614D5F494A7372585858585858580302020202020206543D
          3A3A3A3A3A3A3A3A3A3A3A3A5959030202020202020669402323232323232323
          232323235A5A03020202020202096E6A6741683E7A78604B475B454644440302
          0202020202081B1C201A2566643B3C76777574483839040202020E0E0E0E0E0E
          0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E02020A2C7B2A55296B421F3F24
          5279624E5D5C0302020E0E02020A2E180F0F0F0F0F0F0F0F0F0F0F0F4F4C0302
          020E0E02020C7D7E11111111111111111111111165630402020E0E0E0E0E0E0E
          0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0202020B36363636362F2F575722
          226F6F262626030202020202020D37813A3A3A3A3A3A3A3A3A3A3A3A28270302
          02020202021001012323232323232323232323236D4303020202020202130101
          0101010101010101010101016F6C030202020202021201010101013635313371
          2F701D1E2156030202020202021701013A3A3A3A3A3A3A3A3A3A3A3A2D2B0302
          0202020202150101232323232323232323232323705703020202020202150101
          01010101010101017F357C337130030202020202021501010101010101010101
          0105801932340302020202020216141414141414141414141414141414140702
          0202}
        Layout = blGlyphTop
        TabOrder = 3
        OnClick = btnFacturarClick
      end
    end
    object pnlTotal: TRzPanel
      Left = 481
      Top = 1
      Width = 88
      Height = 58
      Align = alClient
      Alignment = taRightJustify
      BorderOuter = fsFlat
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -32
      Font.Name = 'Terminal'
      Font.Style = [fsBold]
      FrameControllerNotifications = [fcpColor, fcpDisabledColor, fcpReadOnlyColor, fcpReadOnlyColorOnFocus, fcpParentColor, fcpFlatButtonColor, fcpFlatButtons, fcpFrameColor, fcpFrameHotColor, fcpFrameHotTrack, fcpFrameHotStyle, fcpFrameSides, fcpFrameStyle, fcpFrameVisible, fcpFramingPreference]
      ParentFont = False
      TabOrder = 1
    end
  end
  object pnlCampos: TRzPanel
    Left = 0
    Top = 173
    Width = 570
    Height = 157
    Align = alClient
    BorderOuter = fsFlat
    TabOrder = 4
    object pnlDetalle: TRzPanel
      Left = 1
      Top = 1
      Width = 568
      Height = 84
      Align = alTop
      BorderOuter = fsFlat
      TabOrder = 0
      object pnlDetalle2: TRzPanel
        Left = 487
        Top = 1
        Width = 80
        Height = 82
        Align = alRight
        Alignment = taRightJustify
        BorderOuter = fsFlat
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object btnEliminarLinea: TBitBtn
          Left = 1
          Top = 31
          Width = 78
          Height = 30
          Align = alTop
          Caption = 'Eliminar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = btnEliminarLineaClick
        end
        object btnInsertarLinea: TBitBtn
          Left = 1
          Top = 1
          Width = 78
          Height = 30
          Align = alTop
          Caption = 'Aplicar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = btnInsertarLineaClick
        end
      end
      object pnlDetalle1: TRzPanel
        Left = 1
        Top = 1
        Width = 486
        Height = 82
        Align = alClient
        BorderOuter = fsFlat
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object pnlDetalle11: TRzPanel
          Left = 1
          Top = 1
          Width = 484
          Height = 40
          Align = alTop
          BorderOuter = fsFlat
          TabOrder = 0
          object pnlCodigoProducto: TRzPanel
            Left = 1
            Top = 1
            Width = 200
            Height = 38
            Align = alLeft
            BorderOuter = fsFlat
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object Label5: TLabel
              Left = 1
              Top = 1
              Width = 39
              Height = 16
              Align = alTop
              Caption = 'C'#243'digo'
            end
            object edtCodigoProducto: TButtonedEdit
              Left = 1
              Top = 17
              Width = 198
              Height = 20
              Align = alClient
              Images = ImageList1
              RightButton.ImageIndex = 0
              RightButton.Visible = True
              TabOrder = 0
              Text = 'edtCodigoProducto'
              OnExit = edtCodigoProductoExit
              OnKeyDown = edtCodigoProductoKeyDown
              OnRightButtonClick = edtCodigoProductoRightButtonClick
              ExplicitHeight = 24
            end
          end
          object pnlCodigoBarras: TRzPanel
            Left = 201
            Top = 1
            Width = 100
            Height = 38
            Align = alLeft
            Anchors = [akLeft, akTop, akRight, akBottom]
            BorderOuter = fsFlat
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            object Label6: TLabel
              Left = 1
              Top = 1
              Width = 80
              Height = 16
              Align = alTop
              Caption = 'C'#243'digo Barras'
            end
            object edtCodigoBarras: TButtonedEdit
              Left = 1
              Top = 17
              Width = 98
              Height = 20
              Align = alClient
              TabOrder = 0
              Text = 'ButtonedEdit1'
              OnExit = edtCodigoBarrasExit
              OnKeyDown = edtCodigoBarrasKeyDown
              ExplicitHeight = 24
            end
          end
          object pnlCantidad: TRzPanel
            Left = 301
            Top = 1
            Width = 89
            Height = 38
            Align = alLeft
            BorderOuter = fsFlat
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            object Label7: TLabel
              Left = 1
              Top = 1
              Width = 87
              Height = 16
              Align = alTop
              Caption = 'Cantidad'
              ExplicitWidth = 50
            end
            object edtCantidad: TCurrencyEdit
              Left = 1
              Top = 17
              Width = 87
              Height = 20
              Align = alClient
              DisplayFormat = ',0.00;-,0.00'
              TabOrder = 0
              OnKeyDown = edtCantidadKeyDown
              ExplicitHeight = 24
            end
          end
          object pnlDescuentoDetalle: TRzPanel
            Left = 390
            Top = 1
            Width = 90
            Height = 38
            Align = alLeft
            BorderOuter = fsFlat
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            object Label8: TLabel
              Left = 1
              Top = 1
              Width = 88
              Height = 16
              Align = alTop
              Caption = 'Descuento %'
              ExplicitWidth = 75
            end
            object edtDescuento: TCurrencyEdit
              Left = 1
              Top = 17
              Width = 68
              Height = 20
              Align = alClient
              DisplayFormat = ',0.00;-,0.00'
              TabOrder = 0
              ExplicitHeight = 24
            end
            object btnDescuentoMonto: TBitBtn
              Left = 69
              Top = 17
              Width = 20
              Height = 20
              Align = alRight
              Caption = '?'
              TabOrder = 1
              OnClick = btnDescuentoMontoClick
            end
          end
        end
        object pnlDetalle12: TRzPanel
          Left = 1
          Top = 41
          Width = 484
          Height = 40
          Align = alTop
          BorderOuter = fsFlat
          TabOrder = 1
          object pnlProducto: TRzPanel
            Left = 1
            Top = 1
            Width = 89
            Height = 38
            Align = alLeft
            Anchors = [akLeft, akTop, akRight, akBottom]
            BorderOuter = fsFlat
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object Label9: TLabel
              Left = 1
              Top = 1
              Width = 99
              Height = 16
              Align = alTop
              Caption = 'Producto Nombre'
            end
            object edtProductoNombre: TButtonedEdit
              Left = 1
              Top = 17
              Width = 87
              Height = 20
              Align = alClient
              Images = ImageList1
              ReadOnly = True
              RightButton.ImageIndex = 0
              RightButton.Visible = True
              TabOrder = 0
              Text = 'ButtonedEdit1'
              OnRightButtonClick = edtProductoNombreRightButtonClick
              ExplicitHeight = 24
            end
          end
          object pnlPrecio: TRzPanel
            Left = 90
            Top = 1
            Width = 89
            Height = 38
            Align = alLeft
            BorderOuter = fsFlat
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            object Label10: TLabel
              Left = 1
              Top = 1
              Width = 87
              Height = 16
              Align = alTop
              Caption = 'Precio'
              ExplicitWidth = 35
            end
            object edtPrecio: TCurrencyEdit
              Left = 1
              Top = 17
              Width = 87
              Height = 20
              Align = alClient
              DisplayFormat = ',0.00;-,0.00'
              ReadOnly = True
              TabOrder = 0
              ExplicitHeight = 24
            end
          end
          object pnlExistencia: TRzPanel
            Left = 179
            Top = 1
            Width = 100
            Height = 38
            Align = alLeft
            BorderOuter = fsFlat
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            object Label11: TLabel
              Left = 1
              Top = 1
              Width = 98
              Height = 16
              Align = alTop
              Caption = 'Existencia'
              ExplicitWidth = 56
            end
            object edtExistencia: TCurrencyEdit
              Left = 1
              Top = 17
              Width = 98
              Height = 20
              Align = alClient
              DisplayFormat = ',0.00;-,0.00'
              ReadOnly = True
              TabOrder = 0
              ExplicitHeight = 24
            end
          end
          object pnlDescripcion1: TRzPanel
            Left = 279
            Top = 1
            Width = 100
            Height = 38
            Align = alLeft
            BorderOuter = fsFlat
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            Visible = False
            object Label12: TLabel
              Left = 1
              Top = 1
              Width = 76
              Height = 16
              Align = alTop
              Caption = 'Descripci'#243'n 1'
            end
            object edtDescripcion1: TButtonedEdit
              Left = 1
              Top = 17
              Width = 98
              Height = 20
              Align = alClient
              TabOrder = 0
              Text = 'ButtonedEdit1'
              ExplicitHeight = 24
            end
          end
          object pnlDescripcion2: TRzPanel
            Left = 379
            Top = 1
            Width = 100
            Height = 38
            Align = alLeft
            BorderOuter = fsFlat
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            Visible = False
            object Label13: TLabel
              Left = 1
              Top = 1
              Width = 76
              Height = 16
              Align = alTop
              Caption = 'Descripci'#243'n 2'
            end
            object edtDescripcion2: TButtonedEdit
              Left = 1
              Top = 17
              Width = 98
              Height = 20
              Align = alClient
              TabOrder = 0
              Text = 'ButtonedEdit1'
              ExplicitHeight = 24
            end
          end
        end
      end
    end
    object pnlListaTitulo: TRzPanel
      Left = 1
      Top = 85
      Width = 568
      Height = 22
      Align = alTop
      BorderOuter = fsFlat
      Caption = 'Lista'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object chkTodoLista1: TCheckBox
        Left = 6
        Top = 4
        Width = 14
        Height = 17
        TabOrder = 0
        OnClick = chkTodoLista1Click
      end
    end
    object stbEstado1: TRzStatusBar
      Left = 1
      Top = 137
      Width = 568
      Height = 19
      BorderInner = fsNone
      BorderOuter = fsNone
      BorderSides = [sdLeft, sdTop, sdRight, sdBottom]
      BorderWidth = 0
      TabOrder = 3
      object RzStatusPane1: TRzStatusPane
        Left = 0
        Top = 0
        Width = 465
        Height = 19
        Align = alLeft
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Caption = ''
      end
    end
    object lvLista1: TRzListView
      Left = 1
      Top = 107
      Width = 568
      Height = 30
      Align = alClient
      Checkboxes = True
      Columns = <
        item
          MaxWidth = 25
          Width = 25
        end
        item
          Caption = 'C'#243'digo'
          Width = 150
        end
        item
          Caption = 'Nombre'
          Width = 300
        end
        item
          Alignment = taRightJustify
          Caption = 'Cantidad'
          Width = 100
        end
        item
          Alignment = taRightJustify
          Caption = 'Venta'
          Width = 150
        end
        item
          Alignment = taRightJustify
          Caption = 'Monto'
          Width = 150
        end
        item
          Caption = 'IdProducto'
          MaxWidth = 1
          Width = 0
        end
        item
          Caption = 'Id'
          MaxWidth = 1
          Width = 1
        end>
      PopupMenu = popDetalle
      ReadOnly = True
      RowSelect = True
      TabOrder = 2
      ViewStyle = vsReport
    end
  end
  object pnlPie: TRzPanel
    Left = 0
    Top = 330
    Width = 570
    Height = 41
    Align = alBottom
    BorderOuter = fsFlat
    TabOrder = 5
    object pnlSubTotal: TRzPanel
      Left = 1
      Top = 1
      Width = 200
      Height = 39
      Align = alLeft
      Alignment = taLeftJustify
      AlignmentVertical = avBottom
      BorderOuter = fsFlat
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Terminal'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object Label1: TLabel
        Left = 1
        Top = 1
        Width = 51
        Height = 16
        Align = alTop
        Caption = 'SubTotal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
    end
    object pnlDescuento: TRzPanel
      Left = 201
      Top = 1
      Width = 200
      Height = 39
      Align = alLeft
      Alignment = taLeftJustify
      AlignmentVertical = avBottom
      BorderOuter = fsFlat
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Terminal'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object Label2: TLabel
        Left = 1
        Top = 1
        Width = 59
        Height = 16
        Align = alTop
        Caption = 'Descuento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
    end
    object pnlServicio: TRzPanel
      Left = 401
      Top = 1
      Width = 200
      Height = 39
      Align = alLeft
      Alignment = taLeftJustify
      AlignmentVertical = avBottom
      BorderOuter = fsFlat
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Terminal'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Visible = False
      object Label3: TLabel
        Left = 1
        Top = 1
        Width = 45
        Height = 16
        Align = alTop
        Caption = 'Servicio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
    end
    object pnlImpuesto: TRzPanel
      Left = 601
      Top = 1
      Width = 200
      Height = 39
      Align = alLeft
      Alignment = taLeftJustify
      AlignmentVertical = avBottom
      BorderOuter = fsFlat
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Terminal'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      object Label4: TLabel
        Left = 1
        Top = 1
        Width = 96
        Height = 16
        Align = alTop
        Caption = 'Impuesto Ventas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
    end
  end
  object ImageList1: TImageList
    Left = 496
    Top = 184
    Bitmap = {
      494C010102000800980010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      000000000000000000000000000000000000FFFFFFFF314B6200AC7D7E00FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005084B2000F6FE100325F8C00B87E
      7A00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF6C6A6A006C6A6A00FFFFFFFFFFFFFFFFFFFFFFFF6C6A6A00FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000032A0FE0037A1FF00106FE200325F
      8B00B67D7900FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6C6A
      6A00B0ADAD008E8A8B006C6A6A00817E7F006C6A6A00D0CFCF006C6A6A006C6A
      6A00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFF37A4FE00379FFF000E6D
      DE00355F8900BB7F7900FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6C6A6A00E0DE
      DE00C0BFBF00A19F9F00A19F9F0000000000000000005D5D5D00A9A9A900CACA
      CA00CACACA00C1C0C0006C6A6A006C6A6A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFF37A4FE00359E
      FF000F6FDE0035608B00A67B7F00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6C6A6A00D3D3D300CFCF
      CF008C8A8A00817F7F00817F7F00141414000808080000000000000000005D5D
      5D00A9A9A900CACACA00B7B6B6006C6A6A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF38A5
      FE00329DFF00156DCE00444F5B00FFFFFFFF9C6B6500AF887B00AF887E00AA80
      7500FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCACACA00C5C5C500D7D4
      D400F7F6F600F2F0F000E0DEDE00B6B5B500A5A3A300A19F9F009E9A9C006865
      6600232223001919190099979700FFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF3BABFF00A1CAE700AD867900A9837300E0CFB100FFFFDA00FFFFDD00FCF8
      CF00CCB29F00A1746B00FFFFFFFFFFFFFFFFFFFFFFFFC5C5C5008E8C8C00F7F6
      F600F7F6F600F2F0F000EEEDED00E7E6E600E3E2E200C2C1C100AFADAD00A19F
      9F00999797006C6A6A009F9D9D00FFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFC0917D00FCE9AC00FFFFCC00FFFFCF00FFFFD000FFFF
      DE00FFFFFA00E3D3D10099696500FFFFFFFFFFFFFFFFCECBCC00F7F6F600F7F6
      F600F7F6F600AFACAD00ADABAB0083797B0075696B00ABA5A600C7C6C600D1D1
      D100CECECE00BBBABA00A6A4A400FFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFB0897800FAD19200FEF4C200FFFFD000FFFFDA00FFFF
      F600FFFFFC00FFFFFC00B6938400FFFFFFFFFFFFFFFF6C6A6A006C6A6A00EDEB
      EB00AFA4A500766A6C0083787A00ACAAAA00B2B0B0009891920081777800938C
      8E00BFBFBF00CACACA00C0C0C000FFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFB0897800FEDA9700EDB47800FBEEBB00FFFFD300FFFFDC00FFFF
      F400FFFFF400FFFFE200E9DDBC00A67B7300FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFBD828100FFD0A100FFCB9800A1785C007B665F00665659006F626500CECC
      CC00CFCFCF006C6A6A00FFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFB18A7800FFDE9900E9A16700F4D19900FEFCCC00FFFFD500FFFF
      DA00FFFFDC00FFFFD700EFE6C500A97E7500FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFBD828100FFD4A900FFCFA000FFC68E00FFC18600FFC08400BD8281006C6A
      6A006C6A6A00FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFAA7F7300FAE0A400F0B77800EEBA7B00F6DDA600FEFBCC00FFFF
      D300FFFFD100FFFFD700D9C5A700A3756C00FFFFFFFFFFFFFFFFFFFFFFFFBD82
      8100FFE5CB00FFDCB800FFD7AF00FFCE9D00FFC99500BD828100FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFCEB29300FFFEDD00F4D1A500EEBA7B00F2C78F00F8E1
      AB00FCF0BA00FCFACA00A3776F00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBD82
      8100FFEAD400FFE0C000FFDAB700FFD1A500FFCC9C00BD828100FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFA1746B00E1D4D300FFFEEE00F7CC8C00F0B47300F7C7
      8800FCE3A500C2A08800A5776C00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7
      EE00FFF2E300FFE7D000FFE3C700FFD9B400FFD4AB00FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF98686500BA958700EAD7A400EAD59E00E0C0
      9700A5776C00A5776C00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBD828100FFFA
      F300FFF6ED00FFEBD900FFE7CF00FFDDBC00F2C7A900FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA77E7000A9807300A478
      6E00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFBD828100BD828100BD828100FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
  object popImprimir: TPopupMenu
    Left = 456
    Top = 80
    object Imprimir1: TMenuItem
      Caption = 'Imprimir'
      OnClick = Imprimir1Click
    end
    object VistaPrevia1: TMenuItem
      Caption = 'Vista Previa'
      OnClick = VistaPrevia1Click
    end
  end
  object popDetalle: TPopupMenu
    Left = 409
    Top = 274
    object CambiarDetalle1: TMenuItem
      Caption = 'Cambiar Detalle'
      OnClick = CambiarDetalle1Click
    end
  end
end