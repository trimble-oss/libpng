@echo off

set Major=1
set Minor=2
set Patch=59
set /p Build=<build.txt
set /a Build+=1
echo %Build% >build.txt

c:\work\nuget.exe restore ..

MSBuild.exe .. /p:Configuration=140-DebugCRT /p:Platform=x64 /p:MajorVersion=%Major% /p:MinorVersion=%Minor% /p:PatchVersion=%Patch% /p:BuildVersion=%Build% /maxCpuCount
MSBuild.exe .. /p:Configuration=142-DebugCRT /p:Platform=x64 /p:MajorVersion=%Major% /p:MinorVersion=%Minor% /p:PatchVersion=%Patch% /p:BuildVersion=%Build% /maxCpuCount
MSBuild.exe .. /p:Configuration=140-Release /p:Platform=x64 /p:MajorVersion=%Major% /p:MinorVersion=%Minor% /p:PatchVersion=%Patch% /p:BuildVersion=%Build% /maxCpuCount
MSBuild.exe .. /p:Configuration=142-Release /p:Platform=x64 /p:MajorVersion=%Major% /p:MinorVersion=%Minor% /p:PatchVersion=%Patch% /p:BuildVersion=%Build% /maxCpuCount

rem c:\work\nuget.exe pack -Version %Major%.%Minor%.%Patch%.%Build% LibPng-Tekla.nuspec
rem c:\work\nuget.exe pack -Version %Major%.%Minor%.%Patch%.%Build% LibPng-Tekla.redist.nuspec
c:\work\nuget.exe pack -Version %Major%.%Minor%.%Patch%.%Build% LibPng-Tekla.Static.nuspec
