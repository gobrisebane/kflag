

initImgCaret(){


		initKey()
		MsgBox("***************** INIT CALLED")





		loop 5 {




			; DllCall("QueryPerformanceFrequency", "Int64*", freq)
			; DllCall("QueryPerformanceCounter", "Int64*", CounterBefore)


			caret.detect()
			MsgBox("initImgCaret() :: X : " current_x " / Y : " current_y " / W : " current_w " / H " current_h)


			; DllCall("QueryPerformanceCounter", "Int64*", CounterAfter)
			; MsgBox("Elapsed QPC time is "(CounterAfter - CounterBefore) / freq * 1000 " ms")



			if( current_w > 0 ){
				SplashImageGUI()
			} else if( current_w = 0 ){
				hideSplashGUI()
			}


			sleep 100
		}


		/*
		if(initClickCount > 0){
			; MsgBox("::::::::::: REVIVE :::::::::::")
			initImgCaret()
		}
		*/

}


















searchingLateCaret(loopCount){

		initKey()



		; MsgBox("=== LOOP START ===")

		loop, %loopCount% {



			; DllCall("QueryPerformanceFrequency", "Int64*", freq)
			; DllCall("QueryPerformanceCounter", "Int64*", CounterBefore)

			caret.detect()




			; MsgBox("INDEX : " A_Index)
			timeRecord("searchingLateCaret - 2 / Loop i : " A_Index)
			; MsgBox("LateCaret INDEX : " A_Index " X : " x " / Y : " y " / W : " w " / H " h)




			if(keyTyping = True){
				; MsgBox("===DETECT KEYTYPING SO STOP LOOP===")
				keyTyping := False
				break
			}


			if( current_w != 0 ){
				SplashImageGUI()
			} else if(current_w = 0){
				; 1)이쪽에 넣지 않으면 url->네이버->검색창 이동 때 반짝임 현상 있음
				; 2)네이버 -> 구글 이동시 없어지므로 break걸면 안됨
				hideSplashGUI()
			}


			; DllCall("QueryPerformanceCounter", "Int64*", CounterAfter)
			; MsgBox("Elapsed QPC time is "(CounterAfter - CounterBefore) / freq * 1000 " ms")


			Sleep 50
		}


	if(initClickCount > 0){
		; MsgBox("::::::::::: REVIVE :::::::::::")
		searchingLateCaret(loopCount)
	}



 }





initInstantCaret(){


	; MsgBox("*************** CALLING INITIMGINSTANT *****************")
	timeRecord("initInstantCaret()-1 START")





	; DllCall("QueryPerformanceFrequency", "Int64*", freq)
	; DllCall("QueryPerformanceCounter", "Int64*", CounterBefore)

	caret.detect()






	if(current_w > 0){
		timeRecord("initInstantCaret()-1-1 (W>0) / SplashImageGUI() w : " w)
		; MsgBox("INSTANT-1-WORKS")
		SplashImageGUI()
	} else {
		timeRecord("initInstantCaret()-1-1 (W<1) / hideSplashGUI() w : " w)
		; MsgBox("INSTANT-2-HIDE")
		hideSplashGUI()
	}


	; DllCall("QueryPerformanceCounter", "Int64*", CounterAfter)
	; MsgBox("Elapsed QPC time is "(CounterAfter - CounterBefore) / freq * 1000 " ms")




	; timeRecord("initInstantCaret()-2 DONE")

}





initKey(){
		keyTyping := False


		/*
		이것 누락시
		크롬시동 -> url 클릭 -> www.naver.com 타이핑 -> 엔터클릭 = 네이버 검색창에 플래그 안뜸
		*/
		initClickCount := 0
		keyCount := 0
}






