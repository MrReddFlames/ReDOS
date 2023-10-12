::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAnk
::fBw5plQjdG8=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCuDJGuB0G0DeUsEDDaHMG67FbAg2u3fwNnW7B1TBKw6YIq7
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
system\conshowcursor /hide
system\consetbuffer /X 80 /Y 26
system\batbox /f 0
timeout /t 3 /nobreak >nul
echo Loading ReDOS 1.0.0 ....
timeout /t 2 /nobreak >nul
cls
timeout /t 1 /nobreak >nul
echo Copyright(c) ReCTF Co.
echo Welcome to ReDOS - use "help" for a list of available commands.
echo.
:main
set /p command="> "

if "%command%"=="" goto main

if "%command%"=="exit" (
    echo Goodbye!
    timeout /t 2 /nobreak >nul
    shutdown /s /f /t 0
    exit /b
)

if "%command%"=="exitdev" (
    echo Goodbye!
    timeout /t 1 /nobreak >nul
    exit /b
)

if "%command%"=="date" (
    echo Today's date is %date%
    goto main
)

if "%command%"=="time" (
    echo Current time is %time%
    goto main
)

if "%command%"=="dir" (
    dir
    goto main
)

if "%command%"=="calc" (
    set /p "expression=Enter a mathematical expression: "
    if not defined expression (
        echo No input provided.
    ) else (
        set /a "result=%expression%"
        echo Result: %result%
    )
    goto main
)

if "%command%"=="unhelp" (
    echo Unavailable commands:
    echo - info: [NOT AVAILABLE] Shows version number and info
    goto main
)

if "%command%"=="help" (
    echo Available commands:
    echo - date: Display the current date
    echo - time: Display the current time
    echo - dir: List files in the current directory
    echo - calc: Perform a simple calculation (Broken
    echo - help: Show this list of available commands
    echo - shutdown: Shutdown ReDOS
    echo - hello: ReDOS Greeting
    echo - cd: Change Directories
    echo - list: List files and directories in the current folder
    echo - notepad: Open a text editor
    echo - cls: Clear the screen
    echo - cmd: Starts Command Prompt
    echo - print [text]: Display text
    echo - echo [text]: Alternative for print
    echo - mkdir [directory]: Create a directory
    echo - rmdir [directory]: Remove a directory
    echo - install [package]: Install a package using winget [WIP]
    echo - diskpart: Launch the DiskPart utility
    echo - unhelp: Shows a list of unavailable commands
    goto main
)

if "%command%"=="shutdown" (
    echo Shutting down....
    shutdown /s /f /t 0
    exit /b
)

if "%command:~0,3%"=="cd " (
    set folderName=%command:~3%
    pushd "%folderName%" 2>nul
    if errorlevel 1 (
        echo Folder not found: "%folderName%"
    ) else (
        echo Changed to folder: "%cd%"
    )
    goto main
)

if "%command%"=="hello" (
    echo Hello! Thank you for using ReDOS!
    goto main
)

if "%command%"=="list" (
    dir
    goto main
)

if "%command%"=="notepad" (
    set "tempFile=%temp%\reDosNotepad.txt"
    if not exist "%tempFile%" type nul > "%tempFile%"
    start notepad "%tempFile%"
    goto main
)

if "%command%"=="cls" (
    cls
    goto main
)

if "%command%"=="cmd" (
    start cmd
    echo Starting cmd.exc
    goto main
)

if "%command:~0,6%"=="print " (
    echo %command:~6%
    goto main
)

if "%command:~0,5%"=="echo " (
    echo %command:~5%
    goto main
)

if "%command:~0,6%"=="mkdir " (
    mkdir "%command:~6%"
    goto main
)

if "%command:~0,6%"=="rmdir " (
    rmdir /s /q "%command:~6%"
    goto main
)

if "%command:~0,8%"=="install " (
    set "package=%command:~8%"
    if "%package%"=="" (
        echo Package name not provided. Please specify a package to install.
    ) else (
        winget install %package%
        if %errorlevel% equ 0 (
            echo Installation of %package% succeeded.
        ) else (
            echo Installation of %package% failed.
        )
    )
    goto main
)

if "%command%"=="diskpart" (
    echo Opening Diskpart....
    diskpart
    goto main
)

if not defined command goto main
echo Invalid command: %command%
goto main
