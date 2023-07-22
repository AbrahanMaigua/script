@echo off
set rep="https://github.com/AbrahanMaigua/catalogo.git"
python --version 
pip --version
git --version

:: get proyect
IF exist catalogo (
   :: change dir
   cd catalogo 
   echo proyect exist.... ok    
   IF exist env (
      echo enviromet exist.... ok
      call env\Scripts\activate
   
   ) ELSE (
      echo enviromet exist.... Error
   
   )

 ) ELSE (
    echo proyect exist.... Error
    git clone %rep%
    python -m venv env
    call env\Scripts\activate
    pip install -r requirements.txt
)

:: active env
echo .
pip list
cd delivery 
if exist sqlite.sql (
   python manage.py makemigrations
   python manage.py migrate
   python manage.py createsuperuser

) 
python manage.py runserver