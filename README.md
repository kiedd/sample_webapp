Set up new Docker server
* Create Ubuntu server
* run `sudo apt update`
* run `sudo apt upgrade`
* run `sudo apt-get install haveged`
* restart server by running `reboot`
* Install Docker (instruction [here](https://docs.docker.com/engine/install/ubuntu/) or [here](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04))
* Configure Docker logging (set local logging driver) by editing /etc/docker/daemon.json:
```
{
    "log-driver": "local"
}
```
* Create /root/secrets folder and copy JSON files from secrets folder in repository.
* Create /root/deploy_config folder
* create deploy key `ssh-keygen -t ed25519 -C "your_email@example.com"`. Choose default location and no passphrase.
* run `cat .ssh/id_ed25519.pub`, copy public key and add to new github deploy key
* create SSH key for deployment
`ssh-keygen -t rsa -b 4096 -C "your_email@example.com"`
`cat .ssh/id_rsa.pub >> .ssh/authorized_keys`
Copy Private Key content and paste in Github Secrets (SSHKEY): `cat .ssh/id_rsa`