object Cad_Cidade: TCad_Cidade
  Left = 0
  Top = 0
  Caption = 'Cidade'
  ClientHeight = 369
  ClientWidth = 701
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 701
    Height = 369
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 105
      Height = 369
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object Button1: TButton
        Left = 0
        Top = 0
        Width = 105
        Height = 45
        Action = ActIncluir
        Align = alTop
        Style = bsCommandLink
        TabOrder = 0
      end
      object Button2: TButton
        Left = 0
        Top = 45
        Width = 105
        Height = 45
        Action = ActAlterar
        Align = alTop
        Style = bsCommandLink
        TabOrder = 1
      end
      object Button3: TButton
        Left = 0
        Top = 90
        Width = 105
        Height = 45
        Action = ActExcluir
        Align = alTop
        Style = bsCommandLink
        TabOrder = 2
      end
      object Button4: TButton
        Left = 0
        Top = 324
        Width = 105
        Height = 45
        Action = ActSair
        Align = alBottom
        Style = bsCommandLink
        TabOrder = 3
      end
      object Button6: TButton
        Left = 0
        Top = 135
        Width = 105
        Height = 45
        Action = ActSalvar
        Align = alTop
        Style = bsCommandLink
        TabOrder = 4
      end
      object Button7: TButton
        Left = 0
        Top = 180
        Width = 105
        Height = 45
        Action = ActCancela
        Align = alTop
        Style = bsCommandLink
        TabOrder = 5
      end
    end
    object PageControl1: TPageControl
      Left = 105
      Top = 0
      Width = 596
      Height = 369
      ActivePage = TabSheet2
      Align = alClient
      TabOrder = 1
      object TabSheet1: TTabSheet
        Caption = 'Dados'
        object Label2: TLabel
          Left = 3
          Top = 17
          Width = 27
          Height = 13
          Caption = 'Cod.:'
        end
        object Label3: TLabel
          Left = 152
          Top = 17
          Width = 37
          Height = 13
          Caption = 'Estado:'
        end
        object Label4: TLabel
          Left = 0
          Top = 70
          Width = 63
          Height = 13
          Caption = 'C'#243'digo IBGE:'
        end
        object Label5: TLabel
          Left = 3
          Top = 116
          Width = 31
          Height = 13
          Caption = 'Nome:'
        end
        object Label6: TLabel
          Left = 152
          Top = 71
          Width = 113
          Height = 13
          Caption = 'C'#243'digo Localidade ANP:'
        end
        object edtCodigo: TDBEdit
          Left = 2
          Top = 36
          Width = 121
          Height = 21
          Color = clInactiveCaption
          DataField = 'cod_cidade'
          DataSource = Dm.DS_Cidade
          Enabled = False
          TabOrder = 0
        end
        object edtIBGE: TDBEdit
          Left = 0
          Top = 89
          Width = 121
          Height = 21
          DataField = 'cod_cidade_ibge'
          DataSource = Dm.DS_Cidade
          Enabled = False
          TabOrder = 2
        end
        object edtLocalidade: TDBEdit
          Left = 152
          Top = 90
          Width = 121
          Height = 21
          DataField = 'codigo_localidade_anp'
          DataSource = Dm.DS_Cidade
          Enabled = False
          TabOrder = 3
        end
        object edtNome: TDBEdit
          Left = 3
          Top = 135
          Width = 574
          Height = 21
          CharCase = ecUpperCase
          DataField = 'nome_cidade'
          DataSource = Dm.DS_Cidade
          Enabled = False
          TabOrder = 4
        end
        object edtEstado: TDBLookupComboBox
          Left = 152
          Top = 36
          Width = 425
          Height = 21
          DataField = 'cod_estado'
          DataSource = Dm.DS_Cidade
          Enabled = False
          KeyField = 'cod_estado'
          ListField = 'nome_estado'
          ListSource = Dm.DS_Estado
          TabOrder = 1
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Lista'
        ImageIndex = 1
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 588
          Height = 49
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object Label1: TLabel
            Left = 8
            Top = 1
            Width = 95
            Height = 13
            Caption = 'Pesquisa por Nome:'
          end
          object edtPesquisa: TEdit
            Left = 8
            Top = 15
            Width = 399
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 0
          end
          object Button5: TButton
            Left = 413
            Top = 3
            Width = 116
            Height = 41
            Action = ActPesquisa
            Style = bsCommandLink
            TabOrder = 1
          end
        end
        object DBGrid1: TDBGrid
          Left = 0
          Top = 49
          Width = 588
          Height = 292
          Align = alClient
          DataSource = Dm.DS_Cidade
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
  object AcCidade: TActionList
    Left = 24
    Top = 240
    object ActIncluir: TAction
      Caption = 'Incluir'
      OnExecute = ActIncluirExecute
    end
    object ActAlterar: TAction
      Caption = 'Alterar'
      OnExecute = ActAlterarExecute
    end
    object ActExcluir: TAction
      Caption = 'Excluir'
      OnExecute = ActExcluirExecute
    end
    object ActSair: TAction
      Caption = 'Sair'
      OnExecute = ActSairExecute
    end
    object ActPesquisa: TAction
      Caption = 'Pesquisar'
      OnExecute = ActPesquisaExecute
    end
    object ActSalvar: TAction
      Caption = 'Salvar'
      Enabled = False
      OnExecute = ActSalvarExecute
    end
    object ActCancela: TAction
      Caption = 'Cancelar'
      OnExecute = ActCancelaExecute
    end
  end
end
