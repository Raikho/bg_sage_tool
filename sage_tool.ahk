#Requires AutoHotkey v2.0
#SingleInstance force

WINDOW_WIDTH := 265
WINDOW_HEIGHT := 355
WINDOW_X := 0
WINDOW_Y := 0

;==============================================================================
;==================================== GUI =====================================
;==============================================================================

myGui := Gui("+0x40000") ; resizable
myGui.MarginX := 10
myGui.MarginY := 10
MyGui.SetFont(, "Arial")
myGui.SetFont(, "Verdana")

myGui.SetFont("s18")
text1 := myGui.AddText("x10", "F5:")
text1.SetFont("Bold c3399FF")
myGui.SetFont("s9")
text2 := myGui.AddText("yp w205 r2", "paste clipboard with [Tab]s inbetween each value")

myGui.SetFont("s18")
text3 := myGui.AddText("x10 yp+45 c3399FF", "F8:")
text3.SetFont("Bold c3399FF")
myGui.SetFont("s9")
text4 := myGui.AddText("yp w205 r2", "paste clipboard with [Down]s inbetween each value")

myGui.SetFont("s8")
myBtn := myGui.AddButton("x190 y100 w65 h35 Section", "Read Clipboard")
myBtn.OnEvent("Click", printClipboard)

myGui.SetFont("s12")
myGui.AddText("x5 ys+15 Section", "Clipboard contents:")

myGui.SetFont("s10")
editBox := myGui.AddEdit("xs+0 ys+28 Multi ReadOnly VScroll HScroll w250 h200", "")
editBox.Opt("BackgroundBFDBFE")

myGui.OnEvent("Close", (*) => ExitApp)
myGui.Show(Format("w{1} h{2} x{3} y{4}", WINDOW_WIDTH, WINDOW_HEIGHT, WINDOW_X, WINDOW_Y))

;==============================================================================
;=============================== EVENTS & KEYS ================================
;==============================================================================

OnClipboardChange clipChanged

$F5::pasteClipboard("{tab}")
$F8::pasteClipboard("{down}")

;==============================================================================
;================================= FUNCTIONS ==================================
;==============================================================================

clipChanged(DataType) {
	if (DataType != 1) {
		editBox.value := ""
		return
	}
	printClipboard()
}

printClipboard(*) {
	clip_1 := RegExReplace(A_Clipboard, "[ ,$]", "")
	clip_2 := RegExReplace(clip_1, "(`r`n)[`r`n]+", "${1}")
	editBox.Value := clip_2
}

pasteClipboard(key) {
	arr := StrSplit(editBox.Value, [A_TAB, "`n"])
	for field in arr {
		if GetKeyState("ESC", "P")
			break
		if (field = "")
			continue
		Send(field)
		Sleep(10)
		Send(key)
		Sleep(10)
	}
}
