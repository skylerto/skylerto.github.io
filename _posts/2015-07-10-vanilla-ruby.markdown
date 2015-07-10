---
layout: post
title: "Vanilla Ruby Fun"
date: 2015-07-10 00:01:25
catagories: ruby programming
---

Vanilla, a term that took me a while to truely understand. Wiki says

`Computer software, and sometimes also other computing-related systems like
computer hardware or algorithms, is called Vanilla when not customized from its
original form, meaning that it is used without any customizations or updates
applied to it.`

This code was built from the ground up with nothing but tmux and vim as a text
editor. I didn't even have an internet connection as most of this code base was
built on the bus to/from work.

{% highlight bash %}
~ $ tree inventory/
inventory/
├── README.md
├── input
│   ├── bufferinvoker.rb
│   ├── commands
│   │   ├── addcommand.rb
│   │   ├── checkcommand.rb
│   │   ├── command.rb
│   │   ├── ordercommand.rb
│   │   └── showcommand.rb
│   ├── inputbuffer.rb
│   ├── inputhandler.rb
│   ├── invokers.rb
│   └── testing
│       └── buffer-test.rb
├── output
│   └── outputbuffer.rb
├── run.rb
└── system
    ├── bag.rb
    ├── exceptions.rb
    ├── inventory.rb
    └── testing
        └── bag-tests.rb

6 directories, 17 files
{% endhighlight %}


