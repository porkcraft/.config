capslock::
    suspend Permit
    switchToNormalMode()
    Return

+capsLock::
    switchToInsertMode()
    return

; #if GetKeyState("CapsLock", "T")
;     Menu, Tray, Icon, ..\icons\inactive.ico, , 1
;     switchToNormalMode()
; Return

; if getkeystate("capslock", "T") = 1 {
;     setcapslockstate, on
;     switchToNormalMode()
; } else if getkeystate("capslock", "F") = 0 {
;     setcapslockstate, off
;     switchToInsertMode()
; }

; CapsLock::
; state := getkeystate("capslock", "T")
;     if (state := state) {
;         ;Suspend Permit
;         switchToNormalMode()
;         Menu, Tray, Icon, ..\icons\active.ico, , 1
;         if (state := !state) {
;             switchToInsertMode()
;             Menu, Tray, Icon, ..\icons\inactive.ico, , 1
;         }
;     }
; Return

; CapsLock Up::
; if getkeystate("capslock", "T") {
;     switchToNormalMode()
;     Menu, Tray, Icon, ..\icons\active.ico, , 1
; } else {
;     switchToInsertMode()
;     Menu, Tray, Icon, ..\icons\inactive.ico, , 1
; }
; return

; i::
;     switchToInsertMode()
;     Return

; +i::
;     switchToInsertMode()
;     Send, {Home}
;     Return

; a::
;     switchToInsertMode()
;     Send, {Right}
;     Return

; +a::
;     switchToInsertMode()
;     Send, {End}
;     Return

v::
    turnVisualModeOn()
    Return

+v::
    turnVisualModeOn()
    Send, {Home}{Home}+{Down}
    Return

'::
    switchToInsertMode()
    Return
