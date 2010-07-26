Program List;
Type
 TSong = Record
          nam,status : String;
         End;
Var
 w : Array[1..100] Of TSong;
 ans : Array[1..100] Of String;
 i,n,t : Integer;

Begin
 Assign(input,'list.in');
 Reset(input);
 Assign(output,'list.out');
 Rewrite(output);
 Readln(n);
 For i:=1 to n do
 Begin
  Readln(w[i].nam);
  Readln(w[i].status);
  If w[i].status='SAME' then
   ans[i]:=w[i].nam;
 End;
 Repeat
  Inc(t);
 Until ans[t]='';
 For i:=1 to n do
  If w[i].status='DOWN' then
  Begin
   ans[t]:=w[i].nam;
   Repeat
    Inc(t);
   Until ans[t]='';
  End;
 For i:=1 to n do
  If w[i].status='UP' then
  Begin
   ans[t]:=w[i].nam;
   Repeat
    Inc(t);
   Until ans[t]='';
  End;
 For i:=1 to n do
  Writeln(ans[i]);
 Close(input);
 Close(output);
End.