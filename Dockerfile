FROM ruby:3.0.0
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /yourapp
COPY Gemfile /yourapp//Gemfile
COPY Gemfile.lock /yourapp/Gemfile.lock
RUN bundle install

COPY . ./

# Launch the server (or run some other Ruby command)
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]

RUN echo hello \
# comment 
world

