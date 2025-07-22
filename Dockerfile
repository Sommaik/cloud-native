FROM python:3.9-slim

RUN apt-get update && apt-get upgrade -y && apt-get clean

WORKDIR /app
COPY requirements.txt .
COPY etl_pipeline.py .
RUN pip install --upgrade pip --timeout=120
RUN pip install -r requirements.txt --timeout=300
VOLUME [ "/data" ]
ENV DB_SERVER=localhost
ENV DB_NAME=test_db
ENV DB_USER=sa
ENV DB_PASSWORD=new#Mssql001

ENTRYPOINT ["python", "etl_pipeline.py"]