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

    $where = {$_.model -like "MS*"}
    if($NetworkID){
        return Get-MerakiDevice -NetworkID $NetworkID | Where-Object $where
    }else{
        return Get-MerakiDevice | Where-Object $where
    }

}

function Get-MerakiAPs ($NetworkID) {

    $where = {$_.model -like "MR*"}
    if($NetworkID){
        return Get-MerakiDevice -NetworkID $NetworkID | Where-Object $where
    }else{
        return Get-MerakiDevice | Where-Object $where
    }

}

function Get-MerakiAppliances ($NetworkID) {

    $where = {$_.model -like "MX*"}
    if($NetworkID){
        return Get-MerakiDevice -NetworkID $NetworkID | Where-Object $where
    }else{
        return Get-MerakiDevice | Where-Object $where
    }

}

function Get-MerakiDevice ($NetworkID) {

    if(-not $NetworkID){
        $OrgId = (Get-MerakiOrganizations).id
        $NetworkID = (Get-MerakiNetworks -OrganizationID $OrgId).id
    }
    
    $output = $NetworkID | ForEach-Object {
        $uri = $api.endpoint + "/networks/$_/devices"
        Invoke-MerakiRequest -Uri $uri
    } | ForEach-Object {$_}

    return $output

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