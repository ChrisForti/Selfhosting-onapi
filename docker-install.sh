# Then install docker's latest
if ( which docker )
then 
  echo "Dockers latest already installed"
else
  echo "Installing docker"
  sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
fi
