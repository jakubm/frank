FROM ruby:2.5

WORKDIR /app
COPY . /app

RUN bundle install

EXPOSE 4567

CMD ["/usr/local/bin/ruby", "app.rb"]
