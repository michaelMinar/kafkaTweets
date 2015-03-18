# kafkaTweets

This is a fun experiment to test out the use of ansible to deploy Apache Kafka, Mesos, and Spark onto 
some Digital Ocean boxes. We'll use a combination of Python and Scala to analyze and report on data.

To use of this code, we STRONGLY recommend that you use some tools:
pyenv and virtualenv. To get going with those, do the following.

- Be sure to get the latest, up to date version with `brew update` first. Next run `brew install pyenv pyenv-virtualenv`.
- You'll then need to add the following lines to your .profile or .bashrc file: ```eval "$(pyenv init -)"```, ```eval "$(pyenv virtualenv-init -)"```
- Once that is in place, you should check out the docs. Last, the script `caliban.sh` will help get your environment up and running, complete with a version of python 2.7.6.
