# -------------------------------------------------------------------------------------------------------------
# Limpieza de pantalla
Clear-Host

# -------------------------------------------------------------------------------------------------------------
# Se muestra por pantalla los ejecutables, tanto *.exe como *.com de C:\Windows\System32 junto a sus atributos
Get-ChildItem -Path C:\Windows\System32\* -Include ('*.exe', '*.com') | Select-Object Name,Mode,Length