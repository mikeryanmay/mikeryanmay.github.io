---
layout: page
title: Code
---

I do most of my programming in C++ and R. 
I'm a developer on [RevBayes](https://github.com/revbayes/revbayes), as well as the R packages [TESS](https://github.com/hoehna/TESS) and [RevGadgets](https://github.com/cmt2/RevGadgets).
Head over to my [GitHub](https://github.com/mikeryanmay) page for examples of my code, as well as supplementary code and data archives for my publications.

## ITEM

[ITEM](https://github.com/mikeryanmay/ITEM) is an R package for Bayesian inference of transmission-enhancing mutations from viral genome sequences and phylogenies. It jointly models viral transmission, mutation, and sampling, and uses reversible-jump MCMC to identify mutations that increase transmission rates without specifying candidate sites in advance. See [May & Rannala (2026)](https://doi.org/10.1098/rspb.2026.0532).

## Diversinet.jl

[Diversinet.jl](https://github.com/mikeryanmay/Diversinet.jl) is a Julia interface to my C++ library [Diversinet](https://github.com/mikeryanmay/Diversinet). It calculates phylogenetic-network probabilities under a birth-death-reticulation model that incorporates gene flow, hybrid speciation, and allopolyploidization. These probabilities can be used as likelihoods for maximum-likelihood or Bayesian inference of diversification and reticulation parameters. See [May & Rothfels (2026)](https://doi.org/10.64898/2026.09.11.750987).

## TensorPhylo

[TensorPhylo](https://bitbucket.org/mrmay/tensorphylo) is a C++ library for fast likelihood calculations under a general set of state-dependent models of diversification, fossilization, and character evolution. It is available as a plugin for RevBayes and provides the likelihood calculations used by ITEM. See the [performance comparison on my research page](/pages/research/#tensorphylo).

<!-- ## Workflows and tools

I'm developing a standard total-evidence dating RevBayes pipeline for fitting and comparing models of character evolution and lineage diversification as demonstrated in May _et al._ 2021 (Syst. Biol.).
You can find this workflow [here](https://github.com/mikeryanmay/marattiales_supplemental) (with Marattiales as a working example).

I made a little [RevBayes prior specification widget](https://mikeryanmay.shinyapps.io/plotprior/) with RevGadgets and Shiny. -->
