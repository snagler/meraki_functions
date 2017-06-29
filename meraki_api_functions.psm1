<# -----------------------------------------------------------------------------

 meraki_api_functions.psm1

 .Synopsis
    A helpful module to bridge PowerShell to and wrap the Meraki API endpoints.

----------------------------------------------------------------------------- #>
param (
    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [String]
    $api_key,
    
    [String]
    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    $networkID,
    
    [String]
    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    $orgID,
)

<# -----------------------------------------------------------------------------
 Get-MerakiSwitches()

 .Description
    List switches in a given Meraki network.
----------------------------------------------------------------------------- #>
function Get-MerakiSwitches {
param (
    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [String]
    $api_key,
    
    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [String]
    $networkID
)

    $header = @{
        "X-Cisco-Meraki-API-Key" = $api_key
        "Content-Type" = 'application/json'
    }

    $api = @{
        "endpoint" = 'https://dashboard.meraki.com/api/v0'
    }

    $api.url = "/networks/$networkID/devices"
    $uri = $api.endpoint + $api.url
    $request = Invoke-RestMethod -Method GET -Uri $uri -Headers $header
    return $request
} Export-ModuleMember -Function Get-MerakiSwitches

<# -----------------------------------------------------------------------------
 Get-MerakiAPs()

 .Description
    List Access Points in a given Meraki network.
----------------------------------------------------------------------------- #>
function Get-MerakiAPs {
param (
    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [String]
    $api_key,
    
    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [String]
    $networkID
)

    $api = @{
        "endpoint" = 'https://dashboard.meraki.com/api/v0'
    }

    $header = @{
        "X-Cisco-Meraki-API-Key" = $api_key
        "Content-Type" = 'application/json'
    }
    
    $api.url = "/networks/$networkID/devices"
    $uri = $api.endpoint + $api.url
    $request = Invoke-RestMethod -Method GET -Uri $uri -Headers $header
    return $request
}

<# -----------------------------------------------------------------------------
 Get-MerakiAppliances()

 .Description
    List Meraki appliances in a given Meraki network.
----------------------------------------------------------------------------- #>
function Get-MerakiAppliances {
param (
    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [String]
    $api_key,
    
    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [String]
    $networkID
)
    $api = @{
        "endpoint" = 'https://dashboard.meraki.com/api/v0'
    }

    $header = @{
        "X-Cisco-Meraki-API-Key" = $api_key
        "Content-Type" = 'application/json'
    }

    $api.url = "/networks/$networkID/devices"
    $uri = $api.endpoint + $api.url
    $request = Invoke-RestMethod -Method GET -Uri $uri -Headers $header
    return $request
} Export-ModuleMember -Function Get-MerakiAppliances

<# -----------------------------------------------------------------------------
 Get-MerakiVPN()

 .Description
    List VPN connections configured in a given Meraki organization.
----------------------------------------------------------------------------- #>
function Get-MerakiVPN {
param (
    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [String]
    $api_key,
    
    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [String]
    $networkID,
    
    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [String]
    $orgID
)
    $api = @{
        "endpoint" = 'https://dashboard.meraki.com/api/v0'
    }

    $header = @{
        "X-Cisco-Meraki-API-Key" = $api_key
        "Content-Type" = 'application/json'
    }

    $api.url = "/organizations/$orgID/thirdPartyVPNPeers"
    $uri = $api.endpoint + $api.url
    $request = Invoke-RestMethod -Method GET -Uri $uri -Headers $header
    return $request
}

<# -----------------------------------------------------------------------------
 Get-MerakiNetworks()

 .Description
    List networks for a given Meraki organization.
----------------------------------------------------------------------------- #>
function Get-MerakiNetworks {
param (
    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [String]
    $api_key,
    
    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [String]
    $networkID,
    
    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [String]
    $orgID
)
    $api = @{
        "endpoint" = 'https://dashboard.meraki.com/api/v0'
    }

    $header = @{
        "X-Cisco-Meraki-API-Key" = $api_key
        "Content-Type" = 'application/json'
    }

    $api.url = "/organizations/$orgID/networks"
    $uri = $api.endpoint + $api.url
    $request = Invoke-RestMethod -Method GET -Uri $uri -Headers $header
    return $request
} Export-ModuleMember -Function Get-MerakiNetworks

<# -----------------------------------------------------------------------------
 Get-MerakiOrganizations()

 .Description
    List organizations available to your Meraki API key.
----------------------------------------------------------------------------- #>
function Get-MerakiOrganizations {
param (
    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [String]
    $api_key
)
    $api = @{
        "endpoint" = 'https://dashboard.meraki.com/api/v0'
    }

    $header = @{
        "X-Cisco-Meraki-API-Key" = $api_key
        "Content-Type" = 'application/json'
    }

    $api.url = '/organizations'
    $uri = $api.endpoint + $api.url
    $request = Invoke-RestMethod -Method GET -Uri $uri -Headers $header
    return $request
} Export-ModuleMember -Function Get-MerakiOrganizations
