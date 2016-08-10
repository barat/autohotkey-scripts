; This script checks each 5s if Steam is running in Big Picture mode and switch audio device
; Additional software (eg. AudioSwitcher) that allows to switch audio devices with hotkeys is needed
; Here CTRL+ALT+NUMPAD1 and CTRL+ALT+NUMPAD2 switch between PC speakers and TV HDMI.
; When Steam Big Picture is detected audio is changed to HDMI, and returning to PC after SBP close.

#Persistent ;keep the script running
SetTimer, sbp , 5000

sbp:
IfWinExist, ahk_class CUIEngineWin32
{
	If (not defaudio = "TV")
	{
		Send, ^!{Numpad2}
		defaudio := "TV"
	}
} else if (not defaudio = "PC") {
	Send, ^!{Numpad1}
	defaudio := "PC"
}
