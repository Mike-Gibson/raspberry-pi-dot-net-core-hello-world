#dotnet publish -r linux-arm /p:ShowLinkerSizeComparison=true
pushd ./RaspberryPiHelloWorld/bin/Debug/netcoreapp3.1/linux-arm/publish
scp -rp ./* pi:/home/pi/code/hello-world
popd