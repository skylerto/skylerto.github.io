---
layout: post
title: Using fullpage.js and Rails
date: 2016-05-13
catagories: programming JavaScript
---

**TL;DR** kill turbolinks, `config.assets.compile = true` in production, and yes use `$(document).ready`.

I am working on a new clients website, for the purposes on this post we will
call them *Ethel*. Ethel, wants an anchored scroll homepage. I.e. each section
fills the entire viewport and section transitions have a cute swooping page
transition; similar to a slide show.  


## Solution

With these requirements in mind, I chose to pick up [fullpage.js](http://alvarotrigo.com/fullPage/). A fullscreen scrolling webpage framework.

Super simple installation. Download and load the code that same way you do with
jQeury. Oh yeah, you need jQuery. Start with a `div#fullpage`, inside that just add a
`div.section` for a full page. Then, simply initialize:

``` javascript
$(document).ready(function() {
    $('#fullpage').fullpage();
});
```

## Problem

I am a rails developer, so a problem arose.
when loading a new page, *none* of the JavaScript in `$(document).ready` gets
loaded after clicking a through a link. This is **not** desirable behaviour. This is
where I ran into my problem. I started using `.pageLoad`, still didn't work; actually
it was worse. Then I remembered this think called [turbolinks](https://github.com/turbolinks/turbolinks),
makes your webpage navigation faster, but messes around with the inner workings (not exactly sure on those).
You often see this behaviour if you are loading a JavaScript text editor. Sometimes it
loads, sometimes it doesn't.  

Also because we are including the vendor packages in our asset pipeline, we need
`config.assets.compile = true` we want the packages to get loaded off the asset
pipeline.

## What Do

For now, my solution is to disregard turbolinks, if someone's reading this and
has a better solution, I would love to [hear about
it](mailto:skylerclayne@gmail.com)!
