@echo off

echo.
echo  _______ _______ ___ ______   _______ _______ __   __ _______
echo ^|       ^|       ^|   ^|    _ ^| ^|       ^|       ^|  ^|_^|  ^|       ^|
echo ^|    ___^|   _   ^|   ^|   ^| ^|^| ^|       ^|   _   ^|       ^|    _  ^|
echo ^|   ^|___^|  ^|_^|  ^|   ^|   ^|_^|^|_^|      _^|  ^|_^|  ^|       ^|   ^|_^| ^|
echo ^|    ___^|       ^|   ^|    __  ^|     ^| ^|       ^|       ^|    ___^|
echo ^|   ^|   ^|   _   ^|   ^|   ^|  ^| ^|     ^|_^|   _   ^| ^|^|_^|^| ^|   ^|
echo ^|___^|   ^|__^| ^|__^|___^|___^|  ^|_^|_______^|__^| ^|__^|_^|   ^|_^|___^|
echo  -- in docker -- https://github.com/n3wjack/faircamp-docker
echo.

if NOT EXIST "%cd%\data" (
    echo Whoops. You do not have a .\data folder in the current folder: %cd%
    echo Please create the folder, and put your Faircamp/music files in the folder. See the Faircamp manual for more information.
    echo.
    pause
    goto :EOF
)

:build

echo Building the Faircamp site in %cd%\data\.faircamp_build ...
echo.
docker run -ti -v %cd%\data:/data --rm n3wjack/faircamp

echo.
echo Building a browsable version in %cd%\data\.faircamp_build_browsable ...
echo.
docker run -ti -v %cd%\data:/data --rm n3wjack/faircamp --build-dir .faircamp_build_browsable --no-clean-urls

echo.
echo You can find your Faircamp site to upload in:
echo - %cd%\data\.faircamp_build
echo.
echo A browseable version can be found in:
echo - %cd%\data\.faircamp_build_browsable
echo.

start %cd%/data/.faircamp_build_browsable/index.html

set /p response=Do you want to do another build, or stop? [y/n] : 

echo.
if /I %response%==y goto :build

