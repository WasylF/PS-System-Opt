Procedure gen(mas:tmas; NS{,k}:byte; M:t2mas{; ind:word});
 // mas - структура цепочки;  kol - кол-во элементов в цепочке;
var
 ii,jj,pp : byte; te : byte; kol,NS1,kl :byte;
 flag,flag2 : boolean;
 SysNext : tmas;
 kM,Mnext : t2mas;
 sss : string;
begin
kol:= X[NS];
 kM[k]:= M[k]; For ii:= k-1 downto 1 do kM[ii]:= kM[ii+1] + M[ii];
mas[kol]:= mas[kol]-1; // !!! DOPISAT' SLUCHAY!!!!!
 flag:= false; //mas[kol]:= k;
 repeat      // поиск элемента который можно увеличить
  pp:= 0;
  While pp<kol do
  begin
   inc(pp); te:= mas[kol-pp+1]+1;
   If te<=k then begin If kM[te]>=pp then pp:= pp+ml; end;
  end;   // конец поиска элемента который можно увеличить

  If pp>ml then  // если нашли, то
  begin
   ii:= te;  kl:= kol-(pp-ml);  //записываем цепочку до конца
   repeat
    jj:= 0;
    while (jj<M[ii]) and (kl<kol) do
    begin inc(kl); mas[kl]:= ii; inc(jj); end;
    inc(ii);
   until (kl=kol); // конец записываем цепочку до конца

   te:= mas[kol];
   For jj:= 1 to k do Mnext[jj]:= M[jj];
   For jj:= 1 to kol do dec(Mnext[mas[jj]]);
   inc(Mnext[te]);

   Repeat
   If Mnext[te]>0 then
   begin
    mas[kol]:= te;
    // Цепочка сгенерирована
//    If NS=1 then writeln;
//    write(NS,'-ya zepochka: ');
//    For jj:= 1 to kol do write(mas[jj],' '); writeln;
    For jj:= 1 to kol do system[NS,jj]:= mas[jj];
    For jj:= kol+1 to ml do system[NS,jj]:= 0;
     flag2:= true; NS1:= NS-1;
     If X[NS]=X[NS1] then //если следующая цепочка такой же длинны
     begin
      If mas[1]<System[NS1,1] then flag2:= false;
      If mas[1]=System[NS1,1] then
      begin
       jj:= 1;
       repeat inc(jj); until (mas[jj]<>System[NS1,jj]) or (jj=X[NS]);
       If mas[jj]<System[NS1,jj] then flag2:= false;
      end;
     end;
    If (NS=L) and (flag2) then // Система сгенерирована !!!
    begin
     begin   // вывод на экран системы
      inc(ks);
      For ii:= L+1 to ml do system[ii,1]:= 0;
     end;  // конец вывод на экран системы
      Ptemp:= nad; Str(Ptemp:10:8,sss);
      PtempStr:= system;
       jj:= kb;
      While (Ptemp>P[jj]) and (jj>0) do
      begin
       P[jj]:= P[jj-1];   Pstr[jj]:= Pstr[jj-1];
       dec(jj);
      end;
      inc(jj); P[jj]:= Ptemp; Pstr[jj]:= PtempStr;
    end
             else //система продолжает генерироваться
    If flag2 then
    begin
     NS1:= NS+1;
     dec(Mnext[te]); // не менять te до inc(Mnext[te]); (в этом else )
     kl:= 0; ii:= 0;
     repeat   //записываем масив для генерации следующей цепочки
      inc(ii); jj:= 0;
      While  (jj<Mnext[ii]) and (kl<X[NS1]) do
      begin
      inc(jj); inc(kl); SysNext[kl]:= ii;
      end;
     until kl=X[NS1]; // end записываем масив для генерации следующей цепочки
     SysNext[kl+1]:= 0; SysNext[kl+2]:= 0; Mnext[k+1]:= 0; Mnext[k+2]:= 0;
//     If flag2 then  // отправляем на следующую генерацию цепочки
     begin
      gen(SysNext,NS1,Mnext);
     end;
     inc(Mnext[te]);
    end;
   end;
    inc(te);
   until te>k;
  end
           else flag:= true;
 until flag;
end;
