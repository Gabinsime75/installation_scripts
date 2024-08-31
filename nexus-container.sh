# Pull the Nexus Docker image:
sudo docker pull sonatype/nexus3

# Run the Nexus container:
sudo docker run -d -p 8081:8081 --name nexus -v nexus-data:/nexus-data sonatype/nexus3

# Open a web browser and go to http://your_server_ip_or_domain:8081.
# The default username is admin.
#Retrieve the initial admin password from the log:
sudo docker logs nexus 2>&1 | grep -i password