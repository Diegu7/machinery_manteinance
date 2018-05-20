FROM ruby:2.4.4
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash
RUN apt-get install -y nodejs
RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
COPY package.json /myapp
RUN npm install
COPY . /myapp
RUN bundle exec rake db:drop db:create db:migrate
RUN bundle exec rails db:seed
CMD bundle exec rails server -p $PORT -e development -b 0.0.0.0
# EXPOSE $PORT