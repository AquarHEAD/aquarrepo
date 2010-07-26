{
ID:aquarhead1
PROG:frac1
LANG:PASCAL
}
Program Frac1;
Type
   TAns	= Record
	     a,b : Integer;
	     x	 : Extended;
	  End;
Var
   w	     : Array[1..25600] Of TAns;
   n,i,j,tot : Integer;
   
Function Gcd(a,b: Integer ):Integer;
Begin
   If b=0 then
      Exit(a)
   Else
      Exit(Gcd(b,a mod b));
End; { Gcd }

Procedure Sort(l,r :Integer );
Var
   i,j : Integer;
   x,y : TAns;
Begin
   i:=l;
   j:=r;
   x:=w[(l+r) div 2];
   Repeat
      While w[i].x<x.x do Inc(i);
      While x.x<w[j].x do Dec(j);
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
End; { Sort }

Begin
   Assign(input,'frac1.in');
   Reset(input);
   Assign(output,'frac1.out');
   Rewrite(output);
   Readln(n);
   tot:=0;
   For i:=1 to n do
      For j:=1 to i do
	 If Gcd(i,j)=1 then
	 Begin
	    Inc(tot);
	    w[tot].a:=j;
	    w[tot].b:=i;
	    w[tot].x:=j/i;
	 End;
   Writeln('0/1');
   Sort(1,tot);
   For i:=1 to tot do
      Writeln(w[i].a,'/',w[i].b);
   Close(input);
   Close(output);
End.