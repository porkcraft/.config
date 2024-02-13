#==== Startup Location ====#
Set-Location ~\.config

#==== Prompt Config ====#
oh-my-posh init pwsh --config ~\.config\pwsh\m2k-slash.json | Invoke-Expression

#==== Terminal-Icons & PSReadLine ====#
Import-Module -Name Terminal-Icons
$PSReadLineOptions = @{
	EditMode = "Vi"
	BellStyle = "None"
	PredictionSource = "History"
	#PredictionViewStyle = "ListView"
}
Set-PSReadLineOption @PSReadLineOptions
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
SEt-PSReadlineKeyHandler -Chord Alt+[ -Function ViCommandMode

#==== Aliases ====#
Set-Alias vim nvim
Set-Alias open ii
Set-Alias g git
Set-Alias st status
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'
Set-Alias vs '~\AppData\Local\Programs\Microsoft VS Code\Code.exe'
Set-Alias ipy '~\AppData\Local\Programs\Python\Python311\Scripts\ipython.exe'

#==== Core Locations ====#
function home
{ set-location ~
}
function config
{ set-location ~\.config
}
function dev
{ Set-Location ~\Developments
}
function docs
{ Set-Location ~\Documents
}
function vault
{ Set-Location D:\TheVault
}
function download
{ Set-Location ~\Downloads
}
function sc
{ Set-Location ~\Scoop
}
function scapps
{ Set-Location ~\Scoop\apps
}
function cleanscoop
{ scoop cache rm --all; scoop cleanup --all
}

#==== Utilities ====#
function which ($command)
{
	Get-Command -Name $command -ErrorAction SilentlyContinue Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}
