unit RTTIEventos.Controller.GerenciaEventos;

interface

uses
  System.TypInfo,
  System.Rtti,
  System.Classes,
  Vcl.DBCtrls,
  Vcl.Forms,
  System.SysUtils,
  RTTIEventos.Model.Eventos;

type
  TGerenciaEventos = class(TInterfacedObject, IGerenciaEventos)
  protected
    FEvento: IEventos;
    constructor Create(const AClassForm: TForm);
    procedure ConfigurarEventos(const AClassForm: TForm);
  public
    class function New(const AClassForm: TForm): IGerenciaEventos;
  end;

implementation

uses
  Vcl.StdCtrls,
  Vcl.Dialogs,
  RTTIEventos.Model.Atributos,
  RTTIEventos.Controller.Eventos;

{ TGerenciaEventos }

class function TGerenciaEventos.New(const AClassForm: TForm): IGerenciaEventos;
begin
  Result := Self.Create(AClassForm);
end;

procedure TGerenciaEventos.ConfigurarEventos(const AClassForm: TForm);
var
  LContexto: TRttiContext;
  LFormClass: TRttiType;
  LEventosClass: TRttiType;
  LField: TRttiField;
  LAtributo: TCustomAttribute;
  LMetodo: TRttiMethod;
  LPropriedadeOnExit: TRttiProperty;
  LMotodoEvento: TMethod;
  LEditInvocado: TEdit;
begin
  LContexto := TRttiContext.Create;
  try
    LFormClass := LContexto.GetType(AClassForm.ClassType);
    LEventosClass := LContexto.GetType(TObject(FEvento).ClassType);
    if not Assigned(LEventosClass) then
    begin
      ShowMessage('Erro: RTTI da classe TEventos não encontrada!');
      Exit;
    end;

    for LField in LFormClass.GetFields do
    begin
      if LField.FieldType.Handle = TypeInfo(TEdit) then
      begin
        LEditInvocado := LField.GetValue(AClassForm).AsType<TEdit>;

        if Assigned(LEditInvocado) then
        begin
          for LAtributo in LField.GetAttributes do
          begin
            if LAtributo is TAtributoEvento then
            begin
              var EventoAtribuido := TAtributoEvento(LAtributo);
              LPropriedadeOnExit := LContexto.GetType(LEditInvocado.ClassType).GetProperty('OnExit');
              if Assigned(LPropriedadeOnExit) then
              begin
                LMetodo := LEventosClass.GetMethod(EventoAtribuido.Evento);

                if not Assigned(LMetodo) then
                  Exit;

                LMotodoEvento.Code := LMetodo.CodeAddress;
                LMotodoEvento.Data := LEditInvocado;
                LPropriedadeOnExit.SetValue(LEditInvocado,TValue.From<TNotifyEvent>(TNotifyEvent(LMotodoEvento)));
              end;
            end;
          end;
        end;
      end;
    end;
  finally
    LContexto.Free;
  end;
end;

constructor TGerenciaEventos.Create(const AClassForm: TForm);
begin
  FEvento := TEventos.New;
  Self.ConfigurarEventos(AClassForm);
end;

end.
