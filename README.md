puppet-modules
==============

This contains a collection of Puppet modules used at
[Stinkyink.com](http://stinkyink.com). We aim to make our modules as generic as
possible, leveraging hiera config to manage organisation information.

Some modules that are not so generic:

* role

We recommend using something like
[librarian-puppet](https://github.com/rodjek/librarian-puppet) to manage your
modules. It makes it easy to include a given module, especially when people like
use have a single repository for all their modules. For example, to just use our
Ruby module you could add this to your Puppetfile

    mod "ruby", :git => "https://github.com/stinkyink/puppet-modules.git", :path => "ruby"

License
-------
Please see the [LICENSE](https://github.com/stinkyink/puppet-modules/blob/master/LICENSE)
file
