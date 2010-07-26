{
ID:aquarhe1
PROG:ariprog
LANG:PASCAL
}
Program Ariprog;
Type
   TPath = Array[1..2] Of Longint; 
Var
   x2			       : Array[0..250] Of Longint;
   g			       : Array[0..125000] Of Boolean;
   list			       : Array[1..30000] Of Longint;
   path			       : Array[1..10000] Of TPath;
   n,m,i,j,s,x,k,pnum,lnum,lim : Longint;
   
Procedure  Sort(l,r	       : Longint );
Var
   i,j : Longint;
   x,y : TPath;
Begin
   i:=l;
   j:=r;
   x:=path[(l+r) div 2];
   Repeat
      While (path[i,2]<x[2]) Or ((path[i,2]=x[2]) And (path[i,1]<x[1])) do Inc(i);
      While (x[2]<path[j,2]) Or ((x[2]=path[j,2]) And (x[1]<path[j,1])) do Dec(j);
      If i<=j then
      Begin
	 y:=path[i];
	 path[i]:=path[j];
	 path[j]:=y;
	 Inc(i);
	 Dec(j);
      End;
   Until i>j;
   If i<r then Sort(i,r);
   If l<j then Sort(l,j);
End; { Sort }

Begin
   Assign(input,'ariprog.in');
   Reset(input);
   Assign(output,'ariprog.out');
   Rewrite(output);
   Readln(n,m);
   For i:=1 to m do
      x2[i]:=Sqr(i);
   For i:=0 to m do
      For j:=0 to m do
	 g[x2[i]+x2[j]]:=True;
   lim:=x2[i]+x2[j];
   lnum:=0;
   For i:=0 to lim do
      If g[i] then
      Begin
	 Inc(lnum);
	 list[lnum]:=i;
      End;
   pnum:=0;
   For i:=1 to lnum-1 do
      For j:=i+1 to lnum do
      Begin
	 x:=list[j]-list[i];
	 s:=list[i];
	 If (s+(n-1)*x)>lim then
	    Break;
	 k:=s+(n-1)*x;
	 While (k<>s) And (g[k]) do
	    Dec(k,x);
	 If k=s then
	 Begin
	    Inc(pnum);
	    path[pnum,1]:=s;
	    path[pnum,2]:=x;
	 End;
      End;
   If pnum>1 then
      Sort(1,pnum);
   For i:=1 to pnum do
      Writeln(path[i,1],' ',path[i,2]);
   If pnum=0 then
      Writeln('NONE');
   Close(input);
   Close(output);
End.