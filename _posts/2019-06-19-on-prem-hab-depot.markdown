---
layout: post
title: "Bringing the Chef Habitat Depot On-Premise in the Enterprise"
date: 2020/06/19
categories: chef habitat depot
---

At ChefConf 2019 in Seattle, I led a session discussing the challenges and the
opportunities of bringing a Chef Habitat Depot on-site.

The core focus of my talk was on: 

- The difference between Product Based Origins and Channels and Organization Based
Origin and Channels.
- Single Vs Multi-Depot.
- Possible iterations of Multi-Depot architecture along with their pros and cons
and best use cases. 

To see my presentation and slide deck, just scroll down to the bottom of this post.

## Chef Habitat Origins and Channel Patterns

When selecting the pattern that is right for you, ask yourself the following questions:

- How do my application/product teams work?
- How do we release code?
- How do we want to work and release code?

### Organization Based Origins and Channels 

![Org Origins and channels](/img/org_based_origin-300x169.jpg)

### Product Based Origin and Channels

![Product Origins and channels](/img/Product_Based_Origin.jpg)

Big enterprises will usually adopt a Product Based pattern as it allows teams to
work independently without losing sight of the company's standards. It's also
ideal for large product-driven organizations; however, on the flip-side, it
introduces a lot of management overhead for the product teams.

## Single vs. Multi-Depot

### Single Depot Overview

Single Depot has a straightforward architecture: your on-prem depot syncs with
an upstream public depot.

![Single Depot](/img/single-depot.jpg)

### Multi-Depot Overview

As the name implies, Multi-Depot architecture involves a single on-prem Prod Depot
syncing with multiple non-Prod upstream Depots.

![Multi-Depot](/img/multi-depot.jpg)


Indellient has an open source Habitat Builder Upstream Sync to help you adopt a
multi-depot pattern: [Indellient/bldr_package_sync](https://github.com/Indellient/bldr_package_sync)

## CI PIPELINE INTEGRATION AND GOVERNANCE

### Multi-Depot With CI

This architecture enables you to connect your Habitat Multi-Depot with a CI
pipeline and abstract the build, upload and promote tasks of your Habitat Packages.

![multi-depot-with-ci](/img/multi-depot-with-ci.jpg)

### Multi-Depot with CI and RBAC:

To ensure that your pipeline is secured and compliant, you can also introduce
Role Based Access Control as illustrated by the following diagram:

![multi-depot-with-ci-and-rbac](/img/multi-depot-with-ci-and-rbac.jpg)

### Pipeline Governance:

For a stricter Pipeline Governance, you can add separation of concerns to your
architecture so that the non-production stages promote packages to a production
pipeline where they undergo further checks before getting pushed to the
Production Ready Habitat Depot.

![pipeline-governance](/img/pipeline-governance.jpg)

## Service Architecture

The following is a Service Architecture that I proposed where a Depot API manages
the Depot storage and renders data and relevant controls on a Web UI.

![service-architecture](/img/service-architecture.jpg)

## Service Infrastructure:

Here's one possible infrastructure for a Hybrid Enterprise Cloud where built
packages are stored on an external service:

![service-infrastructure](/img/service-infrastructure.jpg)

## HA Multi-Depot With CI and RBAC

![HA_Multi_Depot](/img/HA_Multi_Depot.jpg)

Chef Habitat offers flexibility for large enterprises when it comes to architecting
their CI pipeline and their Depot Infrastructure. To sum it all up:

- Choose the correct origin and channel strategy that works for you.
- Ensure that you address CI pipeline integration and governance.
- HA S3 storage is essential for production readiness.
- A Multi-Depot strategy depends on an organization's needs (separation of responsibilities, etc.)
- Chef Habitat is ready for the enterprise.


[Bringing the Chef Habitat Depot On-Premise in the Enterprise Slides](https://www.slideshare.net/Indellient/bringing-the-chef-habitat-depot-onpremise-in-the-enterprise)

[Bringing the Chef Habitat Depot On-Premise in the Enterprise Video](https://youtu.be/GcGb9d3ERn4)
