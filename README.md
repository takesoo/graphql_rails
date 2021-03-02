# docker_for_rails
Rails用docker環境

## tree
```
.
├── README.md
├── db
│   ├── data
│   ├── my.cnf
│   └── sql
├── docker-compose.yml
├── nginx
│   └── custom.conf
└── ruby
    ├── Dockerfile
    ├── custom
    └── src
```

# ready for the application
edit .env file  
edit /nginx/custom.conf to change ${COMPOSE_PROJECT_NAME}

# rails new 
if you create new project
```
$ docker-compose run ruby rails new . -d mysql --skip-bundle
```

# git clone
if you use created project from github, git clone into /ruby/src/

# start server
## only first time
```
$ docker-compose run ruby gem install puma
$ mkdir ruby/src/${COMPOSE_PROJECT_NAME}/tmp/sockets
$ touch ruby/src/${COMPOSE_PROJECT_NAME}/tmp/sockets/puma.sock
$ cp ruby/custom/puma.rb ruby/src/${COMPOSE_PROJECT_NAME}/config/puma.rb
$ cp ruby/custom/database.yml ruby/src/${COMPOSE_PROJECT_NAME}/config/database.yml
```

## start server
```
$ docker-compose up
```

# create database
only first time
```
$ docker-compose exec mysql mysql -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 30
Server version: 5.7.33 MySQL Community Server (GPL)

Copyright (c) 2000, 2021, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> grant all on *.* to docker@'%';
Query OK, 0 rows affected (0.01 sec)

mysql> exit
Bye

$ docker-compose exec ruby bash
# rake db:create
```
