
class Caret{


	focusedH := 0
	type := ""

	X_margin := 3
	Y_margin := 20
 	; Y_margin := 19



	__new(){
		this.detect()
	}



	detect(){




		CoordMode, Caret, Screen
		WinGet, current_winid, ID, A
		WinGet, current_exe, ProcessName, A

		prev_x := current_x
		prev_y := current_y

		; MsgBox("prev_x : " prev_x)
		; MsgBox("prev_y : " prev_y)
		; MsgBox("this.type : " this.type)

		if( current_winid = prev_winid AND this.type){
			; MsgBox("MODE : 1. USING / WINID")
			this.usingCaretType()
		} else {
			; MsgBox("MODE : 2. DETECT")
			this.detectCaretType()
		}

		; MsgBox("current_winid : " current_winid)
		; MsgBox("prev_winid : " prev_winid)
		this.setFocusedHeight()


		prev_winid := current_winid


	}


	setFocusedHeight(){
		if( current_w > 0 AND isBrowser()
			AND ( this.isXYMove() OR this.isWinidDiff())  ){
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
		if(current_x != prev_x OR current_y != prev_y){
			; MsgBox("1. X,Y값 달라졌음")
			return True
		} else {
			return False
		}
	}

	isWinidDiff(){
		; MsgBox("current_winid : " current_winid)
		; MsgBox("prev_winid : " prev_winid)
		if(current_winid != prev_winid){
			MsgBox("2-1. winid 달라졌음")
			; return True
		} else {
			; MsgBox("2-2. winid 그대로임")
			; return False
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



	getFocusedH(Byref focusedH=""){
		focusedH := this.focusedH
	}


	usingCaretType(){
		switch this.type
		{
			case "WINDOW_CARET": this.checkWindowCaret()
			case "ACC_CARET": this.checkAccCaret()
			case "UIA_CARET": this.checkUIACaret()
			; case "OFFICE_CARET": this.checkOfficeCaret()

		}
	}


	detectCaretType(){


		if( current_exe = "WINWORD.EXE" ){
			MsgBox("detect winword works")
			this.type := "UIA_CARET"
			return
		}

		if( this.checkWindowCaret() ){
			MsgBox("windowCaret WORKS")
			this.type := "WINDOW_CARET"
			return
		}


		if( this.checkAccCaret() ){
			MsgBox("accCaret WORKS")
			this.type := "ACC_CARET"
			return
		}


		if( this.checkUIACaret() ){
			MsgBox("UIACaret WORKS")
			this.type := "UIA_CARET"
			return
		}


		;여기까지 오면 일치하는 타입 없음
		this.type := ""

	}







	checkOfficeCaret(){


			try{

			oWord := ComObjActive("Word.application")
			oWin := oWord.application.activeWindow
			oRan := oWord.selection.range



			VarSetCapacity(var_L, 24, 0)
			Left_ref := ComObject(0x4003, &var_L)  ; 0x400C is a combination of VT_BYREF and VT_I4 (long).
			VarSetCapacity(var_T, 24, 0)
			Top_ref := ComObject(0x4003, &var_T)  ; 0x400C is a combination of VT_BYREF and VT_I4 (long).
			VarSetCapacity(var_W, 24, 0)
			Width_ref := ComObject(0x4003, &var_W)  ; 0x400C is a combination of VT_BYREF and VT_I4 (long).
			VarSetCapacity(var_H, 24, 0)
			Height_ref := ComObject(0x4003, &var_H)  ; 0x400C is a combination of VT_BYREF and VT_I4 (long).
			oWin.GetPoint(Left_ref, Top_ref, Width_ref, Height_ref, oRan)

			;~ MsgBox("Left_ref[] : " Left_ref[])
			;~ MsgBox("Top_ref[] : " Top_ref[])
			;~ MsgBox("width_ref[] : " width_ref[])
			;~ MsgBox("height_ref[] : " height_ref[])

			; CaretX := Left_ref[] + X_margin
			; CaretY := Top_ref[] + Y_margin
			current_x := Left_ref[] + this.x_margin
			current_y := CaretY := Top_ref[] + this.y_margin
			current_w := 1
			current_h := 15

		}



	}






	checkWindowCaret(){


		if (A_CaretX OR A_CaretY) {
			current_x := A_CaretX + this.X_margin
			current_y := A_CaretY + this.Y_margin
			current_w := 1
			current_h := 15

			filterPowerpointCaretW()
			; MsgBox("--------- A-1. wincaret works")
			return true

		} else {
			; MsgBox("--------- A-2. wincaret fail..")
			return false
		}



	}





	checkAccCaret(){
			AccCaret := Acc_ObjectFromWindow(WinExist("A"), OBJID_CARET := 0xFFFFFFF8)
			caretLocation := Acc_Location(AccCaret)
			current_x := caretLocation.x + this.X_margin
			current_y := caretLocation.y + this.Y_margin
			current_w := caretLocation.w
			current_h := caretLocation.h

			if (current_w > 0 AND current_h > 0){
				; MsgBox("--------- B-1. acccaret works")
				return true
			} else {
				; MsgBox("--------- B-2. acccaret fail..")
				return false
			}
	}


	checkUIACaret(){

			static IUIA := ComObjCreate("{ff48dba4-60ef-4201-aa87-54103eef594e}", "{30cbe57d-d9d0-452a-ab13-7ac5ac4825ee}")

			; GetFocusedElement
			DllCall(NumGet(NumGet(IUIA+0)+8*A_PtrSize), "ptr", IUIA, "ptr*", FocusedEl:=0)
			; ObjRelease(FocusedEl)

			; GetCurrentPattern. TextPatternElement2 = 10024
			DllCall(NumGet(NumGet(FocusedEl+0)+16*A_PtrSize), "ptr", FocusedEl, "int", 10024, "ptr*", patternObject:=0)
			ObjRelease(FocusedEl)

			if patternObject {

				; GetCaretRange
				DllCall(NumGet(NumGet(patternObject+0)+10*A_PtrSize), "ptr", patternObject, "int*", IsActive:=1, "ptr*", caretRange:=0)
				ObjRelease(patternObject)

				; GetBoundingRectangles
				DllCall(NumGet(NumGet(caretRange+0)+10*A_PtrSize), "ptr", caretRange, "ptr*", boundingRects:=0)
				ObjRelease(caretRange)


				; VT_ARRAY = 0x20000 | VT_R8 = 5 (64-bit floating-point number)
				Rect := ComObject(0x2005, boundingRects)


				if (Rect.MaxIndex() = 3) {
						current_x:=Round(Rect[0]) + this.X_margin,
						current_y:=Round(Rect[1]) + this.Y_margin,
						current_w:=Round(Rect[2]),
						current_h:=Round(Rect[3])
				}


				if(current_w > 0 AND current_h > 0){
					; MsgBox("--------- C-1-1. UIA WORKS")
					return True
				} else {
					; MsgBox("--------- C-1-2. UIA FAIL..")
					return false
				}

			}












	}







}
