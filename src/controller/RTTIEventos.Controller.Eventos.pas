unit RTTIEventos.Controller.Eventos;

interface

uses
  System.Rtti,
  System.Classes,
  Vcl.DBCtrls,
  Vcl.Forms,
  System.SysUtils,
  RTTIEventos.Model.Eventos;

type
  TEventos = class(TInterfacedObject, IEventos)
  public
    class function New: IEventos;
    procedure OnExitNome(Sender: TObject);
    procedure OnExitCPF(Sender: TObject);
  end;

implementation

uses
  Vcl.StdCtrls,
  Vcl.Dialogs;

{ TEventos }

class function TEventos.New: IEventos;
begin
  Result := Self.Create;
end;

procedure TEventos.OnExitCPF(Sender: TObject);
var
  LEditCpf: TEdit absolute Sender;
begin
  ShowMessage(Format('Saiu do campo CPF [%s]', [LEditCpf.Text]));
end;

procedure TEventos.OnExitNome(Sender: TObject);
var
  LEditNome: TEdit absolute Sender;
begin
  ShowMessage(Format('Saiu do campo Nome [%s]', [LEditNome.Text]));
end;

end.
