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
CREATE LOGIN test_user WITH PASSWORD = 'new#Testuser001';
```
