@echo off
set /p msg=Geef een commit message: 
git add .
git commit -m "%msg%"
git push
