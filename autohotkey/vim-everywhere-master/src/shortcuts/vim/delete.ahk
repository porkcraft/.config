s::
    switchToInsertMode()
    if (visualMode) {
        Send, ^x
    } else {
        Send, {Delete}
    }

    turnVisualModeOff()

    Return

+s::
    switchToInsertMode()
    Send, {Home}+{End}^x
    Return

r::
    switchToInsertMode()

    Input, key, L1
    Send, {Delete}%key%{Left}

    switchToNormalMode()

    Return
