---
layout: post
title: Arrow Functions and Compatibility
date: 2015-10-25
categories: programming javascript
---

I've taken a strong interest in Javascript this last few weeks. One of my professors told me that first years will be learning it in their first year.
So I've jumped in with two feet, I'm trying to solve all of my problems with javascript it seems to be rather fun these days.

<!-- <script src="http://gist.github.com/1943530.js"></script> -->

Coming into Javascript on the cusp of ECMAScript6 I get to see some interesting transitions. One of those transitions is arrow functions.
They're pretty awesome and I can't wait till safari supports them! 

An example of how cool arrow functions are, they allow you to have access to the object variable from within a arrow functions scope!
{% highlight js %}
this.timer = new Timer({
        ontick: (second) => this.getTime(second)
    });
{% endhighlight %}

As opposed to the old way where we have to store `this` in another variable, I call it that. Then we have access to the object variable within the function scope.
{% highlight js %}

var that = this;
this.tiemr = new Timer({
    ontick: function(second) { that.getTime(second) }
});

{% endhighlight %}

Alright, so it seems as though arrow functions clean up the code. I agree with this but warns to be careful with scope. It was a great lesson leared, I now know to stick with the old that = this notation for compatibility, but I can't wait for arrow functions to be supported.

Always,
Sky
