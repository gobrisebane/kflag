









~LButton up::





		;플래그가 활성 된 창을 드래그 후 놓았을 때 이게 있어야 따라간다.
		initInstantCaret()








return










~LButton::
~!LButton::







	MsgBox("------CLICK START------")
	timeRecord("1-LBUTTON")
	timeRecordCurrentProgram()



	WinGet, cur_exe, ProcessName, A

	if( isExeSearchingLateCaret(cur_exe) ){

		MsgBox("1.")
		searchingLateCaret(10)

	} else if( cur_exe = "Explorer.EXE" OR cur_exe = ""){


		MsgBox("2.current exe are explorer")
		searchingLateCaret(10)



	} else {



		MsgBox("3.")

		; 클릭때 loop이 필요한이유는, gcal의 팝업같은 경우 필요하기 때문이다.

		; tempoff
		; initImgCaret()


		; initInstantCaret()
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

