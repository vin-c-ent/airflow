# Build image

cd to the project folder

```
docker image build -t vincent/airflow:2.7.0 .
```

# Run the container

```
docker run --name vincent_airflow -it -p 2222:8080 vincent/airflow:2.7.0
```

# How to test in local
1. visit http://localhost:2222/home
2. login with vincent/vincent

# Archive the image, to be reused in NAS

```
docker image save -o vincent_airflow.tar vincent/airflow:2.7.0
```


# Remark

1. The Line separator of startup.sh has to be LF, so that it could be run in Unix OS. Otherwise, there will be error like `airflow db migrate\r`.
