## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)
RcppArmadillo::armadillo_throttle_cores(2)
opt <- options()
options(continue="  ", width=70, prompt=" ")
on.exit(options(opt))
library(iDOVE, quietly=TRUE)

## ----eval=FALSE---------------------------------------------------------------
#  intCens(entry_time, left_time, right_time, vaccination_time)

## ----usage, eval=FALSE--------------------------------------------------------
#  idove(formula, data, constantVE = FALSE, plots = TRUE,
#        changePts = NULL, timePts = NULL, tol = 0.0001, maxit = 2000)

## ----intCens-usage, eval=FALSE------------------------------------------------
#  intCens(entry_time, left_time, right_time, vaccination_time) ~ covariates

## ----data-load----------------------------------------------------------------
data(idoveData)

## ----data-head----------------------------------------------------------------
head(idoveData)

## ----data-summary-------------------------------------------------------------
summary(idoveData)
summary(idoveData$right.time[is.finite(idoveData$right.time)])

## ----idove-noaic, fig.show='hide', echo=TRUE, eval=FALSE----------------------
#  model <- intCens(entry.time, left.time, right.time, vaccine.time) ~ priority + sex
#  result1 <- idove(formula = model,
#                   data = idoveData,
#                   changePts = 4*7,
#                   timePts = c(4, 16, 28, 40)*7)

## ----idove-noaic-read, echo = FALSE, eval = TRUE------------------------------
result1 <- readRDS(file="result1.rds")

## ----idove-noaic-return-call--------------------------------------------------
result1$call

## ----idove-noaic-return-changePts---------------------------------------------
result1$changePts

## ----idove-noaic-return-covariates--------------------------------------------
result1$covariates

## ----idove-noaic-return-VE----------------------------------------------------
head(result1$vaccine$VE_a)
tail(result1$vaccine$VE_a)
head(result1$vaccine$VE_h)
tail(result1$vaccine$VE_h)

## ----idove-naic-return-interval-----------------------------------------------
result1$vaccine$VE_period

## ----idove-noaic-plot, eval=FALSE---------------------------------------------
#  plot(x = result1)

## ----idove-noaic-show-plot, echo=FALSE, out.width='49%',fig.cap='\\label{fig:idoveFigs}Plots auto-generated by \\textit{idove()}. On the left, the estimated $VE_a(t)$ curve (black) and its $95\\%$ confidence intervals (green) are shown as a function of the time since vaccination. On the right, the estimated $VE_h(t)$ curve (black) and its $95\\%$ confidence intervals (green) are shown as a function of the time since vaccination.' , fig.show='hold', fig.align='center'----
knitr::include_graphics(
  path=c("idove1a.pdf","idove1b.pdf"),
  auto_pdf = getOption("knitr.graphics.auto_pdf", FALSE),
  dpi = NULL,
  error = getOption("knitr.graphics.error", TRUE)
)

## ----idove-constantVE, echo=TRUE, eval=FALSE----------------------------------
#  result2 <- idove(formula = model, data = idoveData, constantVE = TRUE)

## ----idove-constantVE-read, echo = FALSE, eval = TRUE-------------------------
result2 <- readRDS(file="result2.rds")

## ----idove-constantVE-return-covariates---------------------------------------
result2$covariates

## ----idove-aic-return-VE------------------------------------------------------
result2$vaccine$VE

