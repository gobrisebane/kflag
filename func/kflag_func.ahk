



initKflag(){

	timeRecord("=====START KFLAG=====")



	caret := new Caret()




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
			initInstantCaret()


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
	if(!keyTyping){
		correntFlagAndCaretXY(1)
	}

}



correctFlagAfterSelectionRemoveForTyping(){

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






detectRightOrBottomFlagAndCorrect(){

	if(flagId){
			GuiGetPos( fX,fY,fW,fH, flagId )
			fx := fx + 8

			; MsgBox("flag_x : " fx)
			; MsgBox("current_x : " current_x)
			; MsgBox("flag_y : " fy)
			; MsgBox("current_y : " current_y)


			if(fX > current_x OR fy > current_y){
				; MsgBox("1. 현재 flag 가 오른쪽으로 떨어져있다.")
				initInstantCaret()

			} else if (fX <= current_x){
				; MsgBox("2. 현재 flag가 왼쪽에 있거나 같다.")
			}




		}
}





detectingCaretYPosChange(){


	if( A_ThisHotkey != "Enter"){
		; 엔터일경우 가 되면 간섭하게 됨

		sleep caretChangeDelay
		; 딜레이를 주지 않으면 변경된 y값을 받지 못함 (y값이 업데이트 안되어 prev와 y값이 같아짐)

		caret.detect()

		; MsgBox("prev_y : " prev_y)
		; MsgBox("current_y : " current_y)

		if( current_y > prev_y ){
			initInstantCaret()
		}

	}


}






RemoveToolTip:
ToolTip
return




























