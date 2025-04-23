@echo off
echo ========================================
echo تشغيل تطبيق MVC Lab Project
echo ========================================

REM تعيين مسار Java JDK
set JAVA_HOME=C:\Program Files\Java\jdk-17
set JRE_HOME=C:\Program Files\Java\jdk-17
set PATH=%JAVA_HOME%\bin;%PATH%

echo تم تعيين JAVA_HOME إلى: %JAVA_HOME%

REM إنشاء مجلد target إذا لم يكن موجوداً
if not exist "c:\Users\alala\Desktop\MVCLabProject\target" mkdir "c:\Users\alala\Desktop\MVCLabProject\target"

REM إنشاء ملف WAR من جديد
echo جاري إنشاء ملف WAR...
cd /d c:\Users\alala\Desktop\MVCLabProject
jar -cvf target\MVCLabProject.war -C src\main\webapp .
jar -uvf target\MVCLabProject.war -C build\classes .

REM اسأل المستخدم عن مسار Tomcat الجديد
set TOMCAT_PATH=C:\Users\alala\Desktop\apache-tomcat-10.1.40
if not exist "%TOMCAT_PATH%" (
    echo.
    echo =========================================================
    echo يبدو أن Tomcat 10.1.x لم يتم تثبيته بعد في المسار الافتراضي
    echo الرجاء تحديد مسار تثبيت Tomcat 10.1.40:
    echo على سبيل المثال: C:\Users\alala\Desktop\apache-tomcat-10.1.40
    echo =========================================================
    set /p TOMCAT_PATH=أدخل مسار Tomcat: 
)

REM نسخ ملف WAR إلى مجلد webapps في Tomcat
echo جاري نسخ ملف WAR إلى Tomcat...
copy /Y "c:\Users\alala\Desktop\MVCLabProject\target\MVCLabProject.war" "%TOMCAT_PATH%\webapps\"

REM تشغيل Tomcat
echo جاري تشغيل Tomcat...
cd /d %TOMCAT_PATH%\bin
call catalina.bat run

pause