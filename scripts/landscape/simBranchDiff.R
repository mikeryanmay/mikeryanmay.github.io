simulateBranchingDiffusion <- function(lambda, mu, sigma) {

  ntips <- 4
  # ntips <- 2 + rpois(1, 4)
  
  # simulate the tree
  tree <- rtree(ntips, br = rgamma, shape = lambda, rate = mu)
  
  # # simulate the tree
  # repeat {
  #   tree <- rlineage(lambda, mu, Tmax=1)
  #   if ( length(drop.fossil(tree)$tip.label) == 1 &
  #        length(tree$tip.label) > 2 & length(tree$tip.label) < 7 ) {
  #     break
  #   }
  # }
  
  # initialize the container
  coord_list <- vector("list", nrow(tree$edge) + 1)
  
  # simulate a stem
  stem_length <- rgamma(1, shape = lambda, rate = mu)
  rescale <- sum(tree$edge.length + stem_length)
  x_0 <- 0
  y_0 <- 0
  z_0 <- 0
  
  # x_1 <- rnorm(1, mean = x_0, sd = sigma * sqrt(stem_length))
  # y_1 <- rnorm(1, mean = y_0, sd = sigma * sqrt(stem_length))
  x_1 <- 0
  y_1 <- 0
  z_1 <- stem_length / rescale
  
  coord_list[[1]] <- data.frame(x0 = x_0, x1 = x_1, y0 = y_0, y1 = y_1, z0 = z_0, z1 = z_1, theta=0)

  tree$edge.length <- tree$edge.length / rescale
  
  # visit each node
  nodes <- unique(tree$edge[,1])
  for(i in 1:length(nodes)) {
    
    # get this node
    this_node <- nodes[i]
    
    # get the ancestral coordinates
    if ( this_node == tree$edge[1,1]  ) {
      ancestral_coords <- coord_list[[1]]    
    } else {
      # get the ancestor
      ancestral_node   <- which(tree$edge[,2] == this_node)
      ancestral_coords <- coord_list[[ancestral_node + 1]]
    }
    
    desc_idx <- which(tree$edge[,1] == this_node)
    
    # random theta
    # rtheta <- runif(1, -15, 15)
    rtheta <- rnorm(1, 0, 1)
    
    # simulate left descendant
    this_desc_idx <- desc_idx[1]
    this_desc <- tree$edge[this_desc_idx,2]
    this_bl <- tree$edge.length[this_desc_idx]
    
    this_x0 <- ancestral_coords$x1
    this_y0 <- ancestral_coords$y1
    this_z0 <- ancestral_coords$z1
    this_theta <- ancestral_coords$theta + rtheta
    
    this_z1 <- this_z0 + this_bl * sin(45)
    this_h  <- this_bl * cos(45)
    this_x1 <- this_x0 + this_h * cos(this_theta)
    this_y1 <- this_y0 + this_h * sin(this_theta)
    
    # this_z1 <- ancestral_coords$z1 + this_bl
    # this_x1 <- rnorm(1, mean = this_x0, sd = sigma * sqrt(this_bl))
    # # this_x1 <- this_x0
    # this_y1 <- rnorm(1, mean = this_y0, sd = sigma * sqrt(this_bl))
    # # this_y1 <- this_y0
    
    coord_list[[this_desc_idx + 1]] <- data.frame(x0 = this_x0, 
                                                  x1 = this_x1, 
                                                  y0 = this_y0,
                                                  y1 = this_y1,
                                                  z0 = this_z0,
                                                  z1 = this_z1,
                                                  theta = this_theta)
    
    # simulate right descendant
    this_desc_idx <- desc_idx[2]
    this_desc <- tree$edge[this_desc_idx,2]
    this_bl <- tree$edge.length[this_desc_idx]
    
    this_x0 <- ancestral_coords$x1
    this_y0 <- ancestral_coords$y1
    this_z0 <- ancestral_coords$z1
    this_theta <- ancestral_coords$theta + rtheta + 180
    
    this_z1 <- this_z0 + this_bl * sin(45)
    this_h  <- this_bl * cos(45)
    this_x1 <- this_x0 + this_h * cos(this_theta)
    this_y1 <- this_y0 + this_h * sin(this_theta)
    
    # this_z1 <- ancestral_coords$z1 + this_bl
    # this_x1 <- rnorm(1, mean = this_x0, sd = sigma * sqrt(this_bl))
    # # this_x1 <- this_x0
    # this_y1 <- rnorm(1, mean = this_y0, sd = sigma * sqrt(this_bl))
    # # this_y1 <- this_y0
    
    coord_list[[this_desc_idx + 1]] <- data.frame(x0 = this_x0, 
                                                  x1 = this_x1, 
                                                  y0 = this_y0,
                                                  y1 = this_y1,
                                                  z0 = this_z0,
                                                  z1 = this_z1,
                                                  theta = this_theta)
    
  }

  # make data frame
  coord_df <- do.call(rbind, coord_list)
  
  # rescale
  # max         <- max(coord_df$z1)
  # coord_df$z0 <- coord_df$z0 / max
  # coord_df$z1 <- coord_df$z1 / max
  
  # return the data frame  
  return(coord_df) 
  
}