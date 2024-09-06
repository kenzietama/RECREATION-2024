#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

SetTitleMatchMode, 2

; Contoh script Autohotkey yang aku pakai setiap hari di WINDOWS ONLY, gak ada ahk versi linux
; AHK TIDAK CASE SENSITIVE
; syntax kayak piton, gak perlu pake braces (mostly), gak perlu pake ; setiap akhir line (bebas, kalau udah kebiasa juga tulis aja gak error)
; script ini pakai ahk versi 1.1, udah ada versi 2.x tapi aku gak pake karena ada yang perlu di migrasi koding ulang, jadi nanti tetep pake v1 pas RECREATION


; IMPORTANT
; KALAU UDAH INSTALL AUTOHOTKEY MISAL MAU GANTI TARGET APP NYA BISA PAKE WindowSpy.exe DI C:/Program Files/Autohotkey/WindowSpy.ahk
; USAHAKAN PAKAI ahk_exe, KALAU GAK BISA, PAKAI ahk_class

; ini biar dia run as admin
if (! A_IsAdmin) {
	Run *RunAs "%A_ScriptFullPath%"
	ExitApp
}

^r::Reload

; ini script ngemap F1 buat buka FILE EXPLORER, kalau ada banyak FILE EXPLORER yang kebuka kalau dipencet otomatis dia view window yang lain
; kalau window nya gak fullscreen dia otomatis maximize 
F1::
IfWinNotExist, ahk_class CabinetWClass
	Run, explorer.exe
	GroupAdd, explorergroup, ahk_class CabinetWClass
if WinActive ("ahk_exe explorer.exe")
	GroupActivate, explorergroup, r
else
	WinActivate ahk_class CabinetWClass
WinWaitActive ahk_class CabinetWClass
WinMaximize
return


; kalau yang ini F2 buat buka browser, bebas browser apa, kalau aku pakai rubahapi, kalau mau diganti bisa, bebas,
; ini kalau udah kebuka browsernya terus dipencet, dia next ke tab selanjutnya
F2::
IfWinActive, ahk_exe firefox.exe
	Send, ^{PgDn}
IfWinNotExist, ahk_exe firefox.exe
	Run, firefox.exe
else
	WinActivate, ahk_exe firefox.exe
WinWaitActive, ahk_exe firefox.exe
WinMaximize
return

; ini buat wa
; agak ribet soalnya dia aplikasi dari microsoft store
F3::
IfWinNotExist, ahk_class ApplicationFrameWindow, WhatsAp
    Run, C:\Program Files\WindowsApps\5319275A.WhatsAppDesktop_2.2434.5.0_x64__cv1g1gvanyjgm\WhatsApp.exe
else {
	WinActivate, ahk_class ApplicationFrameWindow, WhatsApp
}
WinWaitActive, ahk_class ApplicationFrameWindow, WhatsApp
WinMaximize
return

; ini buat dc
F4::
IfWinNotExist, ahk_exe discord.exe
    Run, C:\Users\%USERNAME%\AppData\Local\Discord\update.exe --processStart Discord.exe
Else
    WinActivate, ahk_exe discord.exe
WinWaitActive, ahk_exe discord.exe
WinMaximize
return

; bangg kenapa F5 gak dipake???
; F5 itu tombol refresh jangan lupa
; sebenernya bisa juga sih, gini caranya
; jadi dia akan kirim F1 (jadinya kayak yang F1 di atas) jika firefox gak kebuka
; itu dibungkus #IfWinNotActive terus ditutup #If lagi, kalo gak itu sampe bawah gak bakal bisa dipake kalau firefox kebuka

#IfWinNotActive ahk_exe firefox.exe
    F5::F1
#If


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

; ini buat mute discord
F7::
WinActivate, ahk_exe discord.exe
WinWaitActive, ahk_exe discord.exe
SendInput, ^+M                          ;^ itu ctrl, + itu shift, M itu ya M, coba aja manual pasti ke mute, jadi di ngirim shortcutnya ke dc
return


; ini buat end task apex legends (kadang di exit masih ada di task manager)
F8::
Runwait, taskkill /im r5apex.exe /f
return


; GroupAdd, tabswitch, ahk_exe msedge.exe
; GroupAdd, tabswitch, ahk_class CabinetWClass
; GroupAdd, tabswitch, ahk_exe Acrobat.exe
; GroupAdd, tabswitch, ahk_exe idea64.exe
; GroupAdd, tabswitch2, ahk_class XLMAIN
; GroupAdd, tabswitch2, ahk_exe Code.exe
; GroupAdd, tabswitch, ahk_exe firefox.exe

; 1::
; If WinActive("ahk_group tabswitch")
; 	Send, ^+{Tab}
; If WinActive("ahk_group tabswitch2")
; 	Send, ^{PgUp}
; return


; 2::
; If WinActive("ahk_group tabswitch")
; 	Send, ^{Tab}
; If WinActive("ahk_group tabswitch2")
; 	Send, ^{PgDn}
; return


; 3::
; IfWinNotExist, ahk_class OpusApp
; 	Run, WINWORD.exe
; GroupAdd, wordgroup, ahk_class OpusApp
; if WinActive ("ahk_exe WINWORD.exe")
; 	GroupActivate, wordgroup, r
; else
; {
; 	WinActivate ahk_class OpusApp
; 	}
; ;Suspend, On
; return

; 4::
; IfWinNotExist, ahk_class XLMAIN
; 	Run, EXCEL.exe
; GroupAdd, excelgroup, ahk_class XLMAIN
; if WinActive ("ahk_exe EXCEL.exe")
; 	GroupActivate, excelgroup, r
; else
; {
; 	WinActivate ahk_class XLMAIN
; 	}
; ;Suspend, On
; return

; 5::
; IfWinNotExist, ahk_class PPTFrameClass
; 	Run, POWERPNT.exe
; GroupAdd, pptgroup, ahk_class PPTFrameClass
; if WinActive ("ahk_exe POWERPNT.exe")
; 	GroupActivate, pptgroup, r
; else
; {
; 	WinActivate ahk_class PPTFrameClass
; 	}
; ;Suspend, On
; return