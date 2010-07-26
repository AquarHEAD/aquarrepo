{
ID:aquarhe1
PROG:pprime
LANG:PASCAL
}
Program Pprime;
Var
   a,b	 : Longint;
   i,n,p : Longint;
   l,j	 : Integer;
   s,s1	 : String;

Function Prime(x :Longint ):Boolean;
Var
   i : Longint;
Begin
   If (x<a)Or(x>b) then
      Exit(False);
   If x=1 then
      Exit(False);
   For i:=2 to Trunc(Sqrt(x)) do
      If x mod i=0 then
	 Exit(False);
   Prime:=True;
End; { Prime }

Begin
   Assign(input,'pprime.in');
   Reset(input);
   Assign(output,'pprime.out');
   Rewrite(output);
   Readln(a,b);
   i:=1;
   n:=10;
   For l:=1 to 9 do
   Begin
      If (l=2) And (a<11) And (b>10) then
      Begin
	 Writeln(11);
	 Continue;
      End;
      If Odd(l) then
      Begin
	 While i<n do
	 Begin
	    Str(i,s1);
            s:=s1;
	    For j:=Length(s1)-1 downto 1 do
	       s:=s+s1[j];
	    Val(s,p);
	    If Prime(p) then
	       Writeln(p);
	    Inc(i);
	 End;
	 n:=n*10;
      End;
   End;
   Close(input);
   Close(output);
End.