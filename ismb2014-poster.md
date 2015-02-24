---
title: "ABySS-Connector: Connect paired-end reads using a Bloom filter de Bruijn Graph"
author: [Shaun Jackman, Ben Vandervalk, René Warren, Anthony Raymond, Hamid Mohamadi, Justin Chu, Mimi Ko, Dean Attali, Inanc Birol]
date: 2014-03-14
---

Paired-end sequencing yields a read from each end of a DNA molecule, typically leaving a gap of unsequenced nucleotides in the middle of the fragment. We have developed ABySS-Connector, a software tool that fills in the nucleotides of the unsequenced gap by navigating a de Bruijn Graph to find a path between the two reads and connect the pair.

ABySS-Connector represents the de Bruijn graph using a Bloom filter, a probabilistic and memory-efficient data structure that represents a set. Our implementation is able to store the de Bruijn graph using a mean 1.5 bytes of memory per *k*-mer, a marked improvement over the typical hash table data structure. The memory usage per *k*-mer is independent of *k*, enabling its application to larger genomes.

The use of a Bloom filter to represent a de Bruijn graph has previously been described for genome sequence assembly, a task which benefits from a second non-probabilistic data structure to enumerate the critical false positives. We observe that this additional data structure is unnecessary for connecting reads, reducing memory requirements. The de Bruijn graph of the 20-gigabase white spruce genome sequencing data, for example, can be represented in 40 gigabytes. *k*-mers observed only once are usually erroneous, and are therefore discarded by using a counting Bloom filter. Constructing the Bloom filter is parallelized and distributed over multiple machines, and connecting the reads is likewise parallelized and distributed. ABySS-Connector is expected to have broad applications in genomic analysis, including read alignment, sequence assembly and haplotype variant calling.
