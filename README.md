# Inception
## How to start

1. this you should create you .env in folder src
2. create folder secets in your folder
3. do this command:
   
       sudo docker rm $(sudo docker ps -aq) 
       sudo docker rmi $(sudo docker images -q)
       sudo docker volume rm $(sudo docker volume ls -q)

4. do this command:

       make fclean

5. create your data path

       make data_paths

7. in the end:

       make


### SSH Commands


    sudo apt install openssh-server
    sudo nano /etc/ssh/sshd_config
    sudo systemctl restart ssh
    sudo systemctl status ssh
    sudo service ssh start
    sudo service ssh stop

### Firewall

      sudo apt install ufw
      sudo ufw status
      sudo ufw enable
      sudo ufw allow 4242

### Connecting to a Server Using SSH
        hostname -I
        ssh UserName@IPAddressHostname -p 4242

# How to Start Docker on Debian Virtual Machine

## 1. Check if Docker is Installed
Open a terminal and run:  
```bash
docker --version
```
If you get a version number, Docker is installed. If not, install it with:

```bash
sudo apt update
sudo apt install docker.io
```

## 2. Start Docker Service
```bash
sudo systemctl start docker
```

## 3. Enable Docker to Start on Boot (optional)
```bash
sudo systemctl enable docker
```

## 4. Verify Docker Status
```bash
sudo systemctl status docker
```
You should see `active (running)` if Docker is running.

## 5. Run a Test Container
To confirm Docker works, run:  
```bash
sudo docker run hello-world
```

## (Optional) Run Docker Without `sudo`
Add your user to the `docker` group:  
```bash
sudo usermod -aG docker $USER
```
Then log out and back in for the changes to take effect.

---

You're now ready to use Docker on your Debian virtual machine! 🚀



This document is a System Administration related exercise.
