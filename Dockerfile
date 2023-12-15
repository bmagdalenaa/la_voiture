FROM ruby:3.1.2
WORKDIR /app
RUN apt-get update -qq && apt-get install -y nodejs
COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install
RUN rails db:create db:migrate db:seed
COPY . .
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
