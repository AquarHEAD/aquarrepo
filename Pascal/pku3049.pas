Program pku3049;
Var
 w : Array[1..26] Of Char;
 ch : Char;
 i,j,l,c : Integer;

Function Check(str : String) : Boolean;
Var
 i,a,b : Integer;
Begin
 a:=0;
 b:=0;
 For i:=1 to l do
  If str[i] In ['a','e','i','o','u'] then
   Inc(a)
  Else
   Inc(b);
 If (a>=1) And (b>=2) then
  Exit(True)
 Else
  Exit(False);
End;

Procedure Search(step,k : Integer;str : String);
Var
 i : Integer;
Begin
 If step=l then
 Begin
  If Check(str) then
   Writeln(str)
 End
 Else
 Begin
  For i:=k+1 to c do
   Search(step+1,i,str+w[i]);
 End;
End;

Begin
 Readln(l,c);
 For i:=1 to c do
  Read(w[i],ch);
 For i:=1 to c-1 do
 For j:=c downto i+1 do
  If w[j]<w[j-1] then
  Begin
   ch:=w[j];
   w[j]:=w[j-1];
   w[j-1]:=ch;
  End;
 For i:=1 to c-l+1 do
  Search(1,i,w[i]);
End.