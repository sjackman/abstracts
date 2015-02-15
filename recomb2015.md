---
title: Scaling ABySS to longer reads using spaced k-mers and Bloom filters
author: Shaun D Jackman, Karthika Raghavan, Benjamin P Vandervalk, Daniel Paulino, Justin Chu, Hamid Mohamadi, Anthony Raymond, René L Warren, Inanç Birol
date: 2015-02-13
---

The continually changing landscape of sequencing technology is a particular challenge when maintaining an assembly software package such as ABySS that spans years of development. It also offers opportunities for better assemblies, if the technology improvements are leveraged by new algorithms.

Illumina read lengths were typically 50 nucleotides at the initial release of ABySS. The read lengths of overlapping MiSeq reads now exceed 500 nucleotides. ABySS and many other de Bruijn graph (dBG) assemblers use a standard hash table to store *k*-mers, tiles of *k* nucleotide long sequences that cover the reads. This requires memory that increases linearly with the value of *k*. To make full use of increasing read lengths without a commensurate increase in memory requires space-efficient data structures. In a new release of ABySS, we use a spaced seeds data type to represent *k*-mers while storing a fraction of their nucleotides. For example, two 32-mer separated by a space of 300 nucleotides represents a dBG comparable to a 364-mer dBG using the memory requirements of a 64-mer dBG.

Another algorithmic improvement we introduce is an assembly finishing tool to close scaffolding gaps in draft assemblies. The Sealer algorithm in our new release fills these gaps by navigating a dBG represented probabilistically by a Bloom filter. Because a Bloom filter is space-efficient, we can employ multiple such filters, using smaller *k* to span regions of low coverage and larger *k* to resolve repeats.

In this work, we present the performance of ABySS, with a detailed look at the new data types we use, and the utility of assembly finishing. We also demonstrate the efficient scalability of these tools on large genomes, using long reads.
