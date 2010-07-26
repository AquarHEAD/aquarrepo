Program Fact;
Var
 i,n,ans : Longint;
Begin
 Assign(input,'fact.in');
 Reset(input);
 Assign(output,'fact.out');
 Rewrite(output);
 Readln(n);
 ans:=1;
 For i:=1 to n do
 Begin
  ans:=ans*i;
  While ans mod 10=0 do
   ans:=ans div 10;
  ans:=ans mod 1000000;
 End;
 Writeln(ans mod 10);
 Close(input);
 Close(output);
End.