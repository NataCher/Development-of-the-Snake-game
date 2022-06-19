program Snake;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, 
GlavnoeMenu, game, ypr, obigree, classic, hardcore, arcada, GameOver, Vin, 
Pravila
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Title:='Snake';
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TMenu, Menu);
  Application.CreateForm(TLevel, Level);
  Application.CreateForm(TYpravlenie, Ypravlenie);
  Application.CreateForm(TObigre, Obigre);
  Application.CreateForm(Tclassica, classica);
  Application.CreateForm(Thardcor, hardcor);
  Application.CreateForm(TArcadaa, Arcadaa);
  Application.CreateForm(TGover, Gover);
  Application.CreateForm(TVictory, Victory);
  Application.CreateForm(TPrigra, Prigra);
  Application.Run;
end.

