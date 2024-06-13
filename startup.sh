airflow db migrate
airflow users create --username vincent --password vincent --role Admin --firstname vincent --lastname wang --email 619054251@qq.com

airflow scheduler &

airflow webserver