unit ypr;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TYpravlenie }

  TYpravlenie = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  Ypravlenie: TYpravlenie;

implementation

{$R *.lfm}

{ TYpravlenie }


procedure TYpravlenie.Button1Click(Sender: TObject);
begin
  Ypr.ypravlenie.Hide;  // Скрыть первоначальную форму
  Unit1.Menu.Show;  //показ формы "Главное меню" | модуль -> Name Form -> Показать
end;

end.
