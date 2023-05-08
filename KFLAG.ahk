

#NoEnv
#Persistent
#SingleInstance force
#MaxHotkeysPerInterval 200




; SetTimer, caretWatcher, 10



SetDefaultMouseSpeed, 0
SendMode, Input

SetMouseDelay, 0
SetKeyDelay, 0
SetWinDelay, 0
SetControlDelay, 0

;~ SetBatchLines, 1000ms
SetBatchLines, -1



;~ Menu,Tray,NoStandard
;~ Menu,Tray,Add,&Hello,ContextMenu
;~ Menu,Tray,Add,&World,ContextMenu
;~ Menu,Tray,Add,E&xit,ContextMenu





if not A_IsAdmin {
   Run *RunAs "%A_ScriptFullPath%"
   ExitApp
}






; TEST
global keyCount
global fix_X
global fix_Y






; caret
global current_x
global current_y
global current_w
global current_h

global prev_x
global prev_y


global current_lang
global caretChangeDelay := 80



; flag
global SplashImage
global FlagApp
global picture
global flagId
global prev_exe
global current_exe
global caret_flag_margin := 8



; holder
global holdingBackSpace
global holdingEnter
global holdingArrow

global spaceCount := 0
global clickCount = 0
global enterCount := 0




; late caret
global keyTyping := False
global prev_enter_x
global prev_enter_y
global prev_box_l
global prev_box_r
global prev_box_t
global prev_box_b


global lastKeyTypingSec := 0
global typingIdleSec := 5



;img / 순서변경금지
global folderpath := A_AppData . "\TWEPO\kflag"
global imgpath_flag_eng_up := folderpath . "\flag_eng_up.png"
global imgpath_flag_eng_lo := folderpath . "\flag_eng_lo.png"
global imgpath_flag_kor := folderpath . "\flag_kor.png"



global UIA := UIA_Interface()






initKflag()













~Space::
~^Space::
~+Space::




	refinedThisHotkey := RegExReplace(A_ThisHotkey, "\W", "")
	refinedPriorHotkey := RegExReplace(A_PriorHotkey, "\W", "")

	; MsgBox("refinedThisHotkey : " refinedThisHotkey)
	; MsgBox("refinedPriorHotkey : " refinedPriorHotkey)

	if( refinedThisHotkey = refinedPriorHotkey ){
		; MsgBox("1. you are holindg")
		holdingSpace := True

	} else {

		; MsgBox("2. not holding")
		; MsgBox("spaceCount : " spaceCount)

		if(spaceCount >= 2){
			; MsgBox("1.space ")
			sleep caretChangeDelay
			initInstantCaret()

		} else {
			; MsgBox("2.space")
			detectingCaretYPosChange()
			spaceCount++
		}


		correctFlagAfterSelectRemove()

	}


return



~Space up::
~^Space up::
~+Space up::

	if(holdingSpace = True){
		initInstantCaret()

		correctFlagAndCaretXY()

		holdingSpace := False
	}

return










~Del::
~+Del::
~^Del::
~BackSpace::
~+BackSpace::
~^BackSpace::
~^+BackSpace::




	; 브라우저일 경우 백스페이스로 뒤로가기 가능하며, 검색창으로 뒤로가기했을 때 카렛이 활성화 될 수 있다.
	refinedThisHotkey := RegExReplace(A_ThisHotkey, "\W", "")
	refinedPriorHotkey := RegExReplace(A_PriorHotkey, "\W", "")

	if( refinedThisHotkey = refinedPriorHotkey ){
		; MsgBox("1. you are holindg")
		holdingBackSpace := True
	} else {
		; MsgBox("2. not holding")


		identifyBackspaceCaret()


		correctFlagAfterSelectRemove()

	}




return




~Del up::
~+Del up::
~^Del up::
~BackSpace up::
~+BackSpace up::
~^BackSpace up::
~^+BackSpace up::



	if(holdingBackSpace = True){
		initInstantCaret()

		correctFlagAndCaretXY()

		holdingBackSpace := False

	}



return











~VK15::
~^VK15::
~+VK15::
~^+VK15::


	capsLockToLowCase()

	/*
	2가지 사용 결과 위치를 바꾸는 것도 좋은 것 같음
	아래는 변환이고 위는 따라오게 하는 것임
	*/

	; initInstantCaret()

	swapLangImage()

return











~^a::


	if( isFocusedBrowserAddressBar()
	OR isFocusedWindowExplorerAddressBar() ){
		;~ MsgBox("1. yes-chrome-addressbard")
		sendInput, ^{End}^+{Home}
	}

	Sleep, 20
	initInstantCaret()


return










~Up up::
~Down up::
~Left up::
~Right up::
~+Up up::
~+Down up::
~+Left up::
~+Right up::
~^Up up::
~^Down up::
~^Left up::
~^Right up::
~^+Up up::
~^+Down up::
~^+Left up::
~^+Right up::


	;tempoff
	; initInstantCaret()
	; 이게 있어야 단번으로 여러번 클릭 때 미아현상을 방지 할 수 있다.



	if(holdingArrow = True){


		; MsgBox("!!! HOLDING STOP ")
		; sleep 200
		; correctFlagAndCaretXY3(15)
		; correctFlagAndCaretXY(15)
		; loopCorrectFlag()
		; correctFlagAndCaretXYNeo2()
		; correctFlagAndCaretXYSplash2()



		; correctFlagAndCaretXYSplash()

		; correctFlagAndCaretXYSplash4()


		DllCall("QueryPerformanceFrequency", "Int64*", freq)
		DllCall("QueryPerformanceCounter", "Int64*", CounterBefore)



		; splash1()
		; splash2()
		; splash3()
		; best
		; splash4()
		; newSplash1()
		; newSplash12()
		; newSplash2()

		newSplash3()



		DllCall("QueryPerformanceCounter", "Int64*", CounterAfter)
		MsgBox("Elapsed QPC time is "(CounterAfter - CounterBefore) / freq * 1000 " ms")


		holdingArrow := False

	}

return






~Up::
~Down::
~Left::
~Right::
~+Up::
~+Down::
~+Left::
~+Right::
~^Up::
~^Down::
~^Left::
~^Right::
~^+Up::
~^+Down::
~^+Left::
~^+Right::


	KeyTyping := False

	refinedThisHotkey := RegExReplace(A_ThisHotkey, "\W", "")
	refinedPriorHotkey := RegExReplace(A_PriorHotkey, "\W", "")

	if( refinedThisHotkey = refinedPriorHotkey ){

		holdingArrow := True
		; MsgBox("1. you are holindg")

	} else {


		; tempoff
		; loopCorrectFlag()
		; MsgBox("2. you are not hold")

	}


return



loopCorrectFlag(){
	; MsgBox("--start--")

	loopSleep := 1

	Loop 20{

		caret.detect()
		; MsgBox("pX : " prev_x " / Y : " prev_y)
		; MsgBox("cX : " current_x " / Y : " current_y)
		; MsgBox("3-loopSleep : " loopSleep)

		if(prev_x != current_x OR prev_y != current_y){

			SplashImageGUI()
			; MsgBox("IT CHANGED..")
			break
		}

		loopSleep := 3 * A_index

		sleep loopSleep
	}
}
















~Enter up::
~+Enter up::



	initInstantCaret()
	; 이쪽이 실제 엔터를 칠 때 반응해주는 곳



	if(holdingEnter = True){
		correctFlagAndCaretXY()
		holdingEnter := False
	}


return












~Enter::
~+Enter::






	if( isBrowser() ){

		caret.getFocusedH(focusedH)

		if(focusedH <= 80){
			; MsgBox("1. 크롬임 / 80이하.. 검색창임")
			searchingLateCaret(20)
		} else {
			; MsgBox("2. 크롬임 / 80 이상.. 텍스트에어리아 엔터임")
		}

	} else {
		; MsgBox("3. 윈도우임 / 그냥 텍스트에어리아 엔터임")
	}





	refinedThisHotkey := RegExReplace(A_ThisHotkey, "\W", "")
	refinedPriorHotkey := RegExReplace(A_PriorHotkey, "\W", "")

	; MsgBox("refinedThisHotkey : " refinedThisHotkey)
	; MsgBox("refinedPriorHotkey : " refinedPriorHotkey)

	if( refinedThisHotkey = refinedPriorHotkey ){
		; MsgBox("1. you are holindg")
		holdingEnter := True
	} else {




		; MsgBox("2. you are not hold")

		; 이쪽은 선택 후 삭제할 때 반응하는 곳이다.
		correctFlagAfterSelectRemove()




	}







return



































~CapsLock::

~^CapsLock::
~+CapsLock::
~^+CapsLock::

	if(IME_CHECK("A") = "1"){
		; MsgBox("1. 한글이었음 - 영어로 변환완료")
		swapLang()
		swapLangImage()
	} else if(IME_CHECK("A") = "0"){
		; MsgBox("2. 영어였음 - 캡스락변환 완료")
		swapCapslockImage()
	}



return














/*
~LShift::
	KeyWait, Shift
	initImgCaret()
return
*/




~F2::
~Tab::
~+Tab::
		Sleep 50
		initImgCaret()
return








~!Tab up::
~!+Tab up::

	; 알트탭과 알트탭업은 손에서 땔때 작동해야한다.
	initImgCaret()

return





















#include %A_ScriptDir%/key/key_mouse.ahk
#include %A_ScriptDir%/key/key_common.ahk


#include %A_ScriptDir%/func/UIA_Interface.ahk
#include %A_ScriptDir%/func/UIA_Browser.ahk
#include %A_ScriptDir%/func/Acc_lib.ahk



#include %A_ScriptDir%/func/kflag_latecaret.ahk
#include %A_ScriptDir%/func/kflag_caret.ahk
#include %A_ScriptDir%/func/kflag_flag.ahk
#include %A_ScriptDir%/func/kflag_lib.ahk
#include %A_ScriptDir%/func/kflag_func.ahk
#include %A_ScriptDir%/func/kflag_img.ahk


#include %A_ScriptDir%/class/Caret.ahk
#include %A_ScriptDir%/class/Flag.ahk



#include %A_ScriptDir%/func/debug.ahk
#include %A_ScriptDir%/func/test.ahk

/*
	VER 1.2
 */
















