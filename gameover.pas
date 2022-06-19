unit GameOver;

{$mode ObjFPC}{$H+}

interface

uses
     Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons,
     ExtCtrls;

type

  { TGover }

    TGover = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Gover: TLabel;
    GO: TLabel;
    Image1: TImage;
    Pd1: TLabel;
    Pd2: TLabel;

procedure Button1Click(Sender: TObject);
procedure Button2Click(Sender: TObject);
procedure FormCreate(Sender: TObject);
procedure Image1Click(Sender: TObject);
private

public

end;

var
    Gover: TGover;

implementation
uses GlavnoeMenu, game, classic;

{$R *.lfm}

{ TGover }

procedure TGover.Button2Click(Sender: TObject);
begin
       GameOver.Gover.Hide;
       Classic.Classica.Hide;
       GlavnoeMenu.Menu.Show;
end;

procedure TGover.FormCreate(Sender: TObject);
begin
end;

procedure TGover.Image1Click(Sender: TObject);
begin

end;

procedure TGover.Button1Click(Sender: TObject);
begin
case Regim of
               1:Level.B2Click(Self);
               2:Level.B3Click(Self);
               3:Level.B4Click(Self);
end;
      close
   end;
end.


