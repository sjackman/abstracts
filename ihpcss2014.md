---
title: Genome sequence assembly using ABySS
author: Shaun Jackman
date: 2014-05-22
---

The Human Genome Project assembled the reference human genome sequence and gave science great insight into the biology of human development and disease.

The genome sequence assembly software ABySS was the first tool capable of assembling a human genome using Illumina high throughput sequencing data. Five years ago assembling a genome of that size, three billion nucleotides, was a major feat, but is now routine thanks to advances in computing capacity and algorithmic improvements in ABySS. We are now tackling species of economic importance that have genomes much larger than the human genome. The white spruce genome, for example, is seven times the size of the human genome. The SMarTForests white spruce genome project sequenced nearly ten billion reads, which we assembled using ABySS.

Each read is a string of typically 150 characters from the nucleotide alphabet, A, C, G and T. Genome sequence assembly is the task of finding all pairs of reads that overlap and merging reads that overlap unambiguously to reassemble the original genome sequence from which the reads were derived. Considering each read to be a vertex and each overlap of two reads to be an edge yields a large graph traversal problem, where the true genome sequence is a path through these overlapping reads. Solving this problem is confounded by errors in the sequencing data, repetitive elements of the genome, and heterozygosity, which is the natural variation between the two copies of the genome inherited from each parent.
