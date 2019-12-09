echo " wanna install furious Java"
read java
if [ $java=='yes']
then


#java
sudo yum install -y git  java-1.8.0-openjdk-devel aws-cli
sudo alternatives --config java

else 
echo "You are out of mind!"
fi

#maven 

sudo wget http://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O /etc/yum.repos.d/epel-apache-maven.repo
sudo sed -i s/\$releasever/6/g /etc/yum.repos.d/epel-apache-maven.repo
sudo yum install -y apache-maven
mvn –v

#Jenkins
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo

sudo rpm --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key

sudo yum install jenkins

sudo service jenkins start

sudo chkconfig --add jenkins
