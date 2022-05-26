library(plotly)
library(plot3D)
library(dirichletprocess)
library(mvtnorm)
library(misc3d)
library(TreeSim)
source("simBranchDiff.R")

dir.create("figs", showWarnings=FALSE)

sims <- 100
for(l in 1:sims) {
  
  cat(l,"\n")
  
  # specify the weights
  weights <- StickBreaking(40, 1000)
  
  # draw the means
  x_mean <- runif(length(weights), max=10)
  y_mean <- runif(length(weights), max=10)
  means  <- cbind(x_mean, y_mean)
  
  # draw the covariances
  corrs <- 2 * rbeta(length(weights), 3, 3) - 1
  vars  <- matrix(rgamma(2 * length(weights), shape = 4, rate = 10), ncol=2)
  
  VCV <- vector("list", length = length(weights))
  for(i in 1:length(weights)) {
    this_sd  <- sqrt(vars[i,])
    this_R   <- matrix(c(1, corrs[i], corrs[i], 1), nrow=2)
    VCV[[i]] <- diag(this_sd) %*% this_R %*% diag(this_sd)
  }
  
  # simulate some trees
  reps <- 200
  trees <- vector("list", reps)
  
  lambda <- 10
  mu     <- 10
  sigma  <- 0.1
  
  for(i in 1:reps) {
    trees[[i]] <- simulateBranchingDiffusion(lambda, mu, sigma)
  }
  
  
  # create the landscape
  densFunction <- function(x) {
    
    weights <- weights / sum(weights)
    
    dens <- numeric(nrow(x))
    for(i in 1:length(weights)) {
      dens <- dens + dmvnorm(x, means[i,], VCV[[i]]) * weights[i]
    }
    
    return(dens)
    
  }
  
  # make the landscape coordinates
  x_coords <- seq(-1, 11, length.out=401)
  y_coords <- seq(-1, 11, length.out=401)
  coords   <- expand.grid(x = x_coords, y = y_coords)
  
  # compute the densities (z coordinate)
  coord_densities <- densFunction(coords)
  
  # translate into matrix
  z_coords <- matrix(coord_densities, nrow=length(x_coords))
  
  # rescale the trees
  max_landscape_z <- max(z_coords)
  # max_tree_z      <- max(do.call(rbind, trees)$z1)
  # relative_tree_height <- 0.5
  # scale_factor <- relative_tree_height / (max_tree_z / max_landscape_z)
  scale_factor <- 0.5 * max_landscape_z
  
  # z_coords[] <- 0
  
  # plot the landscape
  fig <- plot_ly(
    type = 'surface',
    colorscale = list(c(0, 1), c("#DDDDDD", "#BBBBBB")),
    reversescale = FALSE,
    contours = list(
      z = list(show  = TRUE,
               start = 0,
               end   = max(z_coords),
               size  = max(z_coords) / 12,
               color = "#737373",
               width = 1)),
    x = ~y_coords,
    y = ~x_coords,
    z = ~z_coords,
    width = 2400,
    height = 2400)
  
  # add each tree
  for(i in 1:length(trees)) {
    
    # get the tree
    this_tree <- trees[[i]]
    
    # choose a coordinate
    component <- sample.int(length(weights), prob=weights, size=1)
    this_mean <- means[component,]
    this_vcv  <- VCV[[component]]
    
    repeat {
      xy_offset <- rmvnorm(1, mean = this_mean, sigma = this_vcv)
      x_offset  <- xy_offset[1,1]
      y_offset  <- xy_offset[1,2]
      if ( x_offset > head(x_coords, 1) & x_offset < tail(x_coords, 1) &
           y_offset > head(y_coords, 1) & y_offset < tail(y_coords, 1) ) {
        break
      }
    }
    z_offset  <- densFunction(xy_offset)
    
    # add each segment
    for(j in 1:nrow(this_tree)) {
      
      # get the segment
      this_segment <- unlist(this_tree[j,])
      
      # get the coordinates
      this_y <- y_offset + this_segment[1:2]
      this_x <- x_offset + this_segment[3:4]
      this_z <- z_offset + this_segment[5:6] * scale_factor
      
      # add the segment
      fig <- fig %>% add_trace(
        x = this_y,
        y = this_x,
        z = this_z,
        type = "scatter3d",
        mode = "lines",
        showlegend = FALSE,
        line = list(color = "#000000", width = 3))
      
    }
    
  }
  
  fig <- fig %>% layout(
    margin = list(
      autoexpand = FALSE,
      b = 0,
      l = 0,
      r = 0,
      t = 0
    ),
    scene = list(
      camera = list(eye    = list(x = 2.0 * 0.75, y = 0.0, z = 0.45)),
      aspectmode = "manual",
      xaxis = list(showgrid=FALSE, showline=FALSE, showticklabels=FALSE, title="", zeroline=FALSE),
      yaxis = list(showgrid=FALSE, showline=FALSE, showticklabels=FALSE, title="", zeroline=FALSE),
      zaxis = list(showgrid=FALSE, showline=FALSE, showticklabels=FALSE, title="", zeroline=FALSE),
      aspectratio = list(x = 1.0, y = 1.0, z = 0.2))) %>% hide_colorbar() 
  
  orca(fig, paste0("figs/landscape_",l,".pdf"))
  
  
}




# aaa <- c(16, 12)
# bbb <- c(12, 12)
# ccc <- c(14, 14)
# 
# aaaa <- c(18, 11)
# bbbb <- c(14, 14)
# cccc <- c(8, 8)
# 
# aaaaa <- c(42, 21.5)
# bbbbb <- c(25, 12.5)
# ccccc <- c(26.5, 26)
# 
# fig <- plot_ly() %>%
#   add_trace(x = aaaa, y = bbbb, z = cccc, type = "scatter3d", mode = "lines", 
#             name = "lines", showlegend = FALSE)
# orca(fig, "landscape_with_trees.pdf")
# 
# 
# fig <- plot_ly() %>% add_trace(
#           x = unlist(trees[[1]][1,1:2]), 
#           y = unlist(trees[[1]][1,3:4]), 
#           z = unlist(trees[[1]][1,5:6]), 
#           type = "scatter3d", 
#           mode = "lines", 
#           showlegend = FALSE,
#           line = list(color = "red", width = 4))
# orca(fig, "landscape_with_trees.pdf")
# 





# # add each tree
# fig <- plot_ly()
# for(i in 1:length(trees)) {
#   
#   # get the tree
#   this_tree <- trees[[i]]
#   
#   # choose a coordinate
#   component <- sample.int(length(weights), prob=weights, size=1)
#   this_mean <- means[component,]
#   this_vcv  <- VCV[[component]]
#   
#   xy_offset <- rmvnorm(1, mean = this_mean, sigma = this_vcv)
#   x_offset  <- xy_offset[1,1]
#   y_offset  <- xy_offset[1,2]
#   z_offset  <- dmvnorm(xy_offset, this_mean, this_vcv) * weights[component]
#   
#   # add each segment
#   for(j in 1:nrow(this_tree)) {
#     
#     # get the segment
#     this_segment <- unlist(this_tree[j,])
#     
#     # get the coordinates
#     this_y <- x_offset + this_segment[1:2]
#     this_x <- y_offset + this_segment[3:4]
#     this_z <- z_offset + this_segment[5:6] * 0.01
#     
#     # add the segment
#     fig <- fig %>% add_trace(
#       x = this_x,
#       y = this_y,
#       z = this_z,
#       type = "scatter3d",
#       mode = "lines",
#       showlegend = FALSE,
#       line = list(color = "#000000", width = 4))
#     
#   }
#   
# }
# orca(fig, "landscape_with_trees.pdf")
# 















