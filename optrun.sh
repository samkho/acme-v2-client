# Optional runner script
# just for convenience

rm account.key
rm domain.crt
rm domain.key
rm domain.csr

DOMAIN=www.example.org
TOKEN=PutYourHetznerAuthApiTokenHere

# run hzones.sh if you do not know your Zone Id
ZID=PutYourHetznerZoneIdHere

openssl genrsa -out account.key 4096
openssl genrsa -out domain.key 2048
# openssl dhparam -out dhparams.pem 2048
openssl req -new -sha256 -key domain.key -out domain.csr -subj "/CN=$DOMAIN"

./hdns-acme-v2-client.php -d $DOMAIN -k $TOKEN -z $ZID

