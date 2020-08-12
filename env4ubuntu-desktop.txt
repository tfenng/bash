# chrome

wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo apt-get update
sudo apt-get -y install google-chrome-stable

# nvidia driver
sudo add-apt-repository ppa:graphics-drivers/ppa
sudo ubuntu-drivers devices
sudo ubuntu-drivers autoinstall

# QGis

wget -O - https://qgis.org/downloads/qgis-2019.gpg.key | gpg --import
gpg --fingerprint 51F523511C7028C3
gpg --export --armor 51F523511C7028C3 | sudo apt-key add -

echo "deb https://qgis.org/ubuntu bionic main" | sudo tee /etc/apt/sources.list.d/qgis.list
sudo apt update; sudo apt install qgis qgis-plugin-grass

# jupyter notebook
conda install ipykernel
python -m ipykernel install --user --name=base


#wine
sudo dpkg --add-architecture i386

wget -qO- https://dl.winehq.org/wine-builds/Release.key | sudo apt-key add -
sudo apt-add-repository 'deb http://dl.winehq.org/wine-builds/ubuntu/ artful main'
sudo apt-get install --install-recommends winehq-stable
