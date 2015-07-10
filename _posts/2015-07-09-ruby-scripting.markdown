---
layout: post
title: "Writing Ruby scripts"
date: 2015-07-09 16:07:30
catagories: ruby scripting programming
---

TL;DR visit `Sum it up already`

As programmers we like to get the most amount of work done doing the least
amount of things. Some people call it effeciency, I just know we have a tendancy
to be lazy.

I know what you're thinking, why are you saying this Sky? We'll, my dear friends
I have something super cool to teach you today. We're going to learn the basics
of automating all the things!

# Oh yeah, shebang

To start off we first need to tell the computer something. We start our file off
with something called a shebang, it's basically just going to tell the compile
that well, our script bangs. jk, but hopefully it does..

{% highlight ruby %}
#!/usr/bin/env ruby
{% endhighlight %}

The importance of this little line is emence, without it well, we wouldn't have
an executeable script.

# Lets Say hi

Alright, like any good programmer we start off with "hello, world!" we can write
a whole nother article on the importance of hello world, but, we'll save that
for later. 

If you know ruby then you know how easy this is...

lets create a file and name it `hello`. Again, I know what you're thinking
"silly Skyler, we obviously need the .rb extension for a ruby file, like duh". I
must say humour me for a second, we don't ever see commands like `ruby`,
`rails`, or even `pwd` show up with their file extensions.

{% highlight ruby %}
#!/usr/bin/env ruby

puts "Hello, world!"
{% endhighlight %}

# Do something please

Alright, this part is REALLY important. We need to make our script executable.
This is where we tell our computer that we want it to read the file and execute
the ruby instructions. We do this with `chmod`:

{% highlight bash %}
$ chmod +x hello
$ ls -l
-rwxr-xr-x   1 sky  staff    42  9 Jul 17:23 hello
{% endhighlight %}

Now let's give our script a go!

{% highlight bash %}
$ ./hello
Hello, world!
{% endhighlight %}

# I wanna be with you everywhere

Okay, that was cool. Now what if we want to be able to use our script where ever
we want to? Well, lets just drop it in out PATH!

{% highlight bash %}
$ mkdir ~/bin
$ export PATH=~/bin:$PATH
$ mv hello ~/bin
{% endhighlight %}

Now, lets give it a shot!

{%highlight bash %}
$ hello
Hello, world!
{% endhighlight %}

# Sum it up already!

Alright, what'd be learn?  
 - Don't forget shebang  
 - Allow executeable permissions  
 - Move to ~/bin aka our tool belt if we want our scripts close to us  
