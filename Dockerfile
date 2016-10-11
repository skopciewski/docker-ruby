FROM gliderlabs/alpine:3.4

RUN apk-install ruby ruby-io-console ruby-bundler ruby-rake ca-certificates

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
COPY data/run-ext /usr/local/sbin/run-ext
COPY data/gem-install /usr/local/sbin/gem-install
COPY data/gem-install-ext /usr/local/sbin/gem-install-ext

