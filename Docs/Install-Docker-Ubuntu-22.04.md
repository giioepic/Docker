# Install Docker & Docker Compose on Ubuntu 22.04
Follow this documentation to set up docker & docker-compose on __Ubuntu 22.04 LTS__.

Run following command as regular user with sudo privilege, __not root__
# Disable firewall
```
sudo ufw disable
sudo iptables -F
sudo systemctl disable firewalld
sudo systemctl stop firewalld
```
# Prerequisite
##### Install basic packages
```
sudo apt-get update

sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
```
##### Get gpg key
```   
sudo mkdir -p /etc/apt/keyrings

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
```
##### Add apt docker repository
```
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```
# Install docker engine
```  
sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
```
```
sudo yum install *.rpm -y
```
# Add user to docker group
```
sudo usermod -aG docker $USER
```
# Enable docker and check docker version
```
sudo systemctl start docker
sudo systemctl enable docker
sudo systemctl status docker --no-pager
sudo chmod 666 /var/run/docker.sock
docker version
```
# Install docker-compose 2.6.0 
```
sudo curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
```
```
sudo chmod +x /usr/local/bin/docker-compose
```
```
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
```
```
docker-compose version
```
