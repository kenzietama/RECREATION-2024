#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

SetTitleMatchMode, 2

; ini biar dia run as admin
if (! A_IsAdmin) {
	Run *RunAs "%A_ScriptFullPath%"
	ExitApp
}

; mengubah font dan ukuran string menjadi courier new dan ukuran 10
; contoh penggunaan misal di container source code di laprak
; cara pakai: buka microsoft word kemudian block string yang ingin di format terus tinggal tekan F6
F6::
Send, !hff
Sleep, 10
Send, courier
Sleep, 10
Send, {Tab}
Sleep, 10
Send, 10
Sleep, 10
Send, {Enter}
Return
