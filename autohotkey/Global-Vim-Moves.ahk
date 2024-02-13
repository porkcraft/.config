;#HotIf !WinActive("ahk_exe Code.exe", )
;  return

!i:: {
  send("^+{tab}")
  return
}

!o:: {
  send("^{tab}")
  return
}

!s::
{
  send("^{w}")
  return
}

!n:: {
  send("^{t}")
  return
}

` & h:: {
  send("#{left}")
  return
}

` & l:: {
  send("#{right}")
  return
}

` & j:: {
  send("#{down}")
  return
}

` & k:: {
  send("#{up}")
  return
}

` & c:: {
  send("^#!0")
  return
}

` & s:: {
  send("^#!7")
  return
}

` & n:: {
  send("^#!9")
  return
}

`::`