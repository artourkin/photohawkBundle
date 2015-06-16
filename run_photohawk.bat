


@echo off 
setlocal enableDelayedExpansion 

set MYDIR=C:\something
set ORIGINAL_FOLDER=Original
set CONVERTED_FOLDER=Converted
for /F %%x in ('dir /B/D %ORIGINAL_FOLDER%') do (
 	set FILEPATH_ORIGINAL=!ORIGINAL_FOLDER!\%%x
	set FILENAME_ORIGINAL=%%~nx
	echo Working on !FILENAME_ORIGINAL!
	set FILEPATH_CONVERTED=!CONVERTED_FOLDER!\!FILENAME_ORIGINAL!.dng
	if not exist !FILEPATH_CONVERTED! (
		echo File !FILEPATH_CONVERTED! does not exist. Creating...
		"Tools\Adobe DNG Converter.exe" -c -d !CONVERTED_FOLDER! !FILEPATH_ORIGINAL!
		echo Done.
		)

  echo Calculating SSIM for !FILENAME_ORIGINAL!...  
	java -Xmx1000m -jar photohawk.jar --read-left dcraw --read-right dcraw ssim !FILEPATH_ORIGINAL! !FILEPATH_CONVERTED! > tmpFile
	set SSIM=null 
	set /p SSIM= < tmpFile 
	del tmpFile 
	echo SSIM = !SSIM!
	@echo off
	@echo !FILENAME_ORIGINAL!	!SSIM! >> SSIM.txt
	set SSIM=null
)
pause

