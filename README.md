# This particular code will alow you to automate your hosting environment, and bring it home to your pi, or pi's.

- I will start with utillizing a single pi, and move into a pi cluster.
  - which can be replicated on any **self-hosting Rasberry-pi** environment.

## Why do this at all?

This isn’t about criticizing any major cloud service provider. I simply enjoy physical computing, and I like to experiment. Especially with low cost hardware, and high end coding. For optimization, and automation: That enhances scale, and all around dev experience.

# Setting up:

1. Image a micro SD card for your Rasberry Pi.

- Image your micro SD card with **Raspberry Pi OS Lite** using the Raspberry **Pi Imager** utility,

2. Install Docker 🐳

- `sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin`
- **To test the install** run:
  - `sudo docker run hello-world`
 ```   Unable to find image 'hello-world:latest' locally
latest: Pulling from library/hello-world
478afc919002: Pull complete 
Digest: sha256:03b30c6a3c320ff172b52bd68eddffde6ded08ce47e650fe52de861c5e9df46d
Status: Downloaded newer image for hello-world:latest

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (arm64v8)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/get-started/
```
**Results from my first test after install**

- Then we are going to grab their IP addresses, and make note of which Pi had which IP address.
- Then ssh into each one and install Docker using the official release.

3. Create the cluster using Docker Swarm.
4. Write the `docker-compose.yml` for your services

- Time to get to defining our services! In this case, I had two websites I wanted to host: **1** my personal website, and **2** a in hopes of, professional website.
*/This is were i left off*/
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
  - At this point, you should be able to hit the endpoints on any one of the cluster node IPs and see your website!
