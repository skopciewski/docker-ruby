FROM gliderlabs/alpine:edge

RUN apk-install ruby ruby-io-console ruby-bundler ruby-rake

# install gems globally, for great justice
ENV GEM_HOME /opt/gems
ENV PATH $GEM_HOME/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# copy gemrc and gem utils
COPY gemrc /root/.gemrc
COPY run-ext /usr/local/sbin/run-ext
COPY gem-install /usr/local/sbin/gem-install
COPY gem-install-ext /usr/local/sbin/gem-install-ext

# local bundler config outside project
ENV BUNDLE_APP_CONFIG /opt/bundle

# configure bundler to use global gems
RUN bundle config path "$GEM_HOME" \
  && bundle config bin "$GEM_HOME/bin" \
  && bundle config console pry

