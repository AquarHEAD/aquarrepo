{
ID:aquarhe1
PROG:sort3
LANG:PASCAL
}
Program Sort3;
Var
   w	       : Array[1..1000] Of Integer;
   l	       : Array[1..3] Of Integer;
   s	       : Array[1..3,1..3] Of Integer;
   n,i,j,ans,t : Integer;

Function Min(a,b :Integer ):Integer;
Begin
   If a<b then
      Exit(a)
   Else
      Exit(b);
End; { Min }

Begin
   Assign(input,'sort3.in');
   Reset(input);
   Assign(output,'sort3.out');
   Rewrite(output);
   Readln(n);
   For i:=1 to 3 do
      l[i]:=0;
   For i:=1 to 3 do
      For j:=1 to 3 do
	 s[i,j]:=0;
   For i:=1 to n do
   Begin
      Readln(w[i]);
      Inc(l[w[i]]);
   End;
   For i:=1 to l[1] do
      Inc(s[1,w[i]]);
   For i:=l[1]+1 to l[1]+l[2] do
      Inc(s[2,w[i]]);
   For i:=l[1]+l[2]+1 to n do
      Inc(s[3,w[i]]);
   ans:=0;
   
   t:=Min(s[1,2],s[2,1]);
   Inc(ans,t);
   Dec(s[1,2],t);
   Dec(s[2,1],t);

   t:=Min(s[1,3],s[3,1]);
   Inc(ans,t);
   Dec(s[1,3],t);
   Dec(s[3,1],t);

   t:=Min(s[2,3],s[3,2]);
   Inc(ans,t);
   Dec(s[2,3],t);
   Dec(s[3,2],t);

   Inc(ans,(s[1,2]+s[1,3])*2);
   Writeln(ans);
   Close(input);
   Close(output);
End.