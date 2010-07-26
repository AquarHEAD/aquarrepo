{
ID:aquarhe1
PROG:fc
LANG:PASCAL
}
Program Fc;
Type
   TPoint = Record
	       x,y : Extended;
	    End;

Var
   p : Array[0..10000] Of TPoint;
   k,n,l : Longint;

Function Cross(a,b,c : TPoint ) : Extended;
Begin
   Exit((c.y-a.y)*(b.x-a.x)-(b.y-a.y)*(c.x-a.x));
End; { Cross }

Procedure Sort(l,r   : Longint );
Var
   i,j : Longint;
   x,y :  TPoint;
Begin
   i:=l;
   j:=r;
   x:=p[(l+r) div 2];
   Repeat
      While (Cross(p[1],p[i],x)<0) do Inc(i);
      While (Cross(p[1],p[j],x)>0) do Dec(j);
      If i<=j then
      Begin
	 y:=p[i];
	 p[i]:=p[j];
	 p[j]:=y;
	 Inc(i);
	 Dec(j);
      End;
   Until i>j;
   If i<r then Sort(i,r);
   If l<j then Sort(l,j);
End; { Sort }

Procedure Graham_Scan;
Var
   i,min : Longint;

   Procedure Swap(Var a,b : TPoint );
   Var
      c	: TPoint;
   Begin
      c:=a;
      a:=b;
      b:=c;
   End; { Swap }

Begin
   If n=1 then
   Begin
      k:=1;
      Exit;
   End;
   min:=1;
   For i:=2 to n do
      If (p[i].y<p[min].y) then
	 min:=i;
   For i:=1 to n do
      If (p[i].y=p[min].y) And (p[i].x<p[min].x) then
	 min:=i;
   Swap(p[1],p[min]);
   Sort(2,n);
   p[0]:=p[n];
   k:=2;
   For i:=3 to n do
   Begin
      While Cross(p[k-1],p[k],p[i])>=0 do
	 Dec(k);
      Inc(k);
      Swap(p[i],p[k]);
   End;
End; { Graham_Scan }

Procedure Reading;
Var
   i : Longint;
Begin
   Readln(n);
   For i:=1 to n do
      Readln(p[i].x,p[i].y);
End; { Reading }

Procedure OutputAns;
Var
   i,j : Longint;
   ans : Extended;

   Function dist(a,b : TPoint ) : Extended;
   Begin
      Exit(Sqrt(Sqr(a.x-b.x)+Sqr(a.y-b.y)));
   End; { dist }

Begin
   ans:=0;
   For i:=1 to k-1 do
      ans:=ans+dist(p[i],p[i+1]);
   ans:=ans+dist(p[k],p[1]);
   Writeln(ans:0:2);
End; { OutputAns }

Begin
Assign(input,'fc.in');
Reset(input);
Assign(output,'fc.out');
Rewrite(output);
   Reading;
   Graham_Scan;
   OutputAns;
Close(input);
Close(output);
End.
