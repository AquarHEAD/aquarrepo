Program Num;
Var
 k,i,tot : Longint;

Function Ok(x : Longint) : Boolean;
Begin
 Ok:=True;
 If (x div 100) mod k<>0 then
  Exit(False);
 If ((x mod 10000) div 10) mod k<>0 then
  Exit(False);
 If (x mod 1000) mod k<>0 then
  Exit(False);
End;

Begin
 Assign(input,'num.in');
 Reset(input);
 Assign(output,'num.out');
 Rewrite(output);
 Readln(k);
 tot:=0;
 For i:=10000 to 30000 do
  If Ok(i) then
  Begin
   Inc(tot);
   Writeln(i);
  End;
 If tot=0 then
  Writeln('No');
 Close(input);
 Close(output);
End.