unit obigree;

{$mode ObjFPC}{$H+}

interface

uses
     Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TObigre }

      TObigre = class(TForm)
      B1: TButton;
      B2: TButton;
      Img: TImage;
      Ll1: TLabel;

procedure B1Click(Sender: TObject);
procedure B2Click(Sender: TObject);

private

public

end;

var
      Obigre: TObigre;


implementation
uses GlavnoeMenu,Pravila;

{$R *.lfm}

{ TObigre }

procedure TObigre.B1Click(Sender: TObject);
begin
      Obigree.obigre.Hide;
      GlavnoeMenu.Menu.Show;
end;

procedure TObigre.B2Click(Sender: TObject);
begin
      Obigree.obigre.Hide;
      Pravila.Prigra.Show;
end;
end.


