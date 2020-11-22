# acme v2 client, with dns challenge for Hetzner DNS users
Forked from [kaienkira/acme-v2-client](https://github.com/kaienkira/acme-v2-client), and modified to use dns challenge instead of http directory challenge.

Single php file for easy modification.  Some extra convenience scripts provided.

## Input arguments to hdns-acme-v2-client.php
* domain name
* Hetzner Auth API Token
* Hetzner Zone Id

## Input Files (hardcoded names)
* account.key
* domain.csr

## Output File (hardcoded name)
* domain.crt

## Other File
* domain.key

## Files to install on your server
* domain.crt
* domain.key

## Convenience scripts
First, chmod +x \*.sh

Following scripts are not necessary but may be helpful:
* clean.sh - removes files from previous run
* hzones.sh - helps with knowing your zone id
* optrun.sh - creates input files and runs main php code

## See also
README.md at [kaienkira/acme-v2-client](https://github.com/kaienkira/acme-v2-client)

# Thanks
kaienkira@gmail.com

tialaramex@reddit
