# Update
sudo apt update

# Installing ca-certificates
if (which ca-certificates)
then
  echo "ca-certificates already installed"
else
  echo "Installing ca-certificates"
  sudo apt install -y ca-certificates
fi

# Installing curl
if (which curl)
then
  echo "curl already installed"
else
  echo "Installing curl"
  sudo apt install -y curl 
fi

# Creating a keyrings directory 
if (test -d /etc/bin/keyrings)
then
  echo "creating keyrings"
else
  echo "Creating keyrings"
  sudo install -m 0755 -d /etc/apt/keyrings
fi

# Adding a gpg keyring
if (which gpg)
then
  echo "gpg keyring exists, and configured"
else
  echo "configuring gpg keyring"
  curl -fsSL https://download.docker.com/linux/debian/gpg | sudo -H gpg --dearmor -o /etc/apt/keyrings/docker.gpg
fi

if (test -f /etc/bin/keyrings/docker.gpg)
then
  echo " gpg keyring already configured"
else
  echo "configuring gpg keyrings"
  sudo chmod a+r /etc/apt/keyrings/docker.gpg
fi
