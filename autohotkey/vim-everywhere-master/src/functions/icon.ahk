setIcon() {
    If A_IsSuspended
        Menu, Tray, Icon, ..\icons\inactive.ico, , 1
    Else
        Menu, Tray, Icon, ..\icons\active.ico, , 1
}

; hotkey, capslock, switch

; switch: {
;     if GetKeyState("CapsLock", "T")
;         Menu, Tray, Icon, ..\icons\active.ico, , 1
;     else
;         Menu, Tray, Icon, ..\icons\inactive.ico, , 1
; }
; return
