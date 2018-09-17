@echo off
cd C:\Users\hen\Pentest
set /p nam=Nombre del pentest:  
	mkdir %nam%
		cd %nam%
			mkdir Informes
			mkdir Info
			mkdir Hallazgos
				cd Informes
					xcopy C:\Users\hen\Desktop\D4nnR\Pentest\Importante\Informes C:\Users\hen\Desktop\D4nnR\Pentest\%nam%\Informes\
					cd ..
				cd Hallazgos
					echo.>"Seg_%nam%.txt"
					cd /
