# Build image

cd to the project folder

```
docker image build -t vincen/airflow:2.7.0 .
```

# Run the container

```
docker run -it -p 2222:8080 vincen/airflow:2.7.0
```

# How to use
1. visit http://localhost:2222/home
2. login with vincent/vincent


# Remark

1. The Line separator of startup.sh has to be LF, so that it could be run in Unix OS. Otherwise, there will be error like `airflow db migrate\r`.
