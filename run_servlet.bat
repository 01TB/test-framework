@echo off
set PROJECT_PATH=%~dp0
set BUILD_PATH="%PROJECT_PATH%build"
set WEBAPP_PATH="%PROJECT_PATH%src\main\webapp"
set CATALINA_HOME="D:\Dossier Tsitohaina\ITU\Installation\Apache Tomcat\apache-tomcat-10.1.28"
set LIB_PATH="%PROJECT_PATH%lib"

rem Vérifier si le dossier "build" existe et le supprimer
if exist %BUILD_PATH% (
    echo Suppression du dossier build...
    rmdir /s /q %BUILD_PATH%
)

rem Créer la structure de dossiers
echo Création de la structure des dossiers...
mkdir %BUILD_PATH%
mkdir %BUILD_PATH%\WEB-INF
mkdir %BUILD_PATH%\WEB-INF\classes

rem Compilation des fichiers .java et sortie dans le répertoire classes
echo Compilation des fichiers Java...
javac -d %BUILD_PATH%\WEB-INF\classes -classpath %LIB_PATH%\servlet-api.jar;%LIB_PATH%\* "%PROJECT_PATH%src\main\java\*.java"

rem Copier le contenu de webapp dans build de manière récursive
echo Copie récursive des fichiers webapp...
xcopy %WEBAPP_PATH% %BUILD_PATH% /S /Y

rem Créer le fichier .war de ce qui se trouve dans build
echo Création du fichier WAR...
cd %BUILD_PATH%
jar -cvf FrameworkServlet.war *

rem Déplacer le fichier .war dans le répertoire webapps de Tomcat
echo Déploiement du fichier WAR dans Tomcat...
move %BUILD_PATH%\FrameworkServlet.war %CATALINA_HOME%\webapps

echo Projet Servlet déployé et Tomcat prêt à démarrer.
pause
