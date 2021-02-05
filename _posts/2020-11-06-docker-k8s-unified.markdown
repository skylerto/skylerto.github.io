---
layout: post
title: "How Docker & Kubernetes Help Provide a Unified Path to Production"
date: 2020/11/06
categories: docker kubernetes devops
---

This blog post is for the person interested in Kubernetes and Docker but hasn’t
fully taken the leap, or is using them and interested in a wholistic view of
how they help drive value for their business. For the purposes of this article
we will over simplify and say Docker is the packaging system and Kubernetes is
the orchestrator.

If we start to think about what it means to unify the path (using pipelines) to
production, is to start thinking about how your organization ships software from
development (left) to production (right). If you will indulge me in the basics
of Continuous Integration and Continuous Delivery (CI/CD) for a moment, you essentially
want a way to produce artifacts, sign-off on those artifacts through what ever means
of testing/validation you require, and finally, a way to get those signed-off artifacts
delivered to production. The real secret sauce behind unifying the path to production
is having consistent ways to achieve the basic outcomes of CI/CD. Docker and Kubernetes
can help you get there, let me explain:

Starting from development (left), Docker can be used as a packaging system. Docker
images are built from a Dockerfile, and by nature, Dockerfiles are checked into
source control together with the application code. This places the onus on the
application developers to define how their application is built and run. By using
Docker’s build tools to create standardized pipelines, which consist of docker
build, docker push, and docker tag commands enable the tooling used for continuous
integration (CI) of the artifacts. One of the main benefits of producing immutable
artifacts is that they can be used in local development and deployed across
environments in a consistent, low risk way. This consistency gives you the guarantee
that as you do validations, you can expect with a high degree of certainty that the
software will behave the same way in production.

Docker and Kubernetes

Having consistent ways to build, and deploy your software across your organization.
A key way that this can be done is by leveraging Docker and Kubernetes. These tools
help provide a unified path to production by helping to standardize the build
process for immutable artifacts, providing a low risk way to validate artifacts
across environments, and provide a clear, version-able, way to deploy your
application across environments.

