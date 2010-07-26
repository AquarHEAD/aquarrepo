{
ID:aquarhe1
PROG:inflate
LANG:PASCAL
}
Program Inflate;
Var
   f	       : Array[0..10000] Of Dword;
   m,n,v,t,i,j : Longint;

Function Max(a,b :Dword ):Dword;
Begin
   If a>b then
      Exit(a)
   Else
      Exit(b);
End; { Max }

Begin
   Assign(input,'inflate.in');
   Reset(input);
   Assign(output,'inflate.out');
   Rewrite(output);
   Readln(m,n);
   FillChar(f,sizeof(f),0);
   For i:=1 to n do
   Begin
      Readln(v,t);
      For j:=t to m do
	 f[j]:=Max(f[j],f[j-t]+v);
   End;
   Writeln(f[m]);
   Close(input);
   Close(output);
End.