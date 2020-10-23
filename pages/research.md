---
layout: page
title: Research
---

I'm a statistical phylogeneticist, primarily focused on developing Bayesian methods to infer complex "macroevolutionary" processes from phylogenetic data.
Currently, I am exploring the impact of model specification on inferences of time-calibrated phylogenies using total-evidence dating.

# Lineage diversification

Mass-extinction events have profound consequences on the accumulation of lineages through time.
However, the signature of mass-extinction events on molecular phylogenies can be difficult to distinguish from other processes that may be biologically common; for example, increases in net-diversification rates (speciation minus extinction) can result in lineage-accumulation curves that are similar to those caused by mass-extinction events.
Failure to accommodate diversification-rate variation may therefore cause us to make errors in inferring the number, timing, and magnitude of mass-extinction events.
To tackle this problem, I developed a Bayesian method, CoMET, that allows us to robustly infer the impact of mass-extinction events against a background of variation in rates of speciation and extinction.

{% include image.html 
	url="/assets/img/mass_extinction_time.jpg" 
	description="Posterior probability of mass-extinction times estimated by CoMET on the conifer phylogeny from Leslie et al. 2012 PNAS."
	dim="90%"
%}

#### Selected publications on lineage diversification

{% include citation.html
	authors = "<b>May, M. R.</b>, S. Höhna, and B. R. Moore"
	title   = "A Bayesian approach for detecting the impact of mass-extinction events on molecular phylogenies when rates of lineage diversification may vary"
	journal = "Methods in Ecology and Evolution"
	volume  = "7"
	issue   = "8"
	pages   = "947–959"
	year    = "2016"
%}

{% include citation.html
	authors = "<b>May, M. R.</b> and B. R. Moore"
	title   = "How well can we detect lineage-specific diversification-rate shifts? A simulation study of sequential AIC methods"
	journal = "Systematic Biology"
	volume  = "6"
	issue   = "65"
	pages   = "1076–1084"
	year    = "2016"
%}

{% include citation.html
	authors = "Moore, B. R., S. Höhna, <b>M. R. May</b>, B. Rannala and J. P. Huelsenbeck"
	title   = "Critically evaluating the theory and performance of Bayesian analysis of macroevolutionary mixtures"
	journal = "Proceedings of the National Academy of Sciences"
	volume  = "34"
	issue   = "113"
	pages   = "9569–9574"
	year    = "2016"
%}

{% include citation.html
	authors = "Höhna, S., <b>M. R. May</b>, and B. R. Moore"
	title   = "TESS: an R package for efficiently simulating phylogenetic trees and performing Bayesian inference of lineage diversification rates"
	journal = "Bioinformatics"
	volume  = "5"
	issue   = "32"
	pages   = "789–791"
	year    = "2015"
%}

# Character evolution

Many macroevolutionary studies seek to understand how rates of trait evolution depend on the state of some other variable; for example, have reef-dwelling fish—owing to increased habitat complexity and ecological opportunity—experienced increased rates of morphological evolution relative to their non-reef-dwelling relatives? 
However, we expect rates of trait evolution to vary for many reasons; even within clades that are entirely reef-dwelling, we can easily imagine that rates of continuous-trait evolution may vary owing to a variety of other ecological and life-history factors.
I developed a Bayesian method for inferring how rates of continuous-trait evolution vary according to a discrete trait of interest, while controlling for background sources of rate variation.
I implemented this method, [MuSSCRat, in the Bayesian phylogenetic software RevBayes](https://revbayes.github.io/tutorials/cont_traits/state_dependent_bm.html).

{% include image.html 
	url="/assets/img/rate_comparison.png" 
	description="Posterior distribution of rate of evolution in reefs divided by rate of evolution off of reefs for trophic characters of Haemulid (grunt) fishes. Yellow density is for the model without accommodating background-rate variation; blue is for the model that accommodates background-rate variation. Failing to accommodate background-rate variation leads to a 5-fold overestimate of this ratio."
	dim="65%"
%}

#### Selected publications on character evolution

{% include citation.html
	authors = "<b>M. R. May</b> and B. R. Moore"
	title   = "A Bayesian Approach for Inferring the Impact of a Discrete Character on Rates of Continuous-Character Evolution in the Presence of Background-Rate Variation"
	journal = "Systematic Biology"
	volume  = "69"
	issue   = "3"
	pages   = "530–544"
	year    = "2020"
%}

# Total-evidence dating
