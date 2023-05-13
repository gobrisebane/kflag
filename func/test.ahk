

^+r::





	;~ g : UIA_INTERFACE textpattern autohotkey
	;~ UIAutomation with a focus on Chrome
	;~ https://www.autohotkey.com/boards/viewtopic.php?t=104999&start=420
		UIA := UIA_Interface()
		 el := UIA.GetFocusedElement()

	  try {
	  textPattern := el.GetCurrentPatternAs("TextPattern")
	  selectedRange := textPattern.GetSelection()[1] ; Get the first TextRange (may be multiple if multiple selections are allowed, though this is rare)
	  wholeRange := textPattern.DocumentRange ; For comparison, get the whole range (TextRange) of the document
	  selectionStart := selectedRange.CompareEndpoints(UIA_Enum.TextPatternRangeEndpoint_Start, wholeRange, UIA_Enum.TextPatternRangeEndpoint_Start) ; Compare the start point of the selection to the start point of the whole document
	  selectionEnd := selectedRange.CompareEndpoints(UIA_Enum.TextPatternRangeEndpoint_End, wholeRange, UIA_Enum.TextPatternRangeEndpoint_Start) ; Compare the end point of the selection to the start point of the whole document
	}

	  ;~ value := el.Value
	   rect := selectedRange.GetBoundingRectangles()
		MsgBox("selectedRange : " selectedRange.GetText())
		MsgBox("rect x : " rect[1].x " y : " rect[1].y " w " rect[1].w " h " rect[1].h)



	/*

		if( isFocusedBrowserAddressBar()
		OR isFocusedWindowExplorerAddressBar() ){
			;~ MsgBox("1. yes-chrome-addressbard")
			sendInput, ^{End}^+{Home}
		}

		Sleep, 10
		initImgInstantCaret()

	 */



return







zorderWar(){

   ; z-order를 어떻게든 바꾸기 위한 전쟁





;  MsgBox("always work")
; ;  WinSet, alwaysontop, toggle, ahk_class Shell_TrayWnd

;  Gui, +Lastfound
; DllCall("SetParent", UInt, WinExist() , UInt, WinExist("Program Manager"))



; WinSet, alwaysontop, toggle, ahk_exe searchApp.exe
; WinSet, Transparent, off, A


; WinSet, Top,,WinExist("ahk_exe Everything.exe")
; MsgBox("works")


; WinSet, alwaysontop, on, ahk_exe Everything.exe
; WinSet, Style, +0x80880000, A
; WinSet, Style, -0x40000, A




; ExStyle := WinGetExStyle("TEST")

; if (ExStyle & 0x8)  ; 0x8 is WS_EX_TOPMOST.
; 	MsgBox("THISIS ALWAYS-TOP")


; WinGet, ExStyle, ExStyle, A
; MsgBox("ExStyle : " ExStyle)

; WinSet, Style, +0xC00000, A
; WinSet, ExStyle, -0x8, A

; WinSet ExStyle, 0x08000008, A
; MsgBox("workshello")


; hwnd := DllCall("CreateWindowInBand", "uint", 0, "str", "Autohotkey", "str", "title", "uint", 0, "int", 0, "int", 0, "int", 200, "int", 200, "ptr", 0, "ptr", 0, "ptr", 0, "ptr", 0, "int", ZBID_UIACCESS := 2, "ptr")
; if !a_lasterror
;    WinShow ahk_id %hwnd%
; else
; 	MsgBox("error : " a_lasterror)



DllCall("GetWindowBand", "ptr", WinExist("A"), "uint*", band)
MsgBox("current band :::: " band)


; hwnd := DllCall("CreateWindowInBand","uint",0,"str","Autohotkey", "str", "title", "uint", 0, "int", 0, "int", 0, "int", 200, "int", 200, "ptr", 0, "ptr", 0, "ptr", 0, "ptr", 0, "int", ZBID_GENUINE_WINDOWS := 14, "ptr")


; hwnd := DllCall("CreateWindowInBand","uint",0,"str",WinExist("A"), "str", "title", "uint", 0, "int", 0, "int", 0, "int", 200, "int", 200, "ptr", 0, "ptr", 0, "ptr", 0, "ptr", 0, "int", ZBID_GENUINE_WINDOWS := 14, "ptr")

; MsgBox("hwnd : " hwnd)



/*

hwnd := DllCall("CreateWindowInBand", "uint", 0, "str", "Autohotkey", "str", "title", "uint", 0, "int", 0, "int", 0, "int", 200, "int", 200, "ptr", 0, "ptr", 0, "ptr", 0, "ptr", 0, "int", ZBID_UIACCESS := 2, "ptr")
if !a_lasterror
   WinShow ahk_id %hwnd%
else
	MsgBox("a_lasterror" a_lasterror)
 */


; hChildMagnifier := DllCall("CreateWindowInBand", "UInt", 0, "Str", "Magnifier", "Str", "MagnifierWindow", "UInt", WS_CHILD := 0x40000000, "Int", 0, "Int", 0, "Int", w, "Int", h, "Ptr", hGui, "UInt", 0, "Ptr", DllCall("GetWindowLong" (A_PtrSize=8 ? "Ptr" : ""), "Ptr", hGui, "Int", GWL_HINSTANCE := -6 , "ptr"), "UInt", 0, "uint", ZBID_UIACCESS := 2, "ptr")
; WinShow, ahk_id %hChildMagnifier%




	; Gui, New, +HwndhGui +AlwaysOnTop
	; Gui, Font, s11 w700 cC0C0C0, Courier New
	; Gui, Color,, 000000
	; Gui, Add, Edit, % Format("+HwndhEdit x0 y0 w{} h{}", 600, 800)
	; Gui, Show,% Format("w{} h{} x{} y{} NoActivate ", 600, 800, 0,0)


	; DllCall("CreateWindowInBand", "uint", 0, "str", "Autohotkey", "str", "title", "uint", 0, "int", 0, "int", 0, "int", 200, "int", 200, "ptr", 0, "ptr", 0, "ptr", 0, "ptr", 0, "int", ZBID_GENUINE_WINDOWS  := 14, "ptr")



	; $hGUI := WinExist()
	; $curCtrl := $hC0 := CreateWindowEx($hGUI, 2, 2, 396, 596, 0x200)
	; $hC1 := CreateWindowEx($hGUI, 402, 2, 396, 596, 0x200)
	; ; Gui, Show, w800 h600



	; hwnd := DllCall("CreateWindowInBand", "uint", 0, "str", "Autohotkey", "str", "title", "uint", 0, "int", 0, "int", 0, "int", 200, "int", 200, "ptr", 0, "ptr", 0, "ptr", 0, "ptr", 0, "int", ZBID_DESKTOP := 1, "ptr")
	; WinShow ahk_id %hwnd%
	; MsgBox("hwnd : " hwnd)



	; RunWait "C:\Program Files\AutoHotkey\AutoHotkeyU64_UIA.exe" /restart "%A_ScriptFullPath%"


	; Gui, +HWNDhGui
	; Gui, Add, Text,, Please enter your name:
	; Gui, Add, Edit, vName hwndhEdit
	; Gui, Show, x0 y0
	; DllCall("GetWindowBand", "ptr", hGui, "uint*", band)
	; MsgBox("band : " band)
	; Gui, +AlwaysOnTop
	; DllCall("GetWindowBand", "ptr", hGui, "uint*", band)
	; MsgBox("band : " band)


	; splashimage, 1: , B X100 Y1800 W500 H25 CW00FF00
	; splashimage, 2: , B X100 Y1900 W500 H25 CW00FF00


}












SplashImageGUIBackup(X, Y){



	;~ MsgBox("SPALSH CALLED")
	;ORIGINAL
	updateSplashImage()


	GUI, XPT10:+LastFoundExist
	If WinExist(){

		GuiGetPos( fX,fY,fW,fH, flagId )
		timeRecord("SplashImageGUI / GuiGetPos / flagId : " flagId " / fX : " fX " / fY : " fY " / fW : " fW " / fH : " fH )
		;~ MsgBox("SplashImageGUI / GuiGetPos / flagId : " flagId " / fX : " fX " / fY : " fY " / fW : " fW " / fH : " fH )


		if( fW < 1 ){
			MsgBox("!! === CRITICAL ERROR IN SPLASHIMAGEUI : GuiGetPos fW return 0 === !!")
			timeRecord("!! === CRITICAL ERROR IN SPLASHIMAGEUI : GuiGetPos fW return 0 === !!")
			;~ initFlag()
		} else if (fW != 15 OR fH != 10){

			MsgBox("!! === CRITICAL ERROR IN SPLASHIMAGEUI : GuiGetPos fW /fH not valid size === !!")
			timeRecord("!! === CRITICAL ERROR IN SPLASHIMAGEUI : GuiGetPos fW /fH not valid size === !!")
			;~ initFlag()
		} else {

			timeRecord("SplashImageGUI - 2-1 / WinExist()")
			;~ MsgBox("SplashImageGUI - 2-1 / WinExist()")



			; GuiControl,XPT10: -Redraw,     FlagApp
			GuiControl,XPT10:, FlagApp, %SplashImage%
			GuiControl,XPT10: +Redraw,    FlagApp
			Gui, XPT10:+AlwaysOnTop


		}


		;~ 터미널을 이쪽에서 가동시키면 플리커현상이 일어남
		;~ MsgBox("FLICKER TEST")

	} Else {
		;~ MsgBox("SplashImageGUI - 2-2 / else")
		timeRecord("SplashImageGUI - 2-2 / else")
		initFlag()
	}










	Try {

		timeRecord("SplashImageGUI - 3 / x : " X " y : " Y)
		timeRecord("SplashImageGUI - 3 / cx : " current_x  " cy : " current_y )
		;~ MsgBox("SplashImageGUI - 3 / x : " x " y : " y)
		;~ MsgBox("SplashImageGUI - 3 / cx : " current_x  " cy : " current_y )



		if(current_x AND current_y AND X AND Y){

			; 팬텀플래그 현상을 제거하기 위해 처음값과 매치되었을 때만 반영한다
			if(current_x = X and current_y = Y){

				timeRecord("SplashImageGUI - 3-1 / MATCH")
				;~ MsgBox("SplashImageGUI - 3-1 / MATCH")
				Gui, XPT10:Show, x%X% y%Y% NoActivate
			} else {

				timeRecord("SplashImageGUI - 3-2 / NOT MATCH")
				;~ MsgBox("!! === SplashImageGUI - 3-2 / NOT MATCH === !!")

					;~ 만약 값이 다르면.. x와 y에 현재값을 대입
				Gui, XPT10:Show, x%current_x% y%current_y% NoActivate
			}


		} else {

			timeRecord("!! === CRITICAL ERROR-4 : CX,CY,X,Y LOST === !!")
			MsgBox("!! === CRITICAL ERROR-4 : CX,CY,X,Y LOST === !!")

		}




	} catch e {


		timeRecord("!! === CRITICAL ERROR-3 : Lost X Y value ")
		timeRecord("!! === e.what : " e.what " / e.message : " e.message " / e.extra : " e.extra)
		MsgBox("e.what : " e.what)
		MsgBox("e.message : " e.message)
		MsgBox("e.extra : " e.extra)
		throw e

	}

}

















SplashImageGUIPatch(X, Y){


	updateSplashImage()



	GUI, XPT10:+LastFoundExist
	If WinExist(){
			GuiGetPos( fX,fY,fW,fH, flagId )
			timeRecord("SplashImageGUI / GuiGetPos / flagId : " flagId " / fX : " fX " / fY : " fY " / fW : " fW " / fH : " fH )

			if( fW < 1 ){

				MsgBox("!! === CRITICAL ERROR IN SPLASHIMAGEUI : GuiGetPos fW return 0 === !!")
				timeRecord("!! === CRITICAL ERROR IN SPLASHIMAGEUI : GuiGetPos fW return 0 === !!")
				initFlag()

			} else if (fW != 15 OR fH != 10){


				MsgBox("!! === CRITICAL ERROR IN SPLASHIMAGEUI : GuiGetPos fW /fH not valid size === !!")
				timeRecord("!! === CRITICAL ERROR IN SPLASHIMAGEUI : GuiGetPos fW /fH not valid size === !!")
				initFlag()

			} else {
				timeRecord("SplashImageGUI - 2-1 / WinExist()")
				;~ MsgBox("SplashImageGUI - 2-1 / WinExist()")

				GuiControl,XPT10: -Redraw,     FlagApp
				GuiControl,XPT10:, FlagApp, %SplashImage%
				GuiControl,XPT10: +Redraw,    FlagApp
				Gui, XPT10:+AlwaysOnTop
			}

	} Else {


		MsgBox("SplashImageGUI - 2-2 / else")
		timeRecord("SplashImageGUI - 2-2 / else")
		initFlag()

	}





	Try {

		timeRecord("SplashImageGUI - 3 / x : " x " y : " y)
		timeRecord("SplashImageGUI - 3 / cx : " current_x  " cy : " current_y )
		;~ MsgBox("SplashImageGUI - 3 / x : " x " y : " y)
		;~ MsgBox("SplashImageGUI - 3 / cx : " current_x  " cy : " current_y )



		if(current_x AND current_y AND X AND Y){

			; 팬텀플래그 현상을 제거하기 위해 처음값과 매치되었을 때만 반영한다
			if(current_x = X and current_y = Y){

				timeRecord("SplashImageGUI - 3-1 / MATCH")
				;~ MsgBox("SplashImageGUI - 3-1 / MATCH")
				Gui, XPT10:Show, x%X% y%Y% NoActivate
			} else {

				timeRecord("SplashImageGUI - 3-2 / NOT MATCH")
				;~ MsgBox("!! === SplashImageGUI - 3-2 / NOT MATCH === !!")

					;~ 만약 값이 다르면.. x와 y에 현재값을 대입
				Gui, XPT10:Show, x%current_x% y%current_y% NoActivate
			}

		} else {

				timeRecord("!! === CRITICAL ERROR-4 : CX,CY,X,Y LOST === !!")
				MsgBox("!! === CRITICAL ERROR-4 : CX,CY,X,Y LOST === !!")

		}





	} catch e {
		timeRecord("!! === CRITICAL ERROR-3 : Lost X Y value ")
		timeRecord("!! === e.what : " e.what " / e.message : " e.message " / e.extra : " e.extra)
		MsgBox("e.what : " e.what)
		MsgBox("e.message : " e.message)
		MsgBox("e.extra : " e.extra)
		throw e
	}



}




drawFlagPatch(){


	; MsgBox("-----------draw flag--------")

	updateSplashImage()

	GUI, XPT10:+LastFoundExist

	If WinExist(){

			GuiGetPos( fX,fY,fW,fH, flagId )
			timeRecord("SplashImageGUI / GuiGetPos / flagId : " flagId " / fX : " fX " / fY : " fY " / fW : " fW " / fH : " fH )
			; MsgBox("SplashImageGUI / GuiGetPos / flagId : " flagId " / fX : " fX " / fY : " fY " / fW : " fW " / fH : " fH )


			if( fW < 1 ){

				MsgBox("!! === CRITICAL ERROR IN SPLASHIMAGEUI : GuiGetPos fW return 0 === !!")
				timeRecord("!! === CRITICAL ERROR IN SPLASHIMAGEUI : GuiGetPos fW return 0 === !!")
				initFlag()

			} else if (fW != 15 OR fH != 10){


				MsgBox("!! === CRITICAL ERROR IN SPLASHIMAGEUI : GuiGetPos fW /fH not valid size === !!")
				timeRecord("!! === CRITICAL ERROR IN SPLASHIMAGEUI : GuiGetPos fW /fH not valid size === !!")
				initFlag()

			} else {
				timeRecord("SplashImageGUI - 2-1 / WinExist()")
				;~ MsgBox("SplashImageGUI - 2-1 / WinExist()")

				; 플리커현상이 없어지는지 체크를 위해 주석처리
				; GuiControl,XPT10: -Redraw,     FlagApp

				GuiControl,XPT10:, FlagApp, %SplashImage%
				GuiControl,XPT10: +Redraw,    FlagApp
				Gui, XPT10:+AlwaysOnTop
			}

		;~ 터미널을 이쪽에서 가동시키면 플리커현상이 일어남
		;~ MsgBox("FLICKER TEST")


	} Else {

		timeRecord("SplashImageGUI - 2-2 / else")
		; MsgBox("SplashImageGUI - 2-2 / else")
		initFlag()

	}


 	if( ((IME_CHECK("A") = 1) AND current_lang = "eng")
		OR ((IME_CHECK("A") = 0) AND current_lang = "kor") ){
		MsgBox("!!!!! -----REVIVE----- !!!!!")
		drawFlag()
	}


}







	/*
	; V1
	backspaceStatus :=GetKeyState("BackSpace","")
	if ( backspaceStatus = 1 ){
		; 1. Holding / 메장
		MsgBox("1..holding")
		initImgCaret()
	} else {
		; 2.  Not holding / 크롬 검색
		MsgBox("2. not holding")
		; initImgCaret()
	}
	*/


	/*
	메모장 (y가 아래로 움직임)
	textarea (y가 아래로 움직임)
	url -> google.com -> 구글검색창 (y 안움직임) <- 이경우는 urlIdentifer로?
	구글검색창 -> 다음 -> 다음검색창 (y 안움직임)  y가 그대로임
	유튜브채팅 (장문일 경우 y가 움직이나.. 음수-위로 움직임 / x 가 뒤로 움직임)
	아프리카채팅  (장문일 경우 y가 움직이나.. 음수-위로 움직임 / x가 뒤로 움직임)
	*/



	/*

	백스페이스디자인

	크롬 url 백스페이스
	계속 따라가게 해주기

	네이버/구글 검색창 백스페이스
	계속 따라가게 해주기

	유튜브/아프리카 채팅
	계속 따라가게 해주기

	메모장
	기본적으로 안따라감
	A> 백스페이스3 카운터로 해주기
	B> 혹은 whileTyping backspace일 때 무시해주기
	C> Recoding Ten일때 3개 이상이면 무시해주기

	크롬/textarea
	기본적으로 안따라감
	A> 백스페이스3 카운터로 해주기
	B>혹은 whileTyping backspace일 때 무시해주기
	C> Recoding Ten일때 3개 이상이면 무시해주기
	*/



	/*
	; fx := fx+5
	; I 맞음
	; 1 이 안맞음
	; D 가 살짝 안맞음


	; fx := fx+6
	; I 맞음
	; 1 이 살짝 안맞음
	; D 가 살짝 안맞음


	; fx := fx + 7
	; I 맞음
	; 1 이 살짝 안맞음
	; D 가 살짝 안맞음


	fx := fx + 8
	; I 맞음
	; 1 맞음
	; D 가 살짝 안맞음


	; fx := fx + 9
	; I 안맞음
	; 1 맞음
	; D 가 살짝 안맞음



	; fx := fx+10
	; I 잘 안맞음

	; fx := fx + 15
	; I 잘 안맞음
	*/







correctFlagAfterSelectionRemoveForTyping2(){

		sleep 25

		keyCount++
		; MsgBox("keyCount : " keyCount)

		if( keyCount = 1 ){
			loop 20{
				caret.detect()
				if(prev_x != current_x OR prev_y != current_y){

					; MsgBox("1. 이전과 현재가 다른경우다.. 이경우에는 바로 업데이트")
					SplashImageGUI()
					break

				} else if(prev_x = current_x AND prev_y = current_y){

					; MsgBox("2. 이전과 현재가 같은 경우다. 이경우에는 룹을 돌려야한다.")
					caret.detect()
					SplashImageGUI()
					break
				}
				sleep 10
			}
		}
}








comparePrevTest(){

	sleep 25
	;SELECTING 삭제 후 사용할 목적으로 만듦


		MsgBox("prev_x : " prev_x)
		MsgBox("current_x : " current_x)
		MsgBox("keyCount : " keyCount)

		if(!keyTyping){


			if(prev_x > current_x OR prev_y > current_y){
				SplashImageGUI()
				MsgBox("1.이전 위치가 우측에 있음 / 현재 select로 삭제하면서 타이핑한것임.")

			} else if(prev_x <= current_x) {
				MsgBox("2.이전위치가 좌측이이거나 같음.. 이것은 일반적인 타이핑이므로 무시")
			}

		}


}



comparePrevXYAndCorrecting(){

	; sleep 100
	;SELECTING 삭제 후 사용할 목적으로 만듦

		MsgBox("KEY" A_ThisHotKey)
		MsgBox("keyCount : " keyCount)

		if(keyCount = 1){

			MsgBox(">>>-------------START--")

			MsgBox("prev_x : " prev_x)
			MsgBox("current_x : " current_x)

			if(prev_x > current_x OR prev_y > current_y){
				SplashImageGUI()
				MsgBox("1.이전 위치가 우측에 있음 / 현재 select로 삭제하면서 타이핑한것임.")
			} else if(prev_x <= current_x) {
				MsgBox("2.이전위치가 좌측이이거나 같음.. 이것은 일반적인 타이핑이므로 무시")
			}


		} else {

			MsgBox("keycount upward")
		}
}



compareFlagXYandCorrecting(){

	sleep 25
	;SELECTING 삭제 후 사용할 목적으로 만듦


	MsgBox("keyCount : " keyCount)

	if(keyCount = 1){

		if(flagId){

				GuiGetPos( fX,fY,fW,fH, flagId )
				fx := fx + 8

				; MsgBox("flag_x : " fx)
				; MsgBox("current_x : " current_x)
				; MsgBox("flag_y : " fy)
				; MsgBox("current_y : " current_y)


				if(fX > current_x OR fy > current_y){
					MsgBox("1. 현재 flag 가 오른쪽으로 떨어져있다.")
					MsgBox("KEY" A_ThisHotKey)

					SplashImageGUI()

				} else if (fX <= current_x){
					; MsgBox("2. 현재 flag가 왼쪽에 있거나 같다.")
				}


		}
	}
}













/*

~+.::
~+/::
	spaceCount := 0
	lastKeyTypingSec := 0
	detectingCaretYPosChange()
	removeSelectingAndCompareFlagForTyping()
	keyTyping := True
	; MsgBox("-->")
	; MsgBox("A_ThisHotKey : " A_ThisHotKey)


	keyCount++
	; MsgBox("keyCount : " keyCount)

	if(keyCount = 1 ){
		; fix_X := prev_x
		; fix_Y := prev_y
		fix_X := Current_X
		fix_Y := Current_Y
	}
	Current_X := fix_X
	Current_Y := fix_Y
	SplashImageGUI()
	; correctFlagAfterSelectionRemove()
	; correctFlagAfterSelectionRemoveForTyping()
return

*/











splash4(){

	; gGOOD

	Loop 10{

		if(a_thishotkey = "~Up up"
		OR a_thishotkey = "~Down up"
		OR a_thishotkey = "~Down"
		OR a_thishotkey = "~Up"){
			MsgBox("caret detect only.. up down")
			caret.detect()
		}

		SplashImageGUI()

		sleep 10

	}
}


correctFlagAndCaretXYNeo2(){
	sleep 300
	; MsgBox("A_thishotkey : " A_thishotkey)
	if( A_thishotkey = "~Up up" OR A_thishotkey = "~Down up"){
		caret.detect()
		SplashImageGUI()
	}
	; MsgBox("CORRECT")
}



correctFlagAndCaretXYNeo1(){

	MsgBox(">>>>>>>>>>>>>>>>>>>>>START>>>>>>>>>>>>>..")
	loopSleep := 10

	sleep 150

	Loop 20{

		caret.detect()
		MsgBox("pX : " prev_x " / Y : " prev_y)
		MsgBox("cX : " current_x " / Y : " current_y)
		MsgBox("3-loopSleep : " loopSleep)

		if(prev_x != current_x OR prev_y != current_y){

			SplashImageGUI()
			MsgBox("====SAME=====")
			; break
		}

		loopSleep := 3 * A_index

		sleep loopSleep
	}
}






correctFlagAndCaretXYBK(loopCount:=5){
	if( !keyTyping ){

		GuiGetPos( fX,fY,fW,fH, flagId )
		sleep 50

		loop %loopCount%{
			caret.detect()


			if(fX != current_x OR fY != current_y ){
				; MsgBox("1 -----. not correcting.. coreecting new")
				SplashImageGUI()

			}
			sleep 15
		}
	}
}


checkUIACaretBK(){


		;~ https://www.autoahk.com/archives/44158


		static iUIAutomation, hOleacc, IID_IAccessible

		try{
			iUIAutomation := ComObjCreate("{E22AD333-B25F-460C-83D0-0581107395C9}", "{30CBE57D-D9D0-452A-AB13-7AC5AC4825EE}")
			hOleacc := DllCall("LoadLibrary", "str", "Oleacc.dll", "ptr")
			VarSetCapacity(IID_IAccessible, 16),
			NumPut(0x11CF3C3D618736E0, IID_IAccessible, "int64"),
			NumPut(0x719B3800AA000C81, IID_IAccessible, 8, "int64")
			VarSetCapacity(guiThreadInfo, size := (A_PtrSize == 8 ? 72 : 48)), NumPut(size, guiThreadInfo, "uint")
		}

		DllCall(NumGet(NumGet(iUIAutomation + 0), 8 * A_PtrSize), "ptr", iUIAutomation, "ptr*", eleFocus)

		if !hwndFocus
			hwndFocus := WinExist()

		if iUIAutomation && eleFocus {

			if DllCall(NumGet(NumGet(eleFocus + 0), 16 * A_PtrSize), "ptr", eleFocus, "int", 10024, "ptr*", textPattern2, "int") || !textPattern2
				|| DllCall(NumGet(NumGet(textPattern2 + 0), 10 * A_PtrSize), "ptr", textPattern2, "int*", isActive, "ptr*", caretTextRange)
				|| !caretTextRange || !isActive || DllCall(NumGet(NumGet(caretTextRange + 0), 10 * A_PtrSize), "ptr", caretTextRange, "ptr*", rects)
				|| !rects || (rects := ComObject(0x2005, rects, 1)).MaxIndex() < 3
				Sleep 1
				try{
					current_x := Round(rects[0]) + this.X_margin,
					current_y := Round(rects[1]) + this.Y_margin,
					current_w := Round(rects[2]),
					current_h := Round(rects[3]),
					hwnd := hwndFocus
				}


				timeRecord("GetCaret - 3-3 : iUIAuto")
				timeRecord("current_x : " current_x  " / current_y : " current_y " current_w : " current_w " current_h :" current_h)
				; MsgBox("GetCaret - 3-3 / current_x : " current_x  " / current_y : " current_y " current_w : " current_w " current_h :" current_h)

				MsgBox("cleaning start")
				goto cleanCaret2


				if(current_w > 0 AND current_h > 0){

					; MsgBox("--------- C-1-1. UIA WORKS")
					return True

				}

				; 크롬에서 셀렉팅한 텍스트를 인식함

				/*
				else if (current_w < 1 AND current_h < 1){
					; use IUIAutomationTextPattern::GetSelection
					if DllCall(NumGet(NumGet(eleFocus + 0), 16 * A_PtrSize), "ptr", eleFocus, "int", 10014, "ptr*", textPattern) || !textPattern
					|| DllCall(NumGet(NumGet(textPattern + 0), 5 * A_PtrSize), "ptr", textPattern, "ptr*", selectionRangeArray) || !selectionRangeArray
					|| DllCall(NumGet(NumGet(selectionRangeArray + 0), 3 * A_PtrSize), "ptr", selectionRangeArray, "int*", length) || !length
					|| DllCall(NumGet(NumGet(selectionRangeArray + 0), 4 * A_PtrSize), "ptr", selectionRangeArray, "int", 0, "ptr*", selectionRange) || !selectionRange
					|| DllCall(NumGet(NumGet(selectionRange + 0), 10 * A_PtrSize), "ptr", selectionRange, "ptr*", rects) || !rects
					Sleep 1
					;~ rects := ComObject(0x2005, rects, 1)

					;~ if rects.MaxIndex() < 3 && DllCall(NumGet(NumGet(selectionRange + 0), 6 * A_PtrSize), "ptr", selectionRange, "int", 0)
					|| DllCall(NumGet(NumGet(selectionRange + 0), 10 * A_PtrSize), "ptr", selectionRange, "ptr*", rects) || !rects || (rects := ComObject(0x2005, rects, 1)).MaxIndex() < 3
						DllCall(NumGet(NumGet(selectionRange + 0), 6 * A_PtrSize), "ptr", selectionRange, "int", 0)
						DllCall(NumGet(NumGet(selectionRange + 0), 10 * A_PtrSize), "ptr", selectionRange, "ptr*", rects)
						rects := ComObject(0x2005, rects, 1)
						Sleep 1
						try{
							current_x := Round(rects[0]) + this.X_margin,
							current_y := Round(rects[1]) + this.Y_margin,
							current_w := Round(rects[2]),
							current_h := Round(rects[3]),
							hwnd := hwndFocus
						}
						if(current_w > 0 AND current_h > 0){
							MsgBox("--------- C-1-2. UIA WORKS")
							return True
						} else {

							MsgBox("--------- C-2. UIA fail..")
							; this.type := ""
							; return False

						}

						timeRecord("GetCaret - 3-4 : usergetselection")
						timeRecord("CaretX : " current_x  " / CaretY : " current_y " CaretW : " current_w " CaretH :" current_h)
						; MsgBox("GetCaret - 3-4 / CaretX : " current_x  " / CaretY : " current_y " CaretW : " current_w " CaretH :" current_h)
						goto cleanCaret2
				}
				*/

				else {

					; MsgBox("--------- C-1-2. UIA FAIL..")
					return false


				}


		}

		cleanCaret2:
		for _, p in [eleFocus, valuePattern, textPattern2, caretTextRange, textPattern, selectionRangeArray, selectionRange, accCaret]
			(p && ObjRelease(p))
		; return hwnd


	}










	checkUIACaretBK2(){


		;~ https://www.autoahk.com/archives/44158

		; static iUIAutomation, hOleacc, IID_IAccessible
		static hOleacc, IID_IAccessible


		try{
			; if(!iUIAutomation){
				iUIAutomation := ComObjCreate("{ff48dba4-60ef-4201-aa87-54103eef594e}", "{30CBE57D-D9D0-452A-AB13-7AC5AC4825EE}")

				; IUIAutomation := ComObjCreate(CLSID_CUIAutomation := "{ff48dba4-60ef-4201-aa87-54103eef594e}", IID_IUIAutomation := "{30cbe57d-d9d0-452a-ab13-7ac5ac4825ee}")
			; }

			hOleacc := DllCall("LoadLibrary", "str", "Oleacc.dll", "ptr")
			VarSetCapacity(IID_IAccessible, 16),
			NumPut(0x11CF3C3D618736E0, IID_IAccessible, "int64"),
			NumPut(0x719B3800AA000C81, IID_IAccessible, 8, "int64")
			VarSetCapacity(guiThreadInfo, size := (A_PtrSize == 8 ? 72 : 48)), NumPut(size, guiThreadInfo, "uint")
		}

		DllCall( NumGet(NumGet(iUIAutomation + 0), 8 * A_PtrSize), "ptr", iUIAutomation, "ptr*", eleFocus)





		if !hwndFocus
			hwndFocus := WinExist()

		if iUIAutomation && eleFocus {

			if DllCall(NumGet(NumGet(eleFocus + 0), 16 * A_PtrSize), "ptr", eleFocus, "int", 10024, "ptr*", textPattern2, "int") || !textPattern2
				|| DllCall(NumGet(NumGet(textPattern2 + 0), 10 * A_PtrSize), "ptr", textPattern2, "int*", isActive, "ptr*", caretTextRange)
				|| !caretTextRange || !isActive || DllCall(NumGet(NumGet(caretTextRange + 0), 10 * A_PtrSize), "ptr", caretTextRange, "ptr*", rects)
				|| !rects || (rects := ComObject(0x2005, rects, 1)).MaxIndex() < 3
				Sleep 1
				try{
					current_x := Round(rects[0]) + this.X_margin,
					current_y := Round(rects[1]) + this.Y_margin,
					current_w := Round(rects[2]),
					current_h := Round(rects[3]),
					hwnd := hwndFocus
				}


				timeRecord("GetCaret - 3-3 : iUIAuto")
				timeRecord("current_x : " current_x  " / current_y : " current_y " current_w : " current_w " current_h :" current_h)
				; MsgBox("GetCaret - 3-3 / current_x : " current_x  " / current_y : " current_y " current_w : " current_w " current_h :" current_h)

				goto cleanCaret

				if(current_w > 0 AND current_h > 0){
					; MsgBox("--------- C-1-1. UIA WORKS")
					return True
				} else {
					; MsgBox("--------- C-1-2. UIA FAIL..")
					return false
				}
		}


		cleanCaret:
		for _, p in [eleFocus, valuePattern, textPattern2, caretTextRange, textPattern, selectionRangeArray, selectionRange, accCaret,guiThreadInfo]
			(p && ObjRelease(p))
		ObjRelease(eleFocus)
		ObjRelease(iUIAutomation)
		DllCall("FreeLibrary", "Ptr", hOleacc)




	}







checkAccCaretBK(){

		static init
		Try {
			if (!init)
					init:=DllCall("LoadLibrary","Str","oleacc","Ptr")
				VarSetCapacity(IID,16),
				idObject:=OBJID_CARET:=0xFFFFFFF8,
				NumPut(idObject==0xFFFFFFF0?0x0000000000020400:0x11CF3C3D618736E0, IID, "Int64"),
				NumPut(idObject==0xFFFFFFF0?0x46000000000000C0:0x719B3800AA000C81, IID, 8, "Int64")

			if DllCall("oleacc\AccessibleObjectFromWindow"
				, "Ptr",WinExist("A"), "UInt",idObject, "Ptr",&IID, "Ptr*",pacc)=0
			{
				Acc:=ComObject(9,pacc,1), ObjAddRef(pacc)
				, Acc.accLocation( ComObj(0x4003,&x:=0), ComObj(0x4003,&y:=0), ComObj(0x4003,&w:=0), ComObj(0x4003,&h:=0), ChildId:=0)
				, current_x:=NumGet(x,0,"int") + this.X_margin
				, current_y:=NumGet(y,0,"int") + this.Y_margin
				, current_w:=NumGet(w,0,"int")
				, current_h:=NumGet(h,0,"int")
			}
		}


}