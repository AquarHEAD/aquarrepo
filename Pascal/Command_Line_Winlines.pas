{
Name : Command_Line_Winlines
Version : 1.0.0
Coded By : AquarHEAD
Published By : Dolphin Software Studio
}
Program Command_Line_Winlines;
Var
 PlayerName,BestName : AnsiString;
 PlayerScore,BestScore : Int64;
 SettingsFile : Text;
 
Procedure WelcomeMessage;
Begin
 Writeln('------Command Line Winlines------');
 Writeln('----------By AquarHEAD.----------');
 Writeln('-----Just Play And Have Fun.-----');
End;

Procedure ExitMessage;
Begin
 Writeln('-----Thanks For Playing This Game.-----');
 Writeln('-------Press Enter To Exit Game.-------');
 Readln;
End;

Function NewGame : Boolean;
Var
 ch : Char;
Begin
 Writeln('>>New Game?(Y/N)');
 Readln(ch);
 While (ch<>'y') And (ch<>'n') And (ch<>'Y') And (ch<>'N') do
  Readln(ch);
 If (ch='y') Or (ch='Y') then
  Exit(True)
 Else
  Exit(False);
End;

Procedure RunGame;
Var
 Map : Array[1..9,1..9] Of Char;
 
Procedure InitGame;

Function GameOver : Boolean;

Begin

//Main Run Game;

End;

Procedure ShowReport;
Begin
 If PlayerScore>BestScore then
 Begin
  Writeln('You have BREAK the record!');
  Writeln('The old record is left by '+BestName+' , it''s ',BestScore);
  Writeln('The NEW record is ',PlayerScore);
  Rewrite(SettingsFile);
  Writeln(SettingsFile,PlayerName);
  Writeln(SettingsFile,PlayerScore);
  Close(SettingsFile);
 End
 Else
 Begin
  Writeln('Dear '+PlayerName+' , your final score is',PlayerScore);
  Writeln('The Best Player now is : '+BestName+' , his score is ',BestScore);
  Writeln('Keep on trying.');
 End;
End;

Begin
 WelcomeMessage;
 While NewGame do
 Begin
  InitGameBoard;
  RunGame;
  ShowReport;
 End;
 ExitMessage;
End.//