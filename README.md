# Iamge info

* based on the [docker-alpine][docker-alpine] minimal image.
* provides edge versions of: ruby, bundler
* with some wrapper scripts that assists in the cleanup of the cache and 
  dev-deps after installing gems:
  * `run-ext [cmd]` - install build utils (for compiling extenstions) + 
    run command + uninstall build utils
  * `gem-install [params]` - gem install + clean cache
  * `gem-install-ext [params]` - `run-ext gem-install [params]`
* all installed gems goes to `/opt/gems`
* local bundler config outside project - `/opt/bundle`
* `$GEM_HOME/bin` in the `$PATH`

[docker-alpine]: https://github.com/gliderlabs/docker-alpine
