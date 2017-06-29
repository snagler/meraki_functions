These are a set of functions to interact with the Meraki cloud via the REST API.

You will need to generate an API key on the Meraki Dashboard.

You will need to collect some data to input some IDs in order for the functions to all work.

1. Input your API key in the $api_key variable where it says INSERT_API_KEY_HERE
2. Run the Get-MerakiOrganizations function... this will output the Organization ID (we will need this)
3. Under the Get-MerakiNetworks and Get-MerakiVPN functions place the Organization ID inside the $api.url variable where it says INSERT_ORGANIZATION_ID
4. Run the Get-MerakiNetworks... this will output your network(s) data (we will need the id from the networks that contain your switche(s), AP(s) and security appliance(s))
5. Under the Get-MerakiSwitches, Get-MerakiAPs and Get-MerakiAppliances functions place the network ID (for the correct network: Get-MerakiSwitches will need the switch network ID,etc,etc) in the $api_url variable where it says INSERT_NETWORK_ID

I accept tips if you found these functions useful:

Bitcoin: 13E8u5PmKqrpvQRnBMPZjtFzo5nQr5SuuL