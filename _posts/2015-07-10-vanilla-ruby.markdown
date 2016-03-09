---
layout: post
title: "Vanilla Ruby Fun"
date: 2015-07-10 00:01:25
catagories: programming ruby
---

Vanilla, a term that took me a while to truely understand and even longer to
include it in my vocabulary. I understand it as writing it all yourself from the
ground up without any additional moving parts. Wiki says

`Computer software, and sometimes also other computing-related systems like
computer hardware or algorithms, is called Vanilla when not customized from its
original form, meaning that it is used without any customizations or updates
applied to it.`

This code was built from the ground up with nothing but tmux and vim as a text
editor. I didn't even have an internet connection as most of this code base was
built on the bus to/from work. Here's the file structure:

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

The system is executed via the `run.rb` command, in my last article I spoke
about [writing scripts in ruby](/2015/07/09/ruby-scripting.html). The thing that
stands out is the low number of test files, but I promise, like a good
programmer I used TDD.

# Patterns
Essentially I used the command design pattern for input commands. This allows
us to seperate out the class that invokes the command from the one that executes
it. I used the strategy pattern to design the internal parts of the system.
Creating my own data structure and a singleton class which inherits it.

Now I know this article is titled "Vanilla Ruby Fun" but it's sort of pun title.
While writing ruby is a lot of fun, as developers in the ruby community, we need
to be aware that this isn't the only way to write ruby applications. Frankly,
this is a terrible way to write ruby there must be a better way.

# Conclusions
This app was particularly craft from the ground up as a lesson in ruby design
patterns in practise. I've since released this version on github and moved on to
using some of the tools the ruby community has come up with, hence no longer
vanilla ruby.
