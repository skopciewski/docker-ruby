FROM alpine:3.9

RUN apk add --no-cache ruby ruby-io-console ruby-bundler ruby-rake ruby-etc ca-certificates

# install gems globally, for great justice
ENV GEM_HOME /opt/gems
ENV PATH $GEM_HOME/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# local bundler config outside project
ENV BUNDLE_APP_CONFIG /opt/bundle

# configure bundler to use global gems
RUN bundle config path "$GEM_HOME" \
  && bundle config bin "$GEM_HOME/bin" \
  && bundle config console pry

# copy gemrc and gem utils
COPY data/gemrc /root/.gemrc
ADD data/sbin /usr/local/sbin

CMD ["sh"]
