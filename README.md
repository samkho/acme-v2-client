# Work-in-progress
Forked from [kaienkira/acme-v2-client](https://github.com/kaienkira/acme-v2-client), this project is being modified to use dns-01 challenge.

Below is from original README.md...

# acme-v2-client
a small PHP script to get and renew TLS certs from Let's Encrypt (Support ACME v2)

* Support ACME v2 (RFC 8555), ACME v1 is deprecated
* Please Read The Lastest Terms of Service Of Let's Encrypt Before You Use this Script.  
  https://letsencrypt.org/documents/LE-SA-v1.2-November-15-2017.pdf
* Please Audit The Code Before You Use It
* Never Let The Script Run By Root
* Never Let The Script Read Your Domain Private Key
* use ssl server test to check your website's security  
  https://www.ssllabs.com/ssltest/

# What you need to use this script to setup a https website
* **account private key**
  * used to register and communicate with acme server
  * the script need the read access of the account key
* **domain private key**
  * used as your website ssl private key
  * it must be different from your account private key for security
  * keep it in safe place, don't let the script read it
* **csr file** (Certificate Signing Request)
  * used to request the cert from CA
  * can be generated from your domain private key
  * the script need the read access of the csr file
* **http challenge dir** (which can be access by your domain)
  * used to prove the domain is in your control, acme server will
    access your domain like  
    http://yourdomain.com/.well-known/acme-challenge/<challenge_file_name>
  * the script need the write access of the http challenge dir
  * the script will put the challenge file in this dir
* **a new user**
  * used to run this script
  * for security, never run this script by root
  * the user can not login from ssh  
    (set your /etc/passwd to disable login for the new user)
  * the user can not read the domain private key
  * the user can read the account private key, csr file only
  * the user can write to the http challenge dir 
  * set the renew cert crontab task for this user  
    (Let's Encrypt cert will exprired about 90 days)
* **custom dh paramters** (optional)
  * fix the weak Diffie-Hellman and the logjam attack issue

# Script Usage
```
usage: acme-v2-client.php
    -a <account_key_file>
    -r <csr_file> 
    -d <domain_list(domain1;domain2...;domainN)>
    -c <http_challenge_dir>
    -o <output_cert_file>
    [-t <terms_of_service>]

if -t command line option is set and it does not equal to the latest tos url,
you will get a error like:

terms of service has changed: please modify your -t command option
new tos: <new_tos>
```

# Detail Guide
## dependency
```
# install php-cli first
sudo apt-get install php-cli php-curl
```

## generate account private key
```
openssl genrsa -out account.key 4096
```

## generate domain private key
```
openssl genrsa -out domain.key 2048
```

## generate custom dh paramters
``
openssl dhparam -out dhparams.pem 2048
``

## generate csr from domain private key
```
# single domain
openssl req -new -sha256 -key domain.key -out domain.csr -subj "/CN=domain.com"

# multiple domain
cp /etc/ssl/openssl.cnf domain.conf
printf "[SAN]\nsubjectAltName=DNS:domain.com,DNS:www.domain.com" >> domain.conf
openssl req -new -sha256 -key domain.key -out domain.csr -subj "/" \
        -reqexts SAN -config domain.conf
```

# Thanks
kaienkira@gmail.com
tialaramex@reddit
