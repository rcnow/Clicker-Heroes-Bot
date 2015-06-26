;Bot Steam Game Clicker Heroes
;Screen Size 1920x1080
#include <Misc.au3>
#include <MsgBoxConstants.au3>

Local $hDLL = DllOpen("user32.dll")

MainBot()

Func MainBot()
   ;Message Bot
   If MsgBox(0,"Info","Exit  bot Press F10") == 1 Then
	  ;Run Game
	  Run("C:\Program Files (x86)\Steam\SteamApps\common\Clicker Heroes\Clicker Heroes.exe")
	  Sleep(1000);Change value if not working winmove
	  WinMove("Clicker Heroes", "", 769, 0)
	  ;Start Game
	  MouseClick("left",1339,316,1)
	  Sleep(2000)
	  ;Close info windows
	  MouseClick("left",1714,109,1)
	  Sleep(2000)
	  ;Press F10 to Close Bot
	  While 1
		 If _IsPressed("79", $hDLL) Then
			;WinClose($hWnd)
		    Exit
		 Else
			Local $nextLevel = Hex(PixelGetColor(1695,37))
		 If ($nextLevel) <> '00FFFF00' Then
			;ConsoleWrite( "no level" & " - " & $nextLevel & @LF)
			MouseClick("left",1634,402)
		 Else
			;ConsoleWrite( "level" & " - " & $nextLevel & @LF)
			MouseClick("left",1691,95)
		 EndIf
		 EndIf
	  WEnd
   EndIf
DllClose($hDLL)
EndFunc   ;==>MainBot
