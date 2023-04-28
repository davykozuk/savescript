# Spécifiez les paramètres de la sauvegarde
$source = "\\chemin\vers\votre\dossier\source"
$destination = "\\chemin\vers\votre\dossier\destination"
$logFile = "\\chemin\vers\votre\fichier\journal.log"

# Vérifiez si le dossier de destination existe. Si ce n'est pas le cas, créez-le.
if (-not (Test-Path $destination)) {
    New-Item -ItemType Directory -Path $destination | Out-Null
}

# Créez un fichier journal pour enregistrer les détails de la sauvegarde
$timestamp = Get-Date -Format "yyyyMMddHHmmss"
$logFilePath = "$logFile.$timestamp"
New-Item -ItemType File -Path $logFilePath | Out-Null

# Sauvegardez le dossier source dans le dossier de destination en mode incrémentiel
Robocopy $source $destination /MIR /FFT /Z /XA:H /W:5 /LOG:$logFilePath


#############################################################################################################################################################################
#
#Ce script utilise la commande Robocopy pour effectuer la sauvegarde incrémentielle. Les paramètres spécifiés dans la commande sont les suivants :
#
# /MIR : copie tous les fichiers, y compris ceux qui ont été supprimés dans la source
# /FFT : utilise un temps de fichier différentiel pour comparer les heures de modification
# /Z : redémarre la copie avec les erreurs en mode de récupération en cas d'interruption de connexion
# /XA:H : exclut les fichiers cachés
#/W:5 : attend 5 secondes entre les tentatives de copie en cas d'erreur
# /LOG:$logFilePath : enregistre les détails de la copie dans le fichier journal spécifié
#Assurez-vous de remplacer les chemins d'accès dans le script par les vôtres. Vous pouvez également modifier les paramètres de la commande Robocopy en fonction de vos besoins.