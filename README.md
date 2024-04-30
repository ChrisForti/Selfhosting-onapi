# This particular code will alow you to automate your hosting environment, and bring it home to your pi, or pi's.

- I will start with utillizing a single pi, and move into a pi cluster.
  - which can be replicated on any **self-hosting Rasberry-pi** environment.

## Why do this at all?

This isn’t about criticizing any major cloud service provider. I simply enjoy physical computing, and I like to experiment. Especially with low cost hardware, and high end coding. For optimization, and automation: That enhances scale, and all around dev experience.

# Setting up:

1. Image a micro SD card for your Rasberry pi, with **Raspbian Pi OS Lite 64 bit**

2. Install all dockers dependencies, and Docker 🐳

- run `dockers-install.sh`

- **To test the install** run:

  - `sudo docker run start`
  - `sudo docker run hello-world`

  - At this point, you should be able to hit the endpoints on your IP and see your website!

  ## Usage

  The Docker daemon binds to a Unix socket, not a TCP port. By default it's the root user that owns the Unix socket, and other users can only access it using sudo. The Docker daemon always runs as the root user.

- If you don't want to run docker at root level. You have to create a user,or run Docker without root privileges, **checkout:** [rootles](https://docs.docker.com/engine/security/rootless/)
- To setup user run:
  - `sudo groupadd docker`
  - `sudo usermod -aG docker $USER`
  - `newgrp docker`
  - `docker run hello-world`

### Built with

   <p>
    <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/ohmyzsh/ohmyzsh-original.svg" height="80" width="80" hspace="10px"/> 
    <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/bash/bash-plain.svg" height="80" width="80" hspace="10px"/>
    <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/docker/docker-original.svg" height="80" width="80" hspace="10px" />
    <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/raspberrypi/raspberrypi-original.svg" height="80" width="80" hspace="10px" />
           
   </p>
