work=`pwd`
UCP_BASE=$1
UCP_USER=$2
UCP_PASSWORD=$3
PROPERTY_FILE=ucp-client-bundle.properties
 
UCP_BUNDLE_DIR=./ucp-client-bundle
 
echo $1 $2 $3 $4;
mkdir -p ${UCP_BUNDLE_DIR}
cd ${UCP_BUNDLE_DIR}
pwd
# -X POST --silent --insecure --data
#AUTHTOKEN=$(curl -sk -d '{"username":"<username>","password":"<password>"}' https://<ucp-ip>/auth/login | jq -r .auth_token)
AUTHTOKEN=$(curl --silent --insecure --data "{\"username\":\"$UCP_USER\",\"password\":\"$UCP_PASSWORD\"}" $UCP_BASE/auth/login | jq -r .auth_token)
 
echo $AUTHTOKEN;
# Download the client certificate bundle
#curl -k -H "Authorization: Bearer $AUTHTOKEN" https://<ucp-ip>/api/clientbundle -o bundle.zip
curl -k -H "Authorization: Bearer $AUTHTOKEN" $UCP_BASE/api/clientbundle -o bundle.zip
 
# Unzip the bundle.
unzip -o bundle.zip
 
# Run the utility script.
source ./env.sh
 
touch ${PROPERTY_FILE}
echo "DOCKER_TLS_VERIFY=${DOCKER_TLS_VERIFY}" >> ${PROPERTY_FILE}
echo "COMPOSE_TLS_VERSION=${COMPOSE_TLS_VERSION}" >> ${PROPERTY_FILE}
echo "DOCKER_CERT_PATH=${DOCKER_CERT_PATH}" >> ${PROPERTY_FILE}
echo "DOCKER_HOST=${DOCKER_HOST}" >> ${PROPERTY_FILE}
 
cd ${work}
#docker login https://dtr.lxc.metlife.co.jp -u ZSYS5KU --password Inautix1
echo ${bamboo.promoter.password} | docker login --username ${bamboo.promoter.username} --password-stdin ${bamboo.dtr_url}
docker stack ls
docker stack rm ${bamboo.stackName}
sleep 5
#docker secret ls
docker pull  ${bamboo.imageName} || exit 1
docker stack ls
docker stack deploy -c docker-compose.yml ${bamboo.stackName} --with-registry-auth
sleep 10
docker stack ps ${bamboo.stackName}
docker logout ${bamboo.dtr_url}
docker rmi  ${bamboo.imageName} –force




git clone $args[0]
cd $args[1]
xcopy /s /i "C:\Users\ZSYSQ08\Downloads\CITS\*" .
git add .
git commit -m "Initial Commit"
git push
 
 
cmd -- powershell.exe -ExecutionPolicy Bypass -file testrepoauto.ps1 "url" "foldername"
 

Expand-Archive -LiteralPath 'D:\build\app\AN1\pub.zip' -DestinationPath 'D:\build\app\AN1'
Place the files which we need
Compress-Archive -LiteralPath 'D:\build\app\AN1\pub\*' -DestinationPath 'D:\build\app\AN1\pub.zip'
Ren D:\build\app\AN1\pub.zip D:\build\app\AN1\pub.war
 
 
 
chcp 65001 && powershell.exe -command "& { $buildpath='D:\build\app\LF1T3\temp'; New-Item -Path $buildpath -ItemType 'directory' -Force; Set-Location -Path $buildpath; jar -xf ..\pub.war; $lf1properties='.\WEB-INF\classes\lf1.properties'; $configlf1properties='.\config\lf1.properties'; $log4jxml='.\WEB-INF\classes\log4j.xml'; $configlog4jxml='.\config\log4j.xml'; ((Get-Content -path $lf1properties -Raw) -replace 'LF1.ear','LF1T3.ear') | Set-Content -Path $lf1properties; ((Get-Content -path $configlf1properties -Raw) -replace 'LF1.ear','LF1T3.ear') | Set-Content -Path $configlf1properties; ((Get-Content -path $log4jxml -Raw) -replace '/LF1/','/LF1T3/') | Set-Content -Path $log4jxml; ((Get-Content -path $configlog4jxml -Raw) -replace '/LF1/','/LF1T3/') | Set-Content -Path $configlog4jxml; Remove-Item -Path '..\pub.war' -Force; jar -cfm ..\pub.war .\META-INF\MANIFEST.MF .\*; Set-Location -Path '..\' }"
 
 
 
chcp 65001 && powershell.exe -command "& { $buildpath='D:\build\app\${bamboo.appName}\temp'; New-Item -Path $buildpath -ItemType 'directory' -Force; Set-Location -Path $buildpath; Out-String -InputObject ('Extracting - D:\build\app\${bamboo.appName}\pub.war -> '+$buildpath); D:\IBM\WebSphere\AppServer\java\8.0\bin\jar -xf ..\pub.war; if ('${bamboo.userContentsPath}' -ne $null -and '${bamboo.userContentsPath}'.Length -gt 0) { $exists = $false; try { $exists = (Test-Path -Path '${bamboo.userContentsPath}' -PathType Container) } catch { $exists = $false }; if ($exists) { Out-String -InputObject ('Copying - ${bamboo.userContentsPath}\pages\css -> '+$buildpath+'\css'); Copy-Item -Path '${bamboo.userContentsPath}\pages\css' -Destination '.\css' -Recurse -Force; Out-String -InputObject ('Copying - ${bamboo.userContentsPath}\pages\js -> '+$buildpath+'\js'); Copy-Item -Path '${bamboo.userContentsPath}\pages\js' -Destination '.\js' -Recurse -Force; Out-String -InputObject ('Copying - ${bamboo.userContentsPath}\pages\common -> '+$buildpath+'\common'); Copy-Item -Path '${bamboo.userContentsPath}\pages\common' -Destination '.\common' -Recurse -Force; Out-String -InputObject ('Copying - ${bamboo.userContentsPath}\pages\item -> '+$buildpath+'\item'); Copy-Item -Path '${bamboo.userContentsPath}\pages\item' -Destination '.\item' -Recurse -Force; Out-String -InputObject ('Copying - ${bamboo.userContentsPath}\pages\other -> '+$buildpath+'\other'); Copy-Item -Path '${bamboo.userContentsPath}\pages\other' -Destination '.\other' -Recurse -Force; Out-String -InputObject ('Copying - ${bamboo.userContentsPath}\xml -> '+$buildpath+'\xml'); Copy-Item -Path '${bamboo.userContentsPath}\xml' -Destination '.\xml' -Recurse -Force; ('${bamboo.appServers}' -split ',') | ForEach-Object { Out-String -InputObject ('Cleaning - \\'+$_+'\data\${bamboo.appName}\pdf'); Remove-Item -Path ('\\'+$_+'\data\${bamboo.appName}\pdf') -Recurse -Force; Out-String -InputObject ('Copying - ${bamboo.userContentsPath}\pdf -> \\'+$_+'\data\${bamboo.appName}\pdf'); Copy-Item -Path '${bamboo.userContentsPath}\pdf' -Destination ('\\'+$_+'\data\${bamboo.appName}\pdf') -Recurse -Force; }; } else { Out-String -InputObject @('${bamboo.userContentsPath} - Path not Exists or Permission denied to ${bamboo.userName}. Hence, Proceeding deployment without copying User Contents'); } } else { Out-String -InputObject @('userContentsPath - Path not entered. Hence, Proceeding deployment without copying User Contents'); }; Out-String -InputObject ('Removing - D:\build\app\${bamboo.appName}\pub.war'); Remove-Item -Path '..\pub.war' -Force; Out-String -InputObject ('Creating War - Contents of '+$buildpath+' -> D:\build\app\${bamboo.appName}\pub.war'); D:\IBM\WebSphere\AppServer\java\8.0\bin\jar -cfm ..\pub.war .\META-INF\MANIFEST.MF .\*; Set-Location -Path '..\'; Out-String -InputObject ('Cleaning up - '+$buildpath); Remove-Item -Path '.\temp' -Recurse -Force }"


