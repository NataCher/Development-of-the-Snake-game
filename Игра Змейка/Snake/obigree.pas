unit obigree;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TObigre }

  TObigre = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  Obigre: TObigre;


implementation
uses Unit1; //подключение формы "Главное меню"

{$R *.lfm}

{ TObigre }

procedure TObigre.Button1Click(Sender: TObject);
begin
Obigree.obigre.Hide;  // Скрыть первоначальную форму
Unit1.Menu.Show;  //показ формы "Главное меню" | модуль -> Name Form -> Показать
end;

end.

