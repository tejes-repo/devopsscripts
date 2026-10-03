#!/bin/bash
VER=26.9.0.129388
cd /opt/
wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-$VER.zip || exit 1
dnf install -y java-21-amazon-corretto unzip
unzip -q sonarqube-$VER.zip
useradd sonar
chown -R sonar:sonar sonarqube-$VER
find sonarqube-$VER -name "*.sh" -exec chmod +x {} \;
sysctl -w vm.max_map_count=524288
echo "vm.max_map_count=524288" >> /etc/sysctl.conf
su - sonar -c "sh /opt/sonarqube-$VER/bin/linux-x86-64/sonar.sh start"
