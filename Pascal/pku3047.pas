Program pku3047;
Const
 n : Array[1..12] Of Integer=(31,28,31,30,31,30,31,31,30,31,30,31);
 l : Array[1..12] Of Integer=(31,29,31,30,31,30,31,31,30,31,30,31);
Var
 x,year,month,day,i : Integer;

Function Leap(k : Integer) : Boolean;
Begin
 If k mod 100=0 then
 Begin
  If k mod 400=0 then
   Exit(True)
  Else
   Exit(False);
 End
 Else
 Begin
  If k mod 4=0 then
   Exit(True)
  Else
   Exit(False);
 End;
End;

Begin
 Readln(year,month,day);
 x:=0;
 If year>=1900 then
 For i:=1900 to year-1 do
 Begin
  If Leap(i) then
   Inc(x,366)
  Else
   Inc(x,365);
  x:=x mod 7;
 End
 Else
  For i:=1899 downto year do
  Begin
   If Leap(i) then
   Inc(x,366)
  Else
   Inc(x,365);
  x:=x mod 7;
  End;
 If year<1900 then
  x:=7-x;
 If Leap(year) then
  For i:=1 to month-1 do
   Inc(x,l[i])
 Else
  For i:=1 to month-1 do
   Inc(x,n[i]);
 Inc(x,day);
 Dec(x);
 x:=x mod 7;
 Case x Of
  0 : Writeln('monday');
  1 : Writeln('tuesday');
  2 : Writeln('wednesday');
  3 : Writeln('thursday');
  4 : Writeln('friday');
  5 : Writeln('saturday');
  6 : Writeln('sunday');
 End;
End.