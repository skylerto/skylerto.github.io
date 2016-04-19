---
layout: post
title: Rails Asset Pipeline vs. Javascript
date: 2016-04-19
catagories: programming JavaScript
---

TL;DR I put up a good fight against rails asset pipeline. The only solution I
could get to work was adding `config.assets.debug = true` to my [production.rb](https://github.com/skylerto/focus/blob/master/config/environments/production.rb).  

This story begins with my new app, [Focus](http://focus.skylerlayne.me).
[Focus](http://focus.skylerlayne.me) is a task management application that uses
the pomodoro technique to break tasks down into manageable bites to help you
complete your goal.  

## Problem

Picture me, programming along, regression testing my Javascript module like a good boy, this happens to be my [pomodoro](https://github.com/skylerto/pomodoro) package. Everything is working fine in testing and development. Time to ship the MVP off to production. Then it happens, the asset pipeline crushes me, my javascrip's not working.

## Diagnosis

When shipping in the production environment, rails compresses and minifies our
Javascript for us, how nice. This is not something new, however it is the first
time I experienced an issue.   

What exactly happened is, when I deployed
[Focus](http://focus.skylerlayne.me).into production, some of my javascript
failed to load the normal way, and I was getting TypeErrors.


## Solution

The solution I came up with was to deploy the assets to production as is, i.e.
in debug mode. This is done simply by placing `config.assets.debug = true` in your [production.rb](https://github.com/skylerto/focus/blob/master/config/environments/production.rb). To cut down on load times, you can also set `config.serve_static_files = true` and precompile your assets in production. This can simply be done by running `RAILS_ENV=production bundle exec rake assets:precompile`.  
