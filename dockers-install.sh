# Update
sudo apt update

# Installing curl
if (which curl)
then 
  echo "curl already installed"
else
  echo "Installing curl"
  sudo apt install curl
fi

# Adding, and configuration of gpg keyring
if [ -f /etc/apt/keyrings/docker.asc ]
then 
  echo "gpg keyring alread configured"
else 
  echo "configuring gpg keyring"
  sudo install -m 0755 -d /etc/apt/keyrings curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc chmod a+r /etc/apt/keyrings/docker.asc
fi

