program RTTIEvent;

uses
  Vcl.Forms,
  RTTIEventos.Main in 'src\view\RTTIEventos.Main.pas' {RttiEventViewMain},
  RTTIEventos.Model.Atributos in 'src\model\RTTIEventos.Model.Atributos.pas',
  RTTIEventos.Model.Eventos in 'src\model\RTTIEventos.Model.Eventos.pas',
  RTTIEventos.Controller.GerenciaEventos in 'src\controller\RTTIEventos.Controller.GerenciaEventos.pas',
  RTTIEventos.Controller.Eventos in 'src\controller\RTTIEventos.Controller.Eventos.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TRttiEventViewMain, RttiEventViewMain);
  Application.Run;
end.
