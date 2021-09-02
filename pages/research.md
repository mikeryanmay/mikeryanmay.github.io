---
layout: page
title: Research
---

# [Total-evidence dating](#total-evidence-dating)

Time-calibrated phylogenies (trees with branches measured in calendar time) are fundamental to understanding how lineages diversify and evolve over time.
The standard method for calibrating phylogenies requires the researcher to express their belief about the age of particular clades in the form of _calibration densities_.
Eliciting calibration densities is often very difficult because it relies on the researcher's understanding of the fossil record (and the processes that generate it) and of the relationship between fossils and extant lineages.
Total-evidence dating is an emerging alternative for estimating time-calibrated phylogenies for fossil and living taxa from combined molecular and morphological datasets (Ronquist _et al._ 2011 <u>Syst. Biol.</u>, Zhang _et al._ 2016 <u>Syst. Biol.</u>).

The strength of total-evidence dating comes from replacing potentially arbitrary calibration densities with statistical models that describe how traits evolve and how lineages diversify (and are ultimately sampled to produce the fossil record).
One of my research goals is to understand the impact of different modeling choices on total-evidence dating.
Together with my colleagues, I explored the impact of model specification on total-evidence-based divergence-time estimates in the marattialean ferns over a large model space, showing that our assumptions about how lineages diversify (speciate and go extinct) have a much larger impact on phylogenetic estimates than do our assumptions about how morphological characters evolve.
This work highlights the need for careful evaluation of the lineage diversification model.
 
{% include image_modal.html 
	url="/assets/img/trees.png" 
	description="Marattialean phylogeny under different tree models: a uniform model (left), a fossilized birth-death model with constant speciation, extinction, and fossilization rates (middle), and a birth-death process where the speciation and extinction rates vary over time (right). From May et al. 2021 <u>Syst. Biol.</u>"
	dim="100%"
	id="treeplot"
%}

Our study of the marattialean ferns demonstrates that the choice of tree prior can have a large impact on divergence-time estimates, so careful model choice is an important aspect of total-evidence dating.
However, our study also a counterintuitive result: despite the fact that most of our fossils come from the Pennsylvanian period, allowing fossilization rates to vary over time always reduced model fit.
In followup work, I used Bayesian theory and simulation to show that this was due to treating birth-death models as priors; because these models have parameters that produce <i>observations</i> (fossils and extant species), some of their probability should be associated with the likelihood of the model.
While it has no impact on parameter estimates for a given model, failing to treat the probability of the samples as part of the likelihood function compromises our ability to compare among tree models.
This exploration allows us to predict the magnitude of the error, and to propose remedies (some more practical than others).

{% include image_modal.html 
   url="/assets/img/figure_1.png" 
   description="Left) Phylogenetic processes produce trees with character changes (colors) and samples (labeled dots). Middle) We collect taxon samples (grey fiddleheads) before collecting character data; at this stage, we could use these samples as data to infer parameters of a diversification process. Right) Finally, we score the samples for character data. Traditionally, phylogeneticists treat the probability of the character data (right) as part of the likelihood function, but not the probability of the taxon data (middle). From May and Rothfels 2021 (in review)."
   dim="100%"
   id="dataplot"
%}


#### Selected publications on total-evidence dating

<ul>
	<li> {% include citation.html
		authors = "<b>May, M. R.</b> & Rothfels, C. J."
		title   = "Mistreating birth-death models as priors in phylogenetic analysis compromises our ability to compare models"
		journal = "bioRxiv"
		biorxiv = "true"
		doi     = "https://www.biorxiv.org/content/10.1101/2021.07.12.452074v1"
		youtube = "https://youtu.be/SWldXeWet68"
		year    = "2021"
	%} </li>
	<li> {% include citation.html
		authors = "<b>May, M. R.</b>, Contreras, D. L., Sundue, M. A., Nagalingum, N. S., Looy, C. V., & Rothfels, C. J."
		title   = "Inferring the Total-Evidence Timescale of Marattialean Fern Evolution in the Face of Model Sensitivity"
		journal = "Systematic Biology"
		doi     = "https://doi.org/10.1093/sysbio/syab020"
		youtube = "https://youtu.be/5H_u9bjn064"
		inpress = "true"
		year    = "2021"
	%} </li>
</ul>

# [Lineage diversification](#lineage-diversification)

Rates of lineage diversification (speciation and extinction) change over time and across the branches of the tree for many reasons.
In ongoing work, I'm developing a Bayesian method for inferring how rates of diversification vary among lineages in a trait- and time-agnostic framework. The method allows diversification-rate shifts along extinct branches (and is therefore a statistically principled alternative to BAMM), and allows rate shifts to occur independent of speciation events (in contrast to CLaDS, which assumes rate shifts occur at speciation events).

Mass-extinction events have profound consequences on the accumulation of lineages through time.
However, the signature of mass-extinction events on molecular phylogenies can be difficult to distinguish from other processes that may be biologically common; for example, increases in net-diversification rates (speciation minus extinction) can result in lineage-accumulation curves that are similar to those caused by mass-extinction events.
Failure to accommodate diversification-rate variation may therefore cause us to make errors in inferring the number, timing, and magnitude of mass-extinction events.
To tackle this problem, I developed a Bayesian method, CoMET, that allows us to robustly infer the impact of mass-extinction events against a background of variation in rates of speciation and extinction.

{% include image_modal.html 
	url="/assets/img/mass_extinction_time.jpg" 
	description="Posterior probability of mass-extinction times for conifers estimated by CoMET May et al. 2016 <u>MEE</u>"
	dim="100%"
	id="comet"
%}

#### Selected publications on lineage diversification

<ul>
	<li> {% include citation.html
		authors = "S., Höhna, Freyman, W. A., Nolen, Z., Huelsenbeck, J. P., <b>May, M. R.</b>, & Moore, B. R."
		title   = "A Bayesian approach for estimating branch-specific speciation and extinction rates"
		journal = "bioRxiv"
		biorxiv = "true"
		doi     = "https://www.biorxiv.org/content/10.1101/2021.07.12.452074v1"
		year    = "2021"
	%} </li>
	<li> {% include citation.html
		authors = "<b>May, M. R.</b>, Höhna, S., & Moore, B. R."
		title   = "A Bayesian approach for detecting the impact of mass-extinction events on molecular phylogenies when rates of lineage diversification may vary"
		journal = "Methods in Ecology and Evolution"
		volume  = "7"
		issue   = "8"
		pages   = "947–959"
		year    = "2016"
		doi     = "https://doi.org/10.1111/2041-210X.12563"
	%} </li>
	<li> {% include citation.html
		authors = "<b>May, M. R.</b> & Moore, B. R."
		title   = "How well can we detect lineage-specific diversification-rate shifts? A simulation study of sequential AIC methods"
		journal = "Systematic Biology"
		volume  = "6"
		issue   = "65"
		pages   = "1076–1084"
		year    = "2016"
		doi     = "https://doi.org/10.1093/sysbio/syw026"
	%} </li>
	<li> {% include citation.html
		authors = "Moore, B. R., Höhna, S., <b>May, M. R.</b>, Rannala, B., & Huelsenbeck, J. P."
		title   = "Critically evaluating the theory and performance of Bayesian analysis of macroevolutionary mixtures"
		journal = "Proceedings of the National Academy of Sciences"
		volume  = "34"
		issue   = "113"
		pages   = "9569–9574"
		year    = "2016"
		doi     = "https://doi.org/10.1073/pnas.1518659113"
	%} </li>
</ul>

# [Character evolution](#character-evolution)

Many macroevolutionary studies seek to understand how rates of trait evolution depend on the state of some other variable; for example, have reef-dwelling fish—owing to increased habitat complexity and ecological opportunity—experienced increased rates of morphological evolution relative to their non-reef-dwelling relatives? 
However, we expect rates of trait evolution to vary for many reasons; even within clades that are entirely reef-dwelling, we can easily imagine that rates of continuous-trait evolution may vary owing to a variety of other ecological and life-history factors.
I developed a Bayesian method for inferring how rates of continuous-trait evolution vary according to a discrete trait of interest, while controlling for background sources of rate variation.
I implemented this method, [MuSSCRat, in the Bayesian phylogenetic software RevBayes](https://revbayes.github.io/tutorials/cont_traits/state_dependent_bm.html).

{% include image_modal.html 
	url="/assets/img/rate_comparison.png" 
	description="Posterior distribution of rate of evolution in reefs divided by rate of evolution off of reefs for trophic characters of Haemulid (grunt) fishes. Yellow density is for the model without accommodating background-rate variation; blue is for the model that accommodates background-rate variation. Failing to accommodate background-rate variation leads to a 5-fold overestimate of this ratio. From May and Moore 2020 <u>Syst. Biol.</u>"
	dim="65%"
	id="musscrat"
%}

#### Selected publications on character evolution

<ul>
	<li> {% include citation.html
		authors = "<b>May, M. R. </b> & Moore, B. R."
		title   = "A Bayesian Approach for Inferring the Impact of a Discrete Character on Rates of Continuous-Character Evolution in the Presence of Background-Rate Variation"
		journal = "Systematic Biology"
		volume  = "69"
		issue   = "3"
		pages   = "530–544"
		year    = "2020"
		doi     = "https://doi.org/10.1093/sysbio/syz069"
	%} </li>
</ul>

# [Software development](#software-development)

I'm a developer on the RevBayes, a flexible platform for Bayesian (mostly) phylogenetic analysis.
Many of the methods I describe above are implemented in RevBayes.
I contribute to and maintain many RevBayes [tutorials](https://revbayes.github.io/tutorials/), especially for models of [continuous-character evolution](https://revbayes.github.io/tutorials/cont_traits/cont_trait_intro.html).

<img align="right" src="https://raw.githubusercontent.com/cmt2/RevGadgets/master/inst/hex_sticker.png" alt="Inspector RevGadget" width="40%"/>

I'm also (along with [Carrie Tribble](https://carrietribble.weebly.com/)) a lead developer on RevGadgets, an R package for visualizing and summarizing RevBayes output. Check it out on [GitHub](https://github.com/cmt2/RevGadgets)!

#### Selected publications on Software

<ul>
	<li> {% include citation.html
		authors = "Tribble, C. M., Freyman, W. A., Landis, M. J., Lim, J. Y., Barido-Sottani, J., Kopperud, B. T., Höhna, S. & <b>May, M. R.</b>"
		title   = "RevGadgets: an R Package for visualizing Bayesian phylogenetic analyses from RevBayes"
		journal = "bioRxiv"
		biorxiv = "true"
		doi     = "https://www.biorxiv.org/content/10.1101/2021.05.10.443470v1"
		year    = "2021"
	%} </li>
	<li> {% include citation.html
		authors = "Höhna, S., <b>May, M. R.</b>, & Moore, B. R."
		title   = "TESS: an R package for efficiently simulating phylogenetic trees and performing Bayesian inference of lineage diversification rates"
		journal = "Bioinformatics"
		volume  = "5"
		issue   = "32"
		pages   = "789–791"
		year    = "2016"
		doi     = "https://doi.org/10.1093/bioinformatics/btv651"
	%} </li>
</ul>
