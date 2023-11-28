FROM nginx:latest
#apt-get upddate is not correct,fixed
RUN apt-get update && apt-get install -y nodejs
#down below commands help to enable kirillica(russian alphabet)
RUN apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
	&& localedef -i ru_RU -c -f UTF-8 -A /usr/share/locale/locale.alias ru_RU.UTF-8
ENV LANG ru_RU.UTF-8
#WORKDIR /app
COPY package*.json ./
COPY index.js ./
#CMD does not need quarrels,so I have removed them
CMD node index.js