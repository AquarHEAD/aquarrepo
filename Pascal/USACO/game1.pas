{
ID:aquarhe1
PROG:game1
LANG:PASCAL
}
Program Game1;
Var
   w	     : Array[1..100] Of Integer;
   f	     : Array[0..100,0..100,0..1] Of Longint;
   i,j,n,p,l : Integer;
   sum	     : Longint;

Function Max(a,b :Longint ):Longint;
Begin
   If a>b then
      Exit(a)
   Else
      Exit(b)
End; { Max }

Function Min(a,b :Longint ):Longint;
Begin
   If a<b then
      Exit(a)
   Else
      Exit(b);
End; { Min }

Begin
   Assign(input,'game1.in');
   Reset(input);
   Assign(output,'game1.out');
   Rewrite(output);
   Readln(n);
   sum:=0;
   For i:=1 to n do
   Begin
      Read(w[i]);
      Inc(sum,w[i]);
   End;
   If Odd(n) then
      p:=0
   Else
      p:=1;
   For l:=1 to n do
   Begin
      For i:=1 to n do
      Begin
	 j:=i+l-1;
	 If j>n then
	    Break;
	 If p=0 then
	    f[i,j,p]:=Max(f[i+1,j,1]+w[i],f[i,j-1,1]+w[j])
	 Else
	    f[i,j,p]:=Min(f[i+1,j,0],f[i,j-1,0]);
      End;
      p:=(p+1) mod 2;
   End;
   Writeln(f[1,n,0],' ',sum-f[1,n,0]);
   Close(input);
   Close(output);
End.
