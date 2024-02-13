p::
    Send, ^v
    turnVisualModeOff()
    Return

+p::
    Send, p

    Return

y::
    visualOrMultipleKeyCommand("y", "^c")
    Send, {Left}

    Return

d::
    visualOrMultipleKeyCommand("d", "^x")
    turnVisualModeOff()
    Return

x::
    visualOrMultipleKeyCommand("d", "^x")
    turnVisualModeOff()
    Return

c::
    visualOrMultipleKeyCommand("c", "^x")
    switchToInsertMode()

    Return

+c::
    Send, +d
    switchToInsertMode()

    Return

+d::
    Send, +{End}^x

    Return
