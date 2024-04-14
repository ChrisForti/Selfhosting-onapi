# This particular code will alow you to automate your hosting environment, and bring it home to your pi, or pi's.

- I will start with utillizing a single pi, and move into a pi cluster.
  - which can be replicated on any self-hosting environment.

## Why do this at all?

This isn’t about criticizing any major cloud service provider. I simply enjoy physical computing, and I like to experiment. Especially with low cost hardware, and high end coding. For optimization, and automation: That enhances scale, and all around dev experience.

# Setting up:

1. Image a micro SD card for your Pi.

- Image your micro SD card with **Raspberry Pi OS Lite** using the Raspberry **Pi Imager** utility,

2. Install Docker 🐳

- Then we are going to grab their IP addresses, and make note of which Pi had which IP address.
- Then ssh into each one and install Docker using the official release.

3. Create the cluster using Docker Swarm.
4. Write the `docker-compose.yml` for your services

- Time to get to defining our services! In this case, I had two websites I wanted to host: 1) my personal website (where you’re reading this post!) and 2) an uber-professional website that’s an inside joke.

If you’re familiar with Docker, this part is quite straightforward. I had already pushed my website images up to Docker Hub, so this was a pretty quick operation. The only Swarm-specific thing I needed to do is to tell Docker that I had a custom network called `chris-server` and then make sure that my services connect to it.

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
  - At this point, you should be able to hit the endpoints on any one of the cluster node IPs and see your website!
