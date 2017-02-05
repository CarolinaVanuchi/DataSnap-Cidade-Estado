object Dm: TDm
  OldCreateOrder = False
  Height = 292
  Width = 427
  object CDS_Estado: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_Estado'
    Left = 56
    Top = 24
    object CDS_Estadocod_estado: TAutoIncField
      FieldName = 'cod_estado'
      ReadOnly = True
    end
    object CDS_Estadocod_pais: TLongWordField
      FieldName = 'cod_pais'
    end
    object CDS_Estadonome_estado: TStringField
      FieldName = 'nome_estado'
      Required = True
    end
    object CDS_Estadosigla_estado: TStringField
      FieldName = 'sigla_estado'
      FixedChar = True
      Size = 2
    end
    object CDS_Estadocodigo_ibge: TIntegerField
      FieldName = 'codigo_ibge'
    end
  end
  object DS_Estado: TDataSource
    DataSet = CDS_Estado
    Left = 56
    Top = 80
  end
  object CDS_Cidade: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_Cidade'
    Left = 264
    Top = 24
    object CDS_Cidadecod_cidade: TAutoIncField
      FieldName = 'cod_cidade'
      ReadOnly = True
    end
    object CDS_Cidadecod_estado: TLongWordField
      FieldName = 'cod_estado'
    end
    object CDS_Cidadenome_cidade: TStringField
      FieldName = 'nome_cidade'
      Required = True
      Size = 30
    end
    object CDS_Cidadecod_cidade_ibge: TIntegerField
      FieldName = 'cod_cidade_ibge'
    end
    object CDS_Cidadecodigo_localidade_anp: TIntegerField
      FieldName = 'codigo_localidade_anp'
    end
  end
  object DS_Cidade: TDataSource
    DataSet = CDS_Cidade
    Left = 264
    Top = 88
  end
end
