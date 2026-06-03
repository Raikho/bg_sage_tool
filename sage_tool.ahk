#Requires AutoHotkey v2.0
#SingleInstance force


WINDOW_WIDTH := 280
WINDOW_HEIGHT := 275
WINDOW_X := 0
WINDOW_Y := 0
myGui := Gui("+0x40000") ; resizable
myGui.MarginX := 10
myGui.Marginy := 10

myGui.SetFont("s12")
myGui.AddText("Section", "Clipboard contents:")

myGui.SetFont("s8")
myBtn := myGui.AddButton("x+50 w60 h20", "Refresh")
myBtn.OnEvent("Click", onButton)

myGui.SetFont("s10")
myEdit := myGui.AddEdit("xs+0 Multi ReadOnly VScroll HScroll w250 h200", "")
myEdit.Opt("BackgroundBFDBFE")

statusBar := myGui.AddStatusBar("xs", "")
statusBar.SetFont("s12")

myGui.OnEvent("Close", (*) => ExitApp)
myGui.Show(Format("w{1} h{2} x{3} y{4}",
	WINDOW_WIDTH, WINDOW_HEIGHT, WINDOW_X, WINDOW_Y))

~^c::{
	Sleep(10)
	onButton()
}

onButton(*) {
	clip := A_Clipboard
	clip := StrReplace(clip, " ", "")
	clip := StrReplace(clip, ",", "")
	clip := StrReplace(clip, "$", "")
	myEdit.Value := clip

	statusBar.SetText((clip == "") ? "" : "Press F5 to send tabbed text")
}

$F5::{
	arr := StrSplit(myEdit.Value, [A_TAB, "`n"])
	for x in arr {
		if GetKeyState("ESC", "P") {
			break
		}
		if (x = "") {
			continue
		}
		Send(x)
		Sleep(10)
		Send("{tab}")
		Sleep(10)
	}
}
