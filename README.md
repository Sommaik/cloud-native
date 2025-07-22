## Step 1

### Start Jenkins

```
cd jenkins
docker compose up -d
```

### Initial Jenkins

```
url : http://localhost:8080
user admin / admin
```

### Get Jenkins Initial secret

```
docker compose logs
```

### Create database for test

```
url: http://localhost:8978
user cbadmin / N01cbadmin
```

```
create database test_db;
```

### Run docker

```
docker run --rm  -v $(pwd)/examples/sample_data:/data -e DB_SERVER=mssql --net=jenkins_default test /data/test_data.csv
```

### Build Agent

```
docker run -i --rm --name build --init --net=jenkins_default -v agent1-workdir:/home/jenkins/agent jenkins/agent java -jar /usr/share/jenkins/agent.jar -url http://jenkinsmaster:8080/  -secret 9fd60c3d196bd13c2a393c5c781a0aa3f4a7d9754a06d59fab826b51b1442769 -name python-agent -webSocket -workDir "/home/jenkins/agent"

docker run -i --rm --name build --init --net=jenkins_default -v agent1-workdir:/home/jenkins/agent python-agent java -jar /usr/share/jenkins/agent.jar -url http://jenkinsmaster:8080/  -secret 9fd60c3d196bd13c2a393c5c781a0aa3f4a7d9754a06d59fab826b51b1442769 -name python-agent -webSocket -workDir "/home/jenkins/agent"
```
