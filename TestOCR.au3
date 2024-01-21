Func QuitScript()
    Exit
EndFunc
Func normal()
	Sleep(300)
	MouseClick("left", 1220, 270)
	Sleep(300)
	MouseClick("left", 1230, 325) ; normal
	Sleep(400)
EndFunc
Func good()
	Sleep(300)
	MouseClick("left", 1220, 270)
	Sleep(300)
	MouseClick("left", 1230, 350) ; good
	Sleep(400)
EndFunc
Func outstanding()
	Sleep(300)
	MouseClick("left", 1220, 270)
	Sleep(300)
	MouseClick("left", 1230, 375) ; outstanding
	Sleep(400)
EndFunc
Func excellent()
	Sleep(300)
	MouseClick("left", 1220, 270)
	Sleep(300)
	MouseClick("left", 1230, 400) ; excellent
	Sleep(400)
EndFunc
Func masterpiece()
	Sleep(300)
	MouseClick("left", 1220, 270)
	Sleep(300)
	MouseClick("left", 1230, 425) ; masterpiece
	Sleep(400)
EndFunc
Func GetNum()
	$get_last_capture = 0
	$delimiter = @CRLF
	 $cleanup = 1
	 $scale = 2  ;--2
	 $left_indent = 1482    	 	;1482
	 $top_indent = 500			;490
	 $right_indent = 1775		;1775
	 $bottom_indent = 1000 	;1000
	$show_capture = 0
	
	; Capture the screen
	_TesseractTempPathSet(@ScriptDir)
	$resultText = _TesseractScreenCapture($get_last_capture, $delimiter, $cleanup, $scale, $left_indent, $top_indent, $right_indent, $bottom_indent, $show_capture)

	If IsArray($resultText) Then
		;ConsoleWrite("Success" &@CRLF)
		
		If UBound($resultText) == 0 Then
			Return "None"
		Else
			Return $resultText[0]
		EndIf
		
	Else
		ConsoleWrite("Failed")
		Return "Failed"
	EndIf
EndFunc

Func CopySheets($num)
	Sleep(300)
	WinActivate("Sheets")
	Sleep(500)
	MouseClick("left", 1970, 260)
	sleep(600)
	;ControlSend($targetWindowSheetsTitle, "", "", "B2")
	;Set to next cell
	$cell = $cellChar & $cellNum
	
	If $cellChar == "B" Then
		$cellChar = "C"
	ElseIf $cellChar== "C" Then
		$cellChar = "D"
	ElseIf $cellChar == "D" Then
		$cellChar = "E"
	ElseIf $cellChar == "E" Then
		$cellChar = "F"
	ElseIf $cellChar == "F" Then
		$cellChar = "B"
		$cellNum = $cellNum + 1
	EndIf
	
	ControlSend($targetWindowSheetsTitle, "", "", $cell)
	sleep(600)
	ControlSend($targetWindowSheetsTitle, "", "", "{ENTER}")
	;ConsoleWrite($num &@CRLF)
	ControlSend($targetWindowSheetsTitle, "", "", $num)
	sleep(300)
	WinActivate($targetWindowGameTitle)
	Sleep(500)
EndFunc
Func RunAllQual()
	normal()
	$value = GetNum()
	CopySheets($value)

	good()
	$value = GetNum()
	CopySheets($value)

	outstanding()
	$value = GetNum()
	CopySheets($value)

	excellent()
	$value = GetNum()
	CopySheets($value)

	masterpiece()
	$value = GetNum()
	CopySheets($value)
	Sleep(300)
EndFunc
Func RunAllEnchant()
	sleep(300)
	MouseClick("left", 1080, 270) ;enchantment
	sleep(300)
	MouseClick("left", 1100, 325) ; .0

	RunAllQual()

	MouseClick("left", 1080, 270) ;enchantment
	sleep(300)
	MouseClick("left", 1100, 350) ; .1

	RunAllQual()

	MouseClick("left", 1080, 270) ;enchantment
	sleep(300)
	MouseClick("left", 1100, 375) ; .2

	RunAllQual()

	MouseClick("left", 1080, 270) ;enchantment
	sleep(300)
	MouseClick("left", 1100, 405) ; .3

	RunAllQual()

	MouseClick("left", 1080, 270) ;enchantment
	sleep(300)
	MouseClick("left", 1100, 430) ; .4

	RunAllQual()
EndFunc
#include <Tesseract.au3>
#include <ScreenCapture.au3>

HotKeySet("{ESC}", "QuitScript") ; esc
Global $targetWindowGameTitle = "Albion Online Client"
Global $targetWindowSheetsTitle = "Sheets"
Global $cellChar = "B"
Global $cellNum = 2
WinActivate($targetWindowGameTitle)
Sleep(600)

;Select Market search
MouseClick("left", 630, 270)
sleep(500)
MouseClick("left", 630, 270)
sleep(500)
MouseClick("left", 630, 270)
sleep(500)
ControlSend($targetWindowGameTitle, "", "", "bag")

MouseClick("left", 950, 270) ; tier
sleep(300)
MouseClick("left", 950, 405) ; t4

RunAllEnchant()

MouseClick("left", 950, 270) ; tier
sleep(300)
MouseClick("left", 950, 430) ; t5
$cellNum = $cellNum + 1

RunAllEnchant()

MouseClick("left", 950, 270) ; tier
sleep(300)
MouseClick("left", 950, 460) ; t6
$cellNum = $cellNum + 1

RunAllEnchant()

MouseClick("left", 950, 270) ; tier
sleep(300)
MouseClick("left", 950, 485) ; t7
$cellNum = $cellNum + 1

RunAllEnchant()

MouseClick("left", 950, 270) ; tier
sleep(300)
MouseClick("left", 950, 510) ; t8
$cellNum = $cellNum + 1

RunAllEnchant()