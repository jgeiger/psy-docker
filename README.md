Docker images for psy.

###VOLUMES:
registry: /registry
jenkins:  /var/lib/jenkins
          /var/log/jenkins

###PORTS
##external:
443: nginx
80: nginx

##internal:
5000: registry
8080: jenkins
