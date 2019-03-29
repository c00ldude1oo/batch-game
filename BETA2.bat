::=================================================
REM made by @c00ldude1oo (Chris) 
REM
REM
REM parts of code inspired by other works
::=================================================
@ECHO OFF
:: loading screen
	TITLE LOADING
	set 00=л
	set wait=PING localhost -n 2
	CLS
	GOTO login1
	ECHO LOADING.. 1
	%wait% > nul
	CLS
	ECHO LOADING.. 9
	%wait% > nul
	CLS
	ECHO LOADING.. 17
	%wait% > nul
	CLS
	ECHO LOADING.. 21
	%wait% > nul
	CLS
	ECHO LOADING.. 34
	%wait% > nul
	CLS
	ECHO LOADING.. 46
	%wait% > nul
	CLS
	ECHO LOADING.. 51
	%wait% > nul
	CLS
	ECHO LOADING.. 65
	%wait% > nul
	CLS
	ECHO LOADING.. 77
	%wait% > nul
	CLS
	ECHO LOADING.. 91
	%wait% > nul
	CLS
	ECHO LOADING.. 100
	%wait% > nul
	CLS
	ECHO DONE LOADING
	%wait% > nul
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

		:B
			ECHO You are now logged in as %user%
			ECHO.
			PAUSE
			CLS
			ECHO looking for saved game.
			GOTO :menu

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
		:exist
			ECHO THE USERNAME %user% HAS BEEN USED.
			PING localhost -n 2 > nul
			GOTO reg

		:A2
			ECHO this is a guest acccount no password and no saves.
			PAUSE
			CLS
			GOTO menu

		:A1
			ECHO your acccount %user% has been created
			ECHO.
			PAUSE
			CLS
::			:B210
			(
			ECHO %user%
			ECHO %pass%
			) >"%D%%user%.gamdat"
			GOTO log

::---------------------------------------------------------------------------------------------------

::=\
:eEXIT2 
:: to return to menu
:menu
:: main menu
	TITLE Batch RPG 
	SETlocal enabledelayedexpansion
	CLS
	ECHO.
	ECHO  лллллллл    лллллллл      лллллллл
	ECHO  лл      лл  лл      лл  лл
	ECHO  лл      лл  лл      лл  лл
	ECHO  лллллллл    лллллллл    лл   ллллл
	ECHO  лл    лл    лл          лл        лл
	ECHO  лл     лл   лл          лл        лл
	ECHO  лл      лл  лл            лллллллл
	ECHO.
	ECHO.
	ECHO 1)begin
	ECHO 2)load game
	ECHO 3)EXIT
	ECHO.
	CHOICE /c 123 /n
	SET direction=%ERRORLEVEL%
	GOTO new%direction%

	:new1
	:: setup
		SET bosshealth=500
		SET bossdmg=10
		SET health=100
		SET playerdmg=7
		SET money=10
		SET bodycount=0
		SET BB=false
		SET Pistol=false
		SET 2ndpistol=false
		SET current=Fist
		SET p=false
		SET BB1=0
		SET Pistol1=0
		SET 2ndpistol1=0
		GOTO home

	:new2
	:: setup
		SET bosshealth=500
		SET bossdmg=10
		SET health=100
		SET playerdmg=7
		SET money=10
		SET bodycount=0
		SET BB=false
		SET Pistol=false
		SET 2ndpistol=false
		SET current=Fist
		SET p=false
		SET BB1=0
		SET Pistol1=0
		SET 2ndpistol1=0
		GOTO loadgame

	:new3
		EXIT

	:loadgame
		< "%D%\%user%.gamdat" (
		SET /P user=
		SET /P pass=
		SET /P money=
		SET /P bodycount=
		)
		GOTO home

:purchase5 
:: ^ to get back from shop
:home
:: game menu
	CLS
	ECHO.
	ECHO HP: %health%  $%money% #kills:%bodycount% DMG:!playerdmg!
	ECHO.
	ECHO 1)Go out into the wild
	IF !money! GEQ 10 ECHO 2)Shop
	IF NOT !money! GEQ 10 ECHO 2)
	ECHO 3)Inventory
	ECHO 4)codes
	ECHO 5)save game
	ECHO 6)Exit
	ECHO.
	CHOICE /c 123456 /n
	SET direction=%ERRORLEVEL%
	GOTO hhome%direction%

	::## ENCOUNTERS ###########################################
	:hhome1
	:prebattle
		CLS
		IF !bodycount! GEQ 0 SET /a lvl=1
		IF !bodycount! GEQ 3 SET /a lvl=2
		IF !bodycount! GEQ 10 SET /a lvl=3
		IF !bodycount! GEQ 15 SET /a lvl=4
		IF !bodycount! GEQ 20 SET /a lvl=5
		IF !bodycount! GEQ 30 SET /a lvl1=1
		IF !bodycount! GEQ 35 SET /a lvl1=2
		IF !bodycount! GEQ 40 SET /a lvl1=3
		IF !bodycount! GEQ 45 SET /a lvl1=4
		IF !bodycount! GEQ 50 SET /a lvl1=5
		ECHO HP: %health%
		ECHO 1) LVL%lvl% monster
		IF !bodycount! GEQ 30 ECHO 2) LVL%lvl1% BOSS
		ECHO b) back
		ECHO.
		SET /P battle=
		IF "!battle!" == "1" GOTO battle1
		IF !bodycount! GEQ 30 IF "!battle!" == "2" GOTO battle2
		IF "!battle!" == "b" GOTO home
		GOTO prebattle

		:Battle1
			SET monsterhealth=30
			SET monsterdmg=5
			IF !bodycount! GEQ 3 IF !bodycount! LEQ 5 (
			SET /a monsterhealth+=10
			SET /a monsterdmg+=5
			)
			IF !bodycount! GEQ 10 (
				SET /a monsterhealth+=20
				SET /a monsterdmg+=5
			)
			IF !bodycount! GEQ 15 (
				SET /a monsterhealth+=20
				SET /a monsterdmg+=5
			)
			IF !bodycount! GEQ 20 (
				SET /a monsterhealth+=20
				SET /a monsterdmg+=5
				SET /a money+=10
			)

			:encounter1
				CLS
				ECHO You: %health%
				ECHO Them: %monsterhealth%
				ECHO.
				ECHO 1)attack
				ECHO 2)pussy out
				ECHO.
				SET /P c=
				IF "!c!" == "1" GOTO attack1
				IF "!c!" == "2" GOTO purchase5
				GOTO encounter1

				:attack1
					SET /a health-=!monsterdmg!
					SET /a monsterhealth-=!playerdmg!
					IF !monsterhealth! lss 0 (
					SET /a money+=10
					SET /a bodycount+=1
					IF !health! LEQ 0 (
					GOTO DIE
					)
					GOTO continue1
					)
					GOTO encounter1

					:continue1
						CLS
						ECHO Do you wish to proceed? (1/2)
						ECHO.
						SET /P c=Enter:
						IF "!c!" == "1" GOTO PreBattle
						IF "!c!" == "2" GOTO home
						GOTO continue1

		:Battle2
			SET bosshealth=500
			SET bossdmg=10
			IF !bodycount! GEQ 34 IF !bodycount! LEQ 35 (
			SET /a bosshealth+=25
			SET /a bossdmg+=8
			SET /a money+=10
			)
			IF !bodycount! GEQ 40 (
			SET /a bosshealth+=50
			SET /a bossdmg+=11
			SET /a money+=20
			)
			IF !bodycount! GEQ 45 (
			SET /a bosshealth+=125
			SET /a bossdmg+=23
			SET /a money+=20
			)
			IF !bodycount! GEQ 50 (
			SET /a bosshealth+=100
			SET /a bossdmg+=37
			SET /a money+=70
			)

			:encounter2
				CLS
				ECHO You: %health%
				ECHO Them: %bosshealth%
				ECHO.
				ECHO 1)attack
				ECHO 2)go back
				ECHO.
				SET /P c=
				IF "!c!" == "1" GOTO attack2
				IF "!c!" == "2" GOTO home
				GOTO encounter2

				:attack2
					SET /a health-=!bossdmg!
					SET /a bosshealth-=!playerdmg!
					IF !bosshealth! lss 0 (
					SET /a money+=20
					SET /a bodycount+=1
					IF !health! LEQ 0 (
					GOTO DIE
					)
					GOTO continue2
					)
					GOTO encounter2

					:continue2
						CLS
						ECHO Do you wish to proceed? (1/2)
						ECHO.
						SET /P c=Enter:
						IF "!c!" == "1" GOTO PreBattle
						IF "!c!" == "2" GOTO home
						GOTO continue2	

	::## SHOP ###############################################
	:hhome2
		CLS
		ECHO What would you like?
		ECHO.
		ECHO $!money!
		ECHO.
		ECHO 1) Baseball Bat [$10]
		ECHO 2) Pistol       [$30]
		ECHO 3) heal +20     [$30]
		ECHO 4) 2ndPistol    [$50]
		ECHO.
		ECHO "b" to go back
		ECHO.
		CHOICE /c 1234b /n
		SET direction=%ERRORLEVEL%
		CLS
		GOTO purchase%direction%
		:purchase1
		SET /a money-=10
		SET BB=true
		SET BB1=1
		SET /a playerdmg+=10
		GOTO home
		:purchase.horse
		SET /a money-=20
		SET /a horses+=1
		SET /a horses+=1
		GOTO home
		:purchase2
		SET /a money-=30
		SET pistol=true
		SET /a playerdmg+=25
		SET /a pistolammo+=20
		GOTO home
		:purchase3
		SET /a money-=30
		SET /a health+=20
		GOTO home
		:purchase4
		SET /a money-=50
		SET 2ndpistol=true
		SET /a playerdmg+=40
		GOTO home
		SET /a monsterdmg-=5

	::## INVENTORY ##########################################
	:hhome3
		CLS
		ECHO Current Weapon:
		ECHO !current!
		ECHO.
		ECHO Weapons:
		IF %BB% == true ECHO 1)Baseball Bat && SET /a p=true
		IF %Pistol% == true ECHO 2)Pistol && SET /a p=true2
		IF %2ndPistol% == true ECHO 3)2ndPistol && SET /a p=true3
		IF %p% == false ECHO None.
		ECHO.
		ECHO /b back
		ECHO.
		SET /P i=Enter:
		IF %p% == true (
			IF "!i!" == "1" SET current=BB && GOTO home
			IF "!p!" == "true2" (
				IF "!i!" == "2" SET current=Pistol && GOTO home
			)
		)
		IF "!i!" == "b" GOTO home
		GOTO home

	:hhome4
		:: code menu
		CLS
		ECHO please enter code to get
		ECHO more money or health.
		ECHO.
		ECHO       ******
		SET /P code=enter:
		::           \codes/
		IF %code% == 222575 SET /a money+=20
		IF %code% == 212511 SET /a health+=20
		GOTO home

	::## SAVE GAME ############################################
	:hhome5
		CLS
		(
		ECHO %user%
		ECHO %pass%
		ECHO %money%
		ECHO %bodycount%
		) >"%D%%user%.gamdat"
		GOTO home
	:eEXIT1
		CLS
		(
		ECHO %user%
		ECHO %pass%
		ECHO %money%
		ECHO %bodycount%
		) >"%D%%user%.gamdat"
		GOTO eEXIT2
	
	:hhome6
		CLS
		ECHO do you want to save game?
		ECHO 1)yes
		ECHO 2)no
		CHOICE /c 12 /n
		SET direction=%ERRORLEVEL%
		GOTO eEXIT%direction%
	
:congrats
	CLS
	ECHO YEA, MERICA!
	ECHO.
	PAUSE
	EXIT
:DIE
	CLS
	ECHO YOU DIED....
	ECHO hit enter to go to the menu.
	IF !money! GEQ 100 ECHO or pay $100 for one more lIFe
	IF !money! GEQ 100 ECHO you have $%money% (1/2)
	IF !money! GEQ 100 SET /P 1lIFe=enter:
	IF !money! GEQ 100 IF "!1lIFe!" == "1" GOTO 1lIFe
	PAUSE>nul
	GOTO menu
:1lIFe
	SET /a money-=100
	SET health=50
	GOTO home