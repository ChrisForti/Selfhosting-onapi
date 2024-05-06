# cloudflared should installed for tunneling
if (test -d /usr/share/keyrings)
then 
  echo "keyring already exists"
else
  echo "Making a directory for keyrings"
  sudo mkdir -p --mode=0755 /usr/share/keyrings
fi

# Installing curl
if (which curl)
then
  echo "curl already installed"
else
  echo "Installing curl"
  sudo apt install -y curl 
fi

# Adding a gpg keyring
if (test -f  /usr/share/keyrings/cloudflare-main.gpg)
then
  echo "gpg keyring already exists"
else
  echo "Installing gpg keyring"
  curl -fsSL https://pkg.cloudflare.com/cloudflare-main.gpg | sudo tee /usr/share/keyrings/cloudflare-main.gpg >/dev/null
fi

curl -fsSL https://pkg.cloudflare.com/cloudflare-main.gpg | sudo tee /usr/share/keyrings/cloudflare-main.gpg >/dev/null
echo "deb [signed-by=/usr/share/keyrings/cloudflare-main.gpg] https://pkg.cloudflare.com/cloudflared $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/cloudflared.list
sudo apt update && sudo apt-get install cloudflared
curl -fsSL https://pkg.cloudflare.com/cloudflared-ascii.repo | sudo tee /etc/yum.repos.d/cloudflared.repo
sudo apt update && sudo apt install cloudflared

# arch linux specific
pacman -Syu cloudflared