object dmLenguajes: TdmLenguajes
  OldCreateOrder = False
  Height = 236
  Width = 278
  object FDMemIdioma: TFDMemTable
    FieldDefs = <
      item
        Name = 'Key'
        DataType = ftMemo
      end
      item
        Name = 'Value'
        DataType = ftMemo
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    AutoCommitUpdates = False
    StoreDefs = True
    Left = 136
    Top = 128
  end
end
