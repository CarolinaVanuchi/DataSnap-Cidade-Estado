inherited Cad_Estado: TCad_Estado
  Caption = 'Estado'
  ClientHeight = 433
  ClientWidth = 709
  OnClose = FormClose
  OnShow = FormShow
  ExplicitWidth = 725
  ExplicitHeight = 472
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 709
    Height = 433
    ExplicitWidth = 120
    ExplicitHeight = 0
    inherited Panel2: TPanel
      Height = 433
      ExplicitHeight = 0
      inherited Button2: TButton
        Top = 392
        ExplicitTop = -41
      end
    end
    inherited pageControl: TPageControl
      Width = 604
      Height = 433
      ExplicitWidth = 15
      ExplicitHeight = 0
      inherited Dados: TTabSheet
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Label3: TLabel [1]
          Left = 168
          Top = 16
          Width = 23
          Height = 13
          Caption = 'Pa'#237's:'
        end
        object Label4: TLabel [2]
          Left = 8
          Top = 73
          Width = 63
          Height = 13
          Caption = 'C'#243'digo IBGE:'
        end
        object Label5: TLabel [3]
          Left = 8
          Top = 127
          Width = 31
          Height = 13
          Caption = 'Nome:'
        end
        object Label6: TLabel [4]
          Left = 168
          Top = 73
          Width = 26
          Height = 13
          Caption = 'Sigla:'
        end
        inherited edtCod: TDBEdit
          DataField = 'cod_estado'
          DataSource = Dm.DS_Estado
        end
        object edtPais: TDBLookupComboBox
          Left = 168
          Top = 35
          Width = 393
          Height = 21
          DataField = 'cod_pais'
          DataSource = Dm.DS_Estado
          Enabled = False
          KeyField = 'cod_pais'
          ListField = 'nome_pais'
          ListSource = Dm.DS_Pais
          TabOrder = 1
        end
        object edtIBGE: TDBEdit
          Left = 8
          Top = 92
          Width = 121
          Height = 21
          DataField = 'codigo_ibge'
          DataSource = Dm.DS_Estado
          Enabled = False
          TabOrder = 2
        end
        object edtNome: TDBEdit
          Left = 8
          Top = 146
          Width = 548
          Height = 21
          CharCase = ecUpperCase
          DataField = 'nome_estado'
          DataSource = Dm.DS_Estado
          Enabled = False
          TabOrder = 4
        end
        object edtSigla: TDBEdit
          Left = 168
          Top = 92
          Width = 121
          Height = 21
          CharCase = ecUpperCase
          DataField = 'sigla_estado'
          DataSource = Dm.DS_Estado
          Enabled = False
          TabOrder = 3
        end
      end
      inherited tbPesquisa: TTabSheet
        ExplicitWidth = 7
        inherited Panel3: TPanel
          Width = 596
          ExplicitWidth = 7
        end
        inherited DBGrid1: TDBGrid
          Width = 596
          Height = 364
          DataSource = Dm.DS_Estado
        end
      end
    end
  end
  inherited ActionList1: TActionList
    inherited ActPesquisar: TAction
      OnExecute = ActPesquisarExecute
    end
  end
end
