




SplashImageGUI(mode:="default"){
	;현재 가장 안정적인 모델
	CoordMode, ToolTip


	drawFlag()

	; MsgBox("!SPLASH CALLED")


	Try {

		; timeRecord("SplashImageGUI - 3 / cx : " current_x  " cy : " current_y )
		; MsgBox("SplashImageGUI - 3 / cx : " current_x  " cy : " current_y )


		if(current_x AND current_y){


			if(mode="only_y"){
				Gui, XPT10:Show, y%current_y% NoActivate
			} else {
				Gui, XPT10:Show, x%current_x% y%current_y% NoActivate
			}


		} else {

			timeRecord("!! === CRITICAL ERROR-4 : current_X,current_Y LOST === !!")
			MsgBox("!! === CRITICAL ERROR-4 : current_X,current_Y LOST === !!")

		}

	} catch e {


		timeRecord("!! === CRITICAL ERROR-3 : Lost X Y value ")
		timeRecord("!! === e.what : " e.what " / e.message : " e.message " / e.extra : " e.extra)
		MsgBox("e.what : " e.what)
		MsgBox("e.message : " e.message)
		MsgBox("e.extra : " e.extra)
		throw e

	}



	prev_exe := current_exe
	prev_winid := current_winid


}














drawFlag(){

	; MsgBox("-----------draw flag--------")


		updateSplashImage()


	; if(!SplashImage OR (current_exe != prev_exe) ){
	; 	; 첫 시동시에 SplashImage를 체크해줘야 맨처음 아무것도 없을 때 에러가 안 생긴다.
	; 	; (첫 시동한 상태에서는 SplashImage가 null인 상황임)
	; 	; MsgBox("1. differ program")
	; 	updateSplashImage()
	; }




	GUI, XPT10:+LastFoundExist
	If WinExist(){




			timeRecord("drawFlag() - 1 / XPT10 Exist")
			; MsgBox("drawFlag() - 1 / XPT10 Exist")

			GuiGetPos( fX,fY,fW,fH, flagId )

			timeRecord("drawFlag() / GuiGetPos / flagId : " flagId " / fX : " fX " / fY : " fY " / fW : " fW " / fH : " fH )
			; MsgBox("drawFlag() / GuiGetPos / flagId : " flagId " / fX : " fX " / fY : " fY " / fW : " fW " / fH : " fH )


			if( fW < 1 ){

				MsgBox("!! === CRITICAL ERROR IN SPLASHIMAGEUI : GuiGetPos fW return 0 === !!")
				timeRecord("!! === CRITICAL ERROR IN SPLASHIMAGEUI : GuiGetPos fW return 0 === !!")

				; 1) patch
				initFlag()

			} else if (fW != 15 OR fH != 10){


				MsgBox("!! === CRITICAL ERROR IN SPLASHIMAGEUI : GuiGetPos fW /fH not valid size === !!")
				timeRecord("!! === CRITICAL ERROR IN SPLASHIMAGEUI : GuiGetPos fW /fH not valid size === !!")

				; 2) patch
				initFlag()


			} else {

					timeRecord("drawFlag() - 1-3 / Else : XPT10 exist'")
					; MsgBox("drawFlag() - 1-3 / Else : XPT10 exist")

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




	checkLangAndCorrect()



}









changeLangFlag(){
	; MsgBox("CHANGE LANG")
	GuiControl,XPT10:, FlagApp, %SplashImage%
	Gui, XPT10:+AlwaysOnTop

}







initFlag(){



		Try {

			Gui, XPT10:Destroy

			Gui, XPT10:Margin , 0, 0
			Gui, XPT10:Add, Picture,vFlagApp, %SplashImage%
			Gui, XPT10:+LastFound -Caption +AlwaysOnTop +ToolWindow -Border
			flagId := WinExist()
			Gui, XPT10:Color, ffffff

			timeRecord("SplashImageGUI - 2-2-1 / Transparent")
			Winset, TransColor, ffffff
			WinSet, Trans, 193
			; WinSet, Trans, 179
			; WinSet, Trans, 178


		} catch e {

			timeRecord("!! === CRITICAL ERROR-4 : initFlag failure ")
			timeRecord("!! === e.what : " e.what " / e.message : " e.message " / e.extra : " e.extra)
			MsgBox("e.what : " e.what)
			MsgBox("e.message : " e.message)
			MsgBox("e.extra : " e.extra)
			throw e

		}


}


hideSplashGUI(){
	; MsgBox("hideSplashGUI CALLED")
	timeRecord("hideSplashGUI()-1 Works")
	Gui, XPT10:hide
}


destroySplashGUI(){
	;~ MsgBox("destroySplashGUI CALLED")
	timeRecord("destroySplashGUI()-1 Works")
	Gui, XPT10:Destroy
}




setPrevLang(){
	; 이전 언어를 기록해야 추후 변경할 때 체크가 가능하다.
	prev_lang := current_lang
}








updateSplashImage(){


	; sleep 1
	; MsgBox("----------updateSplashImage works.. CHANGE - 1")
	ime_status := % IME_CHECK("A")

	MsgBox("ime_status : " ime_status)
	if(ime_status = 1){
		MsgBox("KOR")
	} else {
		MsgBox("ENG")
	}


	GetKeyState, caps_state, CapsLock, T

	if(ime_status = "0"){
		if(caps_state = "D"){
				SplashImage = %folderpath%\flag_eng_up.png
				timeRecord("SplashImageGUI - 1-1 / D")
				; MsgBox("1-1 / eng_up")
		} else if(caps_state = "U"){
				SplashImage = %folderpath%\flag_eng_lo.png
				timeRecord("SplashImageGUI - 1-2 / U")
				; MsgBox("1-2 / eng_lo")
		}
		current_lang := "eng"
		; MsgBox("---IME STATUS : ENG")

	} else {

		SplashImage = %folderpath%\flag_kor.png
		timeRecord("SplashImageGUI - 1-3 / else")
		current_lang := "kor"
		; MsgBox("1-3 / kor")
	}


	; MsgBox("ime_status : " lang)
	; MsgBox("FIRST SplashImage : " SplashImage)

}





swapLangImage(){

	setPrevLang()

	; MsgBox("----------updateSplashImage works.. CHANGE- 2")

	if(current_lang){

		if(current_lang = "kor"){
			setCapslockSplashImage()
			current_lang := "eng"
		} else if(current_lang = "eng"){
			SplashImage = %folderpath%\flag_kor.png
			current_lang := "kor"
		}

		; drawFlag()
		changeLangFlag()

	} else {
		; 맨처음 초기상태에 카렛이 없는곳에서 한영키를 누를 경우
		initInstantCaret()
	}



	; checkLangAndCorrect()


}




checkLangAndCorrect(){

	if( ((IME_CHECK("A") = 1) AND current_lang = "eng")
	OR ((IME_CHECK("A") = 0) AND current_lang = "kor") ){
		MsgBox("!!!!! -----REVIVE----- !!!!!")
		swapLangImage()
	}

}






swapCapslockImage(){
	setCapslockSplashImage()
	drawFlag()
}




setCapslockSplashImage(){
	GetKeyState, caps_state, CapsLock, T
	if(caps_state = "D"){
		SplashImage = %folderpath%\flag_eng_up.png
	} else if(caps_state = "U"){
		SplashImage = %folderpath%\flag_eng_lo.png
	}
}







