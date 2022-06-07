####################################################################################
# Title: The following are Powershell examples making calls to Transact WEB Services
# Author: Steve Tanori
# Ephesoft Professional Services
# March 2022
####################################################################################


############### GLOBAL TRANSACT SERVER VALUES  #############
$TransactHostname = "localhost"    #Specify just the hostname/IP of the Server, the http/https is set below
$TransactServerPort = "8080"       #Specify the Port running Transact Server
$httpOrHTTPS = "http"              #Specify either http or https
############################################################
# This section is for Authentication if needed
# Writes the encoded auth information to 'headers' variable
# Note: This example is using Tomcat/Basic Auth
# If using SSO, comment this out, and user credentials running Powershell script would be attempted
############################################################
<# #>
$user = "ephesoft"
$pass = "demo"
$pair = "${user}:${pass}"
$bytes = [System.Text.Encoding]::ASCII.GetBytes($pair)
$base64 = [System.Convert]::ToBase64String($bytes)
$basicAuthValue = "Basic $base64"
$headers = @{ Authorization = $basicAuthValue }
############################################################




############################################################
# LearnFuzzy DB Example									   #
############################################################
# This will call "Learn Fuzzy DB" via Transact Web Services 
# Visit here for additional details:
# https://web-services-explorer.ephesoft.cloud/dcma/rest/swagger-ui.html#!/ephesoft-batch-class-web-service/learnFuzzyDatabaseUsingPOST
############################################################
$batchClassID = "BC5"
$docType = "INVOICE"

$Uri = $httpOrHTTPS + "://" + $TransactHostname + ":" + $TransactServerPort + "/dcma/rest/batchClass/learnFuzzyDatabase'"
$Form = @{
    batchClassIdentifier  = $batchClassID
    documentType   = $docType
}
$xml = Invoke-RestMethod -Uri $Uri -Method Post -Form $Form -ContentType "application/xml" 
Write-host "Result of LearnFuzzyDB for $docType - $batchClassID : " 
$xml.Web_Service_Result.Response_Code

############################################################






############################################################
# Get All Batches in the system example					   #
############################################################
# Get Batches in the system in "READY FOR VALIDATION" Status
# Visit here for additional details:
# https://web-services-explorer.ephesoft.cloud/dcma/rest/swagger-ui.html#!/ephesoft-web-service-api/getBatchInstanceListUsingGET
############################################################

$Uri = $httpOrHTTPS + "://" + $TransactHostname + ":" + $TransactServerPort + "/dcma/rest/BatchInstanceList/READY_FOR_VALIDATION"
$xml = Invoke-RestMethod -Uri $Uri -Method Get -Headers $headers -ContentType 'application/xml'
Write-host "Result of Get BatchInstanceList in Ready for Validation State : " 
$xml.Web_Service_Result.Result_Message.Batch_Instances.BatchInstance
############################################################






############################################################
# Restart a Batch Instance example						   #
############################################################
# Restart Batch Instance starting at "Extraction" module
# Visit here for additional details: 
# https://web-services-explorer.ephesoft.cloud/dcma/rest/swagger-ui.html#!/ephesoft-web-service-api/restartBatchInstanceUsingGET
#############################################################

$batchIDtoRestart = "BI40"
$moduleToRestart = "Extraction_Module"

$Uri = $httpOrHTTPS + "://" + $TransactHostname + ":" + $TransactServerPort + "/dcma/rest/restartBatchInstance/" + $batchIDtoRestart + "/" + $moduleToRestart
$xml = Invoke-RestMethod -Uri $Uri -Method Get -Headers $headers -ContentType 'application/xml'
Write-host "Result of Restarting Batch Instance " $batchIDtoRestart ":"
$xml.Web_Service_Result.Response_Code
############################################################