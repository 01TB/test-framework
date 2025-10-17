@echo off
set PROJECT_PATH=%~dp0
set BUILD_PATH="%PROJECT_PATH%build"
set WEBAPP_PATH="%PROJECT_PATH%src\main\webapp"
set CATALINA_HOME="D:\Dossier Tsitohaina\ITU\Installation\Apache Tomcat\apache-tomcat-10.1.28"
set LIB_PATH="%PROJECT_PATH%lib"

rem Verifier si le dossier "build" existe et le supprimer
if exist %BUILD_PATH% (
    echo Suppression du dossier build...
    rmdir /s /q %BUILD_PATH%
)

rem Creer la structure de dossiers
echo Creation de la structure des dossiers...
mkdir %BUILD_PATH%
mkdir %BUILD_PATH%\WEB-INF
mkdir %BUILD_PATH%\WEB-INF\classes

rem Compilation des fichiers .java et sortie dans le repertoire classes
echo Compilation des fichiers Java...
javac -d %BUILD_PATH%\WEB-INF\classes -classpath %LIB_PATH%\servlet-api.jar;%LIB_PATH%\* "%PROJECT_PATH%src\main\java\*.java"

rem Copier le contenu de webapp dans build de manière recursive
echo Copie recursive des fichiers webapp...
xcopy %WEBAPP_PATH% %BUILD_PATH% /S /Y

rem Creer le fichier .war de ce qui se trouve dans build
echo Creation du fichier WAR...
cd %BUILD_PATH%
jar -cvf FrameworkServlet.war *

rem Deplacer le fichier .war dans le repertoire webapps de Tomcat
echo Deploiement du fichier WAR dans Tomcat...
move %BUILD_PATH%\FrameworkServlet.war %CATALINA_HOME%\webapps

echo Projet Servlet deploye et Tomcat pret a demarrer.
pause
