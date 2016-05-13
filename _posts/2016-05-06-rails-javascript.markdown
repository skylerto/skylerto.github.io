---
layout: post
title: Rails and JavaScript
date: 2016-05-06
catagories: programming JavaScript
---

I have a temporary solution to a lot of my JavaScript headaches in rails.  

If your code is not getting loaded every time you navigate to a new link, or if
your refresh the page. Well, this is how I have fixed my issue.

## Remove Turbolinks

Delete the following line from `app/assets/javascripts/application.js`:

``` javascript
//= require turbolinks
```

and remove from your `Gemfile`:

``` ruby
gem 'turbolinks'
```

If someone's reading this and has a better solution, I would love to [hear about
it](mailto:skylerclayne@gmail.com)!
