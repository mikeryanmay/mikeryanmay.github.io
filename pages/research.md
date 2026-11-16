---
layout: page
title: Research
---

# [Identifying mutations that enhance viral transmission](#transmission-enhancing-mutations)
{: #TEMs}

A fundamental objective of sequencing viral genomes during an epidemic is to identify newly emerged mutations that influence transmission rates. Thousands of mutations are typically circulating at any point during an epidemic, but most are expected to be neutral or deleterious. Thus, statistical methods are needed to identify mutations that influence transmissibility. Previous work demonstrated that phylogenies contain substantial information about the impact of mutations on transmission rates ([May & Rannala, 2024](https://doi.org/10.1126/sciadv.adk7623)). In principle, it is possible to use information available from genome sequences to infer the demographic expansion of mutant lineages over time and evaluate their effects on transmission rates directly.

I developed a Bayesian method based on a stochastic birth-death-mutation-sampling model for estimating which nucleotide mutations increase rates of transmission using viral genome sequences ([May & Rannala, 2026](https://doi.org/10.1098/rspb.2026.0532)). The method identifies transmission-enhancing mutations (TEMs) *de novo*, using no information other than viral sequences sampled over time. We used simulation to show that the approach accurately discriminates between mutations that increase the transmission rate and those that do not. Applying the method to global SARS-CoV-2 sequences from 2020 identified TEMs consistent with subsequent findings, and the predicted dynamics of their spread matched those observed in early 2021.

{% include image_modal.html 
	url="/assets/img/figure_2_TEM.png" 
	description="Left) Posterior probabilities that specific mutations were transmission-enhancing mutations (TEMs), inferred from global SARS-CoV-2 sequences sampled in 2020.
    Right) Posterior estimates of the effect-size parameter of each transmission-enhancing mutation.
    The effect size is the fold-increase in the transmission rate for viral lineages with that mutation.
	From <a href='https://doi.org/10.1098/rspb.2026.0532'>May & Rannala (2026)</a>, <u>Proc. R. Soc. B</u> 293(2073), 20260532."
	dim="100%"
	id="templot"
%}

#### Selected publications on transmission-enhancing mutations

<ul>
	<li> {% include citation.html
		authors = "<b>May, M. R.</b> & Rannala, B."
		title   = "A method for detecting transmission-enhancing mutations in viral genomes"
		journal = "Proceedings of the Royal Society B"
		volume  = "293"
		issue   = "2073"
		pages   = "20260532"
		year    = "2026"
		doi     = "https://doi.org/10.1098/rspb.2026.0532"
	%} </li>
	<li> {% include citation.html
		authors = "<b>May, M. R.</b> & Rannala, B."
		title   = "Early detection of highly transmissible viral variants using phylogenomics"
		journal = "Science Advances"
		volume  = "10"
		pages   = "eadk7623"
		year    = "2024"
		doi     = "https://doi.org/10.1126/sciadv.adk7623"
	%} </li>
</ul>

# [TensorPhylo](#tensorphylo)
{: #TensorPhylo}

Why do some groups of organisms diversify faster than others?
State-dependent diversification models address this question by jointly describing how traits evolve, how lineages split into new species, and how lineages go extinct.
They allow speciation and extinction rates to depend on an organism's traits, linking differences in those traits to patterns of species diversity.
These biological questions often require many character states and large phylogenies, making likelihood calculations computationally demanding.

I developed TensorPhylo, a C++ library for fast likelihood calculations under a general set of state-dependent models of diversification, fossilization, and character evolution, to make these analyses more practical.
TensorPhylo is available as a plugin for RevBayes. 
The benchmark below compares RevBayes likelihood calculations under the ChromoSSE model with and without TensorPhylo across trees with 32–1,024 tips and models with 16–1,024 character states, demonstrating that TensorPhylo performs approximately 100 times faster than the standard implementation.
<!-- Because a typical analysis requires thousands to millions of likelihood evaluations, faster calculations can substantially reduce the computational cost of fitting these models. -->

{% include image_modal.html
    url="/assets/img/tensorphylo_benchmark.png"
    description="TensorPhylo performance for the ChromoSSE model of chromosome evolution and diversification. Filled circles show RevBayes with TensorPhylo; open circles show the standard implementation. Lines connect comparisons with the same tree size and number of character states, and colors indicate the number of tips. Higher values indicate faster likelihood calculations. Both axes use logarithmic scales. For the larger combinations of tree size and state space, only TensorPhylo results are shown."
    dim="50%"
    id="tensorphyloplot"
%}

#### Selected publications using TensorPhylo

<ul>
	<li> {% include citation.html
		authors = "Buchloh, T. D., Tribble, C. M., <b>May, M. R.</b>, & Wickett, N. J."
		title   = "Chromosome evolution model reveals hidden variation in fern diversification rates"
		journal = "Systematic Biology"
		status  = "advance online publication, syag054"
		year    = "2026"
		doi     = "https://doi.org/10.1093/sysbio/syag054"
	%} </li>
	<li> {% include citation.html
		authors = "Lichter-Marck, I. H., Swiston, S. K., Mendes, F. K., <b>May, M. R.</b>, Neupane, S., Baldwin, B. G., Wood, K. R., Rønsted, N., Wagner, W. L., Zapata, F., & Landis, M. J."
		title   = "Synchronizing speciation, extinction, and dispersal to island paleodynamics through Bayesian phylogenetics in a Hawaiian plant radiation"
		journal = "bioRxiv (preprint, version 2)"
		biorxiv = "true"
		year    = "2026"
		doi     = "https://www.biorxiv.org/content/10.64898/2025.12.16.694722v2"
	%} </li>
	<li> {% include citation.html
		authors = "Tribble, C. M., Márquez-Corro, J. I., <b>May, M. R.</b>, Hipp, A. L., Escudero, M., & Zenil-Ferguson, R."
		title   = "Macroevolutionary inference of complex modes of chromosomal speciation in a cosmopolitan plant lineage"
		journal = "New Phytologist"
		volume  = "245"
		issue   = "5"
		pages   = "2350–2361"
		year    = "2025"
		doi     = "https://doi.org/10.1111/nph.20353"
	%} </li>
	<li> {% include citation.html
		authors = "Oyston, J. W., <b>May, M. R.</b>, & Felice, R. N."
		title   = "Brain size dependent speciation and extinction rates in birds and the cognitive buffer hypothesis"
		journal = "bioRxiv (preprint)"
		biorxiv = "true"
		year    = "2025"
		doi     = "https://doi.org/10.1101/2025.02.04.634049"
	%} </li>
</ul>


# [Phylogenetic network diversification](#network-diversification)
{: #Phylogenetic network diversification}

Much of the history of life is reticulate and better represented by phylogenetic networks than by strictly bifurcating trees.
Understanding the processes that generated that history thus requires models of diversification (speciation and extinction) that incorporate reticulation.
I developed a simple birth-death-reticulation model that includes unidirectional and bidirectional gene flow, homoploid hybrid speciation, and allopolyploidization, and derived the probability density function for networks evolving under this model.
This method is implemented in the julia package [Diversinet.jl](https://github.com/mikeryanmay/Diversinet.jl).

We applied the model to an existing phylogenetic allopolyploid network of ferns from the Cystopteridaceae to evaluate competing allopolyploid ancestry scenarios and to understand whether allopolyploids might diversify at different rates than diploids. Our results revealed evidence in favor Stebbin's controversial dead-end hypothesis, which posits that polyploids have lower diversification rates than their diploid relatives ([May & Rothfels, 2026](https://doi.org/10.64898/2026.09.11.750987)).

{% include image_modal.html
    url="/assets/img/network_diagram.png"
    description="Left) A phylogenetic network produced by the birth-death-reticulation model.
	Black lines represent sampled lineages, while red lines represent extinct or unsampled lineages.
    Reticulation events are indicated by blue shapes; hybridization events are indicated by squares, and allopolyploidization events are indicated by circles.
    A unidirectional hybridization event is marked U; a bidirectional hybridization event is marked B; a homoploid hybrid speciation event is marked H; and an allopolyploid speciation event is marked P.
    Right) The sampled phylogenetic network, produced by pruning extinct and unsampled lineages from the full network.
    From <a href='https://doi.org/10.64898/2026.09.11.750987'>May & Rothfels (2026)</a>, <u>bioRxiv</u>."
    dim="80%"
    id="networkplot"
%}

#### Selected publications on network diversification

<ul>
	<li> {% include citation.html
		authors = "<b>May, M. R.</b> & Rothfels, C. J."
		title   = "An explicit birth-death-reticulation model for studying the diversification of phylogenetic networks"
		journal = "bioRxiv (preprint)"
		biorxiv = "true"
		year    = "2026"
		doi     = "https://doi.org/10.64898/2026.09.11.750987"
	%} </li>
</ul>

# [Total-evidence dating](#total-evidence-dating)
{: #Total-evidence dating}

Time-calibrated phylogenies (trees with branches measured in calendar time) are fundamental to understanding how lineages diversify and evolve over time.
The standard method for calibrating phylogenies requires the researcher to express their belief about the age of particular clades in the form of _calibration densities_.
Eliciting calibration densities is often very difficult because it relies on the researcher's understanding of the fossil record (and the processes that generate it) and of the relationship between fossils and extant lineages.
Total-evidence dating is an emerging alternative for estimating time-calibrated phylogenies for fossil and living taxa from combined molecular and morphological datasets ([Ronquist _et al._, 2012](https://doi.org/10.1093/sysbio/sys058); [Zhang _et al._, 2016](https://doi.org/10.1093/sysbio/syv080)).

The strength of total-evidence dating comes from replacing potentially arbitrary calibration densities with statistical models that describe how traits evolve and how lineages diversify (and are ultimately sampled to produce the fossil record).
One of my research goals is to understand the impact of different modeling choices on total-evidence dating.
Together with my colleagues, I explored the impact of model specification on total-evidence-based divergence-time estimates in the marattialean ferns over a large model space, showing that our assumptions about how lineages diversify (speciate and go extinct) have a much larger impact on phylogenetic estimates than do our assumptions about how morphological characters evolve.
This work highlights the need for careful evaluation of the lineage diversification model.
 
{% include image_modal.html 
	url="/assets/img/trees.png" 
	description="Marattialean phylogeny under different tree models: a uniform model (left), a fossilized birth-death model with constant speciation, extinction, and fossilization rates (middle), and a birth-death process where the speciation and extinction rates vary over time (right). From <a href='https://doi.org/10.1093/sysbio/syab020'>May <i>et al.</i> (2021)</a>, <u>Syst. Biol.</u>."
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
   description="Left) Phylogenetic processes produce trees with character changes (colors) and samples (labeled dots). Middle) We collect taxon samples (grey fiddleheads) before collecting character data; at this stage, we could use these samples as data to infer parameters of a diversification process. Right) Finally, we score the samples for character data. Traditionally, phylogeneticists treat the probability of the character data (right) as part of the likelihood function, but not the probability of the taxon data (middle). From <a href='https://doi.org/10.1093/sysbio/syad010'>May & Rothfels (2023)</a>, <u>Syst. Biol.</u>."
   dim="100%"
   id="dataplot"
%}

#### Selected publications on total-evidence dating

<ul>
	<li> {% include citation.html
		authors = "Mulvey, L. P. A., <b>May, M. R.</b>, Brown, J. M., Höhna, S., Wright, A. M., & Warnock, R. C. M."
		title   = "Assessing the adequacy of morphological models using posterior predictive simulations"
		journal = "Systematic Biology"
		volume  = "74"
		issue   = "1"
		pages   = "34–52"
		year    = "2025"
		doi     = "https://doi.org/10.1093/sysbio/syae055"
	%} </li>
	<li> {% include citation.html
		authors = "<b>May, M. R.</b> & Rothfels, C. J."
		title   = "Diversification models conflate likelihood and prior, and cannot be compared using conventional model-comparison tools"
		journal = "Systematic Biology"
		volume  = "72"
		issue   = "3"
		pages   = "713–722"
		year    = "2023"
		doi     = "https://doi.org/10.1093/sysbio/syad010"
		youtube = "https://www.youtube.com/watch?v=SWldXeWet68"
	%} </li>
	<li> {% include citation.html
		authors = "<b>May, M. R.</b>, Contreras, D. L., Sundue, M. A., Nagalingum, N. S., Looy, C. V., & Rothfels, C. J."
		title   = "Inferring the total-evidence timescale of Marattialean fern evolution in the face of model sensitivity"
		journal = "Systematic Biology"
		volume  = "70"
		issue   = "6"
		pages   = "1232–1255"
		year    = "2021"
		doi     = "https://doi.org/10.1093/sysbio/syab020"
		youtube = "https://www.youtube.com/watch?v=5H_u9bjn064"
	%} </li>
</ul>

# [Lineage diversification and mass-extinction events](#lineage-diversification)
{: #Lineage diversification and mass-extinction events}

Rates of lineage diversification (speciation and extinction) change over time and across the branches of the tree for many reasons.
I contributed to the development of a Bayesian method for inferring how rates of diversification vary among lineages in a trait- and time-agnostic framework ([Höhna _et al._, 2026](https://doi.org/10.1093/sysbio/syag003)). The method allows diversification-rate shifts along extinct branches (and is therefore a statistically principled alternative to BAMM), and allows rate shifts to occur independent of speciation events (in contrast to CLaDS, which assumes rate shifts occur at speciation events).

Mass-extinction events have profound consequences on the accumulation of lineages through time.
However, the signature of mass-extinction events on molecular phylogenies can be difficult to distinguish from other processes that may be biologically common; for example, increases in net-diversification rates (speciation minus extinction) can result in lineage-accumulation curves that are similar to those caused by mass-extinction events.
Failure to accommodate diversification-rate variation may therefore cause us to make errors in inferring the number, timing, and magnitude of mass-extinction events.
To tackle this problem, I developed a Bayesian method, CoMET, that allows us to robustly infer the impact of mass-extinction events against a background of variation in rates of speciation and extinction.

{% include image_modal.html 
	url="/assets/img/mass_extinction_time.jpg" 
	description="Posterior probability of mass-extinction times for conifers estimated by CoMET. From <a href='https://doi.org/10.1111/2041-210X.12563'>May <i>et al.</i> (2016)</a>, <u>Methods Ecol. Evol.</u>."
	dim="100%"
	id="comet"
%}

#### Selected publications on lineage diversification

<ul>
	<li> {% include citation.html
		authors = "Höhna, S., Freyman, W. A., Nolen, Z., Huelsenbeck, J. P., <b>May, M. R.</b>, Rannala, B., & Moore, B. R."
		title   = "Inferring branch-specific rates of lineage diversification under the birth–death-shift process"
		journal = "Systematic Biology"
		volume  = "75"
		issue   = "5"
		pages   = "948–966"
		year    = "2026"
		doi     = "https://doi.org/10.1093/sysbio/syag003"
	%} </li>
	<li> {% include citation.html
		authors = "do Rosario Petrucci, B., <b>May, M. R.</b>, & Heath, T. A."
		title   = "Fossils improve extinction-rate estimates under state-dependent diversification models"
		journal = "Philosophical Transactions of the Royal Society B"
		volume  = "380"
		issue   = "1919"
		pages   = "20230313"
		year    = "2025"
		doi     = "https://doi.org/10.1098/rstb.2023.0313"
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
		volume  = "65"
		issue   = "6"
		pages   = "1076–1084"
		year    = "2016"
		doi     = "https://doi.org/10.1093/sysbio/syw026"
	%} </li>
	<li> {% include citation.html
		authors = "Moore, B. R., Höhna, S., <b>May, M. R.</b>, Rannala, B. & Huelsenbeck, J. P."
		title   = "Critically evaluating the theory and performance of Bayesian analysis of macroevolutionary mixtures"
		journal = "Proceedings of the National Academy of Sciences"
		volume  = "113"
		issue   = "34"
		pages   = "9569–9574"
		year    = "2016"
		doi     = "https://doi.org/10.1073/pnas.1518659113"
	%} </li>
</ul>

# [Character evolution](#character-evolution)
{: #Character evolution}

Many macroevolutionary studies seek to understand how rates of trait evolution depend on the state of some other variable; for example, have reef-dwelling fish—owing to increased habitat complexity and ecological opportunity—experienced increased rates of morphological evolution relative to their non-reef-dwelling relatives? 
However, we expect rates of trait evolution to vary for many reasons; even within clades that are entirely reef-dwelling, we can easily imagine that rates of continuous-trait evolution may vary owing to a variety of other ecological and life-history factors.
I developed a Bayesian method for inferring how rates of continuous-trait evolution vary according to a discrete trait of interest, while controlling for background sources of rate variation.
I implemented this method, [MuSSCRat, in the Bayesian phylogenetic software RevBayes](https://revbayes.github.io/tutorials/cont_traits/state_dependent_bm.html).

{% include image_modal.html 
	url="/assets/img/rate_comparison.png" 
	description="Posterior distribution of rate of evolution in reefs divided by rate of evolution off of reefs for trophic characters of Haemulid (grunt) fishes. Yellow density is for the model without accommodating background-rate variation; blue is for the model that accommodates background-rate variation. Failing to accommodate background-rate variation leads to a 5-fold overestimate of this ratio. From <a href='https://doi.org/10.1093/sysbio/syz069'>May & Moore (2020)</a>, <u>Syst. Biol.</u>."
	dim="65%"
	id="musscrat"
%}

#### Selected publications on character evolution

<ul>
	<li> {% include citation.html
		authors = "Tribble, C. M., Martínez-Gómez, J., Rothfels, C. J., & <b>May, M. R.</b>"
		title   = "An evolving view of character macroevolution"
		journal = "Systematic Biology"
		volume  = "75"
		issue   = "4"
		pages   = "617–641"
		year    = "2026"
		doi     = "https://doi.org/10.1093/sysbio/syag034"
	%} </li>
	<li> {% include citation.html
		authors = "Thompson, A., <b>May, M. R.</b>, Hopkins, B. R., Riedl, N., Barmina, O., Liebeskind, B. J., Zhao, L., Begun, D., & Kopp, A."
		title   = "Quantifying transcriptome turnover on phylogenies by modeling gene expression as a binary trait"
		journal = "Molecular Biology and Evolution"
		volume  = "42"
		issue   = "5"
		pages   = "msaf106"
		year    = "2025"
		doi     = "https://doi.org/10.1093/molbev/msaf106"
	%} </li>
	<li> {% include citation.html
		authors = "Tribble, C. M., <b>May, M. R.</b>, Jackson-Gain, A., Zenil-Ferguson, R., Specht, C. D., & Rothfels, C. J."
		title   = "Unearthing modes of climatic adaptation in underground storage organs across Liliales"
		journal = "Systematic Biology"
		volume  = "72"
		issue   = "1"
		pages   = "198–212"
		year    = "2023"
		doi     = "https://doi.org/10.1093/sysbio/syac070"
	%} </li>
	<li> {% include citation.html
		authors = "<b>May, M. R.</b> & Moore, B. R."
		title   = "A Bayesian approach for inferring the impact of a discrete character on rates of continuous-character evolution in the presence of background-rate variation"
		journal = "Systematic Biology"
		volume  = "69"
		issue   = "3"
		pages   = "530–544"
		year    = "2020"
		doi     = "https://doi.org/10.1093/sysbio/syz069"
	%} </li>
</ul>

# [Software development](#software-development)
{: #Software}


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
		journal = "Methods in Ecology and Evolution"
		volume  = "13"
		issue   = "2"
		pages   = "314–323"
		year    = "2022"
		doi     = "https://doi.org/10.1111/2041-210X.13750"
	%} </li>
	<li> {% include citation.html
		authors = "Höhna, S., <b>May, M. R.</b>, & Moore, B. R."
		title   = "TESS: an R package for efficiently simulating phylogenetic trees and performing Bayesian inference of lineage diversification rates"
		journal = "Bioinformatics"
		volume  = "32"
		issue   = "5"
		pages   = "789–791"
		year    = "2016"
		doi     = "https://doi.org/10.1093/bioinformatics/btv651"
	%} </li>
</ul>
