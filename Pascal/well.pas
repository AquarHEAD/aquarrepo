Program Well;
Type
 TTrash = Record
           t,f,h : Longint;
          End;
Var
 w : Array[1..100] Of TTrash;
 ans : Array[0..125,1..4010] Of Boolean;
 d,n,i,t,maxt : Longint;

Procedure Sort(l,r : Longint);
Var
 i,j : Longint;
 x,y : TTrash;
Begin
 i:=l;
 j:=r;
 x:=w[(l+r) div 2];
 Repeat
  While w[i].t<x.t do Inc(i);
  While x.t<w[j].t do Dec(j);
  If i<=j then
  Begin
   y:=w[i];
   w[i]:=w[j];
   w[j]:=y;
   Inc(i);
   Dec(j);
  End;
 Until i>j;
 If i<r then Sort(i,r);
 If l<j then Sort(l,j);
End;

Function Max(a,b : Longint) : Longint;
Begin
 If a>b then
  Exit(a)
 Else
  Exit(b)
End;

Procedure Doing;
Var
 k,i,j : Integer;
Begin
 ans[0,10]:=True;
 For k:=1 to n do
 For i:=d-1 downto 0 do
 For j:=maxt downto w[k].t do
  If ans[i,j] then
  Begin
   ans[i+w[k].h,j]:=True;
   If (i+w[k].h>=d) then
   Begin
    Writeln(w[k].t);
    Exit;
   End;
   ans[i,j+w[k].f]:=True;
  End;
 For j:=maxt downto 1 do
 If ans[0,j] then
  Begin
   Writeln(j);
   Exit;
  End;
End;

Begin
 Assign(input,'well.in');
 Reset(input);
 Assign(output,'well.out');
 Rewrite(output);
 Readln(d,n);
 maxt:=0;
 For i:=1 to n do
 Begin
  Readln(w[i].t,w[i].f,w[i].h);
  maxt:=Max(maxt,w[i].t);
 End;
 Inc(maxt,10);
 For i:=1 to n do
  Inc(maxt,w[i].f);
 FillChar(ans,sizeof(ans),False);
 Sort(1,n);
 Doing;
 Close(input);
 Close(output);
End.