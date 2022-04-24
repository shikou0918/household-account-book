FROM ruby:2.7.2
RUN apt-get update -qq && apt-get install -y build-essential nodejs postgresql-client libpq-dev

RUN apt-get update && apt-get install -y curl apt-transport-https wget && \
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
apt-get update && apt-get install -y yarn

RUN curl -sL https://deb.nodesource.com/setup_7.x | bash - && \
apt-get install nodejs

RUN mkdir /household-account-book
WORKDIR /household-account-book
COPY Gemfile /household-account-book/Gemfile
COPY Gemfile.lock /household-account-book/Gemfile.lock
RUN bundle install
COPY . /household-account-book

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
