---
layout: post
title: "Encryption in Java"
date: 2015-07-14 14:02:45
catagories: programming java algorithms
---

TL;DR [Check it out](https://github.com/skylerto/encryption)

I started reading [Java Concurrency in Practice](http://www.amazon.ca/Java-Concurrency-Practice-Brian-Goetz/dp/0321349601) by Brian Goetz and though how better to learn about concurrency in java then build an application the is concurrent! So I thought it'd be a good idea to start with a flavor of file IO. I'm by no means an amazing programmer. I just have a knack for solving problems in an organization fashion. That doesn't mean I don't aspire to be one of the greats, it just means I'm not there yet.

With that said this isn't an algorithm that will by any means compete with the
software that already exisits for encryption, it is merely an exercise in
software architecture as well as concurrency in Java.

# Structure

At the moment the application has a CLI, it taks as arguments, the input file,
output file, and an encryption key. 

# Encryption Algorithm

The algorithm used tp encrypt is a simple symmetric encryption, it gets the
integer value of the character and performs simple additions an modulo then
convert the integer back to a character. 


{% highlight java %}

protected char encryptChar(char character){
  if(this.key >= 0 && character > 31 && character < 127) {
    character = (char) ((((int) character - 32) + 2 * 95 + this.key) % 95 + 32);
  } else if (this.key < 0 && character > 3 && character < 127 ) {
    character = (char) ((((int) character - 32) + 2 * 95 - (-1*this.key)) % 95 + 32);
  }
  return character;
}

{% endhighlight %}

See I told you it was simple.

