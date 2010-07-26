{
ID:aquarhe1
PROG:sprime
LANG:PASCAL
}
Program Sprime;
Var
   i,n : Integer;

Function Prime(k :Longint ):Boolean;
Var
   i : Longint;
Begin
   For i:=2 to Trunc(Sqrt(k)) do
      If k mod i=0 then
	 Exit(False);
   Prime:=True;
End; { Prime }

Procedure Search(k: Longint;step:Integer );
Var
   i : Integer;
Begin
   If step=n then
   Begin
      Writeln(k);
      Exit;
   End;
   For i:=0 to 9 do
      If Prime(k*10+i) then
	 Search(k*10+i,step+1);
End; { Search }

Begin
   Assign(input,'sprime.in');
   Reset(input);
   Assign(output,'sprime.out');
   Rewrite(output);
   Readln(n);
   For i:=2 to 9 do
      If Prime(i) then
      Search(i,1);
   Close(input);
   Close(output);
End.