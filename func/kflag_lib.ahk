


GuiGetPos( ByRef X, ByRef Y, ByRef W, ByRef H, GuiID=1 ) {

	try{
		timeRecord("GuiGetPos - 1-1 Try / Success")

		Gui %GuiID%:+LastFoundExist
		IfWinExist
		{
			WinGetPos X, Y
			VarSetCapacity( rect, 16, 0 )
			DllCall("GetClientRect", uint, MyGuiHWND := WinExist(), uint, &rect )
			W := NumGet( rect, 8, "int" )
			H := NumGet( rect, 12, "int" )
			timeRecord("GuiGetPos - 1-1 Try / Success :: GuiID : " GuiID " / MyGuiHWND : " MyGuiHWND)
			timeRecord("GuiGetPos - 1-1 / X :" X " / Y :" Y " / W :" W " / H :" H)
			; MsgBox("GuiGetPos - 1-1 / X :" X " / Y :" Y " / W :" W " / H :" H)
		}


	} catch {

			timeRecord("GuiGetPos - 1-2 Catch / Failure")

			MsgBox("!! === ERROR GUID : " GuiID "=== !!")
			timeRecord("!! === ERROR GUID : " GuiID "=== !!")

			if(GuiID){
				MsgBox("!! === CRITICAL ERROR-1 : GUID HAVE BUT NOT VALID GuiID === !!")
				timeRecord("!! == CRITICAL ERROR-1 : GUID HAVE BUT NOT VALID GuiID === !!")
			} else {

        MsgBox("!! === CRITICAL ERROR-2 : DOESNT HAVE GuiID === !!")
				timeRecord("!! == CRITICAL ERROR-2 : DOESNT HAVE GuiID === !!")

			}

			W := 0
			H := 0

	}
}








;   Author: eamat
;   URL: http://www6.atwiki.jp/eamat/
;   https://gist.github.com/komamitsu/54ccdf681d2bdda1b47f9bbd1164e2fb

IME_CHECK(WinTitle="A")  {

  ControlGet,hwnd,HWND,,,%WinTitle%

    if    (WinActive(WinTitle))    {

        ptrSize := !A_PtrSize ? 4 : A_PtrSize
        VarSetCapacity(stGTI, cbSize:=4+4+(PtrSize*6)+16, 0)
        NumPut(cbSize, stGTI,  0, "UInt")   ;    DWORD   cbSize;
        hwnd := DllCall("GetGUIThreadInfo", Uint,0, Uint,&stGTI)
                 ? NumGet(stGTI,8+PtrSize,"UInt") : hwnd
    }

    return DllCall("SendMessage"
          , UInt, DllCall("imm32\ImmGetDefaultIMEWnd", Uint,hwnd)
          , UInt, 0x0283  ;Message : WM_IME_CONTROL
          ,  Int, 0x0005  ;wParam  : IMC_GETOPENSTATUS
          ,  Int, 0)      ;lParam  : 0
}




IME_CHECK_BK(WinTitle)
{
	WinGet,hWnd,ID,%WinTitle%
	Return Send_ImeControl(ImmGetDefaultIMEWnd(hWnd),0x005,"")
}



Send_ImeControl(DefaultIMEWnd, wParam, lParam)
{
	DetectSave := A_DetectHiddenWindows
	DetectHiddenWindows,ON
	SendMessage 0x283, wParam,lParam,,ahk_id %DefaultIMEWnd%
	if (DetectSave <> A_DetectHiddenWindows)
		DetectHiddenWindows,%DetectSave%
		return ErrorLevel
}


ImmGetDefaultIMEWnd(hWnd)
{
	return DllCall("imm32\ImmGetDefaultIMEWnd", Uint,hWnd, Uint)
}






WriteFile(file,data)
{
   Handle :=  DllCall("CreateFile","str",file,"Uint",0x40000000
                  ,"Uint",0,"UInt",0,"UInt",4,"Uint",0,"UInt",0)
   Loop
   {
     if strlen(data) = 0
        break
     StringLeft, Hex, data, 2
     StringTrimLeft, data, data, 2
     Hex = 0x%Hex%
     DllCall("WriteFile","UInt", Handle,"UChar *", Hex
     ,"UInt",1,"UInt *",UnusedVariable,"UInt",0)
    }

   DllCall("CloseHandle", "Uint", Handle)
   return
}









isStringInArray(haystack, array){
	for index, value in array
		if( InStr(haystack, value) ){
			return true
		}
}



hasValue(haystack, needle) {
    if(!isObject(haystack))
        return false
    if(haystack.Length()==0)
        return false
    for k,v in haystack
        if(v==needle)
            return true
    return false
}



GetCaretPos(ByRef x, ByRef y)
{
	;https://www.autohotkey.com/boards/viewtopic.php?t=64101

  static Size:=8+(A_PtrSize*6)+16, hwndCaret:=8+A_PtrSize*5
  Static CaretX:=8+(A_PtrSize*6), CaretY:=CaretX+4

  VarSetCapacity(Info, Size, 0), NumPut(Size, Info, "Int")

  DllCall("GetGUIThreadInfo", "UInt", 0, "Ptr", &Info), x:=y:=""

  if !(HWND:=NumGet(Info, hwndCaret, "Ptr"))
    return, 0
  x:=NumGet(Info, CaretX, "Int"),
  y:=NumGet(Info, CaretY, "Int")

  VarSetCapacity(pt, 8),
  NumPut(y, NumPut(x, pt, "Int"), "Int")

  DllCall("ClientToScreen", "Ptr", HWND, "Ptr", &pt)

  x:=NumGet(pt, 0, "Int"),
  y:=NumGet(pt, 4, "Int")

  return, 1
}
