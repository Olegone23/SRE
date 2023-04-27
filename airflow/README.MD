# Инструкция по запуску и дополнительной настройки Airflow

1) Зайти по SSH на вновь созданную виртуальную машину пользователем awsadmin
2) Перейти в каталог airflow
3) Проиницилизировать airflow, выполнив в терминале команду "docker-compose up airflow-init"
4) Запустить airflow выполнив команду "docker-compose up -d"
5) Залогиниться в UI консоли airflow "http://IP_ADDRESS:8080" (login: airflow; password: airflow)
6) Зайти в  "/connection/list/" и создать подключение к службе Yandex.Postgres (скриншот с настройками прилагается)
7) Поместить в папку ./dags файл pg_dag.py 
8) В списке dags найти "postgres_operator_dag" запустить его вручную (если вновь созданный dag отсутствует рестартануть docker-compose)
9) Зайти в Yandex.Postgres и убедиться что таблица "test" создана 