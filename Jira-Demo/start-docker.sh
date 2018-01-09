docker run -v /opt/atlassian/jira:/var/atlassian/jira -v /opt/atlassian/jira/logs:/opt/atlassian/jira/logs --name="jira" -d -p 8080:8080 atlassian/jira-server
