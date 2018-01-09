docker run -v /opt/atlassian/bamboo:/var/atlassian/bamboo --name="bamboo" -d -p 8085:8085 -p 54663:54663 atlassian/bamboo-server:latest
