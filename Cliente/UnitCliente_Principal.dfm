object Cliente_Principal: TCliente_Principal
  Left = 0
  Top = 0
  Caption = 'Estado/Cidade'
  ClientHeight = 400
  ClientWidth = 655
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 655
    Height = 400
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 655
      Height = 49
      Align = alTop
      BevelOuter = bvNone
      Color = clGradientInactiveCaption
      ParentBackground = False
      TabOrder = 0
      object Button1: TButton
        Left = 0
        Top = 0
        Width = 175
        Height = 49
        Action = ActEstado
        Align = alLeft
        Style = bsCommandLink
        TabOrder = 0
      end
      object Button2: TButton
        Left = 175
        Top = 0
        Width = 175
        Height = 49
        Action = ActCidade
        Align = alLeft
        Style = bsCommandLink
        TabOrder = 1
      end
    end
  end
  object ActConexao: TActionList
    Left = 32
    Top = 352
    object ActEstado: TAction
      Caption = 'Estado'
      OnExecute = ActEstadoExecute
    end
    object ActCidade: TAction
      Caption = 'Cidade'
      OnExecute = ActCidadeExecute
    end
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
    Left = 272
    Top = 356
    UniqueId = '{1BD55322-084A-4FC7-B19B-A9FE52F0907E}'
  end
  object DSProviderConnection1: TDSProviderConnection
    ServerClassName = 'TServidor_Principal_Metodos'
    SQLConnection = SQLConnection1
    Left = 160
    Top = 356
  end
end
