---
layout: post
title: Arrow Functions and Compatibility
date: 2015-10-25
categories: programming javascript
---

So I've just jumped two feet into javascript, it seems to be rather fun these days.

Remember when you had to do this?
<!-- <script src="http://gist.github.com/1943530.js"></script> -->

{% highlight js %}

var that = this;
function thatThing(){
  that.getTime();
}

{% endhighlight %}

{% highlight js %}

() => this.getTime();

{% endhighlight %}

Which is like what? I'm accessing the object from outside the function scope? This is awesome, means I don't have to mess around with this or that anymore!
