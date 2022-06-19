unit Pravila;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TPrigra }

  TPrigra = class(TForm)
    Image1: TImage;
    Knopka: TButton;
    Lb1: TLabel;
    Lb2: TLabel;
    Lb3: TLabel;
    Lb4: TLabel;
    Lb5: TLabel;
    Lb6: TLabel;
    Lb7: TLabel;
    Lb8: TLabel;
    procedure Image1Click(Sender: TObject);
    procedure KnopkaClick(Sender: TObject);
    procedure Lb7Click(Sender: TObject);
  private

  public

  end;

var
  Prigra: TPrigra;

implementation
uses GlavnoeMenu;

{$R *.lfm}

{ TPrigra }

procedure TPrigra.Lb7Click(Sender: TObject);
begin

end;

procedure TPrigra.Image1Click(Sender: TObject);
begin

end;

procedure TPrigra.KnopkaClick(Sender: TObject);
begin
       Pravila.Prigra.Hide;
       GlavnoeMenu.Menu.Show;
end;

end.

