# Building Desmume (Nintendo DS Emulator) in VS19

Desume source code

https://github.com/TASVideos/desmume/

Solution file for VS19: desmume\src\frontend\windows\DeSmuME.sln

desmume\src\frontend\windows\touch.exe

desmume\src\frontend\windows\7z.exe

desmume\src\frontend\windows\7z.dll

https://github.com/TASEmulators/desmume/issues/525

I set the permissions for every possible user to have "Full Control" (so modify, read, write, read&execute") on windows on touch.exe, 7z.exe, and 7z.dll in the repo.

I then had to clear all the "Special Permissions" for every user for touch.exe, 7z.exe, and 7z.dll.
Then the build started to get past these problems, but still had some warnings and then was able to finish the build.
