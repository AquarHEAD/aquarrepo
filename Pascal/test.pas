Program Test;
Var
 i,ans : Longint;

Function Prime(k : Longint) : Boolean;
Var
 i : Longint;
Begin
 Prime:=True;
 For i:=2 to Trunc(Sqrt(k)) do
  If k mod i = 0 then
   Exit(False);
End;

Begin
 For i:=1 to 100000000 do
  If Prime(i) then
   Inc(ans);
 Writeln(ans);
End.