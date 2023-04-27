Requirments:

    Install Docker & Docker-compose

In the project directory, Run:

    docker-compose build

    docker-compose up

Access docker's application container using it's id by Run:

    docker ps

After getting it's id to access it, Run :

    sudo docker exec -it YOUR_CONTAINER_ID /bin/sh

    Note: replace YOUR_CONTAINER_ID with your container application id

For APIs Doc using Rswag Swagger, once you set up the project, Follow this link: http://localhost:3000/api-docs/index.html



rails g controller CreateUsers
rails g controller CreateRepositories
rails g controller CreateCommits
rails g controller CreateLanguages
rails g controller CreateTags
rails g controller CreateSearches
rails g controller CreateSearchTerms
rails g controller CreateFilters
rails g controller CreateFilterValues
rails g controller CreateSortingOptions
