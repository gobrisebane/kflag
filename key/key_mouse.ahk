









~LButton up::

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
		initImgCaret()
	}



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

