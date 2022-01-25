FROM mongo
FROM ruby:latest
ADD . /
WORKDIR /
RUN bundle install
RUN gem install thin && gem install puma && gem install reel && gem install http && gem install webrick
EXPOSE 9292
CMD ["/bin/bash"]

