{
ID:aquarhe1
PROG:gift1
LANG:PASCAL
}
Program Gift1;
Type
 TPerson = Record
            nam : String;
			rec,own,giv : Longint;
		   End;
Var
 w : Array[1..10] Of TPerson;
 i,n,j,k,p : Longint;
 str : String;
 
Begin
   Assign(input,'gift1.in');
   Reset(input);
   Assign(output,'gift1.out');
   Rewrite(output);
 Readln(n);
 For i:=1 to n do
  Readln(w[i].nam);
 While Not Eof do
 Begin
  Readln(str);
  For i:=1 to n do
   If w[i].nam=str then
    Break;
  Readln(w[i].own,k);
  For p:=1 to k do
  Begin
   Readln(str);
   For j:=1 to n do
    If w[j].nam=str then
	 Break;
   Inc(w[j].rec,w[i].own div k);
  End;
  If k<>0 then
   Inc(w[i].giv,(w[i].own div k)*k);
 End;
 For i:=1 to n do
  Writeln(w[i].nam,' ',w[i].rec-w[i].giv);
   Close(input);
   Close(output);
End.