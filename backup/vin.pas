unit Vin;

{$mode ObjFPC}{$H+}

interface

uses
    Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TVictory }

    TVictory = class(TForm)
    B1: TButton;
    B2: TButton;
    GO: TLabel;
    Img: TImage;
    Podpic: TLabel;
    Pd2: TLabel;

procedure B1Click(Sender: TObject);
procedure B2Click(Sender: TObject);
procedure FormCreate(Sender: TObject);
private

public

end;

var
    Victory: TVictory;

implementation
uses Game,GlavnoeMenu,hardcore,arcada,classic;
{$R *.lfm}

{ TVictory }

procedure TVictory.B1Click(Sender: TObject);
begin
  case Regim of
                 1:Level.B2Click(Self);
                 2:Level.B3Click(Self);
                 3:Level.B4Click(Self);
end;
      close
end;

procedure TVictory.B2Click(Sender: TObject);
begin
      Classic.Classica.Hide;
      Vin.Victory.Hide;
      GlavnoeMenu.Menu.Show;  //показ формы "Главное меню" | модуль -> Name Form -> Показать
end;

procedure TVictory.FormCreate(Sender: TObject);
begin

end;

end.

