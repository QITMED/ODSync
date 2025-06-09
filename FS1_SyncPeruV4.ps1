# Obtener nombre de usuario actual
$userName = $env:USERNAME

# Armar dirección de correo esperada
$userEmail = "$userName@agenciaquiroga.com"

# Validar que el dominio sea correcto
if (-not ($userEmail -like "*@agenciaquiroga.com")) {
    Write-Host "El dominio del correo no es válido. El script se detendrá." -ForegroundColor Red
    exit
}

# Codificar email para URL
Add-Type -AssemblyName System.Web
$userEmailEncoded = [System.Web.HttpUtility]::UrlEncode($userEmail)

# Armar URL de sincronización
$SyncURL = "odopen://sync?userId=4759e515%2D644f%2D4273%2Dafbd%2D7aba3ff98989&userEmail=$userEmailEncoded&isSiteAdmin=0&siteId=%7B387262ca%2D560f%2D4a81%2Da818%2Da68b64471361%7D&webId=%7B801a2ea9%2Dee89%2D41ad%2D854d%2D26cf6d69e442%7D&webTitle=FileServer%201&webTemplate=21&webLogoUrl=%5Flayouts%2F15%2Fimages%2Fsiteicon%2Epng&webUrl=https%3A%2F%2Fqmedios%2Dmy%2Esharepoint%2Ecom%2Fpersonal%2Ffs1%5Fagenciaquiroga%5Fcom&onPrem=0&libraryType=2&listId=9d868cb7%2D6c67%2D45c4%2D9e44%2Da10b52a939d2&listTitle=Documentos&folderId=df7d2621%2D67d6%2D4cec%2D95b0%2D588c1b9ad203&folderName=Peru&folderUrl=https%3A%2F%2Fqmedios%2Dmy%2Esharepoint%2Ecom%2Fpersonal%2Ffs1%5Fagenciaquiroga%5Fcom%2FDocuments%2FPeru&scope=OPENFOLDER"

# Ejecutar sincronización
Start-Process $SyncURL
