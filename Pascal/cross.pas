Program Cross;
Var
   a,b		 : Array[1..200] Of Integer;
   f		 : Array[0..200,0..200] Of Byte;
   i,j,u,v,n1,n2 : Integer;
   temp		 : Byte;

Function Max(a,b :Byte ):Byte;
Begin
   If a>b then
      Exit(a)
   Else
      Exit(b);
End; { Max }

Function Found1(Var t :Integer ):Boolean;
Var
   k : Integer;
Begin
   For k:=i-1 downto 1 do
      If a[k]=b[j] then
      Begin
	 t:=k;
	 Exit(True);
      End;
   Found1:=False;
End; { Found1 }

Function Found2(Var t :Integer ):Boolean;
Var
   k : Integer;
Begin
   For k:=j-1 downto 1 do
      If b[k]=a[i] then
      Begin
	 t:=k;
	 Exit(True);
      End;
   Found2:=False;
End; { Found2 }

Begin
   Assign(input,'cross.dat');
   Reset(input);
   Assign(output,'cross.out');
   Rewrite(output);
   Readln(n1,n2);
   For i:=1 to n1 do
      Read(a[i]);
   Readln;
   For i:=1 to n2 do
      Read(b[i]);
   Readln;
   FillChar(f,sizeof(f),0);
   For i:=1 to n1 do
      For j:=1 to n2 do
      Begin
	 temp:=Max(f[i-1,j],f[i,j-1]);
	 If (a[i]<>b[j]) And Found1(u) And Found2(v) And (f[u-1,v-1]+1>temp) then
	    temp:=f[u-1,v-1]+1;
	 f[i,j]:=temp;
      End;
   Writeln(f[n1,n2]*2);
   Close(input);
   Close(output);
End.