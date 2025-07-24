## Run Step

### Start Jenkins

```
cd jenkins
docker compose up -d
```

### Get Jenkins Initial secret

```
docker compose logs
```

### Initial Jenkins

```
url : http://localhost:8080
user admin / admin
```

### Create database for test

```
url: http://localhost:8978
user cbadmin / N01cbadmin
```

```
create database test_db;
```

### Build Agent

```
docker compose up -d agent
docker run -i --rm --name build --init --net=jenkins_default  python-agent java -jar /app/agent.jar -url http://jenkinsmaster:8080/  -secret 9fd60c3d196bd13c2a393c5c781a0aa3f4a7d9754a06d59fab826b51b1442769 -name python-agent -webSocket -workDir "/home/jenkins/agent"
```

### Run docker

```
docker run --rm  -v $(pwd)/examples/sample_data:/data -e DB_SERVER=mssql --net=jenkins_default test /data/test_data.csv
```

### SonarQube

```
http://localhost:9000
user admin /  N01#sonarqube
```

### Sonar Scanner

```
url = https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-7.1.0.4889-linux-x64.zip

subfolder = sonar-scanner-7.1.0.4889-linux-x64
```

### ZAP Scan
```
docker run -t zaproxy/zap-stable zap-full-scan.py -t http://host.docker.internal:3000
```
