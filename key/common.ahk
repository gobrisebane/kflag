


~^z::
~^y::
~^+z::


return



~^z up::
~^y up::
~^+z up::

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

	keyTyping := True



	detectingCaretYPosChange()



	; correctFlagAfterSelectionRemoveForTyping()

	detectXYChange()

return


detectXYChange(){


	MsgBox("hello im changeing just xy detecting..")



	MsgBox("prev :: X : " prev_x " / Y : " prev_y)
	MsgBox("before :: X : " current_x " / Y : " current_y " / W : " current_w " / H " current_h)



	if(prev_x > x){


		MsgBox("a1")
				MsgBox("한글2")
		MsgBox("a2")
		; MsgBox("1.이전 위치가 우측에 있음 / 현재 select로 삭제하면서 타이핑한것임.")


	} else if(prev_x <= x) {
		; MsgBox("2.이전위치가 좌측이이거나 같음.. 이것은 일반적인 타이핑이므로 무시")
	}




	; loop 20{
	; 	caret.detect()
	; 	MsgBox("after :: X : " current_x " / Y : " current_y " / W : " current_w " / H " current_h)
	; 	sleep 100
	; }

}


