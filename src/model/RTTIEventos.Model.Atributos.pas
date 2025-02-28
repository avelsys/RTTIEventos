unit RTTIEventos.Model.Atributos;

interface

uses
  System.SysUtils,
  System.Rtti,
  System.Classes,
  Vcl.DBCtrls,
  Vcl.Forms;

type
  TAtributoEvento = class(TCustomAttribute)
  private
    FEvento: string;
  public
    constructor Create(AEvento: string);
    property Evento: string read FEvento;
  end;

implementation

constructor TAtributoEvento.Create(AEvento: string);
begin
  FEvento := AEvento;
end;

end.
