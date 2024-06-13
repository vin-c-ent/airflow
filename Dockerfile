FROM apache/airflow:2.7.0

USER root

RUN apt-get update \
  && apt-get install -y --no-install-recommends vim \
  && apt-get install -y --no-install-recommends net-tools \
  && apt-get autoremove -yqq --purge \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

COPY startup.sh /opt/airflow

USER airflow

ENTRYPOINT /opt/airflow/startup.sh
