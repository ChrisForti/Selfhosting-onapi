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

  - At this point, you should be able to hit the endpoints on any one of the cluster node IPs and see your website!
