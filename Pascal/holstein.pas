{
ID:aquarhe1
PROG:holstein
LANG:PASCAL
}
Program Holstein;
Const
   maxv	= 25;
   maxg	= 15;
Var
   need	       : Array[1..maxv] Of Longint;
   eat	       : Array[1..maxg,1..maxv] Of Longint;
   cho,ans     : Array[1..maxg] Of Boolean;
   v,g,i,j,min : Integer;

Function Check : Boolean;
Var
   tmp : Array[1..maxv] Of Longint;
   i,j : Integer;
Begin
   FillChar(tmp,sizeof(tmp),0);
   For i:=1 to g do
      If cho[i] then
      Begin
	 For j:=1 to v do
	    Inc(tmp[j],eat[i,j]);
      End;
   Check:=True;
   For i:=1 to v do
      If tmp[i]<need[i] then
	 Exit(False);
End; { Check }

Procedure Search(step,num: Integer;sta:Boolean );
Begin
   If step>g then
      Exit;
   cho[step]:=sta;
   If Check then
   Begin
      If num<min then
      Begin
	 min:=num;
	 ans:=cho;
      End;
   End
   Else
   Begin
      Search(step+1,num+1,True);
      Search(step+1,num,False);
   End;
End; { Search }

Begin
   Assign(input,'holstein.in');
   Reset(input);
   Assign(output,'holstein.out');
   Rewrite(output);
   Readln(v);
   For i:=1 to v do
      Read(need[i]);
   Readln;
   Readln(g);
   For i:=1 to g do
   Begin
      For j:=1 to v do
	 Read(eat[i,j]);
      Readln;
   End;
   FillChar(cho,sizeof(cho),False);
   min:=g+1;
   Search(1,1,True);
   Search(1,0,False);
   Write(min);
   For i:=1 to g do
      If ans[i] then
	 Write(' ',i);
   Writeln;
   Close(input);
   Close(output);
End.
