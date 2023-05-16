



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


/*

	try{
		ppt := ComObjActive("PowerPoint.application")
		ppt.ActiveWindow.Selection.Type
		; type 3
	}
 */




	/*
	ControlGet, ctrlHwnd, Hwnd,, %ctrlClass%, ahk_class Notepad
			DllCall("SendMessage","PTR",ctrlHwnd,"UInt",0xB0,"PTR*",start,"PTR*",end) ;EM_GETSEL
			MsgBox("start : " start)
			MsgBox("end : " end)
	*/

	; clearRam()












	; eleFocus := UIA.GetFocusedElement()
	; focusedH := eleFocus.BoundingRectangle.b-eleFocus.BoundingRectangle.t
	; MsgBox("focusedH : " focusedH)





; 	PostMessage, 0x112, 0xF020,,, Telegram.exe,
; PostMessage, 0x06, 2,,, Telegram,
; PostMessage, 0x0201, 0x0001,,, Telegram,
; sleep 100
; Left Mouse Button Up
; PostMessage, 0x0202,,,, Telegram.
; WinShow, Telegram



; checkUIACaret3()
; checkUIACaretBK2()
; checkUIACaretBK()



	; ime_status := % IME_CHECK("A")
	; MsgBox("ime_status : " ime_status)
	; if(ime_status = 1){
	; 	MsgBox("CURRENT : KOR(1)")
	; } else if(ime_status = 0){
	; 	MsgBox("CURRENT : ENG(0)")
	; }



	; caret.detect()
	; MsgBox("X : " current_x " / Y : " current_y " / W : " current_w " / H : " current_h)
	; SplashImageGUI()








	WinGet, a_exe, ProcessName, A
	StringUpper, a_exe, a_exe
	browser_arr := ["EXCEL.EXE","SOURCETREE.EXE"]


	if( hasExactValue(browser_arr, a_exe) ) {
		; return true
	} else {
		; return false
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





	; GetCaretPos(x, y)
	; MsgBox("x : " x)
	; MsgBox("y : " y)


	; MsgBox(">>")
	; MsgBox("x : " A_Caret("x"))
	; MsgBox("y : " A_Caret("y"))
	; MsgBox("w : " A_Caret("w"))
	; MsgBox("h : " A_Caret("h"))


;   ControlGet, ctrlHwnd, Hwnd,, %ctrlClass%, ahk_class Notepad

; 		  DllCall("SendMessage","PTR",ctrlHwnd,"UInt",0xB0,"PTR*",start,"PTR*",end) ;EM_GETSEL

; 		  MsgBox("start : " start)
; 		  MsgBox("end : " end)




	; caret.detect()
	; MsgBox("X : " current_x " / Y : " current_y)
	; initInstantCaret()















; GetCaretPos(sx,sy)
; MsgBox("sx : " sx)
; MsgBox("sy : " sy)



; Acc_Caret := Acc_ObjectFromWindow(WinExist("A"), OBJID_CARET := 0xFFFFFFF8)
; Caret_Location := Acc_Location(Acc_Caret)
; Acc_Caret := Acc_ObjectFromWindow(WinExist("A"), OBJID_CARET := 0xFFFFFFF8)
; msgbox % Acc_State(Acc_Caret)
; MsgBox("Caret_Location : " Acc_State(Acc_Caret))



		; eleFocus := UIA.GetFocusedElement()
		; focusedH := eleFocus.BoundingRectangle.l
		; ; focusedH := eleFocus.BoundingRectangle.b-eleFocus.BoundingRectangle.t
		; MsgBox("focusedH : " focusedH)
		; caret.detect()
		; MsgBox("X : " current_x " / Y : " current_y)






	; MsgBox("run..")
	; Run, C:\Windows\System32\notepad.exe




	; GetCaretPosChrome()











	;  static IUIA := ComObjCreate("{ff48dba4-60ef-4201-aa87-54103eef594e}", "{30cbe57d-d9d0-452a-ab13-7ac5ac4825ee}")

	;  ; GetFocusedElement
   ;  DllCall(NumGet(NumGet(IUIA+0)+8*A_PtrSize), "ptr", IUIA, "ptr*", FocusedEl:=0)


	;  ; GetCurrentPattern. TextPatternElement2 = 10024
   ;  DllCall(NumGet(NumGet(FocusedEl+0)+16*A_PtrSize), "ptr", FocusedEl, "int", 10024, "ptr*", patternObject:=0),
	;  ObjRelease(FocusedEl)

	;  if patternObject {
   ;      ; GetCaretRange
   ;      DllCall(NumGet(NumGet(patternObject+0)+10*A_PtrSize), "ptr", patternObject, "int*", IsActive:=1, "ptr*", caretRange:=0), ObjRelease(patternObject)
   ;      ; GetBoundingRectangles
   ;      DllCall(NumGet(NumGet(caretRange+0)+10*A_PtrSize), "ptr", caretRange, "ptr*", boundingRects:=0), ObjRelease(caretRange)
   ;      ; VT_ARRAY = 0x20000 | VT_R8 = 5 (64-bit floating-point number)
   ;      Rect := ComObject(0x2005, boundingRects)
   ;      if (Rect.MaxIndex() = 3) {
   ;          X:=Round(Rect[0]), Y:=Round(Rect[1]), W:=Round(Rect[2]), H:=Round(Rect[3])
   ;          return
   ;      }
   ;  }

	;  MsgBox("X : " X)
	;  MsgBox("Y : " Y)




return






debugWindow(){


	static devWin,var,var2,var3,var4,var5,var6,var7


	if !devWin
	{
		Gui, dev:New, +HwnddevWin +Caption +AlwaysOnTop
		Gui, dev:Font, s15 w500, Arial
		Gui, dev:Color, white
		Gui, dev:Add, Text, w500 vVar
		Gui, dev:Add, Text, w500 vVar2
		Gui, dev:Add, Text, w500 vVar3
		Gui, dev:Add, Text, w500 vVar4
		; Gui, dev:Add, Text, w500 vVar5
		Gui, dev:Add, Text, w500 vVar6


		Gui, dev:Show, w394 x600 y0 NoActivate
	} else {

		Gui, dev:Default
		GuiControl,, Var, keyTyping : %keyTyping%
		GuiControl,, Var2, spaceCount : %spaceCount%
		GuiControl,, Var3, keyCount : %keyCount%
		GuiControl,, Var4, prev_x : %prev_x%  /  prev_y : %prev_y%
		; GuiControl,, Var5, dumbCount : %dumbCount%

		GuiControl,, Var6, current_x : %current_x% / current_y : %current_y%


	}





}

















; Gui, MyGui:add, text, Center w100 vTxtUpdate, Updates = %Updates%









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

	/*
	FileAppend, [%A_Mon%-%A_Mday%-%A_Hour%:%A_Min%:%A_Sec%:%A_MSec%][%sentence%] `n, log\%A_Year%-%A_Mon%-%A_Mday%.js
	*/
	}

}

timeRecordCurrentProgram(){
	WinGetActiveTitle, Title
	timeRecord("--- CURRENT PROGRAM : " Title " ---")
}
