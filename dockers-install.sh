 Update
sudo apt update

# Installing ca-certificates
if (which ca-certificates)
then
  echo "ca-certificates already installed"
else
  echo "Installing ca-certificates"
  sudo apt install ca-certificates
fi

# Installing curl
if (which curl)
then
  echo "curl already installed"
else
  echo "Installing curl"
  sudo apt install curl
fi

if (test -f /etc/bin/keyring)
then
  echo "creatingg keyring"
else
  echo "Creating keyring"
  sudo apt install /etc/apt/keyrings
fi

# Adding, and configuration of gpg keyring
if (which gpg)
then
  echo "gpg keyring exists, and configured"
else
  echo "configuring gpg keyring"
  sudo curl-fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc 
fi

if (test -f /etc/bin/keyring/docker.asc)
then
  echo "gpg keyring configured"
else
  echo "configuring keyring"
  sudo chmod a+r /etc/apt/keyrings/docker.asc
fi