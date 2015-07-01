#include <Misc.au3>
#include <MsgBoxConstants.au3>
#include <Array.au3>

Local $hDLL = DllOpen("user32.dll")
Local $mouseDelay = 1 ;Change - 1 Fast Click (Default 65)

Bot()
Func Bot()
   ;Run Game
   Run("C:\Program Files (x86)\Steam\SteamApps\common\Clicker Heroes\Clicker Heroes.exe")
   Sleep(1000)
   ;Move Game Windows
   WinMove("Clicker Heroes", "", 769, 0)
   ;Click Start Button
   MouseClick("left",1339,316,1)
   Sleep(1000)
   ;Click close info windows
   MouseClick("left",1714,109,1)
   Opt("MouseClickDelay",$mouseDelay)
   While 1
	  ;Close Bot PRESS F10
	  If _IsPressed("79", $hDLL) Then
		 ;WinClose($hWnd)
		 Exit
	  Else
		 CheckingNextLevel()
		 CheckBoss()
	  EndIf
   WEnd
EndFunc ;Bot

;Checking new level
Func CheckingNextLevel()
   Local $nextLevel = Hex(PixelGetColor(1695,37))
   If ($nextLevel) == '00FFFF00' Then
	  ;ConsoleWrite('NEW LEVEL' & @LF)
	  BuyFirstUpgrade()
	  MouseClick("left",1691,95)
   Else
	  ;ConsoleWrite('NO NEW LEVEL' & @LF)
	  MouseClick("left",1634,402)
   EndIf
EndFunc ;CheckingNextLevel

;Checking boss
Func CheckBoss()
   Local $boss = Hex(PixelGetColor(1600,215))
   If ($boss) == '00752F0C' Then
	  ;ConsoleWrite ('BOSS LEVEL' & @LF)
	  CheckKillBoss()
   Else
	  ;ConsoleWrite ('NO BOSS LEVEL' & @LF)
   EndIf
EndFunc ;CheckBoss

;Check Kill Boss
Func CheckKillBoss()
   Local $killboss = Hex(PixelGetColor(1612,226))
   If ($killboss) == '00FF9933' Then
	  ConsoleWrite ('NO BOSS Kill' & @LF)
	  FarmGoldtoKillBoss()
   Else
	  ConsoleWrite ('BOSS Kill' & @LF)
   EndIf
EndFunc ;CheckKillBoss

;Farm Gold
Func FarmGoldtoKillBoss()
   MouseClick("left",1562,77,1)
EndFunc ;FarmGoldtoKillBoss


;Using Upgrade



;Buy First Upgrade
Func BuyFirstUpgrade()
   Local $UpgradeCoordY[5] = [229,336,443,550,657]
   Local $X = 925
   Local $Y = UBound(($UpgradeCoordY)) - 1
   _ArrayReverse($UpgradeCoordY)
   For $i = 0 To $Y
	  If (Hex(PixelGetColor($X,$UpgradeCoordY[$i]))) = '00FFCC00' Then
		 While 1
			If (Hex(PixelGetColor($X,$UpgradeCoordY[$i]))) <> '007E6100' Then
			   ConsoleWrite("Mouse X:" & $X & " Y:" & $UpgradeCoordY[$i] & " - ACTIVE" &  " - " & Hex(PixelGetColor($X,$UpgradeCoordY[$i])) & " - BUY" & @CR)
			   MouseClick("left",$X-100,$UpgradeCoordY[$i])

			Else
			   ConsoleWrite("Mouse X:" & $X & " Y:" & $UpgradeCoordY[$i] & " - NO ACTIVE" &  " - " & Hex(PixelGetColor($X,$UpgradeCoordY[$i])) & " - NO BUY" & @CR)
			   ExitLoop
			EndIf
		 WEnd
	  EndIf
   Next
EndFunc ;BuyUpgrade

;Buy Second Upgrade
