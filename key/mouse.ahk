



~LButton up::

	initClickCount++

return




~LButton::
~!LButton::



	WinGet, cur_exe, ProcessName, A
	MsgBox("------CLICK START------")
	timeRecord("1-LBUTTON")
	timeRecordCurrentProgram()


	if(cur_exe = "WINWORD.EXE" OR cur_exe = "POWERPNT.EXE"){
		searchingLateCaret(20)
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

