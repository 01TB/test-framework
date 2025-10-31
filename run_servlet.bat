@echo off
setlocal enabledelayedexpansion

set PROJECT_PATH=%~dp0
rem Obtenir le chemin court sans espaces pour BUILD_PATH
for /f "delims=" %%I in ("%PROJECT_PATH%build") do set BUILD_PATH=%%~sI
set WEBAPP_PATH="%PROJECT_PATH%src\main\webapp"
set CATALINA_HOME="D:\Dossier Tsitohaina\ITU\Installation\Apache Tomcat\apache-tomcat-10.1.28"
set LIB_PATH="%PROJECT_PATH%lib"

echo Nettoyage du build precedent...
if exist %BUILD_PATH% rmdir /s /q %BUILD_PATH%

echo Creation de la structure...
mkdir %BUILD_PATH%
mkdir %BUILD_PATH%\WEB-INF
mkdir %BUILD_PATH%\WEB-INF\classes

echo Compilation de TOUTES les sources Java...
for /r "%PROJECT_PATH%src" %%f in (*.java) do (
    echo Compilation: %%f
    javac -d "%BUILD_PATH%\WEB-INF\classes" -cp "%LIB_PATH%\servlet-api.jar;%LIB_PATH%\*" "%%f"
    if errorlevel 1 (
        echo ERREUR de compilation: %%f
        pause
        exit /b 1
    )
)

echo Copie des ressources web...
xcopy "%WEBAPP_PATH%" "%BUILD_PATH%" /S /Y /I

echo Creation du WAR...
cd "%BUILD_PATH%"
jar -cvf testFramework.war * > nul

echo Deploiement vers Tomcat...
move testFramework.war "%CATALINA_HOME%\webapps" > nul

echo.
echo ========================================
echo Deploiement termine avec succes!
echo ========================================
echo.
pause