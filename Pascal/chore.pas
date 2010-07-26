Program Chore;
Type
 TChore = Record
           num,len,x,ftime : Longint;
           re : Array[1..100] Of Longint;
          End;
Var
 w : Array[1..10000] Of TChore;
 i,n,j,ans,k : Longint;

Begin
 Assign(input,'chore.in');
 Reset(input);
 Assign(output,'chore.out');
 Rewrite(output);
 Readln(n);
 For i:=1 to n do
 Begin
  Read(w[i].num,w[i].len);
  Read(k);
  While k<>0 do
  Begin
   Inc(w[i].x);
   w[i].re[w[i].x]:=k;
   Read(k);
  End;
  Readln;
  For j:=1 to w[i].x do
   If w[w[i].re[j]].ftime>w[i].ftime then
    w[i].ftime:=w[w[i].re[j]].ftime;
  Inc(w[i].ftime,w[i].len);
  If w[i].ftime>ans then
   ans:=w[i].ftime;
 End;
 Writeln(ans);
 Close(input);
 Close(output);
End.