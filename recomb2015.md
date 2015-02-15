---
title: Scaling ABySS to longer reads using paired de Bruijn graphs and Bloom filters
author: Shaun Jackman
date: 2015-02-13
---

The continually changing landscape of sequencing technology is a particular challenge and source of fun when maintaining an assembly software package such as ABySS that spans years of development. Illumina read lengths were typically 50 nucleotides at the initial release of ABySS. The read lengths of overlapping MiSeq reads now exceed 500 nucleotides.

Using a standard hash table to store the *k*-mers of a de Bruijn graph (dBG) requires memory that increases linearly with the value of *k*. To make full use of increasing read lengths without a commensurate increase in memory requires space-efficient data structures. Using a paired dBG gains the advantage of larger *k* while storing a fraction of the nucleotides of that *k*-mer. Two 32-mer separated by a gap of 300 nucleotides for example represents a dBG comparable to a 364-mer dBG using the memory requirements of a 64-mer dBG.

Scaffolding an assembly using paired-end reads produces contigs separated by gaps of unknown sequence. Filling these gaps is one component of finishing a genome. The Sealer algorithm of ABySS fills these gaps by navigating a dBG represented probabilistically by a Bloom filter. A dBG of large *k* resolves repeats but may be incomplete due to regions of low sequencing coverage, whereas a dBG of small *k* is more complete but is hampered by repeats. Because a Bloom filter is space-efficient, ABySS can employ multiple such filters, using smaller *k* to span regions of low coverage and larger *k* to resolve repeats.

We have scaled ABySS to efficiently assemble increasingly longer reads by using large values of *k* and data structures whose memory requirement does not increase with the value of *k*.
