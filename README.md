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
