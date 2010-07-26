{
ID:aquarhe1
PROG:friday
LANG:PASCAL
}
Program Friday;
Const
 leap : Array[1..12] Of Integer=(31,29,31,30,31,30,31,31,30,31,30,31);
 normal : Array[1..12] Of Integer=(31,28,31,30,31,30,31,31,30,31,30,31);
Var
 w : Array[1..7] Of Integer;
 i,n,nday : Integer;

Function Leapy(year : Integer) : Boolean;
Begin
 If year mod 100=0 then
 Begin
  If year mod 400=0 then
   Exit(True)
  Else
   Exit(False);
 End
 Else
 Begin
  If year mod 4=0 then
   Exit(True)
  Else
   Exit(False);
 End;
End;

Procedure Calc(year : Integer);
Var
 i : Integer;
Begin
 If Leapy(year) then
  For i:=1 to 12 do
  Begin
   nday:=(nday+11) mod 7+1;
   Inc(w[nday]);
   nday:=(nday+leap[i]-13) mod 7+1;
  End
 Else
  For i:=1 to 12 do
  Begin
   nday:=(nday+11) mod 7+1;
   Inc(w[nday]);
   nday:=(nday+normal[i]-13) mod 7+1;
  End;
End;

Begin
 Assign(input,'friday.in');
 Reset(input);
 Assign(output,'friday.out');
 Rewrite(output);
 Readln(n);
 nday:=1;
 For i:=1900 to 1899+n do
  Calc(i);
 Writeln(w[6],' ',w[7],' ',w[1],' ',w[2],' ',w[3],' ',w[4],' ',w[5]);
 Close(input);
 Close(output);
End.
