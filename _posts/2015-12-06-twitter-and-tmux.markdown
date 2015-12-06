---
layout: post
title: Twitter and Tmux
date: 2015-12-06
categories: programming javascript
---

Project in question [tsay](https://github.com/skylerto/tsay)

# Setting the Scene
Let me tell you a story, it's not really a story because it's true. So here I am, hanging out at home, working on a school project (you'll see!). I was programming some eiffel
as I program I like to tweet various things, such as "took all day for me to git this burnt coffee taste out of my mouth", "is it important to keep the API endpoints and actual app separate or should i build my app on the API? #webdevelopment" 
and various other things. The reason being it keeps my mind on track some how by allowing me to splerg out random information that's sitting in my brain. My problem is, I usually
lose focus from having to visit twitter, post, and them catch up on my twitter feed. Also, sometimes I forget what my last post was. So to fix this I did a thing.

# What is it?
The thing I did was write a CLI for posting to twitter my thoughts, I know this has been done before with the 't' gem, but that seemed too heavy for what I wanted. 
All I wanted was to be able to post tweets and see what my last tweet was, you know, so I don't get distracted. 

Jumped to the [twitter](https://github.com/desmondmorris/node-twitter) API, found everything I needed. Popped open VIM and wrote it out using [commander](https://github.com/tj/commander.js)

# How do I use it?
Okay so I didn't want to give my information away and didn't want to spend too much time away from my school project so currently to install you must clone the project and add
your twitter API keys here ./keys.json, once that's done run `npm install` from the project root and you should be up and running!

To tweet run `tsay -t <INSERT TWEET>`
To view your last tweet run `tsay -a`, or `tsay -s` to run the 

If you want to view your last tweet in tmux add this to your ~/.tmux.conf `set -g status-left "#(ts -s)"`

Cheers,
Sky

p.s. sorry for the unfortunate installation process, would much rather have this app authenticate the user. For now it's life, and I have exams to worry about!
