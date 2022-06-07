# Ephesoft Transact Powershell

This repository contains PowerShell cmdlets for developers and administrators to develop, deploy, and manage the Ephesoft Transact application.

## Installation

### [PowerShell Gallery](https://www.powershellgallery.com/)

Run the following command in an elevated PowerShell session to install the module for Ephesoft Transact CMDlets:

```powershell
Install-Module -Name Ephesoft.Transact
```

This module runs on Windows PowerShell 7.0 or greater.

If you have an earlier version of the Ephesoft Transact PowerShell module installed from the PowerShell Gallery and would like to update to the latest version, run the following command in an elevated PowerShell session:

```powershell
Update-Module -Name Ephesoft.Transact
```

`Update-Module` installs the new version side-by-side with previous versions. It does not uninstall the previous versions.

## Usage

### Discovering cmdlets

Use the `Get-Command` cmdlet to discover cmdlets within a specific module, or cmdlets that follow a specific search pattern:

```powershell
# List all cmdlets in the Ephesoft.Transact module
Get-Command -Module Ephesoft.Transact

# List all cmdlets that contain TransactBatch
Get-Command -Name '*TransactBatch*'
```

### Cmdlet help and examples

To view the help content for a cmdlet, use the `Get-Help` cmdlet:

```powershell
# View the basic help content for Get-TransactBatchClassList
Get-Help -Name Get-TransactBatchClassList

# View the examples for Import-TransactBatchClass
Get-Help -Name Import-TransactBatchClass -Examples

# View the full help content for Submit-TransactBatch
Get-Help -Name Submit-TransactBatch -Full
```

## Examples of Consuming Transact Web Services using PowerShell
The examples presented in the powershell script file are meant to provide examples of consuming the following Transact Web Service Calls. These can be used as a starting point to help build out calls to other Transact Web Service calls that are available.

### Transact Web Services: ###

* Learn Fuzzy DB
* Restart a Batch Instance


### Pre-requisite ###
The Transact Server that the web service call is sent to should have "Web Services" enabled on the Ephesoft Transact License.

### Configuring the Powershell Script ###

- First step is to fill out the Transact Server and Port information:
	* Set $TransactHostname to "Name of Transact Server Hostname" Note: "localhost" is used by default if running on Transact server directly
	* Set $TransactServerPort to "Transact Port"; If using Out of Box http, then it would normally be "8080", however if using SSL, it is most likely "443"
	* Set $httpOrHTTPS to "http" or "https" depending on how the Transact Server is configured. If using Out of Box configuration, most likely leave default as "http"
	
	
	![ServerSetupInfo.png](ReadMeImages/ServerSetupInfo.png)
	
	
- Fill out User Credential/Authenitcation information:
	* If using OOB Tomcat authentication or LDAP, configure the following:
	** $user - username of Transact User
	** $pass - password of Transact User
	
	* If using SSO, then comment out lines 20 - 26, these are used for basic Tomcat/ldap authentication. The script will utilize the credentials of the logged in user/executing the Powershell script when attempting to make the Transact Web Service call
	
	![UserCredSetup.png](ReadMeImages/UserCredSetup.png)
	

### Configuring Learn Fuzzy DB Web Service ###

To use/consume the "Learn Fuzzy DB" Web Service call in Transact, the following variables can be configured in the Powershell script example:

* $batchClassID - This should be the Batch Class you want to perform the "Learn Fuzzy DB" action on
* $docType - This should be the "Document Type Name" that is in the Batch Class containing the Fuzzy Database configuration that you want to "Learn DB"
	
![LearnFuzzyDBSetup.png](ReadMeImages/LearnFuzzyDBSetup.png)

### Configuring Restart a Batch Instance Web Service ###

To use/consume the "Restart Batch Instance" Web Service call in Transact, the following variables can be configured in the Powershell script example:

* $batchIDtoRestart - This should be the Batch Instance ID of the Batch you wish to restart
* $moduleToRestart - This should be the "Module Name" at which point in the Batch Class workflow that you wish to Restart the Batch Instance. For example, in the default value provided "Extraction_Module", the Batch will be restarted at "Extraction" in the Batch Workflow.
	
![RestartBISetup.png](ReadMeImages/RestartBISetup.png)
	
	
### Link for all available Transact Web Service calls ###

The complete list of api/Web Service calls that are available to use in Transact can be found here:

https://ephesoft.com/docs/products/transact/developers/web-services-api/web-services-explorer/


## Contributing
Please see the [CONTRIBUTING.md](CONTRIBUTING.md) file

## License
Please see the [LICENSE.md](LICENSE.md) file

## ChangeLog
Please see the [CHANGELOG.md](CHANGELOG.md) file