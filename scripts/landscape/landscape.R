library(plotly)
library(plot3D)
library(dirichletprocess)
library(mvtnorm)
library(misc3d)

# specify the weights
weights <- StickBreaking(20, 1000)

# draw the means
x_mean <- runif(length(weights), max=10)
y_mean <- runif(length(weights))
means  <- cbind(x_mean, y_mean)

# draw the covariances
corrs <- 2 * rbeta(length(weights), 3, 3) - 1
vars  <- matrix(rgamma(2 * length(weights), shape = 4, rate = 15), ncol=2)

VCV <- vector("list", length = length(weights))
for(i in 1:length(weights)) {
  this_sd  <- sqrt(vars[i,])
  this_R   <- matrix(c(1, corrs[i], corrs[i], 1), nrow=2)
  VCV[[i]] <- diag(this_sd) %*% this_R %*% diag(this_sd)
}

densFunction <- function(x) {

  weights <- weights / sum(weights)
    
  dens <- numeric(nrow(x))
  for(i in 1:length(weights)) {
    dens <- dens + dmvnorm(x, means[i,], VCV[[i]]) * weights[i]
  }
  
  return(dens)
  
}

densFunction( matrix(c(0.1,0.8), nrow=1) )

# make the landscape coordinates
x_coords <- seq(-1, 11, length.out=401)
y_coords <- seq(-1, 2, length.out=401)
coords   <- expand.grid(x = x_coords, y = y_coords)

# compute the densities (z coordinate)
coord_densities <- densFunction(coords)

# translate into matrix
z_coords <- matrix(coord_densities, nrow=length(x_coords))

# test contour
contour(z_coords, nlevels=20)

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
             width = 2)),
  x = ~y_coords,
  y = ~x_coords,
  z = ~z_coords,
  width = 4800,
  height = 960)
fig <- fig %>% layout(
  margin = list(
    autoexpand = FALSE,
    b = 0,
    l = 0,
    r = 0,
    t = 0
  ),
  scene = list(
    camera = list(eye = list(x = 1.25, y = 0.0, z = 1.0)),
    aspectmode = "manual",
    xaxis = list(showgrid=FALSE, showline=FALSE, showticklabels=FALSE, title="", zeroline=FALSE),
    yaxis = list(showgrid=FALSE, showline=FALSE, showticklabels=FALSE, title="", zeroline=FALSE),
    zaxis = list(showgrid=FALSE, showline=FALSE, showticklabels=FALSE, title="", zeroline=FALSE),
    aspectratio = list(x = 1.0, y = 5.0, z = 0.5))) %>% hide_colorbar() 

orca(fig, "landscape.pdf")




# save stuff
saveRDS(weights, file="weights.Rds")
saveRDS(means, file="means.Rds")
saveRDS(VCV, file="vcvs.Rds")















