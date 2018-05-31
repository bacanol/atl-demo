startme() {
	echo "Starting Atlassian demo environment in correct order..."
	docker start postgresql
	sleep 10s;
	docker start bamboo
	sleep 20s;
	docker start bitbucket
	sleep 30s;
	docker start nexus
	sleep 40s;
	docker start sonaqube
	sleep 50s;
	docker start jira
	sleep 60s;
	docker start confluence
#	sleep 70s;
#	docker start tomcat
	echo "...everything started in order."
}

stopme() {
	echo "Stopping Atlassian demo environment in correct order..."
	docker stop bamboo
	sleep 5s;
	docker stop bitbucket
	sleep 5s;
	docker stop nexus
	sleep 5s;
	docker stop sonaqube
	sleep 5s;
	docker stop jira
	sleep 5s;
	docker stop confluence
	sleep 5s;
#	docker stop tomcat
#	sleep 5s;
	docker stop postgresql
	echo "...everything stopped in order."
}

case "$1" in 
    start)   startme ;;
    stop)    stopme ;;
    restart) stopme; startme ;;
    *) echo "usage: $0 start|stop|restart" >&2
       exit 1
       ;;
esac

