object RttiEventViewMain: TRttiEventViewMain
  Left = 0
  Top = 0
  Caption = 'RTTI Inser'#231#227'o de eventos no Edit'
  ClientHeight = 111
  ClientWidth = 672
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object grpCadastro: TGroupBox
    Left = 0
    Top = 0
    Width = 672
    Height = 105
    Align = alTop
    Caption = 'Informa'#231#245'es'
    TabOrder = 0
    object lblID: TLabel
      Left = 16
      Top = 35
      Width = 45
      Height = 15
      Caption = 'CODIGO'
    end
    object lblNome: TLabel
      Left = 152
      Top = 35
      Width = 35
      Height = 15
      Caption = 'NOME'
    end
    object lblCPF: TLabel
      Left = 536
      Top = 35
      Width = 21
      Height = 15
      Caption = 'CPF'
    end
    object edtID: TEdit
      Left = 16
      Top = 56
      Width = 121
      Height = 23
      TabOrder = 0
    end
    object edtNome: TEdit
      Left = 152
      Top = 56
      Width = 369
      Height = 23
      TabOrder = 1
    end
    object edtCPF: TEdit
      Left = 536
      Top = 56
      Width = 121
      Height = 23
      TabOrder = 2
    end
  end
end
