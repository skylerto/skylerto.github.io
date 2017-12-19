---
layout: post
title: "Structs and attributes: wrapping a Struct in a class"
date: 2017/12/19
categories: ruby programming
---

> TL;DR wrapped a Stuct in a class today and it felt good to get object
attributes, but  I feel like I violated a OOP principle.

## Background and Statement of Problem

I was working on a Ruby API wrapping the Chef Automate REST API, [Automate
Soup](https://github.com/skylerto/automate_soup). To make the requests I used
the `net/http`, which turns the response bodies into Ruby Hash objects.
Interacting with Hash's in Ruby is pivotal, but what happens when you would like
to add some state around that Hash while keeping the dynamic attributes?

## The Solution

The solution I propose is to provide a contract is to introduce a class. The
class will encapsulate the attributes we know exist as well as add some state
around those attributes is to introduce a class. To maintain the ability to
reach attributes on the Hash this solution will use an underlying `OpenStruct`
and delegate `method_missing` to the `OpenStruct`.

This solution was chosen so that we can maintain the attribute accessors with
little to no code overhead. However, my feeling is that there are unintended
consequences with this solution. Here is a code snippet of how this was
accomplished, trimmed for your viewing pleasure. To see the full code checkout
the [Automate Soup](https://github.com/skylerto/automate_soup) repo.

<script src="https://gist.github.com/skylerto/0d180c1fb61bfce52db0ffdfd7f8cd57.js"></script>

## Alternatives

Another alternative I though about was instead of an `OpenStruct` to use a
`Hash`, delegate `method_missing` to access the attribute on the hash, and
override `[]` to also fetch from the underlying `Hash`. My immediate thoughts
would be that this would cut down on the amount of memory used as Hashes are
relatively cheap in Ruby.

## Call To Action

Would love to hear feedback/better ways/how you solve this problem! You can
reach me on twitter at [@skylerto](https://twitter.com/skylerto).
