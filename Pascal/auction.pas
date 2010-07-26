{
ID:aquarhead1
PROG:auction
LANG:PASCAL
}
Program Auction;
Var
   w	      : Array[1..1000] Of Longint;
   n,m,i,maxi : Integer;
   max	      : Longint;
   
Procedure Sort(l,r: Integer );
Var
   i,j : Integer;
   x,y : Longint;
Begin
   i:=l;
   j:=r;
   x:=w[(l+r) div 2];
   Repeat
      While w[i]<x do Inc(i);
      While x<w[j] do Dec(j);
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

Function Min(a,b :Longint ):Longint;
Begin
   If a<b then
      Exit(a)
   Else
      Exit(b);
End; { Min }

Begin
   Assign(input,'auction.in');
   Reset(input);
   Assign(output,'auction.out');
   Rewrite(output);
   Readln(n,m);
   For i:=1 to m do
      Readln(w[i]);
   Sort(1,m);
   max:=0;
   For i:=1 to m do
   Begin
      If w[i]*Min(n,m-i+1)>max then
      Begin
	 maxi:=i;
	 max:=w[i]*Min(n,m-i+1);
      End;
   End;
   Writeln(w[maxi],' ',max);
   Close(input);
   Close(output);
End.