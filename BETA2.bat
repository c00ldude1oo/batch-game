@ECHO OFF
:: loading screen
	TITLE LOADING
	set 00=л
	CLS
	GOTO login1
	ECHO LOADING.. 1
	PING localhost -n 2 > nul
	CLS
	ECHO LOADING.. 9
	PING localhost -n 2 > nul
	CLS
	ECHO LOADING.. 17
	PING localhost -n 2 > nul
	CLS
	ECHO LOADING.. 21
	PING localhost -n 2 > nul
	CLS
	ECHO LOADING.. 34
	PING localhost -n 2 > nul
	CLS
	ECHO LOADING.. 46
	PING localhost -n 2 > nul
	CLS
	ECHO LOADING.. 51
	PING localhost -n 2 > nul
	CLS
	ECHO LOADING.. 65
	PING localhost -n 2 > nul
	CLS
	ECHO LOADING.. 77
	PING localhost -n 2 > nul
	CLS
	ECHO LOADING.. 91
	PING localhost -n 2 > nul
	CLS
	ECHO LOADING.. 100
	PING localhost -n 2 > nul
	CLS
	ECHO DONE LOADING
	PING localhost -n 2 > nul
:login1
	SET "D=%CD%\"
	TITLE login
	SET reglog=1
	COLOR a
	CLS
	ECHO 1)login
	ECHO 2)register
	CHOICE /c 12 /n
	SET direction=%ERRORLEVEL%
	GOTO l%direction%
	:l1
		TITLE LOGIN
		CLS
		ECHO please Login.
		ECHO.
		SET /P u=Username:
		SET code=%u%
		< "%D%%code%.gamdat" (
		SET /P user=
		SET /P pass=
		)
		SET /P pa=Password:
		IF %u%==%user% IF %pa%==%pass% GOTO B
		CLS
		COLOR 4f
		ECHO Invlalid username or password.
		ECHO.
		PAUSE
		CLS
		GOTO login1
	:l2
		TITLE REGISTER
		SET ramdo1=%random%
		SET userg=Guest%ramdo1%
		SET user=Guest%ramdo1%
		SET pass=1
		ECHO please register.
		ECHO.
		SET /P user=Username:
		SET /P pass=Password:
		CLS
		IF EXIST "%D%%user%.gamdat" GOTO exist
		IF %user% == %userg% GOTO A2
		GOTO A1







