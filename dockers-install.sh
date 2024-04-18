# Update
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

# Adding, and configuration of gpg keyring
if (test -f /usr/bin/keyring/docker.asc)
then
  echo "gpg keyring exists, and configured"
else
  echo "configuring gpg keyring"
  sudo apt install -m 0755 -d /etc/apt/keyrings curl-fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc chmod a+r /etc/apt/keyrings/docker.asc
fi