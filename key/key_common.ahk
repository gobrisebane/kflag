

~^l::
~LWin::
~RWin::


	initImgCaret()


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





	spaceCount := 0
	lastKeyTypingSec := 0


	detectingCaretYPosChange()



	removeSelectingAndCompareFlagForTyping()


	keyTyping := True











	; MsgBox("-->")
	; MsgBox("A_ThisHotKey : " A_ThisHotKey)


	keyCount++
	; MsgBox("keyCount : " keyCount)




	if(keyCount = 1 ){
		; fix_X := prev_x
		; fix_Y := prev_y

		fix_X := Current_X
		fix_Y := Current_Y

	}

	; Current_X := fix_X
	; Current_Y := fix_Y
	; SplashImageGUI()


	/*
	hello hello
	hello
	hello world
	this
	*/

	; correctFlagAfterSelectionRemove()
	; correctFlagAfterSelectionRemoveForTyping()

return






correctFlagAfterSelectionRemove4(){

	; 해당 함수는, block 지정 후 삭제시 딜레이가 있기때문에 한번더 correct를 해준다
	keyCount++

	; MsgBox("keyCount : " keyCount)

	if(keyCount = 1){
		correntFlagAndCaretXY(1)
	}


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


correctFlagAfterSelectionRemoveForTyping(){


	;이건 그냥 테스트용으로 가져온것

		; sleep 25

		keyCount++

		MsgBox("keyCount : " keyCount)


		if( keyCount = 1 ){
			MsgBox("hello one keycound")
		}



		; keyCount++
		; MsgBox("keyCount : " keyCount)

		; if( keyCount = 1 ){
		; 	loop 20{
		; 		caret.detect()
		; 		if(prev_x != current_x OR prev_y != current_y){

		; 			; MsgBox("1. 이전과 현재가 다른경우다.. 이경우에는 바로 업데이트")
		; 			SplashImageGUI()
		; 			break

		; 		} else if(prev_x = current_x AND prev_y = current_y){

		; 			; MsgBox("2. 이전과 현재가 같은 경우다. 이경우에는 룹을 돌려야한다.")
		; 			caret.detect()
		; 			SplashImageGUI()c
		; 			break
		; 		}
		; 		sleep 10
		; 	}
		; }


}





































