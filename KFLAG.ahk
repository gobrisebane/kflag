#NoEnv
#Persistent
#SingleInstance force
#MaxHotkeysPerInterval 200




; SetTimer, caretWatcher, 1000



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






; caret
global current_x
global current_y
global current_w
global current_h

global prev_x
global prev_y


global current_lang
global caretChangeDelay := 25




; flag
global SplashImage
global FlagApp
global picture
global flagId
global prev_exe
global current_exe



; holder
global holdingBackSpace
global holdingEnter
global holdingArrow
global spaceCount := 0



; late caret
global initClickCount = 0
global keyTyping := False
global enterCount := 0

global prev_enter_x
global prev_enter_y
global prev_box_l
global prev_box_r
global prev_box_t
global prev_box_b


global lastKeyTypingSec := 0
global typingIdleSec := 5


;img
global imgpath_flag_eng_up := folderpath . "\flag_eng_up.png"
global imgpath_flag_eng_lo := folderpath . "\flag_eng_lo.png"
global imgpath_flag_kor := folderpath . "\flag_kor.png"
global folderpath := A_AppData . "\TWEPO\kflag"



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

		correctFlagAfterSelectionRemove()
	}

return



~Space up::
~^Space up::
~+Space up::

	if(holdingSpace = True){
		initInstantCaret()

		correntFlagAndCaretXY()

		holdingSpace := False
	}

return







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

		correctFlagAfterSelectionRemove()

	}

return





~BackSpace up::
~+BackSpace up::
~^BackSpace up::
~^+BackSpace up::



	if(holdingBackSpace = True){
		initInstantCaret()

		correntFlagAndCaretXY()

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
	*/

	initInstantCaret()

	; swapLangImage()

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


	;2중으로 체크
	initInstantCaret()



	if(holdingArrow = True){

		sleep 50
		initInstantCaret()

		correntFlagAndCaretXY(10)

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

	refinedThisHotkey := RegExReplace(A_ThisHotkey, "\W", "")
	refinedPriorHotkey := RegExReplace(A_PriorHotkey, "\W", "")

	if( refinedThisHotkey = refinedPriorHotkey ){

		holdingArrow := True
		; MsgBox("1. you are holindg")

	} else {

		sleep caretChangeDelay
		initInstantCaret()

		; correntFlagAndCaretXY(15)
		; MsgBox("2. you are not hold")
	}


return

















~Enter up::
~+Enter up::

	initInstantCaret()

	if(holdingEnter = True){
		correntFlagAndCaretXY()
		holdingEnter := False
	}


return












~Enter::
~+Enter::



	if( isBrowser() ){


		caret.getFocusedH(focusedH)


		MsgBox("focusedH : " focusedH)

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
		correctFlagAfterSelectionRemove()
	}







return















~LButton::


	initClickCount++

return







~^l::
~MButton::
~XButton1::
~XButton2::
~LButton up::
~LWin::
~RWin::


~!LButton::











	/*
	구글->네이버 이동시 플래그가 url에 남아있음
	이전의 keyTyping := True가 5초간 진행중이어서
	searchingLateCaret에서 break가 걸린것임
	*/
	keyTyping := False




	timeRecord("1-LBUTTON UP / ENTER")
	timeRecordCurrentProgram()


	MsgBox("-----------------------")
	MsgBox("------CLICK START------")
	MsgBox("-----------------------")


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






















#include %A_ScriptDir%/key/common.ahk


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
















