

initImgCaret(){


		initKey()

		keyCount := 0
		; MsgBox("***************** INIT CALLED")


		; loop 5 {
		loop 10 {



			; MsgBox("initImgCaret() :: X : " current_x " / Y : " current_y " / W : " current_w " / H " current_h)



			caret.detect()

			if( keyTyping ) {
				; MsgBox("TYPING so break")
				break
			}





			/*
			 A_ThisHotKey는 처음시작할때 등록되면 계속 같은 값을 가진다.
			 최소한 A_thishotkey가 qwerty 가 아닐때만 작동하게 할 수 있다.
			*/


			if( current_w > 0  ){
				SplashImageGUI()
			} else if( current_w = 0 ){
				hideSplashGUI()
			}



			sleep 150

		}




		; if(clickCount > 0){
		; 	; MsgBox("::::::::::: REVIVE :::::::::::")
		; 	initImgCaret()
		; }


}








searchingLateCaret(loopCount){

		initKey()

		keyCount := 0


		; MsgBox("=== LOOP START ===")

		loop, %loopCount% {


			caret.detect()


			; MsgBox("LateCaret INDEX : " A_Index " X : " current_x " / Y : " current_y " / W : " current_w " / H " current_h)




			; MsgBox("A_ThisHotKey : " A_ThisHotKey)

			; arr := ["Button"]
			; if( !isStringInArray(A_ThisHotKey, arr) ){
			; 	break
			; }

			if(keyTyping = True){
				; MsgBox("===DETECT KEYTYPING SO STOP LOOP===")
				keyTyping := False
				break
			}





			if( current_w != 0 ){

				SplashImageGUI()

				flag.show()


			} else if(current_w = 0){
				; 1)이쪽에 넣지 않으면 url->네이버->검색창 이동 때 반짝임 현상 있음
				; 2)네이버 -> 구글 이동시 없어지므로 break걸면 안됨
				hideSplashGUI()
			}




			if(A_index >= 3){
				/*
					처음과 두번째 LOOP 때 잡으면 버튼이 홀드로 잡혀있으므로 3번째부터 홀드인지 아닌지 감지
					위와 같이 안하면 처음 시작하자마자 더블클릭으로 감지한다
				*/
				if GetKeyState("LButton", "P"){
					clickCount++
				}
			}


			Sleep 50


		}


	if(clickCount > 0){
		; MsgBox("::::::::::: REVIVE :::::::::::")
		clickCount := 0
		searchingLateCaret(loopCount)
	}



 }





initInstantCaret(){




	; keyCount := 0
	; initKey()

	keyTyping := False



	; MsgBox("*************** CALLING INITIMGINSTANT *****************")
	; timeRecord("initInstantCaret()-1 START")





	caret.detect()

	; MsgBox("X : " current_x " / Y : " current_y " / W : " current_w " / H : " current_h)



	if(current_w > 0 ){
		timeRecord("initInstantCaret()-1-1 (W>0) / SplashImageGUI() w : " w)

		; MsgBox("INSTANT-1-WORKS")
		; SplashImageGUI()
		flag.Show()


	} else {
		timeRecord("initInstantCaret()-1-1 (W<1) / hideSplashGUI() w : " w)
		; MsgBox("INSTANT-2-HIDE")
		hideSplashGUI()
	}






	; timeRecord("initInstantCaret()-2 DONE")

}






initKey(){





	keyTyping := False
		/*
		이것 누락시
		크롬시동 -> url 클릭 -> www.naver.com 타이핑 -> 엔터클릭 = 네이버 검색창에 플래그 안뜸
		*/




}






