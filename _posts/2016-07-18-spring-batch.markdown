---
layout: post
title: Quick and Dirty Spring Batch
date: 2016-07-18
catagories: programming Java
---

**TL;DR** Did some work with spring batch, pretty easy when you wrap your mind around the sequential processing.

[Java Spring](https://projects.spring.io/spring-framework/) offers a suite of
frameworks. The most common is their [Spring
MVC](https://spring.io/guides/gs/serving-web-content/), which is an MVC
framework for web programming. Anyways, Spring also offers a batch processing
framework called [Spring Batch](http://projects.spring.io/spring-batch/). This
is in direct competition to the built in [Batch
Processing](http://www.oracle.com/technetwork/articles/java/batch-1965499.html)
that comes with Java EE 7.0. IMHO, there really is no competition.  

Like with many spring projects, everything is a bean. This makes thing really
easy as they are basically plugs of functionality overriding defaults, please
don't quote me on that, I'm still learning...  

## Breaking It Down

I find it helpful to grab some domain knowledge to get you
thinking before we get into the meat and potatoes, or tofu for the vegans. Quick and
dirty, here are the pieces:

- Job: Some big functionality, composed of one, or many steps.  
- Step: Composed of a Reader, Processor, and/or Writer, or even a Tasklet, but I
don't know much about those so lets leave those out for now.  
- Reader: Reads from the specified datasource.  
- Processor: Manipulates the data which is read from the datasource.  
- Writer: _Writes_ the processed data (I emphasize writes, because it can write to the datasource, or stdout, or a file, or any/all of the things!).  

**Listeners can be attached at any level**, I know it's called a `StepListener`,
but if you define the listener in one of each of the Reader, Processor, Writers,
it will fire after that work has been done. Another example is a `JobListener`,
this can also be fired after specific jobs.

## Why Though

So Batch processing essentially tries to optimize the way large amounts of data
are handled. For example, payroll calculations, report generation, and any sort
of job that can be fired off multiple times (monthly report, weekly report, end
of day, etc). Its main goal is to provide structure for things that happen
often, such as database reads, writes, and data manipulation. Hence the Reader,
Writer, and Processor terminology. The goal is to essentially implement
interfaces at each of these levels, and define steps within a Job.  

## High Level Example

For a high level example, lets talk about money, Payroll form generation to be
specific. You know those forms you get that make you feel terrible about how
high income tax is? They have some of your information as well as how many hours
you have worked, at what pay rate, vacation pay, etc.  

For our example we will talk about a small database table of 2 employees:  

<div class="table-striped">
|-------+-------------------+------------+--------------|
| Name  | Pay Rate (Hourly) | Week Of    | Hours Worked |
|-------|-------------------|------------|--------------|
| John  | $10.00            | July 18-22 | 40           |
| Jacob | $40.00            | July 18-22 | 20           |
| John  | $15.00            | July 25-29 | 40           |
| Jacob | $40.00            | July 25-29 | 40           |
|-------+-------------------+------------+--------------|
</div>
Our goal is to run payroll calculations biweekly, and generate a nice little
report:  

|-------+------------+--------------+------------|
| Name  | Pay Period | Hours Worked |  Total Pay |
|-------|------------|--------------|------------|
| John  | July 18-29 |       80     | $1000.00   |
| Jacob | July 18-29 |       60     | $2400.00   |
|-------+------------+--------------+------------|

### Reader

Reads in a buffered amount of data, in this case we will read all of our data. It's only 4 rows after all. After each read, the row is converted using a [RowMapper](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/jdbc/core/RowMapper.html), into the desired Domain Object: 

```
WeekRecord
Name: String
PayRate: float
WeekOf: Date
HoursWorked: int
```

Afterward, it is handed off to the Processor for processing.

### Processor

Our Processor takes our RowMapped Object, WeekRecord, and processes it into a BiWeekRecord, performing the summation calculations needed:

```
BiWeekRecord
Name: String
PayPeriod: Date
HoursWorked: int
TotalPay: float
```

After completion of all Mapped rows, a list is sent off to the writer.

### Writer

During the Writer step, we can loop over all the passed `BiWeekRecord`s, writing them out to our report. In our case, we would just do plain old inserts into the database table for Biweekly reports. However, the possibilities are endless here. One could flush out to a PDF document, Database, excel document, make API calls, I think you get it.

## Conclusions

Even though most of the discussed functionality could have been implemented on our own fairly easy, we only need to define small pieces and incorporate them into the framework. Why reinvent the wheel if there's already a perfectly good solution?
