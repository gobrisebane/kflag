GetCaret(Byref CaretX="", Byref CaretY="",Byref CaretW="",Byref CaretH=""){


	CoordMode, Caret, Screen
	WinGet, current_exe, ProcessName, A


	timeRecord("GetCaret - 1  current_exe : " current_exe)
	; MsgBox("GetCaret - 1 - Starting")


	X_margin := 3
 	Y_margin := 20
	prev_x := current_x
	prev_y := current_y



		if (A_CaretX or A_CaretY) {


			;~ MsgBox("type1 Default")
			CaretX := A_CaretX + X_margin
			CaretY := A_CaretY + Y_margin
			CaretW := 1
			current_x := CaretX
			current_y := CaretY


			timeRecord("GetCaret - 3-1 / x : " CaretX  " / y : " CaretY)
			; MsgBox("GetCaret - 3-1 / x : " CaretX  " / y : " CaretY)

		} else {

				;~ UIA := UIA_Interface()
				;~ eleFocus := UIA.GetFocusedElement()
				;~ BoundingRectLeft := eleFocus.BoundingRectangle.l
				;~ timeRecord("GetCaret - 3-2 / BoundingRectLeft :" eleFocus.BoundingRectangle.l)
				;~ MsgBox("GetCaret - 3-2 / BoundingRectLeft :" eleFocus.BoundingRectangle.l)



				;~ if(BoundingRectLeft > 1){

				static init
				Try {

						;~ MsgBox("name : " eleFocus.Name)
						;~ MsgBox("ctype : " eleFocus.ControlType)
						;~ MsgBox("value : " eleFocus.Value)


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
						, CaretX:=NumGet(x,0,"int") + X_margin
						, CaretY:=NumGet(y,0,"int") + Y_margin
						, CaretW:=NumGet(w,0,"int")
						, CaretH:=NumGet(h,0,"int")
						, current_x := CaretX
						, current_y := CaretY
					}
				}

				timeRecord("GetCaret - 3-2 : CHROME")
				timeRecord("CaretX : " CaretX  " / CaretY : " CaretY " CaretW : " CaretW " CaretH :" CaretH)
				; MsgBox("GetCaret - 3-2 / CaretX : " CaretX  " / CaretY : " CaretY " CaretW : " CaretW " CaretH :" CaretH)


				;~ } else

				if(CaretW < 1 AND CaretH < 1 ){

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

					useAccLocation:
					if !hwndFocus
						hwndFocus := WinExist()

					if iUIAutomation && eleFocus {

						if DllCall(NumGet(NumGet(eleFocus + 0), 16 * A_PtrSize), "ptr", eleFocus, "int", 10024, "ptr*", textPattern2, "int") || !textPattern2
							|| DllCall(NumGet(NumGet(textPattern2 + 0), 10 * A_PtrSize), "ptr", textPattern2, "int*", isActive, "ptr*", caretTextRange)
							|| !caretTextRange || !isActive || DllCall(NumGet(NumGet(caretTextRange + 0), 10 * A_PtrSize), "ptr", caretTextRange, "ptr*", rects)
							|| !rects || (rects := ComObject(0x2005, rects, 1)).MaxIndex() < 3
							Sleep 1
							try{
								CaretX := Round(rects[0]) + X_margin,
								CaretY := Round(rects[1]) + Y_margin,
								CaretW := Round(rects[2]),
								CaretH := Round(rects[3]),
								hwnd := hwndFocus
								current_x := CaretX
								current_y := CaretY
							}

							timeRecord("GetCaret - 3-3 : iUIAuto")
							timeRecord("CaretX : " CaretX  " / CaretY : " CaretY " CaretW : " CaretW " CaretH :" CaretH)
							; MsgBox("GetCaret - 3-3 / CaretX : " CaretX  " / CaretY : " CaretY " CaretW : " CaretW " CaretH :" CaretH)


							if(CaretW < 1 AND CaretH < 1){

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
										CaretX := Round(rects[0]) + X_margin,
										CaretY := Round(rects[1]) + Y_margin,
										CaretW := Round(rects[2]),
										CaretH := Round(rects[3]),
										current_x := CaretX,
										current_y := CaretY,
										hwnd := hwndFocus
									}

									timeRecord("GetCaret - 3-4 : usergetselection")
									timeRecord("CaretX : " CaretX  " / CaretY : " CaretY " CaretW : " CaretW " CaretH :" CaretH)
									; MsgBox("GetCaret - 3-4 / CaretX : " CaretX  " / CaretY : " CaretY " CaretW : " CaretW " CaretH :" CaretH)
									goto cleanUp


							}
					}

					cleanUp:
					for _, p in [eleFocus, valuePattern, textPattern2, caretTextRange, textPattern, selectionRangeArray, selectionRange, accCaret]
						(p && ObjRelease(p))
					return hwnd

				}
				;~ <-- if CaretW -->

		}







}
