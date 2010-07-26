{
ID:aquarhe1
PROG:milk2
LANG:PASCAL
}
Program Milk2;
Type
 TPeriod = Record
            a,b : Longint;
           End;
Var
 w,p : Array[1..5000] Of TPeriod;
 i,n,tot : Longint;
 maxmilk,maxnonmilk : Longint;

Procedure Sort(l,r : Integer);
Var
 i,j : Integer;
 x,y : TPeriod;
Begin
 i:=l;
 j:=r;
 x:=w[(l+r) div 2];
 Repeat
  While (w[i].a<x.a) Or ((w[i].a=x.a) And (w[i].b<x.b)) do Inc(i);
  While (x.a<w[j].a) Or ((x.a=w[j].a) And (x.b<w[j].b)) do Dec(j);
  If i<=j then
  Begin
   y:=w[i];
   w[i]:=w[j];
   w[j]:=y;
   Inc(i);
   Dec(j);
  End;
 Until i>j;
 If i<r then Sort(i,r);
 If l<j then Sort(l,j);
End;

Function Max(a,b : Longint) : Longint;
Begin
 If a>b then
  Exit(a)
 Else
  Exit(b);
End;

Begin
 Assign(input,'milk2.in');
 Reset(input);
 Assign(output,'milk2.out');
 Rewrite(output);
 Readln(n);
 For i:=1 to n do
  Readln(w[i].a,w[i].b);
 Sort(1,n);
 tot:=1;
 p[tot].a:=w[1].a;
 p[tot].b:=w[1].b;
 For i:=2 to n do
 Begin
  If w[i].a<=p[tot].b then
   p[tot].b:=Max(w[i].b,p[tot].b)
  Else
  Begin
   Inc(tot);
   p[tot].a:=w[i].a;
   p[tot].b:=w[i].b;
  End;
 End;
 maxmilk:=p[1].b-p[1].a;
 maxnonmilk:=0;
 For i:=2 to tot do
 Begin
  If p[i].b-p[i].a>maxmilk then
   maxmilk:=p[i].b-p[i].a;
  If p[i].a-p[i-1].b>maxnonmilk then
   maxnonmilk:=p[i].a-p[i-1].b;
 End;
 Writeln(maxmilk,' ',maxnonmilk);
 Close(input);
 Close(output);
End.
