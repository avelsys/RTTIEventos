unit RTTIEventos.Model.Eventos;

interface

uses
  System.Classes;

type
  IEventos = interface
    ['{98C179A8-CA74-4C31-A4D0-4267E613406F}']
    procedure OnExitNome(Sender: TObject);
    procedure OnExitCPF(Sender: TObject);
  end;

  IGerenciaEventos = interface
    ['{98C179A8-CA74-4C31-A4D0-4267E613406F}']
  end;

implementation

end.
