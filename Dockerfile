FROM mattrayner/lamp:latest-1804

# Your custom commands
RUN apt-get update

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt install nodejs

RUN npm i -g -y yarn
RUN yarn global add @vue/cli @vue/cli-service-global

CMD ["/run.sh"]