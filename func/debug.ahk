



/*
	1)
	Gui, XPT10:+LastFound
	? ??? ???

	2)
	Gui, XPT10:Show, x%X% y%Y% NoActivate
	? ? ?? ???

 */




^+q::

	ExitApp

return


!1::

	flag_status := True
	MsgBox("A1 / flag_status := True")

return


!2::
	flag_status := False
	MsgBox("A2 / flag_status := False")

return


!3::

	MsgBox("A3 / flag_status : " flag_status)
	MsgBox("0 = false / 1 = true")

return


!4::

	Gui, XPT10:hide
	MsgBox("A4 / Hide flag")


return


!5::

	initImgCaret()
	MsgBox("A5 / REVITE FLAG - initImgCaret()")

return


!6::

	hideSplashGUI()
	MsgBox("A6 / hideSplashGUI()")

return


!7::

	MsgBox("A7 / ")
return




!8::
	initInstantCaret()
	MsgBox("A8 / initInstantCaret()")
return


!9::
	SplashImageGUI()
	MsgBox("A9 / SplashImageGUI()")
return



^!1::
	searchingLateCaret(20)
	MsgBox("B1 / searchingLateCaret()")
return


^!2::


return



^!3::
	;~ searchingOpenProgramCaret()
	;~ MsgBox("B3 / searchingOpenProgramCaret()")
return


^!4::



return



^!5::
	MsgBox("B5 / isBrowser() : " isBrowser() )
return



^!6::
	swapLang()
	MsgBox("B6 / swapLang()")
return



^!7::
	MsgBox("B7 / checkIsExcel() : " checkIsExcel() )
return


^!8::
	MsgBox("B8")

return


^!9::
	MsgBox("B9 " )

return






^!P::

	MsgBox("C1")

	GuiGetPos( fX,fY,fW,fH, flagId )
	MsgBox("SplashImageGUI / GuiGetPos / flagId : " flagId " / fX : " fX " / fY : " fY " / fW : " fW " / fH : " fH )


	;~ SplashImageGUI(x, y, true)
	;~ MsgBox("C1 / ERROR" )
	;~ Gui, XPT10:Flash

	;~ Gui, XPT10:+LastFound
	;~ GuiOne_ID := WinExist()	;store the ID of the lastfound window
	;~ MsgBox("uiOne_ID : " GuiOne_ID)


return







^!/::

	initImgCaret()


	MsgBox("KILL -> LASTFOUND")
	Gui, XPT10:Destroy
	Gui, XPT10:+LastFound


return

^!.::

	;~ initImgCaret()


	MsgBox("KILL -> SHOW")
	Gui, XPT10:Destroy
	;~ Gui, XPT10:+LastFound

	caret.detect()
	Gui, XPT10:Show, x%X% y%Y% NoActivate



return




^\::

	caret.detect()
	Gui, XPT10:Show, x%X% y%Y% NoActivate

return




















^![::

	MsgBox("KILL SWITCH - 1 / XPT10:+LastFound")

	/*
		flag id? ???
	 */


	Gui, XPT10:Destroy
	Gui, XPT10:+LastFound

return







^!]::

	MsgBox("KILL SWITCH - 2 / XPT10:Show")


	Gui, XPT10:Destroy


	caret.detect()
	Gui, XPT10:Show, x%X% y%Y% NoActivate
return


^!\::

	MsgBox("REVIVE SWITCH - 1 / when no GuiID")

	caret.detect()
	; SplashImageGUIPatch(X, Y)
	;~ MsgBox("KILL SWITCH - 3")
	;~ Gui, XPT10:Destroy

return


^!'::

	MsgBox("-- KILL CHECK --")


	MsgBox("CURRENT FLAGID : " flagId)


	if(flagId){
		MsgBox("1.flag id have")
	} else {
		MsgBox("2.flag id doesnt have")
	}


	GuiGetPos( fX,fY,fW,fH,flagId )
	MsgBox("GuiGetPos / flagId : " flagId " / fX : " fX " / fY : " fY " / fW : " fW " / fH : " fH )


return









^!r::



	MsgBox("testing one")

	;~ Run, C:\Windows\System32\SnippingTool.exe

	Run, winword.exe




return





^r::






	;~ Gui, XPT10:+AlwaysOnTop
	;~ Gui,+AlwaysOnTop
	;~ Winset,AlwaysOnTop,Toggle,A
	;~ hideSplashGUI()




	;~ MsgBox("initImgcaret() works")




	;~ Run C:\Program Files (x86)\Google\Chrome\Application\chrome.exe ,,, newPID





	;~ initImgCaret()
	;~ MsgBox("setseting")

	;~ MsgBox("GetURL: " GetURL("A"))




	;~ hideSplashGUI()

	;~ MsgBox("xy 달리하기 디버그")
	;~ Gui, XPT10:Show, x%sd% y%cc% NoActivate

	;~ MsgBox("GetURLBar1() : " GetURLBar1())


	;~ MsgBox("sUrl : " sUrl)

	;~ GetCaretPosEx3(x,y,w,h)
	;~ MsgBox("n-x : " x " / y : " y " w : " w " h :" h)





/*

		UIA := UIA_Interface()

		 el := UIA.GetFocusedElement()
	  try {
	  textPattern := el.GetCurrentPatternAs("TextPattern2")
	  selectedRange := textPattern.GetSelection()[1] ; Get the first TextRange (may be multiple if multiple selections are allowed, though this is rare)
	  wholeRange := textPattern.DocumentRange ; For comparison, get the whole range (TextRange) of the document
	  selectionStart := selectedRange.CompareEndpoints(UIA_Enum.TextPatternRangeEndpoint_Start, wholeRange, UIA_Enum.TextPatternRangeEndpoint_Start) ; Compare the start point of the selection to the start point of the whole document
	  selectionEnd := selectedRange.CompareEndpoints(UIA_Enum.TextPatternRangeEndpoint_End, wholeRange, UIA_Enum.TextPatternRangeEndpoint_Start) ; Compare the end point of the selection to the start point of the whole document
	}

	  value := el.Value
	rect := selectedRange.GetBoundingRectangles()
	MsgBox("selectedRange : " selectedRange.GetText())
	MsgBox("rect x : " rect[1].x " y : " rect[1].y " w " rect[1].w " h " rect[1].h)

 */


/*

	cacheRequest := UIA.CreateCacheRequest()
	cacheRequest.TreeScope := 1 ; Set TreeScope to include the starting element and all descendants as well
	cacheRequest.AddProperty("Name")

	npEl:= UIA.ElementFromHandleBuildCache("A", cacheRequest) ; Get element and also build the cache
	MsgBox("npEl : " npEl.DumpAll())

 */


/*

	UIA := UIA_Interface()
	cacheRequest := UIA.CreateCacheRequest()
	cacheRequest.TreeScope := 1 ; Set TreeScope to include the starting element and all descendants as well
	;~ cacheRequest.AddProperty("ControlType") ; Add all the necessary properties that DumpAll uses: ControlType, LocalizedControlType, AutomationId, Name, Value, ClassName, AcceleratorKey
	;~ cacheRequest.AddProperty("LocalizedControlType")
	;~ cacheRequest.AddProperty("AutomationId")
	;~ cacheRequest.AddProperty("ClassName")
	;~ cacheRequest.AddProperty("AcceleratorKey")

	;~ MsgBox("npEl : " npEl.Dump())

	cacheRequest.AddProperty("Name")
	cacheRequest.AddProperty("Value")
	npEl:= UIA.ElementFromHandleBuildCache("A", cacheRequest) ; Get element and also build the cache
	MsgBox("npEl : " npEl.DumpAll())


 */



/*
	UIA := UIA_Interface() ; Initialize UIA interface
	npEl := UIA.ElementFromHandle(WinExist("A"))
	documentEl := npEl.FindFirstByType("Document")
	MsgBox("documentEl : " documentEl.Value)
*/






	;~ MsgBox("el : " eleFocus.DumpAll())
	;~ MsgBox("el : " el.CurrentName)
	;~ MsgBox("el : " el.CurrentControlType)
	;~ MsgBox("el : " el.Name)
	;~ MsgBox("el : " el.Value)
	;~ GetChromiumContentElement












	   ;   WinSet, AlwaysOnTop, Toggle, A



; 		  WinGet, hWnd, ID, A
; ;WinGetClass, vWinClass, % "ahk_id " hWnd
; ;if (vWinClass = "Shell_TrayWnd")
; ;	return
; if (hWndOnTopLast = hWnd)
; 	return
; else if hWndOnTopLast
; 	WinSet, AlwaysOnTop, Off, % "ahk_id " hWndOnTopLast
; hWndOnTopLast := hWnd
; WinSet, AlwaysOnTop, On, % "ahk_id " hWnd








; ToolTip, Multiline`nTooltip, 100, 550
; WinSet, alwaysontop, toggle, ahk_class Shell_TrayWnd









	/*

	Gui, +Resize
	Gui, Show, w400 h300, Demo Window

	OnMessage(0x112, "WM_SYSCOMMAND")
	Return

	WM_SYSCOMMAND(wParam)
	{
		if (wParam = 0xF060) ; SC_CLOSE
		{
			MsgBox("closeworks?")
			return 0
		}
	}

	*/


; WinSet,AlwaysOnTop,Toggle,A
; WinSet,AlwaysOnTop,Toggle,ahk_exe notepad.exe




; ToolTip, Multiline`nTooltip, 500, 150


; WinGet, Prnt,  ID, ahk_exe SearchApp.exe  ;id of parent
; WinGet, Chld,  ID, dock
; WinGet, Chld2, ID, cur  ;getting id if splashimage


; WinGet, Prnt,  ID, A  ;id of parent
; MsgBox("Prnt : " Prnt)



; DllCall("SetParent", Int, Chld, Int, Prnt)

;searchapp
; 0x110e76

; 메모장
;0x15b0c9c
; DllCall("SetParent", Int, 0x15b0c9c, Int, 0x110e76)



/*

; WinSet, AlwaysOnTop, Off, A
; WinSet, TransColor, 333333 150, A
; DllCall("dwmapi\DwmSetWindowAttribute", "ptr", A
;   , "uint", DWMWA_NCRENDERING_POLICY := 2, "int*", DWMNCRP_DISABLED := 1, "uint", 4)
; WinSetRegion "50-0 250-0 150-250", "A"
WinSet, TransColor, 333333 255, A
; WinSet, Region, 0-0 W1000 H630 , A
; Winset, region, 131-296 841-296 841-741 131-741 131-296      168-342 316-342 316-460 168-460 168-342, A
; Winset, region, 131-296 841-296 841-741 131-741 131-296       250-350, A
Winset, region, 131-296 841-296 841-741 131-741 131-296      168-342 316-342 316-460 168-460 168-342, A
*/






	; MsgBox("------------")
	; GuiGetPos( fX,fY,fW,fH, flagId )
	; MsgBox("SplashImageGUI / GuiGetPos / flagId : " flagId " / fX : " fX " / fY : " fY " / fW : " fW " / fH : " fH )






	; ControlGet, hCtl, Hwnd,, Edit1, ahk_class Notepad
	; oAcc := Acc_Get("Object", "5", 0, "ahk_id " hCtl)
	; vChildId := 0
	; vAccStateNum := oAcc.accState(vChildId)
	; vAccStateNum := Format("0x{:X}", vAccStateNum)
	; vAccStateText := Acc_GetStateText(oAcc.accState(vChildId))
	; ; MsgBox, % vAccStateNum " " vAccStateText
	; MsgBox("vAccStateNum : " vAccStateNum)
	; MsgBox("vAccStateText : " vAccStateText)



	; WinGet, hWnd, ID, A
	; ControlGetFocus, vCtlClassNN, % "ahk_id " hWnd
	; ControlGet, vCtlStyle, Style,, % vCtlClassNN, % "ahk_id " hWnd
	; MsgBox("vCtlClassNN : " vCtlClassNN)
; MsgBox, % vCtlClassNN "`r`n" "has WS_VSCROLL? " !!(vCtlStyle & 0x200000) ;WS_VSCROLL := 0x200000



	; ControlGet, hCtl, Hwnd,, Edit1, A
	; oAcc := Acc_Get("Object", "5", 0, "ahk_id " hCtl)
	; oRect := Acc_Location(oAcc)
	; MsgBox("oAcc : " oAcc.accValue)
	; MsgBox("oRect : " oRect.x)
	; MsgBox("oRect : " oRect.y)
	; MsgBox("oRect : " oRect.w)
	; MsgBox("oRect : " oRect.h)






	; initInstantCaret()
	; MsgBox("instant restart")




/*
	UIA := UIA_Interface() ; Initialize UIA interface
	eleFocus := UIA.GetFocusedElement()

	MsgBox("----------")
	; MsgBox("eleFocus.l : " eleFocus.BoundingRectangle.l)
	; MsgBox("eleFocus.t : " eleFocus.BoundingRectangle.t)
	; MsgBox("eleFocus.b : " eleFocus.BoundingRectangle.b)
	; MsgBox("eleFocus.r : " eleFocus.BoundingRectangle.r)


	hsize := eleFocus.BoundingRectangle.b-eleFocus.BoundingRectangle.t
	MsgBox("h size :" hsize)
	MsgBox("----------")
*/






	;~ g : UIA_INTERFACE textpattern autohotkey
	;~ UIAutomation with a focus on Chrome
	;~ https://www.autohotkey.com/boards/viewtopic.php?t=104999&start=420
		; UIA := UIA_Interface()


/*
		el := UIA.GetFocusedElement()

		MsgBox("value : " el.value )
		MsgBox("el : " eleFocus.DumpAll())
		MsgBox("el : " el.CurrentName)
		MsgBox("el : " el.CurrentControlType)
		MsgBox("el : " el.Name)

		; MsgBox("select1 : " el.GetSelection())
		; MsgBox("select2 : " el.GetSelection()[1])
 */


/*

		; textPattern := el.GetCurrentPatternAs("UIA_LegacyIAccessiblePatternId")
		textPattern := el.GetCurrentPatternAs("LegacyIAccessible")
		; MsgBox("textPattern me : " textPattern.GetCurrentSelection() )
		MsgBox(">>> new val >>>: " textPattern.CurrentValue )

	  try {

		selectedRange := textPattern.GetSelection()[1] ; Get the first TextRange (may be multiple if multiple selections are allowed, though this is rare)



		wholeRange := textPattern.DocumentRange ; For comparison, get the whole range (TextRange) of the document
		selectionStart := selectedRange.CompareEndpoints(UIA_Enum.TextPatternRangeEndpoint_Start, wholeRange, UIA_Enum.TextPatternRangeEndpoint_Start) ; Compare the start point of the selection to the start point of the whole document
		selectionEnd := selectedRange.CompareEndpoints(UIA_Enum.TextPatternRangeEndpoint_End, wholeRange, UIA_Enum.TextPatternRangeEndpoint_Start) ; Compare the end point of the selection to the start point of the whole document
		}

	   ; value := el.Value
	   ; rect := selectedRange.GetBoundingRectangles()
		; MsgBox("selectedRange : " selectedRange.GetText())
		; MsgBox("rect x : " rect[1].x " y : " rect[1].y " w " rect[1].w " h " rect[1].h)


 */









	; eleFocus := UIA.GetFocusedElement()
	; focusedH := eleFocus.BoundingRectangle.b-eleFocus.BoundingRectangle.t
	; MsgBox("focusedH : " focusedH)



	; eleFocus := UIA.GetFocusedElement()
	; MsgBox("eleFocus.Name : " eleFocus.Name)


	; caret.detect()
	; caret.getFocusedH(H)
	; MsgBox("H : " H)



	; eleFocus := UIA.GetFocusedElement()
	; MsgBox("eleFocus : " eleFocus.AutomationId)





	; UIA := UIA_Interface() ; Initialize UIA interface




	; MsgBox("npEl : " npEl)
	; MsgBox("npEl dump : " npEl.DumpAll())
	; MsgBox("npEl dump : " npEl.AutomationId)

	; MsgBox("npEl n : " npEl.Name)
	; MsgBox("npEl v : " npEl.Value)
	; MsgBox("npEl aid : " npEl.AutomationId)


	; documentEl := npEl.FindFirstByType("Document")
	; MsgBox("documentEl : " documentEl.Value)




	; npEl := UIA.ElementFromHandle(WinExist("A"))
	; documentEl := npEl.FindFirstByType("Document")
	; MsgBox("documentEl : " documentEl.AutomationId)






	/*

	UIA := UIA_Interface() ; Initialize UIA interface
	el := UIA.GetFocusedElement()

	textPattern := el.GetCurrentPatternAs("TextPattern")
	selectedRange := textPattern.GetSelection()[1] ; Get the first TextRange (may be multiple if multiple selections are allowed, though this is rare)
	; MsgBox("----------")
	; MsgBox("eleFocus. : " eleFocus.value)
	MsgBox("selectedRange : " selectedRange.GetText())
	MsgBox("V3 V2")
*/





	; caret.detect()
	; MsgBox("X : " current_x " / Y : " current_y " / W : " current_w " / H : " current_h)


	; MsgBox("x : " x)
	; MsgBox("y : " y)
	; SplashImageGUI()
	; MsgBox("--spalshworks--")




	try{
		ppt := ComObjActive("PowerPoint.application")
		ppt.ActiveWindow.Selection.Type
		; type 3
	}









return







^g::

/*
	UIA := UIA_Interface() ; Initialize UIA interface
	el := UIA.GetFocusedElement()
	; textPattern := el.GetCurrentPatternAs("TextPattern")
	; selectedRange := textPattern.GetSelection()[1]
	; MsgBox("selectedRange : " selectedRange.GetText())

	textPattern := el.GetCurrentPatternAs("TextPattern")
	selectedRange := textPattern.GetSelection()[1]
	MsgBox("selectedRange : " selectedRange.GetText())
	; MsgBox("textPattern : " textPattern.Dump() )
	; MsgBox("selectedRange : " selectedRange)
*/


	; caret.detect()
	; MsgBox("X : " current_x " / Y : " current_y)



	; UIA := UIA_Interface() ; Initialize UIA interface
		; el := UIA.GetFocusedElement()
	; MsgBox("el : " CaretBidiMode() )

	; npEl := UIA.ElementFromHandle(WinExist("A"))
	; MsgBox("npEl : " npEl.Name )



	caret.detect()
	MsgBox("X : " current_x " / Y : " current_y)


	; GetCaretPos(x, y)
	; MsgBox("x : " x)
	; MsgBox("y : " y)


	; MsgBox(">>")
	; MsgBox("x : " A_Caret("x"))
	; MsgBox("y : " A_Caret("y"))
	; MsgBox("w : " A_Caret("w"))
	; MsgBox("h : " A_Caret("h"))



return


























GetCaretPosEx3(byref x = 0, byref y = 0, byref w = 0, byref h = 0) {
    x := y := w := h := hwnd := 0











    static iUIAutomation, hOleacc, IID_IAccessible, guiThreadInfo, init
    if !init {
        init := true
        try
            iUIAutomation := ComObjCreate("{E22AD333-B25F-460C-83D0-0581107395C9}", "{30CBE57D-D9D0-452A-AB13-7AC5AC4825EE}")
        hOleacc := DllCall("LoadLibrary", "str", "Oleacc.dll", "ptr")
        VarSetCapacity(IID_IAccessible, 16), NumPut(0x11CF3C3D618736E0, IID_IAccessible, "int64"), NumPut(0x719B3800AA000C81, IID_IAccessible, 8, "int64")
        VarSetCapacity(guiThreadInfo, size := (A_PtrSize == 8 ? 72 : 48)), NumPut(size, guiThreadInfo, "uint")
    }

    if !iUIAutomation || DllCall(NumGet(NumGet(iUIAutomation + 0), 8 * A_PtrSize), "ptr", iUIAutomation, "ptr*", eleFocus) || !eleFocus
        goto useAccLocation2
    ; Check read only property

    if !DllCall(NumGet(NumGet(eleFocus + 0), 16 * A_PtrSize), "ptr", eleFocus, "int", 10002, "ptr*", valuePattern) && valuePattern
        if !DllCall(NumGet(NumGet(valuePattern + 0), 5 * A_PtrSize), "ptr", valuePattern, "int*", isReadOnly) && isReadOnly
            goto cleanUp2
    ; Plan A applies to windows that implement IAccessible, such as chrome
    useAccLocation2:
	/*

    if DllCall("GetGUIThreadInfo", "uint", DllCall("GetWindowThreadProcessId", "ptr", WinExist("A"), "ptr", 0, "uint"), "ptr", &guiThreadInfo)
        hwndFocus := NumGet(guiThreadInfo, A_PtrSize == 8 ? 16 : 12, "ptr")
    if !hwndFocus
        hwndFocus := WinExist()
    if hOleacc && !DllCall("Oleacc\AccessibleObjectFromWindow", "ptr", hwndFocus, "uint", 0xFFFFFFF8, "ptr", &IID_IAccessible, "ptr*", accCaret) && accCaret {
        VarSetCapacity(id, 24, 0), NumPut(3, id, "ushort")
        if !DllCall(NumGet(NumGet(accCaret + 0), 22 * A_PtrSize), "ptr", accCaret, "int*", x, "int*", y, "int*", w, "int*", h, "ptr", &id) {
            hwnd := hwndFocus
            goto cleanUp2
        }
    }
	 */


    ;~ if iUIAutomation && eleFocus {
        ; use IUIAutomationTextPattern2::GetCaretRange
        if DllCall(NumGet(NumGet(eleFocus + 0), 16 * A_PtrSize), "ptr", eleFocus, "int", 10024, "ptr*", textPattern2, "int") || !textPattern2
        || DllCall(NumGet(NumGet(textPattern2 + 0), 10 * A_PtrSize), "ptr", textPattern2, "int*", isActive, "ptr*", caretTextRange) || !caretTextRange || !isActive
        || DllCall(NumGet(NumGet(caretTextRange + 0), 10 * A_PtrSize), "ptr", caretTextRange, "ptr*", rects) || !rects || (rects := ComObject(0x2005, rects, 1)).MaxIndex() < 3
            ;~ goto useGetSelection
        x := rects[0], y := rects[1], w := rects[2], h := rects[3], hwnd := hwndFocus
		MsgBox("x : " x)

        goto useGUITHREADINFO
        useGetSelection:
        ; use IUIAutomationTextPattern::GetSelection
        if DllCall(NumGet(NumGet(eleFocus + 0), 16 * A_PtrSize), "ptr", eleFocus, "int", 10014, "ptr*", textPattern) || !textPattern
        || DllCall(NumGet(NumGet(textPattern + 0), 5 * A_PtrSize), "ptr", textPattern, "ptr*", selectionRangeArray) || !selectionRangeArray
        || DllCall(NumGet(NumGet(selectionRangeArray + 0), 3 * A_PtrSize), "ptr", selectionRangeArray, "int*", length) || !length
        || DllCall(NumGet(NumGet(selectionRangeArray + 0), 4 * A_PtrSize), "ptr", selectionRangeArray, "int", 0, "ptr*", selectionRange) || !selectionRange
        || DllCall(NumGet(NumGet(selectionRange + 0), 10 * A_PtrSize), "ptr", selectionRange, "ptr*", rects) || !rects
            goto useGUITHREADINFO
        rects := ComObject(0x2005, rects, 1)
        if rects.MaxIndex() < 3 && DllCall(NumGet(NumGet(selectionRange + 0), 6 * A_PtrSize), "ptr", selectionRange, "int", 0)
        || DllCall(NumGet(NumGet(selectionRange + 0), 10 * A_PtrSize), "ptr", selectionRange, "ptr*", rects) || !rects || (rects := ComObject(0x2005, rects, 1)).MaxIndex() < 3
            goto useGUITHREADINFO
        x := rects[0], y := rects[1], w := rects[2], h := rects[3], hwnd := hwndFocus
		;~ MsgBox("x : " x)

        goto cleanUp2
    ;~ }
    useGUITHREADINFO:
    if hwndCaret := NumGet(guiThreadInfo, A_PtrSize == 8 ? 48 : 28, "ptr") {
        VarSetCapacity(clientRect, 16)
        if DllCall("GetWindowRect", "ptr", hwndCaret, "ptr", &clientRect) {

			offset := A_PtrSize == 8 ? 56 : 32

			w := NumGet(guiThreadInfo, offset + 8, "int") - NumGet(guiThreadInfo, offset, "int")
            h := NumGet(guiThreadInfo, offset + 12, "int") - NumGet(guiThreadInfo, offset + 4, "int")

			DllCall("ClientToScreen", "ptr", hwndCaret, "ptr", &guiThreadInfo + offset)

			x := NumGet(guiThreadInfo, offset, "int")
            y := NumGet(guiThreadInfo, offset + 4, "int")
            hwnd := hwndCaret
			MsgBox("--------------")
			MsgBox("x : " x)
        }
    }
    cleanUp2:
    for _, p in [eleFocus, valuePattern, textPattern2, caretTextRange, textPattern, selectionRangeArray, selectionRange, accCaret]
        (p && ObjRelease(p))
    return hwnd
}









; Gui, MyGui:add, text, Center w100 vTxtUpdate, Updates = %Updates%





debugWindow(){


	static devWin, varStatus,varStatus2


	if !devWin
	{
		Gui, dev:New, +HwnddevWin +Caption +AlwaysOnTop
		Gui, dev:Font, s15 w500, Arial
		Gui, dev:Color, white
		Gui, dev:Add, Text, w500 vVarStatus ,
		Gui, dev:Add, Text, w500 vVarStatus2 ,
		Gui +LastFound
		Gui, dev:Show,w500 x600 y0
	} else {

		Gui, dev:Default
		GuiControl,, VarStatus, keyTyping : %keyTyping%
		GuiControl,, VarStatus2, spaceCount : %spaceCount%

	}





}






MsgBox(vOutput,color:="")
{

	;~ static hGui, hEdit, vWinW := 1260, vWinH := 2100, x:=0, y:=0 ; LEFT MONITOR / full
	;~ static hGui, hEdit, vWinW := 970, vWinH := 1045, x:=-965, y:=1080 ; LEFT MONITOR / right 50%
	;~ static hGui, hEdit, vWinW := 1260, vWinH := 1040, x:=0, y:=1059 ; RIGHT MONITOR / half down
	;~ static hGui, hEdit, vWinW := 1070, vWinH := 1045, x:=-1065, y:=1080 ; LEFT MONITOR / right 60%
	;~ static hGui, hEdit, vWinW := 900, vWinH := 1040, x:=0, y:=1059 ; RIGHT MONITOR / quad down
	static hGui, hEdit, vWinW := 600, vWinH := 2094, x:=0, y:=0 ; RIGHT MONITOR / left full


	; msgbox %color%

	if !hGui
	{
		Gui, New, +HwndhGui +AlwaysOnTop
		;~ Gui, New, +HwndhGui

		Gui, Font, s11 w700 cC0C0C0, Courier New




		;Gui, Font, cC0C0C0, Fixedsys
		Gui, Color,, 000000

		Gui, Add, Edit, % Format("+HwndhEdit x0 y0 w{} h{}", vWinW, vWinH)
		Gui, Show,% Format("w{} h{} x{} y{} NoActivate ", vWinW, vWinH, x,y)

		; Gui, Add, Edit, % Format("+HwndhEdit x0 y0 w{} h{}", vWinW, vWinH)

}
	;~ Gui, +LastFound +Resize -Caption -Border -MaximizeBox +MinSize%GuiW%x%GuiH%

	vOutput .= "`r`n"
	SendMessage, 0xE, 0, 0,, % "ahk_id " hEdit ;WM_GETTEXTLENGTH := 0xE
	vLen := ErrorLevel
	SendMessage, 0xB1, % vLen, % vLen,, % "ahk_id " hEdit ;EM_SETSEL := 0xB1

	SendMessage, 0xC2, 0, % &vOutput,, % "ahk_id " hEdit ;EM_REPLACESEL := 0xC2
	;PostMessage, 0xB7, 0, 0,, % "ahk_id " hEdit ;EM_SCROLLCARET := 0xB7

}






timeRecord(sentence){
	try{

	FileAppend, [%A_Mon%-%A_Mday%-%A_Hour%:%A_Min%:%A_Sec%:%A_MSec%][%sentence%] `n, log\%A_Year%-%A_Mon%-%A_Mday%.js
	}

}

timeRecordCurrentProgram(){
	WinGetActiveTitle, Title
	timeRecord("--- CURRENT PROGRAM : " Title " ---")
}
