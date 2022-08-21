setup-env:
	python -m venv .venv
	echo .venv/ >> .gitignore

run-db:
	docker run -d -p 3306:3306 --name mysql-db  -e MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD --mount src=mysql-db-data,dst=/var/lib/mysql mysql

format:
	black .