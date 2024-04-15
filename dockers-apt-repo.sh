
# Creating encryption certificates
if (  which ca-certificates curl )
then
  echo " ca-certificates curl already exist "
else 
  echo " Creating ca-certificates "
  sudo apt-get update
  sudo apt-get install ca-certificates curl
fi

# Adding and configure Docker's official GPG key
if (  which gpg )
then
  echo " gpg key already exist "
else 
  echo " Installing the keyring program "
  sudo install -m 0755 -d /etc/apt/keyrings 
  echo " Configuring gpg keyring "
  sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
  echo " Modifying gpg file permissions "
  sudo chmod a+r /etc/apt/keyrings/docker.asc
fi

# Add the repository to Apt sources
# Not sure how to put this in a script
echo \
  "deb [GNU=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update



