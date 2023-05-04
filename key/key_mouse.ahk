









~LButton up::





		;플래그가 활성 된 창을 드래그 후 놓았을 때 이게 있어야 따라간다.
		initInstantCaret()








return










~LButton::
~!LButton::







	MsgBox("------CLICK START------")
	timeRecord("1-LBUTTON")
	timeRecordCurrentProgram()





	if( isExeSearchingLateCaret() ){
		searchingLateCaret(10)
	} else {
		; initImgCaret()
		initInstantCaret()
	}




	; WinGet, cur_exe, ProcessName, A
	; MsgBox("cur_exe : " cur_exe)








	captureStartingPointOfDrag()





return

















~+LButton::
~MButton::
~XButton1::
~XButton2::

		initImgCaret()

return






/*



~Wheelup::
~Wheeldown::

		HideSplashGUI()
		Sleep 50
		initImgCaret()

return

 */

