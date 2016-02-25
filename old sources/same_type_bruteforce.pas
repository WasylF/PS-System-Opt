unit razb;
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
const m=100;
var
  Form1: TForm1;
  P : array[1..m] of extended;
  Pstr : array[1..m] of string;
	X : array [1..m] of byte;
  Qkz,Qo : extended;
implementation
{$R *.dfm}

 procedure Nexttt(var K:byte);
      var i,j:byte;
	  s:word;
    begin
      i:=K-1; s:=X[K];
      {пошук i}
      while (i>1)and(X[i-1]<=X[i]) do begin s:=s+X[i];dec(i) end;
      inc(X[i]);
      K:=i+s-1;
      for j:=i+1 to K do X[j]:=1
    end;

Function stepen(a : extended;b : integer) : extended;
var j : integer;
c : extended;
begin
 c:= a;
 For j:= 2 to b do
  c:= c*a;
 stepen:= c;
end;

Function nad(k : integer) : extended;
var
j : integer;
a,b,Qo1 : extended;
begin
a:= 1;
For j:= 1 to k do
a:= a*(1-stepen(Qkz,x[j]));
Qo1:= 1-Qo;
b:= 1;
For j:= 1 to k do
b:= b*(1-stepen(Qo1,x[j]));
nad:= a-b;
end;
procedure TForm1.Button1Click(Sender: TObject);
var
  N,i,L,j:byte;
  ss : string;
  FtoS : string[10];
  Ptemp,max : extended;
  f : textfile;
  kol : int64;
  begin
Memo1.Clear; Memo2.Clear; max:= 0;  Ptemp:= 0;  kol:= 1;
For j:= 1 to m do
begin
 P[j]:= 0.0;
 Pstr[j]:= '';
 x[j]:= 0;
end;
  Qo:= StrToFloat(Edit2.Text);
  Qkz:= StrToFloat(Edit3.Text);
  n:= StrToInt(edit1.text);
    L:=N; for i:=1 to L do X[i]:=1;
    ss:= '';
    for i:=1 to L do ss:= ss+ IntToStr(X[i])+' ';
     Ptemp:= nad(l);
     If Ptemp > P[l] then
     begin P[l]:= Ptemp; Pstr[l]:= '( '+ss+' ) ';  end;
     memo1.Lines.Add('1. ( '+ss+' ) '{+IntToStr(l)});
    repeat
      Nexttt(L);
      ss:= '';
      for i:=1 to L do ss:= ss+ IntToStr(X[i])+' ';
      inc(kol);
     Ptemp:= nad(l);
     If Ptemp > P[l] then
     begin P[l]:= Ptemp; Pstr[l]:= '( '+ss+' ) ';  end;
     memo1.Lines.Add(IntToStr(kol)+'. ( '+ss+' ) '{+IntToStr(l)});
    until L=1;
 max:= 0;
assignfile(f,'grafik.35');
 rewrite(f);
 For i:= 2 to n do
 begin
  If P[i] > max then begin max:= P[i]; j:= i; end;
  Str(P[i]:10:8,FtoS);
  Memo2.Lines.Add( 'Ширина: ' +IntToStr(i)+'. Надійність ' + FtoS+ '   ' + Pstr[i]);
  writeln(f,P[i]:10:8);
 end;
 Closefile(f);
 Memo2.Lines.Add('');
 Memo2.Lines.Add('Максимальна: '+FloatToStr(max)+' при ширині: ' +IntToStr(j)+ ' ланцюжків. В з''єднанні: ' +Pstr[j]);
end;
end.
