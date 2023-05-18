




SplashImageGUI(mode:="default"){





	drawFlag()



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
	; prev_winid := current_winid


}














drawFlag(){

	; MsgBox("-----------draw flag--------")


	updateSplashImage()



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

					; timeRecord("drawFlag() - 1-3 / Else : XPT10 exist'")
					; MsgBox("drawFlag() - 1-3 / Else : XPT10 exist")



					changeLangFlag()





			}


	} Else {

		timeRecord("SplashImageGUI - 2-2 / else")
		; MsgBox("SplashImageGUI - 2-2 / else")
		initFlag()

	}







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










updateSplashImage(){
	; MsgBox("----------updateSplashImage works.. CHANGE - 1")

	ime_status := % IME_CHECK("A")
	if(ime_status = "0"){

		GetKeyState, caps_state, CapsLock, T
		; MsgBox("UPDATE : CURRENT : ENG(0)")

		if(caps_state = "D"){
				SplashImage = %folderpath%\flag_eng_up.png
				timeRecord("SplashImageGUI - 1-1 / D")
		} else if(caps_state = "U"){
				SplashImage = %folderpath%\flag_eng_lo.png
				timeRecord("SplashImageGUI - 1-2 / U")
		}
		; MsgBox("---IME STATUS : ENG")

	} else if(ime_status = "1") {
		; MsgBox("UPDATE : CURRENT : KOR(1)")

		SplashImage = %folderpath%\flag_kor.png
		timeRecord("SplashImageGUI - 1-3 / else")
	}


}




swapLangImage(){


		ime_status := % IME_CHECK("A")
		if(ime_status = "0"){

			; MsgBox("UPDATE(2) : CURRENT : ENG(0)")
			GetKeyState, caps_state, CapsLock, T

			if(caps_state = "D"){
					SplashImage = %folderpath%\flag_eng_up.png
					timeRecord("SplashImageGUI - 1-1 / D")
					; MsgBox("1-1 / eng_up")
			} else if(caps_state = "U"){
					SplashImage = %folderpath%\flag_eng_lo.png
					timeRecord("SplashImageGUI - 1-2 / U")
					; MsgBox("1-2 / eng_lo")
			}

		} else if(ime_status = "1") {

			; MsgBox("UPDATE(2) : CURRENT : KOR(1)")
			SplashImage = %folderpath%\flag_kor.png

		}


		changeLangFlag()

}









changeLangFlag(){
	GuiControl,XPT10:, FlagApp, %SplashImage%
	Gui, XPT10:+AlwaysOnTop

}










setCapslockSplashImage(){
	GetKeyState, caps_state, CapsLock, T
	if(caps_state = "D"){
		SplashImage = %folderpath%\flag_eng_up.png
	} else if(caps_state = "U"){
		SplashImage = %folderpath%\flag_eng_lo.png
	}
}


swapCapslockImage(){
	setCapslockSplashImage()
	drawFlag()
}











