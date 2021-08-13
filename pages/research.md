---
layout: page
title: Research
---

# Total-evidence dating

Total-evidence dating is an emerging approach for estimating time-calibrated phylogenies for fossil and living taxa from combined molecular and morphological datasets (Ronquist _et al._ 2011, Zhang _et al._ 2016).
While this framework offer many advantages compared traditional methods for calibrating phylogenies (_i.e._, node dating), it requires us to specify a complex hierarchical model that describes how morphological characters evolve, how the tree evolves, and how the extinct and extant taxa are collected.
The relative impact of these modeling choices in empirical studies is still not well understood.
Together with my colleagues, I explored the impact of model specification on total-evidence-based divergence-time estimates in the marattialean ferns over a large model space, showing that our assumptions about the lineage diversification process (the tree model) have a much larger impact on divergence times than do our assumptions about how morphological characters evolve.
 
{% include image.html 
	url="/assets/img/figure_3.jpg" 
	description="Lineage-through-time curves (the number of lineages in the tree over time) are similar among morphological transition (relative rates of change among states, left) and morphological clock (relative rates among lineages, middle) model, but very different among tree models (right)."
	dim="100%"
%}

Our study of the marattialean ferns demonstrates that the choice of tree prior can have a large impact on divergence-time estimates, so careful model choice is an important aspect of total-evidence dating.
However, our study also a counterintuitive result: despite the fact that most of our fossils come from the Pennsylvanian period, allowing fossilization rates to vary over time always reduced model fit.
In followup work, I used Bayesian theory and simulation to show that this was due to treating birth-death models as priors; because these models have parameters that produce <i>observations</i> (fossils and extant species), some of their probability should be associated with the likelihood of the model.
While it has no impact on parameter estimates for a given model, failing to treat the probability of the samples as part of the likelihood function compromises our ability to compare among tree models.
This exploration allows us to 

{% include image.html 
	url="/assets/img/figure_1.png" 
	description="Left) Phylogenetic processes produce trees with character changes (colors) and samples (labeled dots). Middle) We collect taxon samples (grey fiddleheads) before collecting character data; at this stage, we could use these samples as data to infer parameters of a diversification process. Right) Finally, we score the samples for character data (typically so that we can estimate a phylogeny). "
	dim="100%"
%}

#### Selected publications on total-evidence dating

{% include citation.html
	authors = "<b>May, M. R.</b>, D.L. Contreras, M. A. Sundue, N. S. Nagalingum, C. V. Looy,  and C. J. Rothfels"
	title   = "Inferring the Total-Evidence Timescale of Marattialean Fern Evolution in the Face of Model Sensitivity"
	journal = "Systematic Biology"
	doi     = "https://doi.org/10.1093/sysbio/syab020"
	youtube = "https://youtu.be/5H_u9bjn064"
	year    = "2021"
%}

<!-- https://youtu.be/5H_u9bjn064 -->
<!-- https://youtu.be/SWldXeWet68 -->

# Lineage diversification

Mass-extinction events have profound consequences on the accumulation of lineages through time.
However, the signature of mass-extinction events on molecular phylogenies can be difficult to distinguish from other processes that may be biologically common; for example, increases in net-diversification rates (speciation minus extinction) can result in lineage-accumulation curves that are similar to those caused by mass-extinction events.
Failure to accommodate diversification-rate variation may therefore cause us to make errors in inferring the number, timing, and magnitude of mass-extinction events.
To tackle this problem, I developed a Bayesian method, CoMET, that allows us to robustly infer the impact of mass-extinction events against a background of variation in rates of speciation and extinction.

{% include image.html 
	url="/assets/img/mass_extinction_time.jpg" 
	description="Posterior probability of mass-extinction times estimated by CoMET on the conifer phylogeny from Leslie et al. 2012 PNAS."
	dim="100%"
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
	doi     = "https://doi.org/10.1111/2041-210X.12563"
%}

{% include citation.html
	authors = "<b>May, M. R.</b> and B. R. Moore"
	title   = "How well can we detect lineage-specific diversification-rate shifts? A simulation study of sequential AIC methods"
	journal = "Systematic Biology"
	volume  = "6"
	issue   = "65"
	pages   = "1076–1084"
	year    = "2016"
	doi     = "https://doi.org/10.1093/sysbio/syw026"
%}

{% include citation.html
	authors = "Moore, B. R., S. Höhna, <b>M. R. May</b>, B. Rannala and J. P. Huelsenbeck"
	title   = "Critically evaluating the theory and performance of Bayesian analysis of macroevolutionary mixtures"
	journal = "Proceedings of the National Academy of Sciences"
	volume  = "34"
	issue   = "113"
	pages   = "9569–9574"
	year    = "2016"
	doi     = "https://doi.org/10.1073/pnas.1518659113"
%}

{% include citation.html
	authors = "Höhna, S., <b>M. R. May</b>, and B. R. Moore"
	title   = "TESS: an R package for efficiently simulating phylogenetic trees and performing Bayesian inference of lineage diversification rates"
	journal = "Bioinformatics"
	volume  = "5"
	issue   = "32"
	pages   = "789–791"
	year    = "2015"
	doi     = "https://doi.org/10.1093/bioinformatics/btv651"
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
	doi     = "https://doi.org/10.1093/sysbio/syz069"
%}
