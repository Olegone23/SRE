import datetime

from airflow import DAG
from airflow.providers.postgres.operators.postgres import PostgresOperator

# create_test_table is examples of task created by instantiating the Postgres Operator

with DAG(
    dag_id="postgres_operator_dag",
    start_date=datetime.datetime(2023, 5, 1),
    schedule_interval="@once",
    catchup=False,
) as dag:
    create_test_table = PostgresOperator(
        postgres_conn_id="postgres_ext",
        task_id="create_test_table",
        sql="""
            CREATE TABLE IF NOT EXISTS test (
            test_id SERIAL PRIMARY KEY,
            name VARCHAR NOT NULL,
            job_type VARCHAR NOT NULL,
            birth_date DATE NOT NULL,
            OWNER VARCHAR NOT NULL);
          """,
    )