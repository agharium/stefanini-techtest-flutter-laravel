@echo off
setlocal enabledelayedexpansion

echo ===============================
echo Iniciando containers Docker...
echo ===============================

docker-compose -f laravel-api/docker-compose.yml up -d --build
docker-compose -f flutter-app/docker-compose.yml up -d --build

echo.
echo Aguardando o backend iniciar...
set /a duration=10

for /l %%i in (1,1,%duration%) do (
    set /a progress=%%i * 10
    <nul set /p=Carregando: %%i0%%
    timeout /t 1 >nul
    cls
    echo ===============================
    echo Iniciando containers Docker...
    echo ===============================
    echo.
)

start http://localhost:9000

echo.
echo Pressione qualquer tecla para desligar os containers...
pause >nul

docker-compose -f laravel-api/docker-compose.yml down
docker-compose -f flutter-app/docker-compose.yml down

echo.
echo Containers desligados com sucesso!
