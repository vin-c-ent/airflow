FROM apache/airflow:2.7.0

# Install package via apt-get (has to be root mode)
USER root

RUN apt-get update \
  && apt-get install -y --no-install-recommends vim \
  && apt-get install -y --no-install-recommends net-tools \
  && apt-get autoremove -yqq --purge \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

USER airflow

# Adding new PyPI packages individually
COPY requirements.txt /
RUN pip install --no-cache-dir "apache-airflow==${AIRFLOW_VERSION}" -r /requirements.txt

# Copy Dags
COPY --chown=airflow:root dags/test_dag.py /opt/airflow/dags

# Copy startup script
COPY --chown=airflow:root startup.sh /opt/airflow

ENTRYPOINT /opt/airflow/startup.sh
