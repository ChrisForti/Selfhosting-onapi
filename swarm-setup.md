3. Create the cluster using Docker Swarm.
4. Write the `docker-compose.yml` for your services

- Time to get to defining our services! In this case, I had two websites I wanted to host: **1** my personal website, and **2** a in hopes of, professional website.
  If you’re familiar with Docker, this part is quite straightforward. I had already `pushed` my website images up to Docker Hub, so this was a pretty quick operation. The only thing needed to do is to tell Docker that I had a custom network called `chris-server` and then make sure that my services connect to it.

```
services:
  savannahdev:
    image: "savannahostrowski/savannah.dev"
    ports:
     - "8080:80"
    networks:
     - arrakis
    deploy:
     mode: replicated
     replicas: 3
  getshreked:
   image: "savannahostrowski/getshreked"
   ports:
     - "8081:80"
   networks:
     - arrakis
   deploy:
     mode: replicated
     replicas: 3
networks:
  arrakis: {}
```

- Deploying this Compose file is a single command using docker stack `deploy --compose-file docker-compose.yml chris-server` **from the leader node**. Once this command was run, I validated that the services were operational via docker stack services **chris-server** .
