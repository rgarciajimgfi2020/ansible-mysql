# ansible-mysql
Despliegue de container Mysql e insercción de datos.

## Supported Operating Systems

- Ubuntu 16.04 or higher
- CentOS 7

## Supported Ansible Versions

- Ansible 2.5 or higher

## Directory Structure
```
.
├── dev
│   └── inventory
├── LICENSE
├── README.md
├── roles
│   ├── role-ansible-mysql
│   │   ├── defaults
│   │   └── meta
│   │   ├── tasks
│   │   └── templates
└── site-mysql-container.yml
