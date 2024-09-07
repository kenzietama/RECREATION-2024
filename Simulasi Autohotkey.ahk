#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

SetTitleMatchMode, 2

; mengubah font dan ukuran string menjadi courier new dan ukuran 10
; contoh penggunaan misal di container source code di laprak
; cara pakai: block string yang ingin di format terus tinggal tekan F6
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
