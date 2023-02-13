@echo off
echo Windows Version:
systeminfo | findstr /C:"OS Name" /C:"OS Version"
echo.
echo PC Specifications:
echo -------------------
echo CPU:
wmic CPU get Name
echo.
echo GPU:
wmic path Win32_VideoController get Name
echo.
echo CPU Temperature:
wmic /namespace:\\root\wmi PATH MSAcpi_ThermalZoneTemperature get CurrentTemperature /value
echo.
echo GPU Temperature:
wmic /namespace:\\root\CIMV2 path Win32_PerfFormattedData_Nvidia_DisplayController get GPUCoreTemperature /value
echo.
echo Disk Size:
wmic LOGICALDISK where DriveType="3" get Size /Value | find "="
echo.
echo Memory Size:
wmic MEMORYCHIP get Capacity /Value | find "="
pause /L 10
