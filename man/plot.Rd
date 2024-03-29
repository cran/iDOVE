% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot.iDOVE.R
\name{plot}
\alias{plot}
\alias{plot.iDOVE}
\title{Plot Estimated Vaccine Efficacy}
\usage{
\method{plot}{iDOVE}(x, ...)
}
\arguments{
\item{x}{An iDOVE object. The value object returned by idove().}

\item{...}{ignored}
}
\value{
No return value, called to produce graphical elements.
}
\description{
Generates plots of the estimated vaccine efficacy in reducing attack rate, 
  the estimated vaccine efficacy in reducing the hazard rate, 
  and their 95\% confidence intervals.
}
\examples{
\dontshow{
  RcppArmadillo::armadillo_throttle_cores(2)
}

data(idoveData)

set.seed(1234)
smp <- sample(1L:nrow(x = idoveData), size = 250L)

# NOTE: This sample size is chosen for example only -- larger data sets
# should be used.
# See the vignette for a full analysis of the idoveData dataset

# Fit the model with default settings
result <- idove(formula = intCens(entry.time, left.time, right.time, vaccine.time) ~ 1, 
                data = idoveData[smp,])

plot(x = result)

}
