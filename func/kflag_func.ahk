



initKflag(){

	timeRecord("=====START KFLAG=====")


	caret := new Caret()


	SetTimer, debugWindow, 200



}





initImg:

	if !FileExist(folderpath){
		FileCreateDir, %folderpath%
	}

	CoordMode, Pixel, Screen

	GoSub, LoadImgFlagEngUp
	WriteFile(imgpath_flag_eng_up, picture)

	GoSub, LoadImgFlagEngLo
	WriteFile(imgpath_flag_eng_lo, picture)

	GoSub, LoadImgFlagKor
	WriteFile(imgpath_flag_kor, picture)

return










caretWatcher(){


	; MsgBox("CARETWATCHER WORKS")


	if(keyTyping = True){

		;~ MsgBox("1-KEYTYPING MODE / DO NOT MOVE CARET")

		lastKeyTypingSec++
		;~ MsgBox("lastKeyTypingSec : " lastKeyTypingSec)

		if( lastKeyTypingSec > (typingIdleSec - 2) ){
				;~ MsgBox("lastKeyTypingSec up above 5.. so need to reset..")
				keyTyping := False
				lastKeyTypingSec := 0
		}


	} else if(keyTyping = False){
		;~ MsgBox("2-NOT KEYTYPING MODE / MOVE CARET")
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









capsLockToLowCase(){

	ime_status := % IME_CHECK("A")
	if(ime_status = "1"){
		GetKeyState, caps_state, CapsLock, T
		if(caps_state = "D"){
			SetCapsLockState , Off
		}
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


	if( hasValue(browser_arr, a_exe) ) {
		return true
	} else {
		return false
	}
}



isBrowser(){

	WinGet, a_exe, ProcessName, A
	browser_arr := ["chrome.exe","firefox.exe","whale.exe","vivaldi.exe","opera.exe","msedge.exe","brave.exe"]

	if( hasValue(browser_arr, a_exe) ) {
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





hasPriorHotKeySelectingArrow(){

	; MsgBox("A_PriorHotKey : " A_PriorHotKey)
	arr := ["+Down","+Up","+Left","+Right","LButton"]
	if( isStringInArray(A_PriorHotKey, arr) ){
		; MsgBox("1. shift func -yes")
		return True
	} else {
		; MsgBox("2. shift func -no")
	}

}




correntFlagAndCaretXY(loopCount:=5){

	GuiGetPos( fX,fY,fW,fH, flagId )
	sleep 50

	loop %loopCount%{
		caret.detect()

		; MsgBox("loopindex " a_index)

		if(fX != current_x OR fY != current_y ){
			; MsgBox("1 -----. not correcting.. coreecting new")
			SplashImageGUI()
		}
		sleep 15
	}

}





identifyBackspaceCaret(){

	; sleep caretChangeDelay



	caret.detect()

	if(current_w > 0){
		; MsgBox("1 . w > 0 ")
		detectRightOrBottomFlagAndCorrect()

	} else if(current_w = 0) {
		; MsgBox("1 . w = 0 ")
		initImgCaret()
	}

}











correctFlagAfterSelectionRemove(){

	; 해당 함수는, block 지정 후 삭제시 딜레이가 있기때문에 한번더 correct를 해준다



	MsgBox("keyCount : " keyCount)


	if(!keyTyping){
		MsgBox("CORRECT WORKS")
		; 현재 타이핑이 아닐경우에만 자리를 잡아준다.
		; > 만약 하지 않으면 스페이스나 엔터 후 타이핑시 트레일링 된다.

		correntFlagAndCaretXY(1)
	}
}


correctFlagAfterSelectionRemove3(){
	MsgBox("1.A_ThisHotkey : " A_ThisHotkey)

	key_arr := ["BackSpace","Enter","Del","Space"]
	if( isStringInArray(A_ThisHotkey,key_arr) ){



			MsgBox("2.A_ThisHotkey : " A_ThisHotkey)
			MsgBox("CORRECT WORKS - contain key")
			correntFlagAndCaretXY(1)




	}


}



correctFlagAfterSelectionRemove2(){

	; 해당 함수는, block 지정 후 삭제시 딜레이가 있기때문에 한번더 correct를 해준다

	if(!keyTyping){
		MsgBox("CORRECT WORKS")
		; 현재 타이핑이 아닐경우에만 자리를 잡아준다.
		; > 만약 하지 않으면 스페이스나 엔터 후 타이핑시 트레일링 된다.

		correntFlagAndCaretXY(1)
	}
}







detectRightOrBottomFlagAndCorrect(){

	if(flagId){
			GuiGetPos( fX,fY,fW,fH, flagId )
			fx := fx + caret_flag_margin

			; MsgBox("flag_x : " fx)
			; MsgBox("current_x : " current_x)
			; MsgBox("flag_y : " fy)
			; MsgBox("current_y : " current_y)


			if(fX > current_x OR fy > current_y){
				; MsgBox("1. BACKSPACE / 현재 flag 가 오른쪽으로 떨어져있다.")
				SplashImageGUI()
			} else if (fX <= current_x){
				; MsgBox("2. BACKSPACE / 현재 flag가 왼쪽에 있거나 같다.")
			}
	}

}



removeSelectingAndCompareFlagForTyping(){

	sleep caretChangeDelay

	if(flagId){
			GuiGetPos( fX,fY,fW,fH, flagId )
			fx := fx + caret_flag_margin

			; MsgBox("current_x : " current_x)
			; MsgBox("fx : " fx)


			/*
			 keyCount로 할경우 1이 건너뛰어지는 현상이 있어서
			 keyTyping 으로 처리했으며, keyTyping := True를 다음에 주어서 딱한번만 반응하게 함
			*/
			if(!keyTyping){
				; MsgBox("SUCCEED")
				if(fX > current_x OR fy > current_y){
					; MsgBox("1. 현재 flag 가 오른쪽으로 떨어져있다. :: 선택상태 - 삭제")

					/*
					initInstantCaret을 사용할 경우 내부에 keyTyping := False가있어서
					피하기 위해 splash를 사용함
					*/
					caret.detect()
					SplashImageGUI()


				} else if (fX <= current_x){
					; MsgBox("2. 현재 flag가 왼쪽에 있거나 같다. :: 일반상태 - 무시")
				}

			} else {
				; MsgBox("FAIL BUT OKAY")
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

	res := current_y-prev_y

	; MsgBox("res : " res)
	; MsgBox("res/abs : " Abs(res) )
	if( Abs(res) > 1 ){
		; MsgBox("1. 오차 1보다 크다..")
		return True

	}



}






isExeSearchingLateCaret(){

	WinGet, cur_exe, ProcessName, A
	arr := ["WINWORD.EXE","POWERPNT.EXE"]
	; MsgBox("cur_exe : " cur_exe)

	if( hasValue(arr, cur_exe) ) {
		return true
	}

}




detectPowerpointCaretW( exe ){


	if( exe = "POWERPNT.EXE" ){
		try{
			ppt := ComObjActive("PowerPoint.application")
			pptType := ppt.ActiveWindow.Selection.Type
			if(pptType != 3){
				current_w := 0
			}
		}
	}

}




RemoveToolTip:
ToolTip
return




























