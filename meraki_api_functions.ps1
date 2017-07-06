#Insert your API key here

$Global:MerakiApi = ''

$script:api = @{
    "endpoint" = 'https://dashboard.meraki.com/api/v0'
}

function Invoke-MerakiRequest ($Uri) {
    $header = @{
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

    $Devices = Get-MerakiDevice -NetworkID $NetworkID
    return $Devices | Where-Object {$_.model -match "MR*"}

}

function Get-MerakiAppliances ($NetworkID) {

    $Devices = Get-MerakiDevice -NetworkID $NetworkID
    return $Devices | Where-Object {$_.model -match "MX*"}

}

function Get-MerakiDevice ($NetworkID) {

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