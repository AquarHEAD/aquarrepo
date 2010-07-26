{
ID:aquarhe1
PROG:agrinet
LANG:PASCAL
}
Program Agrinet;
Const
   max = 100;
Type
   TEdge = Record
	      a,b : Integer;
	      len : Longint;
	   End;
Var
   edge		   : Array[1..max*max] Of TEdge;
   s		   : Array[1..max] Of Integer;
   n,i,j,x,ans,tot : Longint;
   
Function Find_Set(a: Integer ):Integer;
Begin
   If s[a]<>a then
      s[a]:=Find_Set(s[a]);
   Exit(s[a]);
End; { Find_Set }

Procedure Union(a,b :Integer );
Begin
   s[Find_Set(a)]:=s[Find_Set(b)];
End; { Union }

Procedure Sort(l,r :Longint );
Var
   i,j : Longint;
   x,y : TEdge;
Begin
   i:=l;
   j:=r;
   x:=edge[(l+r) div 2];
   Repeat
      While edge[i].len<x.len do Inc(i);
      While x.len<edge[j].len do Dec(j);
      If i<=j then
      Begin
	 y:=edge[i];
	 edge[i]:=edge[j];
	 edge[j]:=y;
	 Inc(i);
	 Dec(j);
      End;
   Until i>j;
   If i<r then Sort(i,r);
   If l<j then Sort(l,j);
End; { Sort }

Begin
   Assign(input,'agrinet.in');
   Reset(input);
   Assign(output,'agrinet.out');
   Rewrite(output);
   Readln(n);
   tot:=0;
   For i:=1 to n do
   Begin
      For j:=1 to n do
      Begin
	 Read(x);
	 If i>j then
	 Begin
	    Inc(tot);
	    edge[tot].a:=i;
	    edge[tot].b:=j;
	    edge[tot].len:=x;
	 End;
      End;
      Readln;
      s[i]:=i;
   End;
   Sort(1,tot);
   ans:=0;
   For i:=1 to tot do
      If Find_Set(edge[i].a)<>Find_Set(edge[i].b) then
      Begin
	 Inc(ans,edge[i].len);
	 Union(edge[i].a,edge[i].b);
      End;
   Writeln(ans);
   Close(input);
   Close(output);
End.