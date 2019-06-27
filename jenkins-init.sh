#!/bin/bash

# install jenkins
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
echo "deb http://pkg.jenkins.io/debian-stable binary/" >> /etc/apt/sources.list
apt-get update
apt-get install -y jenkins=2.32.1
#!/bin/sh

yum -y install java-1.8.0-openjdk
cd /tmp
wget --no-check-certificate -O /tmp/nexus-latest-bundle.tar.gz http://www.sonatype.org/downloads/nexus-latest-bundle.tar.gz
mkdir -p /opt/sonatype-nexus /opt/sonatype-work /opt/sonatype-work/nexus
tar -zxvf /tmp/nexus-latest-bundle.tar.gz -C /opt/sonatype-nexus --strip-components=1
useradd --user-group --system --home-dir /opt/sonatype-nexus nexus
chown -R nexus:nexus /opt/sonatype-work /opt/sonatype-nexus /opt/sonatype-work/nexus
cp /opt/sonatype-nexus/bin/nexus /etc/init.d/
sed -i 's/NEXUS_HOME=\"\.\.\"/NEXUS_HOME=\"\/opt\/sonatype-nexus\"/g' /etc/init.d/nexus
sed -i 's/\#RUN_AS_USER=/RUN_AS_USER=nexus/g' /etc/init.d/nexus
cd /etc/init.d
chkconfig --level 345 nexus on
/etc/init.d/nexus start
#!/bin/sh

/etc/init.d/nexus restart & sleep 30
curl -i -H "Accept: application/xml" -H "Content-Type: application/xml" -f -X POST -v -d "@repositories/gradle_repository.xml" -u admin:admin123 http://127.0.0.1:8081/nexus/service/local/repositories
curl -i -H "Accept: application/xml" -H "Content-Type: application/xml" -f -X POST -v -d "@repositories/distributions_repository.xml" -u admin:admin123 http://127.0.0.1:8081/nexus/service/local/repositories
curl -i -H "Accept: application/xml" -H "Content-Type: application/xml" -f -X POST -v -d "@repositories/ishreleases_repository.xml" -u admin:admin123 http://127.0.0.1:8081/nexus/service/local/repositories
curl -i -H "Accept: application/xml" -H "Content-Type: application/xml" -f -X POST -v -d "@repositories/components_group.xml" -u admin:admin123 http://localhost:8081/nexus/service/local/repo_groups
curl -i -H "Accept: application/xml" -H "Content-Type: application/xml" -f -X POST -v -d "@repositories/mavenall_group.xml" -u admin:admin123 http://localhost:8081/nexus/service/local/repo_groups
/etc/init.d/nexus restart
