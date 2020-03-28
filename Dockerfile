FROM jenkins/jenkins:2.222.1

# ENV JENKINS_HOME /var/jenkins_home
ENV JENKINS_REF /usr/share/jenkins/ref
ENV JENKINS_USER admin
ENV JENKINS_PASS admin
# ENV CASC_JENKINS_CONFIG /usr/share/jenkins/ref/casc_configs/
# Skip initial setup
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

#Install plugins
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

# copy config
COPY casc_configs/jenkins.yaml $JENKINS_REF/casc_configs/
# COPY init.groovy.d/executors.groovy $JENKINS_REF/init.groovy.d/
# COPY init.groovy.d/default-user.groovy $JENKINS_REF/init.groovy.d/

COPY init.groovy.d/startup.groovy $JENKINS_REF/init.groovy.d/

VOLUME /var/jenkins_home
