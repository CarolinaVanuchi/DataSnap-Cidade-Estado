object Servidor_Principal_Metodos: TServidor_Principal_Metodos
  OldCreateOrder = False
  Height = 193
  Width = 371
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 51
    Top = 16
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    Left = 51
    Top = 72
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=sc'
      'User_Name=root'
      'Password=4321'
      'Server=localhost'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 51
    Top = 136
  end
  object Q_Estado: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from tab_estado')
    Left = 160
    Top = 16
  end
  object Q_Cidade: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from tab_cidade')
    Left = 160
    Top = 80
  end
  object DSP_Estado: TDataSetProvider
    DataSet = Q_Estado
    Left = 240
    Top = 16
  end
  object DSP_Cidade: TDataSetProvider
    DataSet = Q_Cidade
    Left = 240
    Top = 80
  end
end
