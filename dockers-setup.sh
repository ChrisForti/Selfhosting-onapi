# Update
if (apt-cache show docker)
then
  echo "Running dockers latest"
else
  echo "Updating the latest docker"
  sudo apt update
fi

# Installing ca-certificates
if (test -d ca-certificates)
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


 
# setting permissions 
if (test -d /etc/bin/keyrings/docker.asc)
then
  echo " gpg keyring already configured"
else
  echo "Setting permissions for gpg keyring"
  sudo chmod a+r /etc/apt/keyrings/docker.asc
fi

# Intializing repository, and placing copies in .list files
if (test -S  /etc/os-release && echo "$VERSION_CODENAME")
then 
  echo "Repository already initialized"
else
  echo "Initializing repo"
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
fi 

# Update
if (apt-cache show docker)
then
  echo "Running dockers latest"
else
  echo "Updating the latest docker"
  sudo apt update
fi

# Then install docker's latest
if (which docker)
then
  echo "Docker already installed"
else
  echo "Installing docker"
  sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
fi

