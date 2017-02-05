object Frm_Padro: TFrm_Padro
  Left = 0
  Top = 0
  ClientHeight = 462
  ClientWidth = 696
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 696
    Height = 462
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 105
      Height = 462
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object Button2: TButton
        Left = 0
        Top = 421
        Width = 105
        Height = 41
        Action = ActSair
        Align = alBottom
        Style = bsCommandLink
        TabOrder = 0
      end
      object Button3: TButton
        Left = 0
        Top = 0
        Width = 105
        Height = 41
        Action = ActInserir
        Align = alTop
        Style = bsCommandLink
        TabOrder = 1
      end
      object Button4: TButton
        Left = 0
        Top = 41
        Width = 105
        Height = 41
        Action = ActAlterar
        Align = alTop
        Style = bsCommandLink
        TabOrder = 2
      end
      object Button5: TButton
        Left = 0
        Top = 82
        Width = 105
        Height = 41
        Action = ActExcluir
        Align = alTop
        Style = bsCommandLink
        TabOrder = 3
      end
      object Button6: TButton
        Left = 0
        Top = 123
        Width = 105
        Height = 41
        Action = ActSalvar
        Align = alTop
        Style = bsCommandLink
        TabOrder = 4
      end
      object Button7: TButton
        Left = 0
        Top = 164
        Width = 105
        Height = 41
        Action = ActCancelar
        Align = alTop
        Style = bsCommandLink
        TabOrder = 5
      end
    end
    object pageControl: TPageControl
      Left = 105
      Top = 0
      Width = 591
      Height = 462
      ActivePage = tbPesquisa
      Align = alClient
      TabOrder = 1
      object Dados: TTabSheet
        Caption = 'Dados'
        object Label2: TLabel
          Left = 8
          Top = 16
          Width = 27
          Height = 13
          Caption = 'Cod.:'
        end
        object edtCod: TDBEdit
          Left = 8
          Top = 35
          Width = 121
          Height = 21
          Color = clInactiveCaption
          Enabled = False
          TabOrder = 0
        end
      end
      object tbPesquisa: TTabSheet
        Caption = 'Pesquisa'
        ImageIndex = 1
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 583
          Height = 41
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object Label1: TLabel
            Left = 2
            Top = 0
            Width = 95
            Height = 13
            Caption = 'Pesquisa por Nome:'
          end
          object edtPesquisa: TEdit
            Left = 2
            Top = 16
            Width = 399
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 0
          end
          object Button1: TButton
            Left = 407
            Top = 0
            Width = 113
            Height = 41
            Action = ActPesquisar
            Style = bsCommandLink
            TabOrder = 1
          end
        end
        object DBGrid1: TDBGrid
          Left = 0
          Top = 41
          Width = 583
          Height = 393
          Align = alClient
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
        end
      end
    end
  end
  object ActionList1: TActionList
    Left = 24
    Top = 256
    object ActPesquisar: TAction
      Caption = 'Pesquisar'
    end
    object ActSalvar: TAction
      Caption = 'Salvar'
      OnExecute = ActSalvarExecute
    end
    object ActInserir: TAction
      Caption = 'Inserir'
      OnExecute = ActInserirExecute
    end
    object ActAlterar: TAction
      Caption = 'Alterar'
      OnExecute = ActAlterarExecute
    end
    object ActExcluir: TAction
      Caption = 'Excluir'
      OnExecute = ActExcluirExecute
    end
    object ActCancelar: TAction
      Caption = 'Cancelar'
      OnExecute = ActCancelarExecute
    end
    object ActSair: TAction
      Caption = 'Sair'
      OnExecute = ActSairExecute
    end
  end
end
