
class Caret{


	CaretX := 0
	CaretY := 0
	CaretW := 0
	CaretH := 0

	prev_x := 0
	prev_y := 0

	focusedH := 0

	cur_exe := ""
	pre_exe := ""
	cur_winid := ""
	pre_winid := ""

	type := ""
	X_margin := 3
 	Y_margin := 20


	detect(){


		CoordMode, Caret, Screen
		WinGet, cur_exe, ProcessName, A
		WinGet, cur_winid, ID, A

		this.cur_exe := cur_exe
		this.cur_winid := cur_winid
		this.prev_x := this.CaretX
		this.prev_y := this.CaretY



		; MsgBox("----->-----")
		; MsgBox("this.CaretX : " this.CaretX)
		; MsgBox("this.CaretY : " this.CaretY)
		; MsgBox("this.CaretW : " this.CaretW)
		; MsgBox("this.CaretH : " this.CaretH)
		; MsgBox("this.cur_winid : " this.cur_winid)
		; MsgBox("this.pre_winid : " this.pre_winid)


		; MsgBox("this.type : " this.type)

		if( this.cur_winid = this.pre_winid AND this.type){
			; MsgBox("MODE : 1. USING / WINID")
			this.usingCaretType()
		} else {
			; MsgBox("MODE : 2. DETECT")
			this.detectCaretType()
		}





		this.setFocusedHeight()
		this.pre_exe := this.cur_exe
		this.pre_winid := this.cur_winid

	}


	setFocusedHeight(){
		if( this.CaretW > 0 AND isBrowser() AND ( this.isXYMove() OR this.isWinidDiff())  ){
			if( this.HasBrowserKey() ){
				try {
					eleFocus := UIA.GetFocusedElement()
					this.focusedH := eleFocus.BoundingRectangle.b-eleFocus.BoundingRectangle.t
					; MsgBox("5.WORKS : this.focusedH : " this.focusedH)
				} catch e{
						timeRecord("!! === CRITICAL ERROR : getFocuisedELement ")
						timeRecord("!! === e.what : " e.what " / e.message : " e.message " / e.extra : " e.extra)
						MsgBox("e.what : " e.what)
						MsgBox("e.message : " e.message)
						MsgBox("e.extra : " e.extra)
				}
			}
		}
	}


	isXYMove(){
		if(this.CaretX != this.prev_x OR this.CaretY != this.prev_y){
			; MsgBox("1. X,Y값 달라졌음")
			return True
		} else {
			return False
		}
	}

	isWinidDiff(){
		if(this.cur_winid != this.pre_winid){
			; MsgBox("2. winid 달라졌음")
			return True
		} else {
			return False
		}
	}

	HasBrowserKey(){
		key_arr := ["Button","^","+","!","BackSpace"]
		; MsgBox("A THIS HOTKEY : "  A_thishotkey)
		if( isStringInArray(A_ThisHotkey,key_arr) ){
			; MsgBox("3. browser 단축키임")
			return True
		} else {
			return false
		}
	}



	getPos(Byref x="", Byref y="",Byref w="",Byref h="", Byref prev_y="", Byref prev_x=""){

		this.detect()
		prev_x := this.prev_x
		prev_y := this.prev_y
		x := this.CaretX
		y := this.CaretY
		w := this.CaretW
		h := this.CaretH


		current_w := this.CaretW
		current_h := this.CaretH




	}


	getFocusedH(Byref focusedH=""){
		focusedH := this.focusedH
	}


	usingCaretType(){
		switch this.type
		{
			case "WINDOW_CARET": this.checkWindowCaret()
			case "ACC_CARET": this.checkAccCaret()
			case "UIA_CARET": this.checkUIACaret()
		}
	}


	detectCaretType(){

		if( this.checkWindowCaret() ){
			; MsgBox("windowCaret WORKS")
			this.type := "WINDOW_CARET"
			return
		}

		if( this.checkAccCaret() ){
			; MsgBox("accCaret WORKS")
			this.type := "ACC_CARET"
			return
		}

		if( this.checkUIACaret() ){
			; MsgBox("UIACaret WORKS")
			this.type := "UIA_CARET"
			return
		}

		;여기까지 오면 일치하는 타입 없음
		this.type := ""

	}





	checkWindowCaret(){

		if (A_CaretX OR A_CaretY) {

			this.CaretX := A_CaretX + this.X_margin
			this.CaretY := A_CaretY + this.Y_margin
			this.CaretW := 1
			this.CaretH := 15
			current_x := this.CaretX
			current_y := this.CaretY


			; MsgBox("--------- A-1. wincaret works")
			return true

		} else {
			; MsgBox("--------- A-2. wincaret fail..")
			return false
		}

	}


	checkAccCaret(){

		static init
		Try {

			if (!init)
					init:=DllCall("LoadLibrary","Str","oleacc","Ptr")
				VarSetCapacity(IID,16), idObject:=OBJID_CARET:=0xFFFFFFF8
				, NumPut(idObject==0xFFFFFFF0?0x0000000000020400:0x11CF3C3D618736E0, IID, "Int64")
				, NumPut(idObject==0xFFFFFFF0?0x46000000000000C0:0x719B3800AA000C81, IID, 8, "Int64")
			if DllCall("oleacc\AccessibleObjectFromWindow"
				, "Ptr",WinExist("A"), "UInt",idObject, "Ptr",&IID, "Ptr*",pacc)=0
			{
				Acc:=ComObject(9,pacc,1), ObjAddRef(pacc)
				, Acc.accLocation( ComObj(0x4003,&x:=0), ComObj(0x4003,&y:=0), ComObj(0x4003,&w:=0), ComObj(0x4003,&h:=0), ChildId:=0)
				, this.CaretX:=NumGet(x,0,"int") + this.X_margin
				, this.CaretY:=NumGet(y,0,"int") + this.Y_margin
				, this.CaretW:=NumGet(w,0,"int")
				, this.CaretH:=NumGet(h,0,"int")
				, current_x := this.CaretX
				, current_y := this.CaretY
			}
		}

		if (this.CaretW > 0 AND this.CaretH > 0){
			; MsgBox("--------- B-1. acccaret works")
			return true
		} else {
			; MsgBox("--------- B-2. acccaret fail..")
			return false
		}


	}


	checkUIACaret(){




		;~ https://www.autoahk.com/archives/44158
		static iUIAutomation, hOleacc, IID_IAccessible

		try{
			iUIAutomation := ComObjCreate("{E22AD333-B25F-460C-83D0-0581107395C9}", "{30CBE57D-D9D0-452A-AB13-7AC5AC4825EE}")
			hOleacc := DllCall("LoadLibrary", "str", "Oleacc.dll", "ptr")
			VarSetCapacity(IID_IAccessible, 16),
			NumPut(0x11CF3C3D618736E0, IID_IAccessible, "int64"),
			NumPut(0x719B3800AA000C81, IID_IAccessible, 8, "int64")
			VarSetCapacity(guiThreadInfo, size := (A_PtrSize == 8 ? 72 : 48)), NumPut(size, guiThreadInfo, "uint")
		}

		DllCall(NumGet(NumGet(iUIAutomation + 0), 8 * A_PtrSize), "ptr", iUIAutomation, "ptr*", eleFocus)

		if !hwndFocus
			hwndFocus := WinExist()

		if iUIAutomation && eleFocus {

			if DllCall(NumGet(NumGet(eleFocus + 0), 16 * A_PtrSize), "ptr", eleFocus, "int", 10024, "ptr*", textPattern2, "int") || !textPattern2
				|| DllCall(NumGet(NumGet(textPattern2 + 0), 10 * A_PtrSize), "ptr", textPattern2, "int*", isActive, "ptr*", caretTextRange)
				|| !caretTextRange || !isActive || DllCall(NumGet(NumGet(caretTextRange + 0), 10 * A_PtrSize), "ptr", caretTextRange, "ptr*", rects)
				|| !rects || (rects := ComObject(0x2005, rects, 1)).MaxIndex() < 3
				Sleep 1
				try{
					this.CaretX := Round(rects[0]) + this.X_margin,
					this.CaretY := Round(rects[1]) + this.Y_margin,
					this.CaretW := Round(rects[2]),
					this.CaretH := Round(rects[3]),
					hwnd := hwndFocus
					current_x := this.CaretX
					current_y := this.CaretY
				}

				timeRecord("GetCaret - 3-3 : iUIAuto")
				timeRecord("CaretX : " this.CaretX  " / CaretY : " this.CaretY " CaretW : " this.CaretW " CaretH :" this.CaretH)
				; MsgBox("GetCaret - 3-3 / CaretX : " this.CaretX  " / CaretY : " this.CaretY " CaretW : " this.CaretW " CaretH :" this.CaretH)

				if(this.CaretW > 0 AND this.CaretH > 0){

					; MsgBox("--------- C-1-1. UIA WORKS")
					return True

				}

				; 크롬에서 셀렉팅한 텍스트를 인식함

				/*
				else if (this.CaretW < 1 AND this.CaretH < 1){
					; use IUIAutomationTextPattern::GetSelection
					if DllCall(NumGet(NumGet(eleFocus + 0), 16 * A_PtrSize), "ptr", eleFocus, "int", 10014, "ptr*", textPattern) || !textPattern
					|| DllCall(NumGet(NumGet(textPattern + 0), 5 * A_PtrSize), "ptr", textPattern, "ptr*", selectionRangeArray) || !selectionRangeArray
					|| DllCall(NumGet(NumGet(selectionRangeArray + 0), 3 * A_PtrSize), "ptr", selectionRangeArray, "int*", length) || !length
					|| DllCall(NumGet(NumGet(selectionRangeArray + 0), 4 * A_PtrSize), "ptr", selectionRangeArray, "int", 0, "ptr*", selectionRange) || !selectionRange
					|| DllCall(NumGet(NumGet(selectionRange + 0), 10 * A_PtrSize), "ptr", selectionRange, "ptr*", rects) || !rects
					Sleep 1
					;~ rects := ComObject(0x2005, rects, 1)

					;~ if rects.MaxIndex() < 3 && DllCall(NumGet(NumGet(selectionRange + 0), 6 * A_PtrSize), "ptr", selectionRange, "int", 0)
					|| DllCall(NumGet(NumGet(selectionRange + 0), 10 * A_PtrSize), "ptr", selectionRange, "ptr*", rects) || !rects || (rects := ComObject(0x2005, rects, 1)).MaxIndex() < 3
						DllCall(NumGet(NumGet(selectionRange + 0), 6 * A_PtrSize), "ptr", selectionRange, "int", 0)
						DllCall(NumGet(NumGet(selectionRange + 0), 10 * A_PtrSize), "ptr", selectionRange, "ptr*", rects)
						rects := ComObject(0x2005, rects, 1)
						Sleep 1
						try{
							this.CaretX := Round(rects[0]) + this.X_margin,
							this.CaretY := Round(rects[1]) + this.Y_margin,
							this.CaretW := Round(rects[2]),
							this.CaretH := Round(rects[3]),
							current_x := this.CaretX,
							current_y := this.CaretY,
							hwnd := hwndFocus
						}
						if(this.CaretW > 0 AND this.CaretH > 0){
							MsgBox("--------- C-1-2. UIA WORKS")
							return True
						} else {

							MsgBox("--------- C-2. UIA fail..")
							; this.type := ""
							; return False

						}

						timeRecord("GetCaret - 3-4 : usergetselection")
						timeRecord("CaretX : " this.CaretX  " / CaretY : " this.CaretY " CaretW : " this.CaretW " CaretH :" this.CaretH)
						; MsgBox("GetCaret - 3-4 / CaretX : " this.CaretX  " / CaretY : " this.CaretY " CaretW : " this.CaretW " CaretH :" this.CaretH)
						goto cleanCaret
				}
				*/

				else {

					; MsgBox("--------- C-1-2. UIA FAIL..")
					return false


				}


		}

		cleanCaret:
		for _, p in [eleFocus, valuePattern, textPattern2, caretTextRange, textPattern, selectionRangeArray, selectionRange, accCaret]
			(p && ObjRelease(p))
		; return hwnd





	}







}
