Program Loan;
Var
 total,month,year,i : Longint;
 l,r,rate,tmp : Extended;
Begin
 Assign(input,'loan.in');
 Reset(input);
 Assign(output,'loan.out');
 Rewrite(output);
 Readln(total,month,year);
 l:=0;
 r:=3;
 While r-l>1e-5 do
 Begin
  rate:=(l+r)/2;
  tmp:=total;
  For i:=1 to year do
   tmp:=tmp*(rate+1)-month;
  If tmp>0 then
   r:=rate
  Else
   l:=rate;
 End;
 Writeln(rate*100:0:1);
 Close(input);
 Close(output);
End.
