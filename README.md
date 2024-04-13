# This particular code will alow you to automate your hosting environment, and allow you to bring it home to your pi, or pi's.

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
