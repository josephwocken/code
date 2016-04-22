##Goal:

I want to have a ruby script running on cron that will periodically curl the apache storm servers that ExCat's
topology jars are running on, convert the json recieved from the REST endpoint into a log format format that is
stored on the filesystem. The hope will be to have logstash use a file input, along with the current beats one,
and send logs for indexing into elasticsearch. The script will run on the monitoring server (exclx1003).

Will port to Chef recipe.

##Elements of Script:
* Input - from properties file
** name of topology
** list of servers
** REST endpoint URLs

* Clock for timestamp
* Message
** Active or Not Active
