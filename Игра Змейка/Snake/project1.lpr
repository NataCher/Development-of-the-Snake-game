program project1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, Unit1, game, ypr, obigree, classic, hardcore, arcada, GameOver
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
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

