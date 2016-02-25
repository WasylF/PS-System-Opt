unit alg_razb_MAN;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Memo1: TMemo;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit3: TEdit;
    Memo2: TMemo;
    Label5: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Qkz,Qo,Qo1 : extended;
  n : int64;

implementation

{$R *.dfm}

Function stepen(t1 : extended; t2 : int64) : extended;
begin
stepen:= exp(t2*ln(t1));
end;

Function nad(x,Kx,y,Ky : int64) : extended;
var
a1,b1,c1 : extended;
begin
a1:= 1 - stepen(Qkz,x); a1:= stepen(a1,Kx);
b1:= 1 - stepen(Qkz,y); b1:= stepen(b1,Ky);
a1:= a1*b1;

b1:= 1 - stepen(Qo1,x);  b1:= stepen(b1,Kx);
c1:= 1 - stepen(Qo1,y);  c1:= stepen(c1,Ky);
b1:= b1*c1;

nad:= a1-b1;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  i : longint;
  Ptemp,Pmax : extended;
  ss : ansistring;
  s : longint;
  d1,d2,a,b,x1,x2 : int64;
  K1,K2,Ka,Kb,Kx1,Kx2 : int64;
 begin
  N:= StrToInt(Edit1.Text);    s:= N;
  Qo:= StrToFloat(Edit2.Text);  Qo1:= 1-Qo;
  Qkz:= StrToFloat(Edit3.Text);
  Pmax:= 0.0;

  for s:= 2 to n do
  begin

   d1:= n div s; d2:= d1+1; K2:= n mod s;  K1:= s-K2;
   Ptemp:= nad(d1,K1,d2,K2);
   if Ptemp>Pmax then
   begin
    Pmax:= Ptemp; a:= d1; b:= a+1; Ka:= K1; Kb:= K2;
   end;
  end;

  s:= Ka+Kb;
  x1:= a; Kx1:= Ka; x2:= b; Kx2:= Kb;
  K2:= s-1; d1:= n - k2*a;
  Ptemp:= nad(d1,1,a,K2);
   if Ptemp>Pmax then
   begin
    Pmax:= Ptemp; x1:= a; x2:= d1; Kx1:= K2; Kx2:=1;
   end;

  K2:= s-2; d1:= n - k2*b;
  Ptemp:= nad(d1,1,b,K2);
   if Ptemp>Pmax then
   begin
    Pmax:= Ptemp; x1:= b; x2:= d1; Kx1:= K2; Kx2:=1;
   end;

 Memo2.lines.add(FloatToStr(Pmax));
 ss:= '';
 for i:= 1 to Kx2 do ss:= ss+intToStr(x2)+' ';
 for i:= 1 to Kx1 do ss:= ss+intToStr(x1)+' ';
 Memo1.lines.add(ss);
 end;
end. 
