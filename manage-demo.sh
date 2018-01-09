startme() {
	echo "Starting Atlassian demo environment in correct order..."
	docker start postgresql
	sleep 20s;
	docker start bamboo
	sleep 20s;
	docker start bitbucket
	sleep 20s;
	docker start nexus
	sleep 20s;
	docker start sonaqube
	sleep 20s;
	docker start jira
	sleep 30s;
	docker start confluence
	sleep 5s;
	docker start tomcat
	echo "...everything started in order."
}

stopme() {
	echo "Stopping Atlassian demo environment in correct order..."
	docker stop bamboo
	sleep 20s;
	docker stop bitbucket
	sleep 20s;
	docker stop nexus
	sleep 20s;
	docker stop sonaqube
	sleep 20s;
	docker stop jira
	sleep 30s;
	docker stop confluence
	sleep 5s;
	docker stop tomcat
	sleep 20s;
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

