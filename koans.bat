@echo off
setlocal
rem Leiningen 2.13 needs Java 11+, but the system JRE is 1.8.
rem Borrow the JDK bundled with an installed JetBrains IDE.
if "%JAVA_CMD%"=="" (
    for /d %%d in ("%ProgramFiles%\JetBrains\*") do (
        if exist "%%d\jbr\bin\java.exe" set "JAVA_CMD=%%d\jbr\bin\java.exe"
    )
)
if "%JAVA_CMD%"=="" (
    echo No Java 11+ found. Install a JDK, or set JAVA_CMD by hand.
    exit /b 1
)
"%USERPROFILE%\bin\lein.bat" koan run
