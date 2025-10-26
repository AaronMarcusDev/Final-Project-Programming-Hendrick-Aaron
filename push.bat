:: This is just for pushing into the repo, not related to the project
@echo off
set /p msg=Geef een commit message: 
git add .
git commit -m "%msg%"
git push
