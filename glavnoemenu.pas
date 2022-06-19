unit GlavnoeMenu;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons,
  ExtCtrls, MMSystem;

type

  { TMenu }

  TCell = record  // создание змейки
  x,y:integer; // координаты движения для змейки
end;

       TMenu = class(TForm)
       Img1: TImage;
       Img2: TImage;
       Img3: TImage;
       Knopka1: TButton;
       Knopka2: TButton;
       Knopka3: TButton;
       Knopka4: TButton;
       Zagolovok: TLabel;

  procedure FormCreate(Sender: TObject);
  procedure Img2Click(Sender: TObject);
  procedure Knopka1Click(Sender: TObject);
  procedure Knopka2Click(Sender: TObject);
  procedure Knopka3Click(Sender: TObject);
  procedure Knopka4Click(Sender: TObject);


  private

  public

  end;


var         // иниализация - загрузка графики и всего прочего
      Menu: TMenu;
      Buf:TBitmap;  //графический буфер
      Path:string;  //Path -> путь в папку
      IMG:array[1..9] of TBitmap; // хранение картинок
      i,j,povorot,Score,Regim,Vremya,Bessmertie,Zamedlenie,BesTime,ZamTime:integer; // поворот 1-вниз, 2-вверх, 3-влево, 4-вправо
      Zmeyka: array[0..300] of TCell; // ноль это голова .. до каких размеров может быть змейка (макс)
      Zmeykas: array[1..1,1..3] of TCell;
      Povoroti: array[1..9] of Integer;
      map:array[0..19,0..19] of integer;


implementation

 uses Game,ypr,Obigree,hardcore;
{$R *.lfm}


{ TMenu }

procedure TMenu.FormCreate(Sender: TObject);
begin
      Path:=ExtractFileDir(Application.ExeName);  // путь к папке
      Buf:=TBitmap.Create;   // создание графического буфера, выделяем память под графический буфер
      Buf.Width:=320;
      Buf.Height:=320;

for i:=1 to 9 do    //зарузка картинок
Begin
      IMG[i]:=TBitmap.Create;
      IMG[i].LoadFromFile(path+'\IMG\'+inttostr(i)+'.Bmp');
      IMG[i].Transparent:=True;
      IMG[i].TransparentColor:=clwhite;
end;

for i:=0 to 300 do
begin
      Zmeyka[i].x:=-2;
      Zmeyka[i].y:=-2;
end;

for i:=0 to 19 do
for j:=0 to 19 do

      map[i,j]:=0;
end;

procedure TMenu.Img2Click(Sender: TObject);
begin
end;


procedure TMenu.Knopka1Click(Sender: TObject);
begin
      Game.Level.Show;
      GlavnoeMenu.Menu.Hide
end;

procedure TMenu.Knopka2Click(Sender: TObject);
begin
      ypr.Ypravlenie.Show;
      GlavnoeMenu.Menu.Hide;
end;

procedure TMenu.Knopka3Click(Sender: TObject);
begin
      Obigree.Obigre.Show;
      GlavnoeMenu.Menu.Hide;
end;


procedure TMenu.Knopka4Click(Sender: TObject);
begin
     close
   end;
end.


