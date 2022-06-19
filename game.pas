unit game;

{$mode ObjFPC}{$H+}

interface

uses
     Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,MMSystem;

type

  { TLevel }

       TLevel = class(TForm)
       Timer1: TTimer;
       Timer2: TTimer;
       Timer3: TTimer;
       B1: TButton;
       B2: TButton;
       B3: TButton;
       B4: TButton;
       Img1: TImage;
       Img2: TImage;

procedure B1Click(Sender: TObject);
procedure B2Click(Sender: TObject);
procedure B3Click(Sender: TObject);
procedure B4Click(Sender: TObject);

private

public

end;

var
  Level: TLevel;

implementation
uses GlavnoeMenu,classic,hardcore,arcada,ypr;
{$R *.lfm}

{ TLevel }



procedure TLevel.B1Click(Sender: TObject);
begin
       Game.Level.Hide;
       GlavnoeMenu.Menu.Show;

end;

procedure TLevel.B2Click(Sender: TObject);
var i,j:integer;

begin
       Game.Level.Hide;
       GlavnoeMenu.Menu.Hide;
       classic.classica.Show;
       classica.Timer1.Enabled:=True; //включение таймера при нажатии кнопки

       Regim:=1;

for i:=0 to 300 do
begin
       Zmeyka[i].x:=-2;
       Zmeyka[i].y:=-2;
end;

       Zmeyka[0].x:=10;
       Zmeyka[0].y:=10;
       Zmeyka[1].x:=10;
       Zmeyka[1].y:=9;

       Povorot:=0;
       Score:=0;

for i:=0 to 19 do
for j:=0 to 19 do

       map[i,j]:=0;

       Randomize;
       map[Random(20),Random(20)]:=6; // 6 номер картинки

end;

procedure TLevel.B3Click(Sender: TObject);
var i,j,n:integer;
    u:Boolean;

begin
       hardcor.Visible:=False;
       hardcore.hardcor.Show;
       hardcor.T1.Enabled:=True;
       hardcor.T2.Enabled:=True;
       hardcor.T1.Interval:=260;

       Game.Level.Hide;

       Regim:=2;
       Vremya:=0;

for i:=0 to 300 do
begin
       Zmeyka[i].x:=-2;
       Zmeyka[i].y:=-2;
end;

       Zmeyka[0].x:=10;
       Zmeyka[0].y:=10;
       Zmeyka[1].x:=10;
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

//---гриб съедобный---//

       Randomize;
       map[Random(20),Random(20)]:=6; // 6 номер картинки
{

//---ядовитый гриб---//

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

 //---Золотой гриб---//

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
end;

 //---Cиняя капелька---//
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

 //---препятствия---//

n:=0;
while(n<15) do
Begin
      i:=Random(2);

      if i=0 then u:=False //Горионтальный поворот стенки

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



procedure TLevel.B4Click(Sender: TObject);
var i,j:integer;
begin
      Game.Level.Hide;
      arcada.arcadaa.Show;
      Game.Level.Hide;
      GlavnoeMenu.Menu.Hide;
      arcadaa.T3.Enabled:=True;
      arcadaa.T3.Interval:=260;


      Regim:=3;

for i:=0 to 300 do
begin
      Zmeyka[i].x:=-2;
      Zmeyka[i].y:=-2;
end;

      Zmeyka[0].x:=10;
      Zmeyka[0].y:=10;
      Zmeyka[1].x:=10;
      Zmeyka[1].y:=9;

      Povorot:=0;
      Score:=0;

for i:=0 to 19 do
for j:=0 to 19 do

      map[i,j]:=0;

      Randomize;
      map[Random(20),Random(20)]:=6; // 6 номер картинки

for i:=1 to 1 do
for j:=1 to 3 do
Begin
       Zmeykas[i,j].x:=-2;
       Zmeykas[i,j].y:=-2;
   end;
end;
end.



