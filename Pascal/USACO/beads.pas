{
ID:aquarhe1
PROG:beads
LANG:PASCAL
}
Program Beads;
Var
 s1,s2: AnsiString;
 i,n,ans : Integer;

Procedure Calc(k : Integer);
Var
 i,l,r : Integer;
 ch : Char;
Begin
 l:=k-1;
 r:=k;
 While (l>1) And (s1[l-1]=s1[l]) do
  Dec(l);
 While (r<3*n) And (s1[r+1]=s1[r]) do
  Inc(r);
 If r-l+1>ans then
  ans:=r-l+1;
 l:=k-1;
 r:=k;
 While (l>1) And (s2[l-1]=s2[l]) do
  Dec(l);
 While (r<3*n) And (s2[r+1]=s2[r]) do
  Inc(r);
 If r-l+1>ans then
  ans:=r-l+1;
 l:=k-1;
 r:=k;
 While (l>1) And (s1[l-1]=s1[l]) do
  Dec(l);
 While (r<3*n) And (s2[r+1]=s2[r]) do
  Inc(r);
 If r-l+1>ans then
  ans:=r-l+1;
 l:=k-1;
 r:=k;
 While (l>1) And (s2[l-1]=s2[l]) do
  Dec(l);
 While (r<3*n) And (s1[r+1]=s1[r]) do
  Inc(r);
 If r-l+1>ans then
  ans:=r-l+1;
End;

Begin
 Assign(input,'beads.in');
 Reset(input);
 Assign(output,'beads.out');
 Rewrite(output);
 Readln(n);
 Readln(s1);
 s1:=s1+s1+s1;
 s2:=s1;
 For i:=1 to Length(s1) do
  If s1[i]='w' then
  Begin
   s1[i]:='b';
   s2[i]:='r';
  End;
 ans:=0;
 For i:=n+1 to 2*n do
  Calc(i);
 If ans>n then
  ans:=n;
 Writeln(ans);
 Close(input);
 Close(output);
End.
