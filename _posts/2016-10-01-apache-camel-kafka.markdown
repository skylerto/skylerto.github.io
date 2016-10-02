---
layout: post
title: Apache Camel and Kafka
date: 2016/10/01
catagories: programming java learning
---

[Code is here](https://github.com/skylerto/apache-camel-kafka).

Often, managing the integration of two or more systems is a difficult task.
This task becomes even more difficult in a distributed mircoservice-oriented system.
In this post I will explain how to make this communication less painless.
Enter [Apache Kafka](http://kafka.apache.org) feat. [Apache Camel](http://camel.apache.org).

## Configuring the Camel Routes

<script src="https://gist.github.com/skylerto/f1c91e91be05399a8371194a031a35eb.js"></script>

To configure a Provider we define a Camel input route *from* `direct:kafkaRoute`,
exchanging the message *to* the URI endpoint for Kafka.

Finally, we configure a Consumer from the Kafka consumer URI to the java Bean
which is invoked when an event occurs.

### Anatomy of a Camel Kafka URI

```
"kafka:localhost:9092?topic=test&groupId=testing&autoOffsetReset=earliest&consumersCount=1"
```

- topic: The topic the Consumer/Producer is subscribed to.
- groupId: The ID of the group the Consumer/Producer is assigned to.
- autoOffsetReset: The schema to adjust the message outset.
- consumersCount: The number of consumers connecting to the Kafka server

For more information on the Camel URI, consult the [Kafka docs](http://kafka.apache.org/documentation.html) and [Camel Kafka docs](http://camel.apache.org/kafka.html)

## The Bean

<script src="https://gist.github.com/skylerto/03eab3394e367431245d111abaa84798.js"></script>

We are using this class to configure what happens when we consume a message. We
first try to unmarshal the string into a `Notification` object, where we can
then use it (in our case we do a simple toString() and stdout).

## The Controller

<script src="https://gist.github.com/skylerto/4f8feaaa2a2effd3219b3de56e7b7649.js"></script>

We are autowiring in the following Beans: `CamelContext`, 2 `RouteBuilder`s, a
`ProducerTemplate` and a `ConsumerTemplate`.

The most important here is the `ProducerTemplate`, we add the annotation
`@EndpointInject(uri = "direct:kafkaRoute")` to make use of the camel route we
configured in the `KafkaCamelRoute.java` class.


### The Controller Routes

`GET /message` this route we are using to display how we can send a message
using the autowired `ProducerTemplate`.

`POST /message` this route we are using to post JSON, marshal it to string, and
send it off as a message.

## Conclusions

Communication and integration in distributed systems does not need to be
difficult, rather, Apache provides some great tools like [Apache Kafka](http://kafka.apache.org)
and [Apache Camel](http://camel.apache.org) to make integration points
less painless and distributed messaging more fun.
