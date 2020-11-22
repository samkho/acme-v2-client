# run this to get the Zone Id for optrun.sh

TOKEN=PutYourHetznerAuthApiTokenHere
curl "https://dns.hetzner.com/api/v1/zones" -H "Auth-API-Token: $TOKEN"
