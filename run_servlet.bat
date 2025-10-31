@echo off
setlocal enabledelayedexpansion

set "PROJECT_PATH=%~dp0"
set "SRC_JAVA_DIR=%PROJECT_PATH%src\java"
set "LIB_DIR=%PROJECT_PATH%lib"
set "SERVLET_API_JAR=%LIB_DIR%\servlet-api.jar"
set "WEBAPP_PATH=%PROJECT_PATH%src\main\webapp"
set "CLASSES_DIR=%PROJECT_PATH%src\main\classes"
set "CATALINA_HOME=D:\Dossier Tsitohaina\ITU\Installation\Apache Tomcat\apache-tomcat-10.1.28"
set "BUILD_DIR=%PROJECT_PATH%build"

echo ==================================================
echo Deploiement de l'application de test du Framework
echo ==================================================

echo Nettoyage des repertoires de build...
if exist "%BUILD_DIR%" rmdir /s /q "%BUILD_DIR%"
if exist "%CLASSES_DIR%" rmdir /s /q "%CLASSES_DIR%"

echo Creation des repertoires...
mkdir "%CLASSES_DIR%"
mkdir "%BUILD_DIR%"
mkdir "%BUILD_DIR%\WEB-INF"
mkdir "%BUILD_DIR%\WEB-INF\classes"
mkdir "%BUILD_DIR%\WEB-INF\lib"

echo Compilation des sources Java de l'application...
for /r "%SRC_JAVA_DIR%" %%f in (*.java) do (
    echo Compilation: %%f
    javac -d "%CLASSES_DIR%" -cp "%SERVLET_API_JAR%;%PROJECT_PATH%lib\servlet.jar" "%%f"
    if errorlevel 1 (
        echo ERREUR de compilation: %%f
        pause
        exit /b 1
    )
)

echo Copie des classes compilees dans le build...
if exist "%CLASSES_DIR%" (
    xcopy "%CLASSES_DIR%" "%BUILD_DIR%\WEB-INF\classes" /S /Y /I
) else (
    echo ATTENTION: Aucune classe compilee trouvee dans %CLASSES_DIR%
)

echo Copie des ressources web...
if exist "%WEBAPP_PATH%" (
    xcopy "%WEBAPP_PATH%" "%BUILD_DIR%" /S /Y /I
) else (
    echo ATTENTION: Repertoire webapp non trouve: %WEBAPP_PATH%
)

echo Copie du framework (servlet.jar)...
if exist "%PROJECT_PATH%lib\servlet.jar" (
    copy "%PROJECT_PATH%lib\servlet.jar" "%BUILD_DIR%\WEB-INF\lib\"
) else (
    echo ATTENTION: servlet.jar non trouve dans %PROJECT_PATH%lib\
)

echo Creation du fichier WAR...
cd /d "%BUILD_DIR%"
jar -cvf testFramework.war * > nul
if errorlevel 1 (
    echo ERREUR lors de la creation du WAR
    pause
    exit /b 1
)

echo Deploiement du WAR vers Tomcat...
if exist "%CATALINA_HOME%\webapps\testFramework.war" (
    echo Suppression de l'ancien WAR...
    del "%CATALINA_HOME%\webapps\testFramework.war"
    timeout /t 2 > nul
)

if exist "%CATALINA_HOME%\webapps\testFramework" (
    echo Suppression de l'ancien deploiement...
    rmdir /s /q "%CATALINA_HOME%\webapps\testFramework"
    timeout /t 2 > nul
)

move testFramework.war "%CATALINA_HOME%\webapps" > nul
if errorlevel 1 (
    echo ERREUR lors du deploiement vers Tomcat
    pause
    exit /b 1
)

echo.
echo ==================================================
echo DEPLOIEMENT REUSSI!
echo ==================================================
