


~^l::
~LWin::
~RWin::


	initImgCaret()


return





~^x::
~^v::

	sleep caretChangeDelay
	;삭제후 딜레이가 있는데 80은 줘야한다.


	initInstantCaret()

return




~^z::
~^y::
~^+z::


return



~^z up::
~^y up::
~^+z up::

		KeyTyping := False



		sleep caretChangeDelay
		initInstantCaret()

return










~^1::
~^2::
~^3::
~^4::
~^5::
~^6::
~^7::
~^8::
~^9::
~^PgUp::
~^PgDn::
~^Tab::
~^+Tab::




	if(isBrowser()){
		searchingLateCaret(10)
	}



return




~^w::
~^F4::
~!Home::
~!Left::
~!Right::



	if(isBrowser()){
		initImgCaret()
	}

return






~^+t::

	if(isBrowser()){
		searchingLateCaret(20)
	}

return




~^t::

	initImgCaret()

return





~^f::

	initInstantCaret()

return







~~::
~`::
~1::
~2::
~3::
~4::
~5::
~6::
~7::
~8::
~9::
~0::
~-::
~=::
~q::
~w::
~e::
~r::
~t::
~y::
~u::
~i::
~o::
~p::
~[::
~]::
~\::
~a::
~s::
~d::
~f::
~g::
~h::
~j::
~k::
~l::
~;::
~'::
~z::
~x::
~c::
~v::
~b::
~n::
~m::
~,::
~.::
~/::
~+~::
~+`::
~+1::
~+2::
~+3::
~+4::
~+5::
~+6::
~+7::
~+8::
~+9::
~+0::
~+-::
~+=::
~+q::
~+w::
~+e::
~+r::
~+t::
~+y::
~+u::
~+i::
~+o::
~+p::
~+[::
~+]::
~+\::
~+a::
~+s::
~+d::
~+f::
~+g::
~+h::
~+j::
~+k::
~+l::
~+;::
~+'::
~+z::
~+x::
~+c::
~+v::
~+b::
~+n::
~+m::
~+,::
~+.::
~+/::

	keyTyping := True


	spaceCount := 0

	lastKeyTypingSec := 0

	; detectingCaretYPosChange()

	; removeSelectingAndCompareFlagForTyping()

	; dumbass3()

	; removeSelctionForKey()



	dumbass4()

return









dumbass4(){

	; sleep caretChangeDelay

	dumbCount++
	sleep 50
	caret.detect()


	; MsgBox("DUMBCOUNT START")
	; MsgBox("A_PriorHotKey : " A_PriorHotKey)


	if(dumbCount=1){


		arr := ["Enter","Space","BackSpace","Del","^","button"]
		if( !isStringInArray(A_PriorHotKey, arr) ){

			; MsgBox("!!! MUST ONLY ONE WORKS !!!")


			if(flagId){

				GuiGetPos( fX,fY,fW,fH, flagId )

				; MsgBox("caret_flag_margin : " caret_flag_margin)

				fx := fx + caret_flag_margin
				; fx := fx + 5
				; fx := fx
				; MsgBox("current_x : " current_x)
				; MsgBox("fx : " fx)



					; caret.detect()

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
			}
		}
	}




	if( isCurrentYandPrevYDiffer() ){
		initInstantCaret()
	}


}




























removeSelctionForKey(){

	arr := ["Enter"]
	if( !isStringInArray(A_PriorHotKey, arr) ){


		MsgBox("it is not by enter")


	}
	; MsgBox("if this key is possed by enter, etc..")
}



delDetector(){

	if(flagId){

			GuiGetPos( fX,fY,fW,fH, flagId )

			; MsgBox("caret_flag_margin : " caret_flag_margin)

			fx := fx + caret_flag_margin
			; fx := fx + 5
			; fx := fx
			MsgBox("current_x : " current_x)
			MsgBox("fx : " fx)


			/*
			 keyCount로 할경우 1이 건너뛰어지는 현상이 있어서
			 keyTyping 으로 처리했으며, keyTyping := True를 다음에 주어서 딱한번만 반응하게 함
			*/

				; caret.detect()

				if(fX > current_x OR fy > current_y){
					MsgBox("1. 현재 flag 가 오른쪽으로 떨어져있다. :: 선택상태 - 삭제")

					/*
					initInstantCaret을 사용할 경우 내부에 keyTyping := False가있어서
					피하기 위해 splash를 사용함
					*/


					caret.detect()
					SplashImageGUI()



				} else if (fX <= current_x){

					MsgBox("2. 현재 flag가 왼쪽에 있거나 같다. :: 일반상태 - 무시")

				}
		}




}






delDetector2(){



	; sleep caretChangeDelay

	; sleep 70


	caret.detect()

		MsgBox("current_x : " current_x " / current_y : " current_y)
		MsgBox("min_x : " min_x " / min_y : " min_y)



			if( !min_x OR !min_y ){

					MsgBox("1. minx doesnt exist so insert-- ")

					loop 30{


						caret.detect()

						if(!prev_comp_x OR !prev_comp_y){
								MsgBox("1. prev comp x-y make")
								prev_comp_x := current_x
								prev_comp_y := current_y
						}

						MsgBox("prev_comp_x : " prev_comp_x " / prev_comp_y : " prev_comp_y)



						if(current_x <= prev_comp_x OR current_y <= prev_comp_y){
								min_x := prev_comp_x
								min_y := prev_comp_y

								; MsgBox("2-1. minx update works?")
								current_x := min_x
								current_y := min_y
								SplashImageGUI()
						}
						; MsgBox("current_x : " current_x " / current_y : " current_y)


						prev_comp_x := current_x
						prev_comp_y := current_y

						sleep 1
					}


				/*
					min_x := current_x
					min_y := current_y

					current_x := min_x
					current_y := min_y
					SplashImageGUI()
 				*/



				} else {


					sleep 70



					MsgBox("2. minx exist exist")
					MsgBox("current_x : " current_x)
					MsgBox("current_y : " current_y)

					; if(current_x <= min_x OR current_y <= min_y){
					; 		MsgBox("2-1. minx update works?")
					; 		current_x := min_x
					; 		current_y := min_y
					; 		SplashImageGUI()
					; }

					; if(current_x >= min_x){
					; 		MsgBox("2-1. minx update works?")
					; 		current_x := min_x
					; 		SplashImageGUI()
					; }

					; if(current_y >= min_y){
					; 		MsgBox("2-2. miny update works?")
					; 		current_y := min_y
					; 		SplashImageGUI()
					; }

	}
}




dumbassOlympic3(){

	; sleep caretChangeDelay
	sleep 70


	caret.detect()

	; MsgBox("current_x : " current_x)
	; MsgBox("current_y : " current_y)
	MsgBox("min_x : " min_x)
	MsgBox("min_y : " min_y)

	if( !min_x OR !min_y ){

		min_x := current_x
		min_y := current_y

		MsgBox("1. minx doesnt exist so insert")

		current_x := min_x
		current_y := min_y
		SplashImageGUI()


	} else {

		MsgBox("2. minx exist exist")
		MsgBox("current_x : " current_x)
		MsgBox("current_y : " current_y)

		; if(current_x <= min_x OR current_y <= min_y){
		; 		MsgBox("2-1. minx update works?")
		; 		current_x := min_x
		; 		current_y := min_y
		; 		SplashImageGUI()
		; }


		if(current_x >= min_x){
				MsgBox("2-1. minx update works?")
				current_x := min_x
				SplashImageGUI()
		}

		if(current_y >= min_y){
				MsgBox("2-2. miny update works?")
				current_y := min_y
				SplashImageGUI()
		}


	}


}




















dumbassOlympic2(){

	; MsgBox("hello dumbalss works..")
	; sleep caretChangeDelay
	sleep 70
	; dumbCount++


	/*
	idea )
	1) 타이핑을 시작하면 min값을 저장한다..
	2) 그냥 계속 min값에만 쏜다.
	3) init3형제 할때 해제해준다. (스위치)
	4) 다시 타이핑을 시작하면 min값을 저장하낟.
	*/

	caret.detect()

	; MsgBox("current_x : " current_x)
	; MsgBox("current_y : " current_y)

	MsgBox("min_x : " min_x)
	MsgBox("min_y : " min_y)

	if( !min_x OR !min_y ){

		min_x := current_x
		min_y := current_y

		MsgBox("1. minx doesnt exist so insert")

		current_x := min_x
		current_y := min_y
		SplashImageGUI()


	} else {

		MsgBox("2. minx exist exist")

		MsgBox("current_x : " current_x)
		MsgBox("current_y : " current_y)

		if(current_x <= min_x OR current_y <= min_y){

				MsgBox("2-1. minx update works?")
				; min_x := current_x
				; min_y := current_y
				current_x := min_x
				current_y := min_y
				SplashImageGUI()

		}
	}




; if(current_x =< min_x OR current_y =< min_y){

		; MsgBox("change")
		; current_x := min_x
		; current_y := min_y
		; SplashImageGUI()

; }



	; if(current_x != min_x OR current_y != min_y){
	; 	MsgBox("no flickering please")
	; 	SplashImageGUI()
	; }

	; current_x := min_x
	; current_y := min_y
	; SplashImageGUI()
}



















dumbass3(){

	; MsgBox("hello dumbalss works..")
	; sleep caretChangeDelay
	; sleep 50

	dumbCount++

	caret.detect()

	if(dumbCount=1){

		MsgBox("!!! DUMWORKS !!!")
		if(flagId){

			GuiGetPos( fX,fY,fW,fH, flagId )
			; MsgBox("caret_flag_margin : " caret_flag_margin)

			fx := fx + caret_flag_margin
			; fx := fx + 5
			; fx := fx
			MsgBox("current_x : " current_x)
			MsgBox("fx : " fx)


			/*
			 keyCount로 할경우 1이 건너뛰어지는 현상이 있어서
			 keyTyping 으로 처리했으며, keyTyping := True를 다음에 주어서 딱한번만 반응하게 함
			*/

			MsgBox("--olympic start--")
			MsgBox("A_thishotkey : " A_thishotkey)
			loop 10{
				caret.detect()
				MsgBox("current_x : " current_x)

			}

		}

		MsgBox("dumbcount reach 0")
	}




	if( isCurrentYandPrevYDiffer() ){
		initInstantCaret()
	}
}



dumbass2(){

	; MsgBox("hello dumbalss works..")
	; sleep caretChangeDelay
	sleep 50

	dumbCount++

	caret.detect()


	MsgBox("DUMBCOUNT START")

	if(dumbCount=1){

		MsgBox("!!! MUST ONLY ONE WORKS !!!")
		if(flagId){

			GuiGetPos( fX,fY,fW,fH, flagId )

			; MsgBox("caret_flag_margin : " caret_flag_margin)

			fx := fx + caret_flag_margin
			; fx := fx + 5
			; fx := fx
			MsgBox("current_x : " current_x)
			MsgBox("fx : " fx)


			/*
			 keyCount로 할경우 1이 건너뛰어지는 현상이 있어서
			 keyTyping 으로 처리했으며, keyTyping := True를 다음에 주어서 딱한번만 반응하게 함
			*/

				; caret.detect()

				if(fX > current_x OR fy > current_y){
					MsgBox("1. 현재 flag 가 오른쪽으로 떨어져있다. :: 선택상태 - 삭제")

					/*
					initInstantCaret을 사용할 경우 내부에 keyTyping := False가있어서
					피하기 위해 splash를 사용함
					*/


					caret.detect()
					SplashImageGUI()


				} else if (fX <= current_x){

					MsgBox("2. 현재 flag가 왼쪽에 있거나 같다. :: 일반상태 - 무시")

				}
		}

		MsgBox("dumbcount reach 0")
	}




	if( isCurrentYandPrevYDiffer() ){
		initInstantCaret()
	}


}





































