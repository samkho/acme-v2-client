# Optional runner script
#   just for convenience

# set the 6 variables below according to your situation
#   if you do not know your Zone Id, run hzones.sh
DOMAIN=www.example.org
REMOTE_DIR=/etc/stunnel
REMOTE_USER=user
SERVER=$DOMAIN
TOKEN=PutYourHetznerAuthApiTokenHere
ZONE_ID=PutYourHetznerZoneIdHere

# clean
rm account.key
rm domain.crt
rm domain.key
rm domain.csr

# generate keys
openssl genrsa -out account.key 4096
openssl genrsa -out domain.key 2048
# openssl dhparam -out dhparams.pem 2048

# generate certificate signing request
openssl req -new -sha256 -key domain.key -out domain.csr -subj "/CN=$DOMAIN"

# main ACME stuff; creates domain.crt if successful
./acme4hdns.php -d $DOMAIN -k $TOKEN -z $ZONE_ID

# check if we have domain.crt
if [ ! -f domain.crt ]; then
    echo
    echo "domain.crt not found:"
    echo "...acme4hdns.php must have failed!"
    echo
    exit 0
fi

# upload domain.crt and domain.key
#   you will be prompted for your sftp password
sftp $REMOTE_USER@$SERVER <<< "cd $REMOTE_DIR"$'\nput domain.crt\nput domain.key'

