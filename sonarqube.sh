#!/bin/bash
cd /opt/
wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-26.9.0.129388.zip || exit 1
dnf install -y java-21-amazon-corretto unzip
unzip sonarqube-26.9.0.129388.zip
useradd sonar
chown -R sonar:sonar sonarqube-26.9.0.129388
sysctl -w vm.max_map_count=524288
echo "vm.max_map_count=524288" >> /etc/sysctl.conf
su - sonar -c "/opt/sonarqube-26.9.0.129388/bin/linux-x86-64/sonar.sh start"
# Open http://<server-ip>:9000 after 1-2 minutes (login: admin / admin)
