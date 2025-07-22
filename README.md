## Step 1

### Start Jenkins

```
cd jenkins
docker compose up -d
```

### Initial Jenkins

```
url : http://localhost:8080
```

### Get Jenkins Initial secret

```
docker compose logs
```

### Create database for test

```
url: http://localhost:8978
```

```
create database test_db;
```

### Run docker

```
docker run --rm  -v $(pwd)/examples/sample_data:/data -e DB_SERVER=mssql --net=jenkins_default test /data/test_data.csv
```
