 Update
sudo apt-get update

# Installing ca-certificates
if (which ca-certificates)
then
  echo "ca-certificates already installed"
else
  echo "Installing ca-certificates"
  sudo apt-get install ca-certificates
fi

# Installing curl
if (which curl)
then
  echo "curl already installed"
else
  echo "Installing curl"
  sudo apt-get install curl
fi

# Creating a keyrings directory
if (test -f /etc/bin/keyrings)
then
  echo "creating keyrings"
else
  echo "Creating keyrings"
  sudo install -m 0755 -d /etc/apt/keyrings
fi

# Adding gpg keyring
if (which gpg)
then
  echo "gpg keyring exists, and configured"
else
  echo "configuring gpg keyring"
  sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc 
fi

# Configuring keyring
if (test -f /etc/bin/keyrings/docker.asc)
then
  echo "gpg keyring configured"
else
  echo "configuring keyring"
  sudo chmod a+r /etc/apt/keyrings/docker.asc
fi