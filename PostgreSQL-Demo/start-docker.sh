docker run -v /opt/atlassian/pgsql:/var/lib/postgresql/data --name="postgresql" -d -p 5432:5432 -e POSTGRES_PASSWORD=pgsql123 postgresql/postgresql-server
