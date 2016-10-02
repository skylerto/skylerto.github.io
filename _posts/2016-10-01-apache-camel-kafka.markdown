---
layout: post
title: Apache Camel and Kafka
date: 2016/10/01
catagories: programming java learning
---

[Code is here](https://github.com/skylerto/apache-camel-kafka).

Often managing the integration of two or more systems is a difficult task. This task becomes even more difficult in a distributed mircoservice oriented system. Enter [Apache Kafka](http://kafka.apache.org) feat. [Apache Camel](http://camel.apache.org).

## Configuring the Kafka Routes

<script src="https://gist.github.com/skylerto/f1c91e91be05399a8371194a031a35eb.js"></script>

To configure a Provider we define a Camel input route *from* `direct:kafkaRoute`,
exchanging the message *to* the URI endpoint for Kafka.

Finally we configure a Consumer from the Kafka consumer URI to the java Bean.

### Anatomy of a Camel Kafka URI

```
"kafka:localhost:9092?topic=test&groupId=testing&autoOffsetReset=earliest&consumersCount=1"
```




Form more information consult the [Kafka docs](http://kafka.apache.org/documentation.html)

## The Controller

<script src="https://gist.github.com/skylerto/4f8feaaa2a2effd3219b3de56e7b7649.js"></script>
