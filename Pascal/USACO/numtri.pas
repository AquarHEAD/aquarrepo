{
ID:aquarhe1
PROG:numtri
LANG:PASCAL
}
Program Numtri;
Var
   up,down     : Array[0..1000] Of Longint;
   n,i,j,ans,x : Longint;

Function Max(a,b : Longint):Longint;
Begin
   If a>b then
      Exit(a)
   Else
      Exit(b);
End; { Max }

Begin
   Assign(input,'numtri.in');
   Reset(input);
   Assign(output,'numtri.out');
   Rewrite(output);
   Readln(n);
   FillChar(up,sizeof(up),0);
   For i:=1 to n do
   Begin
      For j:=1 to i do
      Begin
	 Read(x);
	 down[j]:=Max(up[j-1],up[j])+x;
      End;
      Readln;
      up:=down;
   End;
   ans:=0;
   For i:=1 to n do
      If down[i]>ans then
	 ans:=down[i];
   Writeln(ans);
   Close(input);
   Close(output);
End.