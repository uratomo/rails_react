
FROM ruby:2.5.3
# npm と yarnコマンドを使用できるようにする
RUN apt-get update -qq \
  &&  apt-get install -y apt-transport-https \
  &&  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  &&  echo "deb https://dl.yarnpkg.com/debian/ stable main" >> /etc/apt/sources.list.d/yarn.list \
  && curl -sL https://deb.nodesource.com/setup_10.x | bash - \
  && apt-get install -y build-essential gnupg nodejs yarn
RUN mkdir /app
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN gem install bundler && bundle install
COPY . /app
