if (which curl)
then 
  echo "curl already installed"
else
  echo "Installing curl"
  sudo apt update
  sudo apt install curl
fi

if (test -f /etc/apt/keyrings/docker.asc)
then 
  echo "Keyrings already present"
else 
  echo "Creating keyrings"
  sudo install -m 0755 -d /etc/apt/keyrings
fi

if (which gpg)
then 
  echo "Gpg alraed installed"
else
  echo "Installing, and configuring gpg"
  sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
fi
