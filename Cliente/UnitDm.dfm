object Dm: TDm
  OldCreateOrder = False
  Height = 190
  Width = 400
  object CDS_Estado: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_Estado'
    RemoteServer = DSProviderConnection1
    Left = 133
    Top = 28
    object CDS_Estadocod_estado: TAutoIncField
      DisplayLabel = 'Cod'
      FieldName = 'cod_estado'
      ReadOnly = True
    end
    object CDS_Estadocod_pais: TLongWordField
      DisplayLabel = 'Cod Pais'
      FieldName = 'cod_pais'
    end
    object CDS_Estadonome_estado: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome_estado'
      Required = True
      Size = 50
    end
    object CDS_Estadosigla_estado: TStringField
      DisplayLabel = 'Sigla'
      FieldName = 'sigla_estado'
      FixedChar = True
      Size = 2
    end
    object CDS_Estadocodigo_ibge: TIntegerField
      DisplayLabel = 'IBGE'
      FieldName = 'codigo_ibge'
    end
  end
  object DS_Estado: TDataSource
    DataSet = CDS_Estado
    Left = 133
    Top = 84
  end
  object CDS_Pais: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_Pais'
    RemoteServer = DSProviderConnection1
    Left = 211
    Top = 28
    object CDS_Paiscod_pais: TAutoIncField
      FieldName = 'cod_pais'
      ReadOnly = True
    end
    object CDS_Paisnome_pais: TStringField
      FieldName = 'nome_pais'
      Required = True
      Size = 30
    end
  end
  object DS_Pais: TDataSource
    DataSet = CDS_Pais
    Left = 211
    Top = 84
  end
  object CDS_Cidade: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_Cidade'
    RemoteServer = DSProviderConnection1
    Left = 293
    Top = 24
    object CDS_Cidadecod_cidade: TAutoIncField
      DisplayLabel = 'Cod'
      FieldName = 'cod_cidade'
      ReadOnly = True
    end
    object CDS_Cidadecod_estado: TLongWordField
      DisplayLabel = 'Estado'
      FieldName = 'cod_estado'
    end
    object CDS_Cidadenome_cidade: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome_cidade'
      Required = True
      Size = 30
    end
    object CDS_Cidadecod_cidade_ibge: TIntegerField
      DisplayLabel = 'IBGE'
      FieldName = 'cod_cidade_ibge'
    end
    object CDS_Cidadecodigo_localidade_anp: TIntegerField
      DisplayLabel = 'Localidade ANP'
      FieldName = 'codigo_localidade_anp'
    end
  end
  object DS_Cidade: TDataSource
    DataSet = CDS_Cidade
    Left = 293
    Top = 80
  end
  object DSProviderConnection1: TDSProviderConnection
    ServerClassName = 'TServidor_Principal_Metodos'
    SQLConnection = SQLConnection1
    Left = 40
    Top = 24
  end
  object SQLConnection1: TSQLConnection
    DriverName = 'DataSnap'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXDataSnap'
      'HostName=localhost'
      'Port=211'
      'CommunicationProtocol=tcp/ip'
      'DatasnapContext=datasnap/'
      
        'DriverAssemblyLoader=Borland.Data.TDBXClientDriverLoader,Borland' +
        '.Data.DbxClientDriver,Version=21.0.0.0,Culture=neutral,PublicKey' +
        'Token=91d62ebb5b0d1b1b')
    Left = 40
    Top = 88
    UniqueId = '{1BD55322-084A-4FC7-B19B-A9FE52F0907E}'
  end
end
