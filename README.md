# Iamge info

* based on the [docker-alpine][docker-alpine] minimal image.
* provides edge versions of: ruby, bundler
* with some wrapper scripts that assists in the cleanup of the cache and 
  dev-deps after installing gems:
  * `gem-install` - gem install + clean cache
  * `gem-install-ext` - install build utils (for compiling extenstions) + 
    `gem-install` + uninstall build utils
* all installed gems goes to `/opt/gems`
* local bundler config outside project - `/opt/bundle`
* `$GEM_HOME/bin` in the `$PATH`

[docker-alpine]: https://github.com/gliderlabs/docker-alpine
