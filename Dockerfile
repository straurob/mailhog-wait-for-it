FROM mailhog/mailhog:v1.0.0

LABEL maintainer="straurob@users.noreply.github.com"

USER root

WORKDIR /usr/bin

RUN apk update && apk upgrade \
    && apk --no-cache add \
        bash \
        ca-certificates \
        wget \
    && update-ca-certificates

# Download wait-for-it.sh
RUN wget https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh \
    && chmod a+x wait-for-it.sh

USER mailhog

WORKDIR /home/mailhog

ENTRYPOINT ["MailHog"]
