{
ID:aquarhe1
PROG:dualpal
LANG:PASCAL
}
Program Dualpal;
Var
   find,n,s,bok,b : Longint;

Function i2ch(k	: Integer ) : Char;
Begin
   Exit(Chr(Ord('0')+k));
End; { i2ch }

Function Check(k,b: Longint ) : Boolean;
Var
   str : String;
   i   : Integer;
Begin
   str:='';
   While k<>0 do
   Begin
      str:=str+i2ch(k mod b);
      k:=k div b;
   End;
   Check:=True;
   For i:=1 to Length(str) do
      If str[i]<>str[Length(str)-i+1] then
	 Exit(False);
End; { Check }

Begin
   Assign(input,'dualpal.in');
   Reset(input);
   Assign(output,'dualpal.out');
   Rewrite(output);
   Readln(n,s);
   find:=0;
   While find<n do
   Begin
      Inc(s);
      bok:=0;
      For b:=2 to 10 do
	 If Check(s,b) then
	    Inc(bok);
      If bok>=2 then
      Begin
	 Inc(find);
	 Writeln(s);
      End;
   End;
   Close(input);
   Close(output);
End.