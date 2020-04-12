FROM mattrayner/lamp:latest-1804

# Although.. this is probably not needed as it can just be ran in the projects Root direct (
# ~/CF/app in my case, not ~CF/stack/app
VOLUME  ["/var/lib/mysql", "/app" ]

# as this is symfony, let's link the public directory instead
RUN mkdir -p /app/public && rm -fr /var/www/html && ln -s /app/public /var/www/html

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