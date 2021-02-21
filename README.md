# docker_for_rails
Rails用docker環境

## tree
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
