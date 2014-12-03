java -Xmx2000m -jar photohawk-commandline-0.0.3-SNAPSHOT-jar-with-dependencies.jar --read-left dcraw --read-right dcraw ssim RAW_CANON_1DM2.CR2 RAW_CANON_1DM2.dng
pause


@echo off 
setlocal enableDelayedExpansion 

set MYDIR=C:\something
for /F %%x in ('dir /B/D %MYDIR%') do (
  set FILENAME=%MYDIR%\%%x\log\IL_ERROR.log
  echo ===========================  Search in !FILENAME! ===========================
  c:\utils\grep motiv !FILENAME!
)



@echo off
@echo This is a test> test.txt