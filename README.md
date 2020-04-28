# Phalcon

This is a PHP image with all the extensions necessary for testing one of my projects using a CI service. More information on what's included in the following table.

## Versions

| Tag         | PHP   | Phalcon | Redis | Added Extensions                                                                                          |
|-------------|-------|---------|-------|-----------------------------------------------------------------------------------------------------------|
| 7.4.5-4.0.5 | 7.4.5 | 4.0.5   | 3.0.0 | bcmath,bz2,calendar,dba,exif,gd,gettext,gmp,imap,intl,ldap,pdo_mysql,psr,soap,sockets,tidy,xmlrpc,xsl,zip |

## Drone CI .drone.yml example

```yaml
kind: pipeline
type: docker
name: default

- name: phpunit
  image: mnunes/phalcon:7.4.5-4.0.5
  commands:
  - composer install
  - nohup php -S localhost:8000 -t public .htrouter.php >/dev/null 2>&1 & sleep 2
  - ...
```
