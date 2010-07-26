Program pku2658;
Var
 i,t : Integer;

Procedure Doing;
Var
 a : Array[1..4] Of String;
 i : Integer;
 str : String;

 Function Format(str : String) : String;
 Var
  i : Integer;
 Begin
  Format:='';
  For i:=Length(str) downto 1 do
  Begin
   If str[i]=' ' then
    Break;
   Format:=str[i]+Format;
   If str[i] In ['a','e','i','o','u','A','E','I','O','U'] then
    Break;
  End;
  For i:=1 to Length(Format) do
   If Format[i] In ['A'..'Z'] then
    Format[i]:=Chr(Ord(Format[i])+$20);
 End;

Begin
 For i:=1 to 4 do
 Begin
  Readln(str);
  a[i]:=Format(str);
 End;
 If (a[1]=a[2]) And (a[2]=a[3]) And (a[3]=a[4]) then
  Writeln('perfect')
 Else If (a[1]=a[2]) And (a[3]=a[4]) then
  Writeln('even')
 Else If (a[1]=a[3]) And (a[2]=a[4]) then
  Writeln('cross')
 Else If (a[1]=a[4]) And (a[2]=a[3]) then
  Writeln('shell')
 Else
  Writeln('free');
End;

Begin
 Readln(t);
 For i:=1 to t do
  Doing;
End.