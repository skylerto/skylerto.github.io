---
layout: post
title: "How I Solve Dynamic Programming Algorithms"
date: 2014-12-03 20:00:11
catagories: programming algorithsm
---

# Introduction
The most difficult part about solving dynamic programming algorithms is
constructing the table. The table is essentially analogous to the stack from of
a recursive algorithm, each cell of the table stores the answers to those
problems.

# Topics of Discussion
What is the Bird-Friend Algorithm?
What is an Instance?
What is the Bird Question?
What are Sub-Instances?
What is this Table?
Construct Solutions?
How do we Construct this Table?
How do we actually code this?

# What is the Bird-Friend Algorithm Really?
The idea here is simple to loop over all possible solutions. The bird-friend
algorithm gives a nice story to place the algorithm to that can be recited every
time this problem needs to be solved. It consists of making the best decision
for each instance by asking a bird a question, then asking a friend to solve the sub-instance consistent with that bird answer, and storing it in a table.

# What is an Instance?
The instance is usually an optimization problem, more specifically when you’re
trying to optimize something subject to another parameter. Some examples of
these types of problems are: Searching a Graph for the Best Path, The Knapsack
Problem, Weighted event scheduling,  and the Stock Algorithm.

# What is the Bird Question?
The bird question is just a simple question that you ask the bird about the end
of the instance. Don’t be afraid to ask your bird more than one question! Be
conscious of how many answers to the questions you ask exist. You can think of
the bird question of how can I know how to get back on track. i.e. what question
do you wish your lost son would ask. Some typical bird questions consist of do I
  take the last element or not? Do I take the path or not? After determining
  what your questions could be, think about possible answers to each question.

# What are Sub-Instances?
A sub-instance is a smaller instance to the problem. Like with recursive
algorithms we give our “friends” a smaller instance that meets the precondition.
With dynamic programming algorithms we also do this. The smaller instance to the
problem will be the same instance without the bird answer.

# What is the Table?
In the bird-friend algorithm we further extract this table into instances and
birds advice. The instances can be thought of as nodes on a graph. The birds
advice is what the inner loop is doing, solving the local problem. This table is
the optimal solution consistent with the current bird answer. i.e.
table[Instances][birds advice] stores the optimal solution for each instance
consistent with that particular bird answer.

# How do we Construct this Table?
To construct this table we need to come up with a solution for every instance
consistent with each bird answer, compare them and store the best one in the
table; for later consideration.

# Now How do I Write this Down?

# How do we actually code this?

{% highlight ruby %}
Dynamic Programming Algorithm
# <pre-cond> – Usually stated within the problem.
# <post-cond> – Usually stated within the problem.
def BirdFriendAlgorithm 
 Table: Create a table to store the optCost of the solution.
 # ”Base case”: Initialize the table
 # General cases: Loop over sub-instances in the table.
 loop from i = n-1, to 0
    # Solve instance subI[i] and fill in table entry <i>
    # Try all bird answers
    for each of the possible bird answers
        # The bird friend algorithm:
        # The bird tells us something about the end of the instance.
        # We listen to the bird and ask a friend for the solution to the sub-instance.
        # He gives us optSol[k], which we had stored in the table, we then add the birds answer resulting in the best solution consistent with the birds kth answer.
        # optSol<i,k> = <vi, vk> + optSol[k];
        optCost<i,k> # is Optimal cost for each instance consistent with that bird answer.
        optCost<i,k> = bird answer + optCost[k];
    end for
    # Having the best answer for each bird answer we keep the best of the best.
    kmin = “a bird answer that minimizes optCost<i,k>”
    # optSol[i] = optSol<i,kmin>
    optCost[i] = optCost<i, kmin>
  end
  return <optCost[0]>
end
{% endhighlight %}
