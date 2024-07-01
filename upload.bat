@echo off
setlocal enabledelayedexpansion

REM Check if problem name is provided
if "%1"=="" (
    echo Usage: %0 "Problem Name"
    exit /b 1
)

REM Set variables
set PROBLEM_NAME=%1

REM Get the current date in the format DD_MM_YY
for /f "tokens=2 delims==." %%a in ('wmic os get localdatetime /value') do set datetime=%%a
set DATE=%datetime:~6,2%_%datetime:~4,2%_%datetime:~2,2%



REM Set folder names and commit message
set FOLDER_NAME=Problem
set NEW_FOLDER_NAME=%PROBLEM_NAME%_%DATE%_Solution
set REPO_PATH=C:\path\to\your\repo
set COMMIT_MESSAGE=Add solution for %DATE%: %PROBLEM_NAME%

REM Navigate to the repository
cd /d %REPO_PATH%

REM Rename the folder
ren %FOLDER_NAME% %NEW_FOLDER_NAME%

REM Add the folder to git
git add %NEW_FOLDER_NAME%

REM Commit the change
git commit -m "%COMMIT_MESSAGE%"

REM Push to GitHub
git push origin main

REM Rename the folder back to the original name
ren %NEW_FOLDER_NAME% %FOLDER_NAME%

endlocal