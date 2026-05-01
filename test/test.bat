@echo off
if "%1"=="zombi" goto zombi

:: 1. Adim: Kamerayi aciyoruz
start microsoft.windows.camera:

:: 2. Adim: 5 tane durmadan akan kanli "seni izliyorum" ekrani aciyoruz
for /l %%x in (1, 1, 5) do (
    start "KanliSaka%%x" cmd /c "%~f0" zombi
)

:: 3. Adim: Ana pencereyi gizlemek yerine, korkutucu bir tuzak ekrana ceviriyoruz
:: Bu ekran acik kaldigi surece ENTER tusunu bekleyecek.
title SISTEM KILITLENDI
color 0C
cls
echo.
echo ====================================================
echo DIKKAT: SISTEM ELE GECIRILDI!
echo KAMERA AKTIF. TUM VERILERINIZ KOPYALANIYOR...
echo ====================================================
echo.
echo (Sistemi kurtarmak imkansiz...)
:: Burada kod gizlice senin ENTER'a basmani bekliyor
pause >nul

:: 4. Adim: ENTER'a basildigi anda tum saka pencerelerini ve kamerayi yokediyoruz!
taskkill /f /fi "WINDOWTITLE eq KanliSaka*" >nul 2>&1
taskkill /f /im WindowsCamera.exe >nul 2>&1
exit

:zombi
:: Burasi acilan o 5 kucuk pencerenin gorevi
color 0C
:loop
echo seni izliyorum :)
ping 127.0.0.1 -n 2 >nul
goto loop