{
ID:aquarhe1
PROG:crypt1
LANG:PASCAL
}
Program Crypt1;
Var
 w : Array[1..9] Of Integer;
 a,b,c,d,e,n : Integer;
 ans : Longint;

Function Find(k : Integer) : Boolean;
Var
 i : Integer;
Begin
 Find:=False;
 For i:=1 to n do
  If w[i]=k then
   Exit(True);
End;

Function Ok(a,b,c,d,e : Integer) : Boolean;
Var
 k1,k2,k : Longint;
Begin
 Ok:=True;
 k1:=(a*100+b*10+c)*e;
 k2:=(a*100+b*10+c)*d;
 k:=k2*10+k1;
 If k1 div 1000<>0 then
  Exit(False);
 If k2 div 1000<>0 then
  Exit(False);
 If Not (Find(k1 div 100) And Find((k1 div 10) mod 10) And Find(k1 mod 10)) then
  Exit(False);
 If Not (Find(k2 div 100) And Find((k2 div 10) mod 10) And Find(k2 mod 10)) then
  Exit(False);
 If k div 10000<>0 then
  Exit(False);
 If Not (Find(k div 1000) And Find((k div 100) mod 10) And Find((k div 10) mod 10)) then
  Exit(False);
End;

Begin
 Assign(input,'crypt1.in');
 Reset(input);
 Assign(output,'crypt1.out');
 Rewrite(output);
 Readln(n);
 For a:=1 to n do
  Read(w[a]);
 ans:=0;
 For a:=1 to n do
 For b:=1 to n do
 For c:=1 to n do
 For d:=1 to n do
 For e:=1 to n do
  If Ok(w[a],w[b],w[c],w[d],w[e]) then
   Inc(ans);
 Writeln(ans);
 Close(input);
 Close(output);
End.