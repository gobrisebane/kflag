class Type{





	setFlagArrowOld(){
		arr := ["Up","Down","Left","Right"]
		; if( isStringInArray(A_PriorHotKey, arr) ){
		if( isStringInArray(A_ThisHotKey, arr) ){
			MsgBox("1. arrow key")
			SplashImageGUI()
		} else {
			if( isFlagRight() ){
				MsgBox("1. flag is right")
				SplashImageGUI()
			} else {
				MsgBox("2. flag is left or same")
				SplashImageGUI("only_y")
			}
		}


	}


	setFlagArrow(){

		arr := ["Up","Down","Left","Right"]
		if( isStringInArray(A_ThisHotKey, arr) ){
			; MsgBox("1. arrow key")
			SplashImageGUI()
		} else {

			flag_direction := getFlagDirection()
			; MsgBox("flag_direction : " flag_direction)

			if( flag_direction = "right" ){

				MsgBox("1-1. flag is right")
				SplashImageGUI()
				; SplashImageGUI("only_y")

			} else if( flag_direction = "left" ) {

				; MsgBox("1-2. flag is left")
				SplashImageGUI("only_y")

			} else if(flag_direction = "center"){

				; MsgBox("1-3. flag is center")
				SplashImageGUI("only_y")

			}

		}

	}


	loopCorrectFlag(){

		; MsgBox("CLASS : --loopCorrectFlag--")


		sleep 10
		; 위에 sleep 10을 해줘야 이전x,y값을 잡는 걸 방지할 수 있음.


		caret.detect()
		this.setFlagArrow()
		; this.setFlagArrowOld()


		sleep 50
		loopSleep := 30

		loop 10{



			caret.detect()
			; MsgBox("3-loopSleep INDEX : " A_INDEX)

			this.setFlagArrow()
			; this.setFlagArrowOld()




			; arrow가 아니면 중지시킴
			arr := ["Up","Down","Left","Right"]
			if( !isStringInArray(A_ThisHotKey, arr) ){
				; MsgBox("------ not that key so brewak")
				arrowCount := 0
				break
			}


			if (GetKeyState("Down", "P")
				OR GetKeyState("Up", "P")
				OR GetKeyState("Left", "P")
				OR GetKeyState("Right", "P") ) {
				; MsgBox("arrowcount up")
				arrowCount++
			}

			loopSleep := 5 * A_index
			sleep loopSleep
		}





		if(arrowCount > 0){
			; MsgBox("::::::::::: REVIVE :::::::::::")
			arrowCount := 0
			this.loopCorrectFlag()
		}
		arrowCount := 0





	}





	newSplash(){

		MsgBox("CLASS :  -- nedSplash --")

		sleep 10
		caret.detect()
		SplashImageGUI()


		MsgBox("1.X : " current_x " / Y : " current_y)


		sleep 350
		caret.detect()



		; this.setFlagArrowOld()
		this.setFlagArrow()



	}

}

















