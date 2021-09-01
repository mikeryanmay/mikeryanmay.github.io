library(RevGadgets)
library(ggplot2)
library(deeptime)
library(gridExtra)

# read the trees
uniform_tree  <- readTrees("uniform_tree.tre")
constant_tree <- readTrees("constant_tree.tre")
variable_tree <- readTrees("variable_tree.tre")

# make the plots
uniform_tree_plot <- plotFBDTree(tree                = uniform_tree,
                                 timeline            = TRUE,
                                 geo                 = TRUE,
                                 geo_units           = "periods",
                                 tip_age_bars        = TRUE,
                                 node_age_bars       = TRUE,
                                 tip_labels_size     = 2,
                                 age_bars_colored_by = "posterior",
                                 label_sampled_ancs  = TRUE,
                                 lineend             = "square")
uniform_tree_plot$layers[[27]] <- NULL
uniform_tree_plot$layers[[26]] <- NULL
uniform_tree_plot$layers[[25]] <- NULL

constant_tree_plot <- plotFBDTree(tree                = constant_tree,
                                  timeline            = TRUE,
                                  geo                 = TRUE,
                                  geo_units           = "periods",
                                  tip_age_bars        = TRUE,
                                  node_age_bars       = TRUE,
                                  tip_labels_size     = 2,
                                  age_bars_colored_by = "posterior",
                                  label_sampled_ancs  = TRUE,
                                  lineend             = "square")
constant_tree_plot$layers[[27]] <- NULL
constant_tree_plot$layers[[26]] <- NULL
constant_tree_plot$layers[[25]] <- NULL

variable_tree_plot <- plotFBDTree(tree                = variable_tree,
                                  timeline            = TRUE,
                                  geo                 = TRUE,
                                  geo_units           = "periods",
                                  tip_age_bars        = TRUE,
                                  node_age_bars       = TRUE,
                                  tip_labels_size     = 2,
                                  age_bars_colored_by = "posterior",
                                  label_sampled_ancs  = TRUE,
                                  lineend             = "square")
variable_tree_plot$layers[[27]] <- NULL
variable_tree_plot$layers[[26]] <- NULL
variable_tree_plot$layers[[25]] <- NULL

constant_tree_plot$layers[1:22] <- uniform_tree_plot$layers[1:22]
variable_tree_plot$layers[1:22] <- uniform_tree_plot$layers[1:22]

# adding axes and legends
xlim <- c(210,-550)
ylim <- c(-2,90)

pp_legend <- ggplot2::theme(legend.position=c(0.85, 0.35))

geo_coord <- deeptime::coord_geo(dat    = list("periods"),
                                 pos    = as.list(rep("bottom",1)),
                                 xlim   = xlim,
                                 ylim   = ylim,
                                 expand = FALSE,
                                 rot    = list(90),
                                 height = list(unit(5, "lines")),
                                 size   = list(3),
                                 abbrv  = FALSE,
                                 neg    = TRUE)

uniform_tree_plot <- uniform_tree_plot +
  geo_coord +
  ggplot2::scale_x_continuous(name="") +
  ggplot2::theme(legend.position=c(0.85, 0.3), plot.margin = unit(c(-0.5,0,-0.3,0), "cm"))

constant_tree_plot <- constant_tree_plot +
  geo_coord +
  ggplot2::scale_x_continuous(name="") +
  ggplot2::theme(legend.position=c(0.85, 0.4), plot.margin = unit(c(-0.5,0,-0.3,0), "cm"))

variable_tree_plot <- variable_tree_plot +
  geo_coord +
  ggplot2::scale_x_continuous(name="") +
  ggplot2::theme(legend.position=c(0.85, 0.4), plot.margin = unit(c(-0.5,0,-0.3,0), "cm"))


pdf("trees.pdf", height=7, width=15)
grid.arrange(uniform_tree_plot, constant_tree_plot, variable_tree_plot, nrow=1)
dev.off()














