---
layout: post
title: Remus and Romulus (actually an infrastructure engagement)
date: 2017/09/18
categories: chef infrastructure engagement
---

On the cusp of wrapping up a client engagement I would like to reflect on my
learnings with 3 specific lessons. We were approached by a business who was in
the middle of a datacentre migration with tight deadlines. They were having
issues verifying that the servers in their new datacentre (Romulus) were
identical to those in the old datacentre (Remus). They would like a set of
_tests_ which they could run against infrastructure to verify it is in
compliance. Their reasoning behind this need was they had started the migration,
however some of the servers were missing software packages, had old application
code, and a number of other issues that arise when these things are done
manually; they needed a way to verify, and quantify a successful migration. In
both datacentres there were PCI and Non-PCI, and RHEL and AIX servers, 4
archetypes total.

After discussions and requirement gathering the we arrived at the following
deliverables: an inventory audit spreadsheet of all 4 archetypes in the old
datacentre, Remus, and a set of InSpec tests for each of the archetypes; with a
deadline of 2 weeks.

# `<<-ENGAGEMENT`

During the engagement there were many hurdles to overcome. Our main contact in
the business was management and infrastructure neither of which knew the purpose
of the servers as this application came from another company which was acquired
by many years ago by the business in the engagement. As usual, management was
very busy and often did not have time to attend _all_ meetings. This lead to
many meetings with the infrastructure team trying to pry some useful information
from them in regards purpose of the servers which would aid the infrastructure
audits. Luckily, when management was able to attend, they knew the right teams
to get us in contact with. This leads to the well known, non technical first
lesson:

> communicate, and communicate with the **right** people.

If you are not getting the information you need, look for someone who can give
it to you this kind of communication is key. It lets the business know exactly
where you are in the project, and how they can help you; your success is their
success.

The next lesson learned I learned during this engagement was use existing
solutions with a grain of sand. They exist for a reason, that reason might not
fit your need exactly.

> Do not be afraid of questioning existing solutions.

I'm talking about specific pieces on InSpec here. Due to our test auditing AIX
servers, we first attempted to use the default chef resources such as users,
groups, and mounts. I can say with confidence these did not fit our need. With a
mix of awkward server architecture and enterprise software they less than suited
our needs. I wish I could have said I knew this from the beginning, but it
wasn't until well into the engagement that it was realized there were
discrepancies. Luckily InSpec provides a way to write [custom resources](https://www.inspec.io/docs/reference/dsl_resource/),
allowing for the discrepancies to quickly be remediated.

# `ENGAGEMENT`

Just a small recap of the lessons learned on this engagement.

- Communicating with the right people will lead to your, and their success
- Use what you know and _they_ know, but do not be afraid to question either!
