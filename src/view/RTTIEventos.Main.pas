unit RTTIEventos.Main;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  RTTIEventos.Model.Eventos,
  RTTIEventos.Model.Atributos;

type
  TRttiEventViewMain = class(TForm)
    grpCadastro: TGroupBox;
    edtID: TEdit;
    [TAtributoEvento('OnExitNome')]
    edtNome: TEdit;
    [TAtributoEvento('OnExitCPF')]
    edtCPF: TEdit;
    lblID: TLabel;
    lblNome: TLabel;
    lblCPF: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    FEvento: IGerenciaEventos;
  end;

var
  RttiEventViewMain: TRttiEventViewMain;

implementation

uses
  RTTIEventos.Controller.GerenciaEventos;

{$R *.dfm}

procedure TRttiEventViewMain.FormCreate(Sender: TObject);
begin
  FEvento := TGerenciaEventos.New(Self);
end;

end.
