unit game;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls;

type

  { TLevel }

  TLevel = class(TForm)
  Timer1: TTimer;
  Timer2: TTimer;
  Timer3: TTimer;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Image1: TImage;
    Image2: TImage;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);

  private

  public

  end;

var
  Level: TLevel;



implementation
uses Unit1,classic,hardcore,arcada,ypr; //подключение форм "Главное меню","Классика","Хардкор", "Аркада"
{$R *.lfm}

{ TLevel }



procedure TLevel.Button1Click(Sender: TObject);
begin
  Game.Level.Hide;  // Скрыть первоначальную форму
  Unit1.Menu.Show;  //показ формы "Главное меню" | модуль -> Name Form -> Показать
end;

procedure TLevel.Button2Click(Sender: TObject);
var i,j:integer;
begin
  Game.Level.Hide;  // Скрыть первоначальную форму
  Unit1.Menu.Hide;
  classic.classica.Show;  //показ формы "Классика" | модуль -> Name Form -> Показать
  classica.Timer1.Enabled:=True; //включение таймера при нажатии кнопки

  Regim:=1;
  for i:=0 to 300 do
 begin
 Zmeyka[i].x:=-2;
 Zmeyka[i].y:=-2;
 end;

  Zmeyka[0].x:=10;  // голова
  Zmeyka[0].y:=10;
  Zmeyka[1].x:=10;  // будет двигаться вниз
  Zmeyka[1].y:=9;

  Povorot:=0;
  Score:=0;

 for i:=0 to 19 do
 for j:=0 to 19 do
 map[i,j]:=0;

 Randomize;
 map[Random(20),Random(20)]:=6; // 6 номер картинки

end;

procedure TLevel.Button3Click(Sender: TObject);
var i,j,n:integer;
u:Boolean;

begin
  hardcor.Visible:=False;
  hardcore.hardcor.Show;  //показ формы "Хардкор" | модуль -> Name Form -> Показать
  hardcor.Timer1.Enabled:=True;
  hardcor.Timer2.Enabled:=True;
  hardcor.Timer1.Interval:=260;

  Game.Level.Hide;  // Скрыть первоначальную форму

  Regim:=2;
  Vremya:=0;

for i:=0 to 300 do
begin
Zmeyka[i].x:=-2;
Zmeyka[i].y:=-2;
end;

Zmeyka[0].x:=10;  // голова
Zmeyka[0].y:=10;
Zmeyka[1].x:=10;  // будет двигаться вниз
Zmeyka[1].y:=9;

Povorot:=0;
Score:=0;
Bessmertie:=0;
Bestime:=0;
Zamedlenie:=0;
ZamTime:=0;


for i:=0 to 19 do
for j:=0 to 19 do
map[i,j]:=0;

//красное яблоко
Randomize;
map[Random(20),Random(20)]:=6; // 6 номер картинки
{

//Черное

u:=False;
 while(u=False) do
 Begin
 i:=Random(20);
 j:=Random(20);
   if  map[i,j]=0 then
   begin
    map[i,j]:=7;
    u:=True;
    end;

 end;
 //Желтое

u:=False;
 while(u=False) do
 Begin
 i:=Random(20);
 j:=Random(20);
   if  map[i,j]=0 then
   begin
    map[i,j]:=8;
    u:=True;
    end;

 //синее

u:=False;
 while(u=False) do
 Begin
 i:=Random(20);
 j:=Random(20);
   if  map[i,j]=0 then
   begin
    map[i,j]:=9;
    u:=True;
    end;
end;
 end;
}
 //препятствие

n:=0;
 while(n<5) do
 Begin
  i:=Random(2);
  if i=0 then u:=False //горионтальный поворот стенки
  else u:=True; //Вертикальнй поворот стенки
 i:=Random(19);
 j:=Random(19);
   if  ( (u=False) and (map[i,j]=0) and (map[i+1,j]=0) ) then
   begin
    map[i,j]:=5;
    map[i+1,j]:=5;
    Inc(n);
    end;

    if  ( (u=True) and (map[i,j]=0) and (map[i,j+1]=0) ) then
   begin
    map[i,j]:=5;
    map[i,j+1]:=5;
    Inc(n);
    end;
end;
 end;



procedure TLevel.Button4Click(Sender: TObject);
var i,j:integer;
begin
  Game.Level.Hide;  // Скрыть первоначальную форму
  arcada.arcadaa.Show;  //показ формы "Аркада" | модуль -> Name Form -> Показать
  Game.Level.Hide;  // Скрыть первоначальную форму
  Unit1.Menu.Hide;
  arcadaa.Timer3.Enabled:=True;
  arcadaa.Timer3.Interval:=260;


  Regim:=3;
  for i:=0 to 300 do
 begin
 Zmeyka[i].x:=-2;
 Zmeyka[i].y:=-2;
 end;

  Zmeyka[0].x:=10;  // голова
  Zmeyka[0].y:=10;
  Zmeyka[1].x:=10;  // будет двигаться вниз
  Zmeyka[1].y:=9;

  Povorot:=0;
  Score:=0;

 for i:=0 to 19 do
 for j:=0 to 19 do
 map[i,j]:=0;

 Randomize;
 map[Random(20),Random(20)]:=6; // 6 номер картинки

 for i:=1 to 10 do
 for j:=1 to 3 do
 Begin
 Zmeyki[i,j]x:=-2;
 Zmeyki[i,j]y:=-2;
 end;
end;

procedure TLevel.Image1Click(Sender: TObject);
begin

end;

procedure TLevel.Image2Click(Sender: TObject);
begin

end;







end.

