Sangaku
=======

Sangaku is a geometry gem for Ruby.

[![Code Climate](https://codeclimate.com/github/agworld/sangaku.png)](https://codeclimate.com/github/agworld/sangaku)
[![Dependency Status](https://gemnasium.com/agworld/sangaku.png)](https://gemnasium.com/agworld/sangaku)
[![Build Status](https://secure.travis-ci.org/agworld/sangaku.png)](http://travis-ci.org/#!/agworld/sangaku)

Getting Started
---------------

Simply `sudo gem install sangaku` and then `require 'sangaku'` in your code.

Look at the examples on this page, the [tests](https://github.com/agworld/sangaku/blob/master/spec) and the [API docs](http://rubydoc.info/github/agworld/sangaku/master/frames) to get up to speed.

Example Usage
-------------

```ruby
data = [[10, 10], [10, 20], [20, 10]]
polygon = Sangaku::Polygon.new(*data)
polygon.close!
aabb = polygon.aabb
puts aabb.mid
```

This code prints the following:

```
(15.0, 15.0)
```

Contributing to Sangaku
-----------------------

* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

Copyright
---------

Copyright (c) 2013 Agworld Pty. Ltd. See LICENSE.txt for further details.
