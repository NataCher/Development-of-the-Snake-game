unit ypr;

{$mode ObjFPC}{$H+}

interface

uses
    Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TYpravlenie }

    TYpravlenie = class(TForm)
    B1: TButton;
    Imag1: TImage;
    Img: TImage;
    Lb: TLabel;

procedure B1Click(Sender: TObject);

private

public

end;

var
     Ypravlenie: TYpravlenie;

implementation
uses GlavnoeMenu;

{$R *.lfm}

{ TYpravlenie }


procedure TYpravlenie.B1Click(Sender: TObject);
begin
      ypr.Ypravlenie.Hide;
      GlavnoeMenu.Menu.Show;
end;



