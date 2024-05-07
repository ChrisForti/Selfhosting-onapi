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


f (test -f /etc/apt/sources.list.d/cloudflared.list)
then 
  echo "Repository already initialized"
else
  echo "Initializing repo"
  echo "deb [signed-by=/usr/share/keyrings/cloudflare-main.gpg] https://pkg.cloudflare.com/cloudflared $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/cloudflared.list 
fi 

if (apt-cache show cloudflared)
then
  echo "Running cloudflared's latest"
else
  echo "Updating the latest cloudflared"
  sudo apt update && sudo apt install cloudflared
fi

if (test -S /etc/apt.repos.d/cloudflared.repo)
then 
  echo "Repository already initialized"
else
  echo "Initializing repo"
  curl -fsSL https://pkg.cloudflare.com/cloudflared-ascii.repo | sudo tee /etc/apt.repos.d/cloudflared.repo
fi 

if (apt-cache show cloudflared)
then
  echo "Running cloudflared's latest"
else
  echo "Updating the latest cloudflared"
  sudo apt update && sudo apt install cloudflared
fi


