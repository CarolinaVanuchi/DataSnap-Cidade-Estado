object Servidor_Principal: TServidor_Principal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Principal - Servidor'
  ClientHeight = 119
  ClientWidth = 402
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 402
    Height = 119
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 421
    ExplicitHeight = 290
    object Label2: TLabel
      Left = 17
      Top = 15
      Width = 50
      Height = 23
      Caption = 'Porta:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Button1: TButton
      Left = 16
      Top = 74
      Width = 369
      Height = 40
      Action = ActConexao_Servidor
      Style = bsCommandLink
      TabOrder = 0
    end
    object edtPorta: TEdit
      Left = 16
      Top = 39
      Width = 369
      Height = 21
      NumbersOnly = True
      TabOrder = 1
      Text = '211'
    end
  end
  object ActConexao: TActionList
    Left = 368
    object ActConexao_Servidor: TAction
      Caption = 'Conectar'
      OnExecute = ActConexao_ServidorExecute
    end
  end
end
