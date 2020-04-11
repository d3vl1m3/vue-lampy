FROM mattrayner/lamp:latest-1804

# Your custom commands
RUN apt-get update

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt install nodejs

# JS stuff going
RUN npm i -g -y yarn
RUN yarn global add @vue/cli @vue/cli-service-global

# Get Symfony CLI sorted
RUN curl -sS https://get.symfony.com/cli/installer | bash
RUN mv /root/.symfony/bin/symfony /usr/local/bin/symfony

CMD ["/run.sh"]