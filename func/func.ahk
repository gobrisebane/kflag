



initKflag(){

	timeRecord("=====START KFLAG=====")

	initImg()
	caret := new Caret()
	type := new Type()
	flag := new Flag()




	; sleep 500
	; SetTimer, debugWindow, 200


}











caretWatcher(){


	; MsgBox("CARETWATCHER WORKS")


	if(keyTyping = True){

		; MsgBox("1-KEYTYPING MODE / DO NOT MOVE CARET")

		lastKeyTypingSec++
		;~ MsgBox("lastKeyTypingSec : " lastKeyTypingSec)

		if( lastKeyTypingSec > (typingIdleSec - 2) ){
				;~ MsgBox("lastKeyTypingSec up above 5.. so need to reset..")
				keyTyping := False
				lastKeyTypingSec := 0
		}


	} else if(keyTyping = False){

		; MsgBox("2-NOT KEYTYPING MODE / MOVE CARET")
		initInstantCaret()


	}
}














findWord(Haystack,Needle){
	IfInString, Haystack, %Needle%
	{
		return True
	}
}





checkClickedIcon()
{
	vChildID := 0
	oAcc := Acc_ObjectFromPoint(vChildID)
	vName := ""
	try vName := oAcc.accName(vChildID)
	return vName
}









isFocusedBrowserAddressBar(){

	WinGetClass, class, A
	if( class = "Chrome_WidgetWin_1"
	 OR class = "MozillaWindowClass"){

			try{
				eleFocus := UIA.GetFocusedElement()
				MsgBox("eleFocus.Name : " eleFocus.Name)

				if( eleFocus.Name = "Address and search bar" ; Chrome
				OR eleFocus.Name = "주소창 및 검색창" ; Brave, Whale
				OR eleFocus.Name = "주소 표시줄 및 검색 창" ; Edge
				OR eleFocus.Name = "주소 필드" ; Opera
				OR eleFocus.Name = "Google 검색 또는 주소 입력"){ ; firefox
					MsgBox("1.1.URL OKAY")
					res := True
				} else {
					MsgBox("1.2.URL NOPE")
					res := False
				}

			} catch e{

				timeRecord("!! === CRITICAL ERROR : getFocuisedELement ")
				timeRecord("!! === e.what : " e.what " / e.message : " e.message " / e.extra : " e.extra)
				MsgBox("e.what : " e.what)
				MsgBox("e.message : " e.message)
				MsgBox("e.extra : " e.extra)
			}



	} else {
		; MsgBox("2.not chrome")
		res := False

	}

	return res

}

isFocusedWindowExplorerAddressBar(){

	WinGetClass, class, A
	if( class = "CabinetWClass"){

		; uia := UIA_Interface()
		try{
			eleFocus := UIA.GetFocusedElement()
			;~ MsgBox("eleFocus.Name : " eleFocus.Name)

			if( eleFocus.Name = "주소"
			OR eleFocus.Name = "검색창"){
					res := True
			} else {
					res := False
			}
		 } catch e{

			timeRecord("!! === CRITICAL ERROR : getFocuisedELement ")
			timeRecord("!! === e.what : " e.what " / e.message : " e.message " / e.extra : " e.extra)
			MsgBox("e.what : " e.what)
			MsgBox("e.message : " e.message)
			MsgBox("e.extra : " e.extra)

		}

	 } else {
			res := False
	 }

	return res
}





isHoldingKey(){

	refinedThisHotkey := RegExReplace(A_ThisHotkey, "\W", "")
	refinedPriorHotkey := RegExReplace(A_PriorHotkey, "\W", "")

	if( refinedThisHotkey = refinedPriorHotkey ){
		; MsgBox("1.hold")
		return True

	} else {
		; MsgBox("2.not hold")
		return False
	}
}



capsLockToLowCase(){

		GetKeyState, caps_state, CapsLock, T
		if(caps_state = "D"){
			SetCapsLockState , Off
		}

}


swapLang(){
	Send, {vk15sc138}
}




















excelActivator(){
	;sleep 70
	try {
		XL := ComObjActive("Excel.Application")
		XL.ActiveWorkbook.Activate
	}
}






checkIsExcel(){

	WinGet, a_exe, ProcessName, A
	browser_arr := ["EXCEL.EXE"]


	if( hasExactValue(browser_arr, a_exe) ) {
		return true
	} else {
		return false
	}
}



isBrowser(){



	WinGet, a_exe, ProcessName, A

	browser_arr := ["CHROME.EXE","FIREFOX.EXE","WHALE.EXE","VIVALDI.EXE","OPERA.EXE","MSEDGE.EXE","BRAVE.EXE"]

	if( hasExactValue(browser_arr, a_exe) ) {
		return true
	} else {
		return false
	}
}






GetBox(ByRef l,ByRef t,ByRef r, ByRef b){
	try{
		el := UIA.GetFocusedElement()
		l := el.BoundingRectangle.l
		t := el.BoundingRectangle.t
		r := el.BoundingRectangle.r
		b := el.BoundingRectangle.b
	} catch e{
			timeRecord("!! === CRITICAL ERROR : getFocuisedELement ")
			timeRecord("!! === e.what : " e.what " / e.message : " e.message " / e.extra : " e.extra)
			MsgBox("e.what : " e.what)
			MsgBox("e.message : " e.message)
			MsgBox("e.extra : " e.extra)
		}
}





hasPriorHotKeySelectingKey(){

	; MsgBox("A_PriorHotKey : " A_PriorHotKey)
	arr := ["+Down","+Up","+Left","+Right","LButton","^z","^y","^+z"]
	if( isStringInArray(A_PriorHotKey, arr) ){
		; MsgBox("1. shift func -yes")
		return True
	} else {
		; MsgBox("2. shift func -no")
	}

}







identifyBackspaceCaret(){

	; sleep caretChangeDelay
	; sleep 100
	; sleep 10
	;이쪽에 딜레이가 있어야 아래에서 업데이트된 current_ 값을 받는다.

	caret.detect()

	if(current_w > 0){

		; MsgBox("1 . w > 0 ")
		correctFlagAfterSelectRemove()

	} else if(current_w = 0) {

		; MsgBox("1 . w = 0 ")
		initImgCaret()
		; 크롬에서 백스페이스 했을 때 작동한다.
	}

}






correctFlagAfterSelectRemoveForKey(){
	if( hasPriorHotKeySelectingKey() ){
		correctFlag()
	}
}



correctFlagAfterSelectRemove(){

	correctFlag()

}






correctFlag(){

	sleep caretChangeDelay
	if(flagId){
		GuiGetPos( fX,fY,fW,fH, flagId )
		fx := fx + 1
		;엔터의 경우 마진(1)을 붙여야 같은자리에서 인식하고 이동한다.

			caret.detect()
			if( (fX > current_x OR fy > current_y) AND current_w > 0 ){


				; MsgBox("1. 현재 flag 가 오른쪽으로 떨어져있다. :: 선택상태 - 삭제")
				/*
				1. 엔터의 경우 여기서 init로 새로 값을 받아줘야 계속 엔터를 쳐도 업데이트된다.
				2. current_w를 체크하지 않으면 구글 검색시 플래그가 남는다.
				*/
				; caret.detect()
				; initInstantCaret()

				SplashImageGUI()

			} else if (fX <= current_x){

				; MsgBox("2. 현재 flag가 왼쪽에 있거나 같다. :: 일반상태 - 무시")
			}
	}

}




isFlagRight(){
	if(flagId){
		GuiGetPos( fX,fY,fW,fH, flagId )
		fx := fx + 1
		;엔터의 경우 마진(1)을 붙여야 같은자리에서 인식하고 이동한다.

			; caret.detect()
			if(fX > current_x OR fy > current_y){

				return True

			} else if (fX <= current_x){
				; MsgBox("2. 현재 flag가 왼쪽에 있거나 같다. :: 일반상태 - 무시")
			}
	}
}

getFlagDirection(){
	if(flagId){
		GuiGetPos( fX,fY,fW,fH, flagId )
		fx := fx + 1
		;엔터의 경우 마진(1)을 붙여야 같은자리에서 인식하고 이동한다.

			; caret.detect()
			if(fX > current_x OR fy > current_y){

				return "right"

			} else if (fX < current_x){
				; MsgBox("2. 현재 flag가 왼쪽에 있거나 같다. :: 일반상태 - 무시")
				return "left"

			} else if(fX = current_x and fy = current_y){

				return "center"

			}
	}
}








correctFlagAndCaretXY(loopCount:=5){
	if( !keyTyping ){

		; sleep 50

		loop %loopCount%{
			GuiGetPos( fX,fY,fW,fH, flagId )
			caret.detect()


			if(fX != current_x OR fY != current_y ){
				; MsgBox("1 -----. not correcting.. coreecting new")
				SplashImageGUI()

			}
			sleep 15
		}
	}
}

































detectingCaretYPosChange(){


	if( A_ThisHotkey != "Enter"){
		; 엔터일경우 가 되면 간섭하게 됨

		sleep caretChangeDelay
		; 딜레이를 주지 않으면 변경된 y값을 받지 못함 (y값이 업데이트 안되어 prev와 y값이 같아짐)

		caret.detect()

		; MsgBox("---")
		; MsgBox("prev_y : " prev_y)
		; MsgBox("current_y : " current_y)

		if( isCurrentYandPrevYDiffer() ){
			initInstantCaret()
		}

	}

}






isCurrentYandPrevYDiffer(){

	res := current_y - prev_y

	; MsgBox("res : " res)
	; MsgBox("res/abs : " Abs(res) )

	if( Abs(res) > 1 ){
		; MsgBox("1. 오차 1보다 크다..")
		return True
	}
}









isExeSearchingLateCaret(cur_exe){

	arr := ["WINWORD.EXE","POWERPNT.EXE"]
	; MsgBox("cur_exe : " cur_exe)

	if( hasExactValue(arr, cur_exe) ) {
		return true
	}

}








clearRam(){
	; https://www.autohotkey.com/board/topic/30042-run-ahk-scripts-with-less-half-or-even-less-memory-usage/

	MsgBox("memory clear")
	 pid := DllCall("GetCurrentProcessId")
	 h:=DllCall("OpenProcess", "UInt", 0x001F0FFF, "Int", 0, "Int", pid)
	 DllCall("SetProcessWorkingSetSize", "UInt", h, "Int", -1, "Int", -1)
	 DllCall("CloseHandle", "Int", h)
}




RemoveToolTip:
ToolTip
return


































