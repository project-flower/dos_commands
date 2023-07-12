@SETLOCAL
@SET FILENAME=*.anyextension
@SET OPTION= /P
@CD "%~1"
@CALL :DELETEFILES
@EXIT /B

:DELETEFILES
@DEL%OPTION% %FILENAME%

@FOR /D %%D IN (*) DO @(
    PUSHD "%%D"

    @IF NOT ERRORLEVEL 1 @(
        CALL :DELETEFILES
        POPD
    )
)

@EXIT /B
