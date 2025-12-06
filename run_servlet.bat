@echo off
setlocal enabledelayedexpansion

rem === Chemins ===
set "PROJECT_PATH=D:\Dossier Tsitohaina\ITU\L3\Framework\test-framework\test-framework"
set "SRC_JAVA_DIR=%PROJECT_PATH%\src\java"
set "LIB_DIR=%PROJECT_PATH%\lib"
set "SERVLET_API_JAR=%LIB_DIR%\servlet-api.jar"
set "FRAMEWORK_JAR=%LIB_DIR%\servlet.jar"
set "WEBAPP_PATH=%PROJECT_PATH%\src\main\webapp"
set "CLASSES_DIR=%PROJECT_PATH%\src\main\classes"
set "CATALINA_HOME=D:\Dossier Tsitohaina\ITU\Installation\Apache Tomcat\apache-tomcat-10.1.28"
set "BUILD_DIR=%PROJECT_PATH%\build"
set "FILE_LIST=%TEMP%\javac_files.txt"

echo ==================================================
echo Deploiement de l'application de test du Framework
echo ==================================================

echo Nettoyage...
if exist "%BUILD_DIR%" rmdir /s /q "%BUILD_DIR%"
if exist "%CLASSES_DIR%" rmdir /s /q "%CLASSES_DIR%"
if exist "%FILE_LIST%" del "%FILE_LIST%"

echo Creation des repertoires...
mkdir "%CLASSES_DIR%" 2>nul
mkdir "%BUILD_DIR%" 2>nul
mkdir "%BUILD_DIR%\WEB-INF" 2>nul
mkdir "%BUILD_DIR%\WEB-INF\classes" 2>nul
mkdir "%BUILD_DIR%\WEB-INF\lib" 2>nul

echo Verification JARs...
if not exist "%SERVLET_API_JAR%" (
    echo ERREUR: servlet-api.jar manquant
    pause & exit /b 1
)
if not exist "%FRAMEWORK_JAR%" (
    echo ERREUR: servlet.jar manquant
    pause & exit /b 1
)

set "CP=%SERVLET_API_JAR%;%FRAMEWORK_JAR%;%CLASSES_DIR%"

rem === Création de la liste des fichiers ===
echo Preparation des fichiers .java...
del "%FILE_LIST%" 2>nul
for /r "%SRC_JAVA_DIR%" %%f in (*.java) do (
    echo %%~f>> "%FILE_LIST%"
)

if not exist "%FILE_LIST%" (
    echo ERREUR: Aucun .java
    pause & exit /b 1
)

rem === Construction de la commande javac avec guillemets ===
set "JAVAC_CMD=javac -d "%CLASSES_DIR%" -cp "%CP%""

for /f "usebackq delims=" %%f in ("%FILE_LIST%") do (
    set "JAVAC_CMD=!JAVAC_CMD! "%%f""
)

echo Compilation...
%JAVAC_CMD%
if errorlevel 1 (
    echo.
    echo ==================================================
    echo ECHEC DE LA COMPILATION
    echo ==================================================
    echo Commande executee:
    echo %JAVAC_CMD%
    pause
    exit /b 1
)

echo Compilation reussie!
del "%FILE_LIST%"

echo Copie classes...
xcopy "%CLASSES_DIR%" "%BUILD_DIR%\WEB-INF\classes" /S /Y /I > nul

echo Copie webapp...
if exist "%WEBAPP_PATH%" (
    xcopy "%WEBAPP_PATH%" "%BUILD_DIR%" /S /Y /I > nul
)

echo Copie framework...
copy "%FRAMEWORK_JAR%" "%BUILD_DIR%\WEB-INF\lib\" > nul

echo Creation WAR...
cd /d "%BUILD_DIR%"
jar -cvf testFramework.war * > nul
if errorlevel 1 (
    echo ERREUR WAR
    pause & exit /b 1
)

echo Deploiement Tomcat...
if exist "%CATALINA_HOME%\webapps\testFramework.war" del "%CATALINA_HOME%\webapps\testFramework.war"
if exist "%CATALINA_HOME%\webapps\testFramework" rmdir /s /q "%CATALINA_HOME%\webapps\testFramework"
timeout /t 2 > nul
move testFramework.war "%CATALINA_HOME%\webapps" > nul

echo.
echo ==================================================
echo DEPLOIEMENT REUSSI!
echo ==================================================
pause