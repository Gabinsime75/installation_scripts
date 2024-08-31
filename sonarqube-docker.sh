# Create a network for SonarQube and PostgreSQL:
sudo docker network create sonarnet

# Run PostgreSQL container:
sudo docker run -d --name sonarqube_db --network sonarnet -e 
POSTGRES_USER=sonar -e POSTGRES_PASSWORD=sonar -e 
POSTGRES_DB=sonarqube -v postgresql:/var/lib/postgresql -v 
postgresql_data:/var/lib/postgresql/data postgres:latest

# Run SonarQube container:
sudo docker run -d --name sonarqube --network sonarnet -p 9000:9000 -e sonar.jdbc.url=jdbc:postgresql://sonarqube_db:5432/sonarqube -e sonar.jdbc.username=sonar -e sonar.jdbc.password=sonar -v sonarqube_data:/opt/sonarqube/data -v sonarqube_extensions:/opt/sonarqube/extensions sonarqube:latest