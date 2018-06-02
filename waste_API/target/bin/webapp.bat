@REM ----------------------------------------------------------------------------
@REM  Copyright 2001-2006 The Apache Software Foundation.
@REM
@REM  Licensed under the Apache License, Version 2.0 (the "License");
@REM  you may not use this file except in compliance with the License.
@REM  You may obtain a copy of the License at
@REM
@REM       http://www.apache.org/licenses/LICENSE-2.0
@REM
@REM  Unless required by applicable law or agreed to in writing, software
@REM  distributed under the License is distributed on an "AS IS" BASIS,
@REM  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@REM  See the License for the specific language governing permissions and
@REM  limitations under the License.
@REM ----------------------------------------------------------------------------
@REM
@REM   Copyright (c) 2001-2006 The Apache Software Foundation.  All rights
@REM   reserved.

@echo off

set ERROR_CODE=0

:init
@REM Decide how to startup depending on the version of windows

@REM -- Win98ME
if NOT "%OS%"=="Windows_NT" goto Win9xArg

@REM set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" @setlocal

@REM -- 4NT shell
if "%eval[2+2]" == "4" goto 4NTArgs

@REM -- Regular WinNT shell
set CMD_LINE_ARGS=%*
goto WinNTGetScriptDir

@REM The 4NT Shell from jp software
:4NTArgs
set CMD_LINE_ARGS=%$
goto WinNTGetScriptDir

:Win9xArg
@REM Slurp the command line arguments.  This loop allows for an unlimited number
@REM of arguments (up to the command line limit, anyway).
set CMD_LINE_ARGS=
:Win9xApp
if %1a==a goto Win9xGetScriptDir
set CMD_LINE_ARGS=%CMD_LINE_ARGS% %1
shift
goto Win9xApp

:Win9xGetScriptDir
set SAVEDIR=%CD%
%0\
cd %0\..\.. 
set BASEDIR=%CD%
cd %SAVEDIR%
set SAVE_DIR=
goto repoSetup

:WinNTGetScriptDir
set BASEDIR=%~dp0\..

:repoSetup
set REPO=


if "%JAVACMD%"=="" set JAVACMD=java

if "%REPO%"=="" set REPO=%BASEDIR%\repo

set CLASSPATH="%BASEDIR%"\etc;"%REPO%"\org\springframework\boot\spring-boot-starter-data-jpa\1.5.4.RELEASE\spring-boot-starter-data-jpa-1.5.4.RELEASE.jar;"%REPO%"\org\springframework\boot\spring-boot-starter\1.5.4.RELEASE\spring-boot-starter-1.5.4.RELEASE.jar;"%REPO%"\org\springframework\boot\spring-boot\1.5.4.RELEASE\spring-boot-1.5.4.RELEASE.jar;"%REPO%"\org\springframework\boot\spring-boot-autoconfigure\1.5.4.RELEASE\spring-boot-autoconfigure-1.5.4.RELEASE.jar;"%REPO%"\org\springframework\boot\spring-boot-starter-logging\1.5.4.RELEASE\spring-boot-starter-logging-1.5.4.RELEASE.jar;"%REPO%"\ch\qos\logback\logback-classic\1.1.11\logback-classic-1.1.11.jar;"%REPO%"\ch\qos\logback\logback-core\1.1.11\logback-core-1.1.11.jar;"%REPO%"\org\slf4j\jul-to-slf4j\1.7.25\jul-to-slf4j-1.7.25.jar;"%REPO%"\org\slf4j\log4j-over-slf4j\1.7.25\log4j-over-slf4j-1.7.25.jar;"%REPO%"\org\yaml\snakeyaml\1.17\snakeyaml-1.17.jar;"%REPO%"\org\springframework\boot\spring-boot-starter-aop\1.5.4.RELEASE\spring-boot-starter-aop-1.5.4.RELEASE.jar;"%REPO%"\org\springframework\spring-aop\4.3.9.RELEASE\spring-aop-4.3.9.RELEASE.jar;"%REPO%"\org\aspectj\aspectjweaver\1.8.10\aspectjweaver-1.8.10.jar;"%REPO%"\org\springframework\boot\spring-boot-starter-jdbc\1.5.4.RELEASE\spring-boot-starter-jdbc-1.5.4.RELEASE.jar;"%REPO%"\org\apache\tomcat\tomcat-jdbc\8.5.15\tomcat-jdbc-8.5.15.jar;"%REPO%"\org\apache\tomcat\tomcat-juli\8.5.15\tomcat-juli-8.5.15.jar;"%REPO%"\org\springframework\spring-jdbc\4.3.9.RELEASE\spring-jdbc-4.3.9.RELEASE.jar;"%REPO%"\javax\transaction\javax.transaction-api\1.2\javax.transaction-api-1.2.jar;"%REPO%"\org\springframework\data\spring-data-jpa\1.11.4.RELEASE\spring-data-jpa-1.11.4.RELEASE.jar;"%REPO%"\org\springframework\data\spring-data-commons\1.13.4.RELEASE\spring-data-commons-1.13.4.RELEASE.jar;"%REPO%"\org\springframework\spring-orm\4.3.9.RELEASE\spring-orm-4.3.9.RELEASE.jar;"%REPO%"\org\springframework\spring-context\4.3.9.RELEASE\spring-context-4.3.9.RELEASE.jar;"%REPO%"\org\springframework\spring-tx\4.3.9.RELEASE\spring-tx-4.3.9.RELEASE.jar;"%REPO%"\org\springframework\spring-beans\4.3.9.RELEASE\spring-beans-4.3.9.RELEASE.jar;"%REPO%"\org\slf4j\jcl-over-slf4j\1.7.25\jcl-over-slf4j-1.7.25.jar;"%REPO%"\org\springframework\spring-aspects\4.3.9.RELEASE\spring-aspects-4.3.9.RELEASE.jar;"%REPO%"\org\springframework\boot\spring-boot-starter-web\1.5.4.RELEASE\spring-boot-starter-web-1.5.4.RELEASE.jar;"%REPO%"\org\springframework\boot\spring-boot-starter-tomcat\1.5.4.RELEASE\spring-boot-starter-tomcat-1.5.4.RELEASE.jar;"%REPO%"\org\apache\tomcat\embed\tomcat-embed-core\8.5.15\tomcat-embed-core-8.5.15.jar;"%REPO%"\org\apache\tomcat\embed\tomcat-embed-el\8.5.15\tomcat-embed-el-8.5.15.jar;"%REPO%"\org\apache\tomcat\embed\tomcat-embed-websocket\8.5.15\tomcat-embed-websocket-8.5.15.jar;"%REPO%"\org\hibernate\hibernate-validator\5.3.5.Final\hibernate-validator-5.3.5.Final.jar;"%REPO%"\javax\validation\validation-api\1.1.0.Final\validation-api-1.1.0.Final.jar;"%REPO%"\com\fasterxml\classmate\1.3.3\classmate-1.3.3.jar;"%REPO%"\com\fasterxml\jackson\core\jackson-databind\2.8.8\jackson-databind-2.8.8.jar;"%REPO%"\com\fasterxml\jackson\core\jackson-annotations\2.8.0\jackson-annotations-2.8.0.jar;"%REPO%"\com\fasterxml\jackson\core\jackson-core\2.8.8\jackson-core-2.8.8.jar;"%REPO%"\org\springframework\spring-web\4.3.9.RELEASE\spring-web-4.3.9.RELEASE.jar;"%REPO%"\org\springframework\spring-webmvc\4.3.9.RELEASE\spring-webmvc-4.3.9.RELEASE.jar;"%REPO%"\org\springframework\spring-expression\4.3.9.RELEASE\spring-expression-4.3.9.RELEASE.jar;"%REPO%"\mysql\mysql-connector-java\5.1.45\mysql-connector-java-5.1.45.jar;"%REPO%"\org\objenesis\objenesis\2.1\objenesis-2.1.jar;"%REPO%"\org\springframework\spring-core\4.3.9.RELEASE\spring-core-4.3.9.RELEASE.jar;"%REPO%"\org\hibernate\hibernate-core\4.1.4.Final\hibernate-core-4.1.4.Final.jar;"%REPO%"\antlr\antlr\2.7.7\antlr-2.7.7.jar;"%REPO%"\org\jboss\logging\jboss-logging\3.3.1.Final\jboss-logging-3.3.1.Final.jar;"%REPO%"\org\jboss\spec\javax\transaction\jboss-transaction-api_1.1_spec\1.0.0.Final\jboss-transaction-api_1.1_spec-1.0.0.Final.jar;"%REPO%"\dom4j\dom4j\1.6.1\dom4j-1.6.1.jar;"%REPO%"\org\hibernate\javax\persistence\hibernate-jpa-2.0-api\1.0.1.Final\hibernate-jpa-2.0-api-1.0.1.Final.jar;"%REPO%"\org\javassist\javassist\3.21.0-GA\javassist-3.21.0-GA.jar;"%REPO%"\org\hibernate\common\hibernate-commons-annotations\4.0.1.Final\hibernate-commons-annotations-4.0.1.Final.jar;"%REPO%"\org\hibernate\hibernate-entitymanager\5.2.3.Final\hibernate-entitymanager-5.2.3.Final.jar;"%REPO%"\org\hibernate\javax\persistence\hibernate-jpa-2.1-api\1.0.0.Final\hibernate-jpa-2.1-api-1.0.0.Final.jar;"%REPO%"\org\apache\geronimo\specs\geronimo-jta_1.1_spec\1.1.1\geronimo-jta_1.1_spec-1.1.1.jar;"%REPO%"\com\googlecode\json-simple\json-simple\1.1.1\json-simple-1.1.1.jar;"%REPO%"\org\apache\httpcomponents\httpclient\4.5.2\httpclient-4.5.2.jar;"%REPO%"\org\apache\httpcomponents\httpcore\4.4.6\httpcore-4.4.6.jar;"%REPO%"\commons-codec\commons-codec\1.10\commons-codec-1.10.jar;"%REPO%"\com\sparkjava\spark-core\2.2\spark-core-2.2.jar;"%REPO%"\org\slf4j\slf4j-api\1.7.25\slf4j-api-1.7.25.jar;"%REPO%"\org\slf4j\slf4j-simple\1.7.25\slf4j-simple-1.7.25.jar;"%REPO%"\org\eclipse\jetty\jetty-server\9.4.5.v20170502\jetty-server-9.4.5.v20170502.jar;"%REPO%"\javax\servlet\javax.servlet-api\3.1.0\javax.servlet-api-3.1.0.jar;"%REPO%"\org\eclipse\jetty\jetty-http\9.4.5.v20170502\jetty-http-9.4.5.v20170502.jar;"%REPO%"\org\eclipse\jetty\jetty-util\9.4.5.v20170502\jetty-util-9.4.5.v20170502.jar;"%REPO%"\org\eclipse\jetty\jetty-io\9.4.5.v20170502\jetty-io-9.4.5.v20170502.jar;"%REPO%"\org\eclipse\jetty\jetty-webapp\9.4.5.v20170502\jetty-webapp-9.4.5.v20170502.jar;"%REPO%"\org\eclipse\jetty\jetty-xml\9.4.5.v20170502\jetty-xml-9.4.5.v20170502.jar;"%REPO%"\org\eclipse\jetty\jetty-servlet\9.4.5.v20170502\jetty-servlet-9.4.5.v20170502.jar;"%REPO%"\org\eclipse\jetty\jetty-security\9.4.5.v20170502\jetty-security-9.4.5.v20170502.jar;"%REPO%"\com\sparkjava\spark-template-freemarker\2.0.0\spark-template-freemarker-2.0.0.jar;"%REPO%"\org\freemarker\freemarker\2.3.26-incubating\freemarker-2.3.26-incubating.jar;"%REPO%"\com\heroku\sdk\heroku-jdbc\0.1.1\heroku-jdbc-0.1.1.jar;"%REPO%"\com\heroku\sdk\heroku-maven-plugin\2.0.4\heroku-maven-plugin-2.0.4.jar;"%REPO%"\com\heroku\sdk\heroku-deploy\2.0.4\heroku-deploy-2.0.4.jar;"%REPO%"\org\apache\commons\commons-compress\1.15\commons-compress-1.15.jar;"%REPO%"\commons-io\commons-io\2.6\commons-io-2.6.jar;"%REPO%"\org\apache\commons\commons-text\1.1\commons-text-1.1.jar;"%REPO%"\org\eclipse\jgit\org.eclipse.jgit\4.5.3.201708160445-r\org.eclipse.jgit-4.5.3.201708160445-r.jar;"%REPO%"\com\jcraft\jsch\0.1.53\jsch-0.1.53.jar;"%REPO%"\com\googlecode\javaewah\JavaEWAH\0.7.9\JavaEWAH-0.7.9.jar;"%REPO%"\com\heroku\api\heroku-api\0.31\heroku-api-0.31.jar;"%REPO%"\com\heroku\api\heroku-json-jackson\0.31\heroku-json-jackson-0.31.jar;"%REPO%"\org\codehaus\jackson\jackson-mapper-asl\1.9.10\jackson-mapper-asl-1.9.10.jar;"%REPO%"\org\codehaus\jackson\jackson-core-asl\1.9.10\jackson-core-asl-1.9.10.jar;"%REPO%"\com\heroku\api\heroku-http-apache\0.31\heroku-http-apache-0.31.jar;"%REPO%"\org\apache\maven\maven-plugin-api\3.5.0\maven-plugin-api-3.5.0.jar;"%REPO%"\org\apache\maven\maven-model\3.5.0\maven-model-3.5.0.jar;"%REPO%"\org\eclipse\sisu\org.eclipse.sisu.plexus\0.3.3\org.eclipse.sisu.plexus-0.3.3.jar;"%REPO%"\javax\enterprise\cdi-api\1.0\cdi-api-1.0.jar;"%REPO%"\javax\annotation\jsr250-api\1.0\jsr250-api-1.0.jar;"%REPO%"\org\eclipse\sisu\org.eclipse.sisu.inject\0.3.3\org.eclipse.sisu.inject-0.3.3.jar;"%REPO%"\org\apache\maven\maven-core\3.5.0\maven-core-3.5.0.jar;"%REPO%"\org\apache\maven\maven-settings\3.5.0\maven-settings-3.5.0.jar;"%REPO%"\org\apache\maven\maven-settings-builder\3.5.0\maven-settings-builder-3.5.0.jar;"%REPO%"\org\apache\maven\maven-builder-support\3.5.0\maven-builder-support-3.5.0.jar;"%REPO%"\org\apache\maven\maven-repository-metadata\3.5.0\maven-repository-metadata-3.5.0.jar;"%REPO%"\org\apache\maven\maven-model-builder\3.5.0\maven-model-builder-3.5.0.jar;"%REPO%"\com\google\guava\guava\20.0\guava-20.0.jar;"%REPO%"\org\apache\maven\maven-resolver-provider\3.5.0\maven-resolver-provider-3.5.0.jar;"%REPO%"\org\apache\maven\resolver\maven-resolver-impl\1.0.3\maven-resolver-impl-1.0.3.jar;"%REPO%"\org\apache\maven\resolver\maven-resolver-api\1.0.3\maven-resolver-api-1.0.3.jar;"%REPO%"\org\apache\maven\resolver\maven-resolver-spi\1.0.3\maven-resolver-spi-1.0.3.jar;"%REPO%"\org\apache\maven\resolver\maven-resolver-util\1.0.3\maven-resolver-util-1.0.3.jar;"%REPO%"\org\apache\maven\shared\maven-shared-utils\3.1.0\maven-shared-utils-3.1.0.jar;"%REPO%"\com\google\inject\guice\4.0\guice-4.0-no_aop.jar;"%REPO%"\javax\inject\javax.inject\1\javax.inject-1.jar;"%REPO%"\aopalliance\aopalliance\1.0\aopalliance-1.0.jar;"%REPO%"\org\codehaus\plexus\plexus-interpolation\1.24\plexus-interpolation-1.24.jar;"%REPO%"\org\codehaus\plexus\plexus-utils\3.0.24\plexus-utils-3.0.24.jar;"%REPO%"\org\codehaus\plexus\plexus-classworlds\2.5.2\plexus-classworlds-2.5.2.jar;"%REPO%"\org\codehaus\plexus\plexus-component-annotations\1.7.1\plexus-component-annotations-1.7.1.jar;"%REPO%"\org\sonatype\plexus\plexus-sec-dispatcher\1.4\plexus-sec-dispatcher-1.4.jar;"%REPO%"\org\sonatype\plexus\plexus-cipher\1.4\plexus-cipher-1.4.jar;"%REPO%"\org\apache\commons\commons-lang3\3.5\commons-lang3-3.5.jar;"%REPO%"\org\apache\maven\maven-artifact\3.5.0\maven-artifact-3.5.0.jar;"%REPO%"\org\apache\maven\plugins\maven-dependency-plugin\3.0.2\maven-dependency-plugin-3.0.2.jar;"%REPO%"\org\apache\maven\reporting\maven-reporting-api\3.0\maven-reporting-api-3.0.jar;"%REPO%"\org\apache\maven\reporting\maven-reporting-impl\2.3\maven-reporting-impl-2.3.jar;"%REPO%"\org\apache\maven\doxia\doxia-core\1.2\doxia-core-1.2.jar;"%REPO%"\xerces\xercesImpl\2.9.1\xercesImpl-2.9.1.jar;"%REPO%"\xml-apis\xml-apis\1.4.01\xml-apis-1.4.01.jar;"%REPO%"\commons-validator\commons-validator\1.3.1\commons-validator-1.3.1.jar;"%REPO%"\commons-beanutils\commons-beanutils\1.9.3\commons-beanutils-1.9.3.jar;"%REPO%"\commons-digester\commons-digester\2.1\commons-digester-2.1.jar;"%REPO%"\commons-logging\commons-logging\1.0.4\commons-logging-1.0.4.jar;"%REPO%"\org\apache\maven\doxia\doxia-sink-api\1.4\doxia-sink-api-1.4.jar;"%REPO%"\org\apache\maven\doxia\doxia-logging-api\1.4\doxia-logging-api-1.4.jar;"%REPO%"\org\apache\maven\doxia\doxia-site-renderer\1.4\doxia-site-renderer-1.4.jar;"%REPO%"\org\apache\maven\doxia\doxia-decoration-model\1.4\doxia-decoration-model-1.4.jar;"%REPO%"\org\apache\maven\doxia\doxia-module-xhtml\1.4\doxia-module-xhtml-1.4.jar;"%REPO%"\org\apache\maven\doxia\doxia-module-fml\1.4\doxia-module-fml-1.4.jar;"%REPO%"\org\codehaus\plexus\plexus-i18n\1.0-beta-7\plexus-i18n-1.0-beta-7.jar;"%REPO%"\org\codehaus\plexus\plexus-container-default\1.0-alpha-30\plexus-container-default-1.0-alpha-30.jar;"%REPO%"\org\codehaus\plexus\plexus-velocity\1.1.7\plexus-velocity-1.1.7.jar;"%REPO%"\org\apache\velocity\velocity\1.5\velocity-1.5.jar;"%REPO%"\oro\oro\2.0.8\oro-2.0.8.jar;"%REPO%"\org\apache\velocity\velocity-tools\2.0\velocity-tools-2.0.jar;"%REPO%"\commons-chain\commons-chain\1.1\commons-chain-1.1.jar;"%REPO%"\sslext\sslext\1.2-0\sslext-1.2-0.jar;"%REPO%"\org\apache\struts\struts-core\1.3.8\struts-core-1.3.8.jar;"%REPO%"\org\apache\struts\struts-taglib\1.3.8\struts-taglib-1.3.8.jar;"%REPO%"\org\apache\struts\struts-tiles\1.3.8\struts-tiles-1.3.8.jar;"%REPO%"\org\codehaus\plexus\plexus-archiver\3.4\plexus-archiver-3.4.jar;"%REPO%"\org\iq80\snappy\snappy\0.4\snappy-0.4.jar;"%REPO%"\org\tukaani\xz\1.5\xz-1.5.jar;"%REPO%"\org\apache\maven\shared\file-management\1.2.1\file-management-1.2.1.jar;"%REPO%"\org\apache\maven\shared\maven-shared-io\1.1\maven-shared-io-1.1.jar;"%REPO%"\org\apache\maven\wagon\wagon-provider-api\1.0-alpha-6\wagon-provider-api-1.0-alpha-6.jar;"%REPO%"\org\codehaus\plexus\plexus-io\2.4\plexus-io-2.4.jar;"%REPO%"\org\apache\maven\shared\maven-dependency-analyzer\1.7\maven-dependency-analyzer-1.7.jar;"%REPO%"\org\ow2\asm\asm\5.0.2\asm-5.0.2.jar;"%REPO%"\org\apache\maven\shared\maven-dependency-tree\3.0.1\maven-dependency-tree-3.0.1.jar;"%REPO%"\org\eclipse\aether\aether-util\0.9.0.M2\aether-util-0.9.0.M2.jar;"%REPO%"\org\apache\maven\shared\maven-common-artifact-filters\3.0.1\maven-common-artifact-filters-3.0.1.jar;"%REPO%"\org\sonatype\sisu\sisu-inject-plexus\1.4.2\sisu-inject-plexus-1.4.2.jar;"%REPO%"\org\sonatype\sisu\sisu-inject-bean\1.4.2\sisu-inject-bean-1.4.2.jar;"%REPO%"\org\sonatype\sisu\sisu-guice\2.1.7\sisu-guice-2.1.7-noaop.jar;"%REPO%"\org\apache\maven\shared\maven-artifact-transfer\0.9.1\maven-artifact-transfer-0.9.1.jar;"%REPO%"\commons-lang\commons-lang\2.6\commons-lang-2.6.jar;"%REPO%"\commons-collections\commons-collections\3.2.2\commons-collections-3.2.2.jar;"%REPO%"\classworlds\classworlds\1.1\classworlds-1.1.jar;"%REPO%"\org\twdata\maven\mojo-executor\2.3.0\mojo-executor-2.3.0.jar;"%REPO%"\lt\kvk\radiukiene\waste_API\0.0.1-SNAPSHOT\waste_API-0.0.1-SNAPSHOT.jar

set ENDORSED_DIR=
if NOT "%ENDORSED_DIR%" == "" set CLASSPATH="%BASEDIR%"\%ENDORSED_DIR%\*;%CLASSPATH%

if NOT "%CLASSPATH_PREFIX%" == "" set CLASSPATH=%CLASSPATH_PREFIX%;%CLASSPATH%

@REM Reaching here means variables are defined and arguments have been captured
:endInit

%JAVACMD% %JAVA_OPTS%  -classpath %CLASSPATH% -Dapp.name="webapp" -Dapp.repo="%REPO%" -Dapp.home="%BASEDIR%" -Dbasedir="%BASEDIR%" lt.kvk.i11.radiukiene.atliekosAPI.KretkomApplication %CMD_LINE_ARGS%
if %ERRORLEVEL% NEQ 0 goto error
goto end

:error
if "%OS%"=="Windows_NT" @endlocal
set ERROR_CODE=%ERRORLEVEL%

:end
@REM set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" goto endNT

@REM For old DOS remove the set variables from ENV - we assume they were not set
@REM before we started - at least we don't leave any baggage around
set CMD_LINE_ARGS=
goto postExec

:endNT
@REM If error code is set to 1 then the endlocal was done already in :error.
if %ERROR_CODE% EQU 0 @endlocal


:postExec

if "%FORCE_EXIT_ON_ERROR%" == "on" (
  if %ERROR_CODE% NEQ 0 exit %ERROR_CODE%
)

exit /B %ERROR_CODE%
