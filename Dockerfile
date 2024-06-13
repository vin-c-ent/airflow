FROM apache/airflow:2.7.0

USER root

RUN apt-get update && \
    apt install -y vim && \
    apt install -y net-tools && \
	apt-get clean

COPY startup.sh /opt/airflow

USER airflow

ENTRYPOINT /opt/airflow/startup.sh