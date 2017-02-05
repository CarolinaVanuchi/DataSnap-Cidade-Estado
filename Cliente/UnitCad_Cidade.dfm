inherited Cad_Cidade: TCad_Cidade
  Caption = 'Cidade'
  ClientHeight = 0
  ClientWidth = 120
  OnClose = FormClose
  OnShow = FormShow
  ExplicitWidth = 136
  ExplicitHeight = 39
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 120
    Height = 0
    ExplicitWidth = 120
    ExplicitHeight = 0
    inherited Panel2: TPanel
      Height = 0
      ExplicitHeight = 0
      inherited Button2: TButton
        Top = -41
        ExplicitTop = -41
      end
    end
    inherited pageControl: TPageControl
      Width = 15
      Height = 0
      ExplicitWidth = 15
      ExplicitHeight = 0
      inherited Dados: TTabSheet
        ExplicitLeft = 6
        ExplicitTop = 28
        object Label3: TLabel [1]
          Left = 159
          Top = 16
          Width = 37
          Height = 13
          Caption = 'Estado:'
        end
        object Label4: TLabel [2]
          Left = 8
          Top = 73
          Width = 63
          Height = 13
          Caption = 'C'#243'digo IBGE:'
        end
        object Label5: TLabel [3]
          Left = 159
          Top = 73
          Width = 113
          Height = 13
          Caption = 'C'#243'digo Localidade ANP:'
        end
        object Label6: TLabel [4]
          Left = 8
          Top = 127
          Width = 31
          Height = 13
          Caption = 'Nome:'
        end
        inherited edtCod: TDBEdit
          DataField = 'cod_cidade'
          DataSource = Dm.DS_Cidade
        end
        object edtEstado: TDBLookupComboBox
          Left = 159
          Top = 35
          Width = 393
          Height = 21
          DataField = 'cod_estado'
          DataSource = Dm.DS_Cidade
          KeyField = 'cod_estado'
          ListField = 'nome_estado'
          ListSource = Dm.DS_Estado
          TabOrder = 1
        end
        object edtIBGE: TDBEdit
          Left = 8
          Top = 92
          Width = 121
          Height = 21
          DataField = 'cod_cidade_ibge'
          DataSource = Dm.DS_Cidade
          TabOrder = 2
        end
        object edtLocalidade: TDBEdit
          Left = 159
          Top = 92
          Width = 121
          Height = 21
          DataField = 'codigo_localidade_anp'
          DataSource = Dm.DS_Cidade
          TabOrder = 3
        end
        object edtNome: TDBEdit
          Left = 8
          Top = 146
          Width = 545
          Height = 21
          CharCase = ecUpperCase
          DataField = 'nome_cidade'
          DataSource = Dm.DS_Cidade
          TabOrder = 4
        end
      end
      inherited tbPesquisa: TTabSheet
        ExplicitWidth = 7
        inherited Panel3: TPanel
          Width = 7
          ExplicitWidth = 7
        end
        inherited DBGrid1: TDBGrid
          Width = 7
          DataSource = Dm.DS_Cidade
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
