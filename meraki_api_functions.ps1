#Insert your API key here

$Global:MerakiApi = ''

$script:api = @{
    "endpoint" = 'https://dashboard.meraki.com/api/v0'
}

function Invoke-MerakiRequest ($Uri) {
    $script:header = @{
        "X-Cisco-Meraki-API-Key" = $MerakiApi
        "Content-Type" = 'application/json'
    }
    Invoke-RestMethod -Method GET -Uri $uri -Headers $header
}

function Get-MerakiSwitches ($NetworkID) {

    $uri = $api.endpoint + "/networks/$NetworkID/devices"
    return Invoke-MerakiRequest -Uri $uri

}

function Get-MerakiAPs ($NetworkID) {

    $uri = $api.endpoint + "/networks/$NetworkID/devices"
    return Invoke-MerakiRequest -Uri $uri

}

function Get-MerakiAppliances ($NetworkID) {

    $uri = $api.endpoint + "/networks/$NetworkID/devices"
    return Invoke-MerakiRequest -Uri $uri

}

function Get-MerakiVPN ($OrganizationID) {

    $uri = $api.endpoint + "/organizations/$OrganizationID/thirdPartyVPNPeers"
    return Invoke-MerakiRequest -Uri $uri

}

function Get-MerakiNetworks ($OrganizationID) {

    $uri = $api.endpoint + "/organizations/$OrganizationID/networks"
    return Invoke-MerakiRequest -Uri $uri

}

function Get-MerakiOrganizations ($ApiKey) {

    if($ApiKey){
        $MerakiApi = $ApiKey
    }
    $uri = $api.endpoint + '/organizations'
    return Invoke-MerakiRequest -Uri $uri

}