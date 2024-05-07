# Add Cloudflare’s package signing key:

sudo mkdir -p --mode=0755 /usr/share/keyrings
curl -fsSL https://pkg.cloudflare.com/cloudflare-main.gpg | sudo tee /usr/share/keyrings/cloudflare-main.gpg >/dev/null

# Add Cloudflare’s apt repo to your apt repositories:

echo "deb [signed-by=/usr/share/keyrings/cloudflare-main.gpg] https://pkg.cloudflare.com/cloudflared $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/cloudflared.list

# Update repositories and install cloudflared:

sudo apt update && sudo apt install cloudflared

# Use the rpm package manager to install cloudflared on compatible machines.

curl -fsSL https://pkg.cloudflare.com/cloudflared-ascii.repo | sudo tee /etc/apt.repos.d/cloudflared.repo

# Update repositories and install cloudflared:

sudo apt update && sudo apt install cloudflared
