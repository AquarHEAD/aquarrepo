{
ID:aquarhe1
PROG:satpix
LANG:PASCAL
}
Program Satpix;
Const
   cx :	Array[1..4] Of Integer = (0,0,1,-1);
   cy :	Array[1..4] Of Integer = (1,-1,0,0);
Var
   map	   : Array[1..1000,1..80] Of Char;
   vis	   : Array[1..1000,1..80] Of Boolean;
   i,j,n,m : Integer;
   ans,k   : Longint;

Procedure Search(x,y : Integer );
Var
   t,tx,ty : Integer;
Begin
   vis[x,y]:=True;
   For t:=1 to 4 do
   Begin
      tx:=x+cx[t];
      ty:=y+cy[t];
      If (tx>=1) And (tx<=n) And (ty>=1) And (ty<=m)
	 And (map[tx,ty]='*') And (Not vis[tx,ty]) then
      Begin
	 Inc(k);
	 Search(tx,ty);
      End;
   End;
End; { Search }

Begin
   Assign(input,'satpix.in');
   Reset(input);
   Assign(output,'satpix.out');
   Rewrite(output);
   Readln(m,n);
   For i:=1 to n do
   Begin
      For j:=1 to m do
	 Read(map[i,j]);
      Readln;
   End;
   FillChar(vis,sizeof(vis),False);
   ans:=0;
   For i:=1 to n do
      For j:=1 to m do
	 If (map[i,j]='*') And (Not vis[i,j]) then
	 Begin
	    k:=1;
	    Search(i,j);
	    If k>ans then
	       ans:=k;
	 End;
   Writeln(ans);
   Close(input);
   Close(output);
End.