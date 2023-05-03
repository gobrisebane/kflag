

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














return








































