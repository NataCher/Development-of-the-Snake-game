unit GameOver;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Form1: TLabel;
    Pd1: TLabel;
    Pd2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation
uses Unit1, game, classic; //подключение формы "Главное меню"

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button2Click(Sender: TObject);
begin
  GameOver.Form1.Hide;  // Скрыть первоначальную форму
  Classic.Classica.Hide;  // Скрыть первоначальную форму
  Unit1.Menu.Show;  //показ формы "Главное меню" | модуль -> Name Form -> Показать
end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  case Regim of
  1:Level.Button2Click(Self);
  2:Level.Button3Click(Self);
  end;
  close
  end;
end.


end.

