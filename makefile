setup-env:
	python -m venv .venv
	echo .venv/ >> .gitignore

run-db:
	docker run -d -p 3306:3306 --name mysql-db  -e MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD --mount src=mysql-db-data,dst=/var/lib/mysql mysql

format:
	isort .
	black .

docker-build:
	docker build -t unir-devops-medex-app .

docker-run:
	docker run -it -p 8020:8020 \
     -e DJANGO_SUPERUSER_USERNAME=admin \
     -e DJANGO_SUPERUSER_PASSWORD=sekret1 \
     -e DJANGO_SUPERUSER_EMAIL=admin@example.com \
     -e MEDEX_APP_USER=medex_app \
     -e MEDEX_APP_PASSWD=MYsuper$passwd123 \
     -e MEDEX_APP_DB=medex_app \
     -e MEDEX_APP_DB_HOST=127.0.0.1 \
     -e MEDEX_APP_DB_PORT=3306 \
     -e SECRET_KEY=MEGAPOWERFULLSECRETKEY \
     -e DEBUG=0 \
     unir-devops-medex-app