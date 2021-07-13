FROM ruby:2.5.3
MAINTAINER Guillermo Guerrero 'guillermo.guerrero@fr.fcm.travel'

ENV PHANTOM_JS=phantomjs-2.1.1-linux-x86_64

RUN apt-get update && apt-get install -y wget python-pip less groff
RUN pip install awscli==1.11.18

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y ca-certificates wget
RUN apt-get update -qq && apt-get install -y build-essential default-libmysqlclient-dev libsnappy-dev libpq-dev cron libicu-dev git yarn nodejs postgresql-client

RUN wget https://github.com/Medium/phantomjs/releases/download/v2.1.1/$PHANTOM_JS.tar.bz2
RUN tar xvjf $PHANTOM_JS.tar.bz2
RUN mv $PHANTOM_JS /usr/local/share
RUN ln -sf /usr/local/share/$PHANTOM_JS/bin/phantomjs /usr/local/bin

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
