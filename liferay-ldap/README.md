# Post Intallation Tasks

## LDAP

### Install `ldap-utils`

```bash
sudo apt install ldap-utils
```

### Test your LDAP-connection

```
ldapsearch -x -H ldap://localhost -b dc=example,dc=org -D "cn=admin,dc=example,dc=org" -w admin
``` 

## Liferay

1. Configure your LDAP connection

  |     Field         |    Value      |
  | ----------------- | ------------- |
  | Server Name   | __Training LDAP__ |
  | Load Default Server Configuration For | __Open LDAP__ |
  | Base Provider URL | __ldap://open-ldap:389__ |
  | Base DN | __dc=example,dc=org__ |
  | Principal | __cn=admin,dc=example,dc=org__ |
  | Credentials | __admin__ |

1. Configure the *Users* mapping as follows:

    __Leave the default values__

    > *Test LDAP Users* will display a list of LDAP users for the current mappings.

1. Configure the *Groups* mapping as follows:

    __Leave the default values__

    > *Test LDAP Groups* will display a list of LDAP groups for the current mappings and the number of each group's users.
