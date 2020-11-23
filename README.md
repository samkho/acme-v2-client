# ACME client for Hetzner DNS users
* An acme v2 client that uses dns challenge, for Hetzner DNS users.
* Forked from [kaienkira/acme-v2-client](https://github.com/kaienkira/acme-v2-client), and modified to use dns challenge instead of http directory challenge.
* Single php file for easy modification.  Some extra convenience scripts provided.
* Note that [Hetzner DNS](https://www.hetzner.com/dns-console) is free even for non-Hetzner customers.
* This project is not affiliated with Hetzner.  I just needed something for my own use.

## Input arguments to acme4hdns.php
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

Scripts are not necessary but may be helpful:
* clean.sh - removes files from previous run
* hzones.sh - helps with knowing your zone id, which is needed by optrun.sh and acme4hdns.php.
You'll need to set a variable in this file.
* optrun.sh - "optional runner script" that creates input files and runs main php code.
You'll need to set some variables in this file.

## See also
README.md at [kaienkira/acme-v2-client](https://github.com/kaienkira/acme-v2-client)

[Hetzner DNS Public API](https://dns.hetzner.com/api-docs/)

[diafygi/gethttpsforfree](https://github.com/diafygi/gethttpsforfree) is a great way to learn how ACME protocol works.
# Thanks
[kaienkira](https://github.com/kaienkira)

tialaramex@reddit
