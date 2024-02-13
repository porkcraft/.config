/::
    Send, ^f
    if (!visualMode) {
        switchToInsertMode()
    }
    Return

+3::
    Send, ^{Left}+^{Right}^c^f^v{Enter}
    Return
