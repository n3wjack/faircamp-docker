@echo off

SET FCVERSION=

:PROCESSPARAM

if "%1" NEQ "" (
    set FCVERSION=%1
    goto :BUILD
)

:USAGE
echo Usage:
echo.
echo  build-container.cmd version
echo.
echo     version: the Faircamp version to build the container for.
echo.
echo E.g.
echo     build-container.cmd 1.1
echo.
goto:EOF

:BUILD

echo - Building for Faircamp version %FCVERSION%

:: Build the Docker container.
docker build --build-arg VERSION=%FCVERSION% . -t n3wjack/faircamp:latest 

if %ERRORLEVEL%==0 (
    :: Tag the release
    docker tag n3wjack/faircamp n3wjack/faircamp:%1
) else (
    echo.
    echo ERROR: Could not build Faircamp container image.
    echo.
) 
