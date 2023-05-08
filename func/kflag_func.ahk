



initKflag(){

	timeRecord("=====START KFLAG=====")

	initImg()
	caret := new Caret()
	type := new Type()



	sleep 500
	SetTimer, debugWindow, 200


}




initImg(){


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




}








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







identifyBackspaceCaret(){

	; sleep caretChangeDelay
	sleep 100
	;이쪽에 딜레이가 있어야 아래에서 업데이트된 current_ 값을 받는다.


	caret.detect()

	if(current_w > 0){

		; MsgBox("1 . w > 0 ")
		detectRightOrBottomFlagAndCorrect()

	} else if(current_w = 0) {
		; MsgBox("1 . w = 0 ")
		initImgCaret()
		; 크롬에서 백스페이스 했을 때 작동한다.
	}

}


detectRightOrBottomFlagAndCorrect(){
	if(flagId){
			GuiGetPos( fX,fY,fW,fH, flagId )
			; fx := fx + caret_flag_margin
			fx := fx - 6 ; 6-7-8 이 이상적임
			; fx := fx + 8 ;
			; fx := fx ;

			if(fX > current_x OR fy > current_y){

				MsgBox("1. BACKSPACE / 현재 flag 가 오른쪽으로 떨어져있다.")
				SplashImageGUI()
				; initInstantCaret()

			} else if (fX <= current_x){
				MsgBox("2. BACKSPACE / 현재 flag가 왼쪽에 있거나 같다.")

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







newSplash2(){

	sleep 10
	caret.detect()
	SplashImageGUI()
	MsgBox("1.X : " current_x " / Y : " current_y)


	sleep 350
	caret.detect()

	MsgBox("a_thishotkey : " a_thishotkey)


	if(a_thishotkey = "~Up up"
	OR a_thishotkey = "~Down up"
	OR a_thishotkey = "~Down"
	OR a_thishotkey = "~Up"){

		MsgBox("1. arrow key")
		SplashImageGUI()

	} else {

		MsgBox("2. typing.. do not set..")
		Gui, XPT10:Show, y%current_y% NoActivate
		; Gui, XPT10:Show, x%current_x% y%current_y% NoActivate
		; SplashImageGUI()
	}

}



newSplash12(){

	sleep 10
	caret.detect()
	SplashImageGUI()
	MsgBox("1.X : " current_x " / Y : " current_y)

	sleep 350

	caret.detect()
	MsgBox("2.X : " current_x " / Y : " current_y)

	if(current_x != prev_x or current_y != prev_y){
		MsgBox("2-1.value diff")
		SplashImageGUI()
	} else {
		MsgBox("2-2.same value do nothing")
	}

}


newSplash1(){

	sleep 10
	caret.detect()
	SplashImageGUI()
	MsgBox("1.X : " current_x " / Y : " current_y)

	sleep 350

	caret.detect()
	MsgBox("2.X : " current_x " / Y : " current_y)
	SplashImageGUI()

}










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







splash3(){

	MsgBox(">>>>>>>>>>>>>>>>>>>>>START>>>>>>>>>>>>>..")
	Loop 10{

		caret.detect()

		SplashImageGUI("arrow")

	}


}





splash2(){

	MsgBox(">>>>>>>>>>>>>>>>>>>>>START>>>>>>>>>>>>>..")
	loopSleep := 10

	sleep 150

	Loop 20{

		caret.detect()
		MsgBox("pX : " prev_x " / Y : " prev_y)
		MsgBox("cX : " current_x " / Y : " current_y)
		MsgBox("3-loopSleep : " loopSleep)

		if(prev_x != current_x OR prev_y != current_y){

			SplashImageGUI("arrow")
			MsgBox("====SAME=====")
			; break
		}

		loopSleep := 3 * A_index

		sleep loopSleep
	}
}







splash1(){
	loop 20{

		MsgBox("L2OOP WORKS")


		if(a_thishotkey = "~Up up"
			OR a_thishotkey = "~Down up"
			OR a_thishotkey = "~Down"
			OR a_thishotkey = "~Up"){

			caret.detect()
			SplashImageGUI()

		}

		sleep 20

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



correctFlagAndCaretXY3(loopCount:=5){


	/*
	1) 만약 현재 키가 qwe 가 아니라면

	2) 플래그를 이동하라
	*/


	sleep 50
	; sleep 100

	loop %loopCount%{

		caret.detect()
		GuiGetPos( fX,fY,fW,fH, flagId )



		MsgBox("A_Thishotkey : " A_Thishotkey)

		if(A_Thishotkey = "~Down"
			OR A_Thishotkey = "~Down Up"
		   OR A_Thishotkey = "~Up"
			OR A_Thishotkey = "~Up up"){

				MsgBox("1. move only arrow..")
				arrow_x := Current_x
				arrow_y := Current_y
				SplashImageGUI()

		} else {

				Current_x := arrow_x
				Current_y := arrow_y

				SplashImageGUI()
				MsgBox("2. typingkey right?")
				break
		}





		MsgBox("arrow_x : " arrow_x)
		MsgBox("arrow_y : " arrow_y)


		; MsgBox("loopindex " a_index)
		; MsgBox("A_Thishotkey : " A_Thishotkey)

		; MsgBox("Current_x : " Current_x " / Current_y : " Current_y)
		; MsgBox("fX : " fX " / fY : " fY)



		; if(current_x = fX AND current_y = fY){
		; 	MsgBox("THEY MATCH..")
		; 	break
		; }

		; if(keyTyping){
		; 	MsgBox("break")
		; 	break
		; }


		; if( (fX != current_x OR fY != current_y) AND A_Thishotkey = "~Down up") {
		; 	MsgBox("1 -----. not correcting.. coreecting new")
		; 	SplashImageGUI()
		; }


		sleep 15

	}
}






correctFlagAndCaretXY2(loopCount:=5){


	/*
	1) 만약 현재 키가 qwe 가 아니라면

	2) 플래그를 이동하라
	*/


	sleep 50
	; sleep 100

	loop %loopCount%{
		caret.detect()
		GuiGetPos( fX,fY,fW,fH, flagId )



		if(A_Thishotkey = "~Down"
			OR A_Thishotkey = "~Down Up"
		   OR A_Thishotkey = "~Up"
			OR A_Thishotkey = "~Up up"){

				MsgBox("move only arrow..")

			SplashImageGUI()
		}


		; MsgBox("loopindex " a_index)
		; MsgBox("A_Thishotkey : " A_Thishotkey)

		MsgBox("Current_x : " Current_x " / Current_y : " Current_y)
		MsgBox("fX : " fX " / fY : " fY)

		if(current_x = fX AND current_y = fY){
			MsgBox("THEY MATCH..")
			break
		}

		; if(keyTyping){
		; 	MsgBox("break")
		; 	break
		; }


		; if( (fX != current_x OR fY != current_y) AND A_Thishotkey = "~Down up") {
		; 	MsgBox("1 -----. not correcting.. coreecting new")
		; 	SplashImageGUI()
		; }


		sleep 15

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
























correctFlagAfterSelectRemove(){
	sleep caretChangeDelay
	if( !keyTyping ){
		if(flagId){
			GuiGetPos( fX,fY,fW,fH, flagId )
			fx := fx + 1
			;엔터의 경우 마진(1)을 붙여야 같은자리에서 인식하고 이동한다.

			caret.detect()
				if(fX > current_x OR fy > current_y){
					; MsgBox("1. 현재 flag 가 오른쪽으로 떨어져있다. :: 선택상태 - 삭제")
					/*
					1. 엔터의 경우 여기서 init로 새로 값을 받아줘야 계속 엔터를 쳐도 업데이트된다.
					*/
					; caret.detect()
					; initInstantCaret()
					SplashImageGUI()

				} else if (fX <= current_x){
					; MsgBox("2. 현재 flag가 왼쪽에 있거나 같다. :: 일반상태 - 무시")
				}
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


































