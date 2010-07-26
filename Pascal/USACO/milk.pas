{
ID:aquarhe1
PROG:milk
LANG:PASCAL
}
Program Milk;
Type
   TFarm = Record
	      p,a   : Longint;
	   End;
Var
   w	     : Array[1..5000] Of TFarm;
   i,n,m,tot : Longint;

Procedure Sort(l,r :Longint );
Var
   i,j : Longint;
   x,y : TFarm;
Begin
   i:=l;
   j:=r;
   x:=w[(l+r) div 2];
   Repeat
      While w[i].p>x.p do Inc(i);
      While x.p>w[j].p do Dec(j);
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
   Assign(input,'milk.in');
   Reset(input);
   Assign(output,'milk.out');
   Rewrite(output);
   Readln(n,m);
   For i:=1 to m do
      Readln(w[i].p,w[i].a);
   Sort(1,m);
   tot:=0;
   While w[m].a<n do
   Begin
      Inc(tot,w[m].p*w[m].a);
      Dec(n,w[m].a);
      Dec(m);
   End;
   Inc(tot,w[m].p*n);
   Writeln(tot);
   Close(input);
   Close(output);
End.