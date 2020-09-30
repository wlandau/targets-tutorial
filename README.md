# Reproducible computation at scale in R with [`targets`](https://github.com/wlandau/targets)

[![Launch RStudio Cloud](https://img.shields.io/badge/RStudio-Cloud-blue)](https://rstudio.cloud/project/1699460)

Data science can be slow. A single round of statistical computation can take several minutes, hours, or even days to complete. The [`targets`](https://github.com/wlandau/targets) R package keeps results up to date and reproducible while minimizing the number of expensive tasks that actually run. [`
Targets`](https://github.com/wlandau/targets) learns how your pipeline fits together, skips costly runtime for steps that are already up to date, runs the rest with optional implicit parallel computing, abstracts files as R objects, and shows tangible evidence that the output matches the underlying code and data. In other words, the package saves time while increasing our ability to trust the conclusions of the research. [`Targets`](https://github.com/wlandau/targets) surpasses the most burdensome permanent limitations of its predecessor, [`drake`](https://github.com/ropensci/drake), to achieve greater efficiency and provide a safer, smoother, friendlier user experience. This hands-on workshop teaches targets using a realistic [case study](https://blogs.rstudio.com/ai/posts/2018-01-11-keras-customer-churn/). Participants begin with the R implementation of a machine learning project, convert the workflow into a [`targets`](https://github.com/wlandau/targets)-powered pipeline, and efficiently maintain the output as the code and data change.

# Syllabus

Topic | Materials
---|---
Intro | <https://wlandau.github.io/targets-tutorial>
Functions | [`1-functions.Rmd`](https://github.com/wlandau/targets-tutorial/blob/master/1-functions.Rmd)
Pipelines | [`2-pipelines.Rmd`](https://github.com/wlandau/targets-tutorial/blob/master/2-pipelines.Rmd)
Changes | [`3-changes.Rmd`](https://github.com/wlandau/targets-tutorial/blob/master/3-changes.Rmd)
Files | [`4-files.Rmd`](https://github.com/wlandau/targets-tutorial/blob/master/4-files.Rmd)
Branching | [`5-branching.Rmd`](https://github.com/wlandau/targets-tutorial/blob/master/5-branching.Rmd)
Debugging | [`6-debugging.Rmd`](https://github.com/wlandau/targets-tutorial/blob/master/6-debugging.Rmd)
Challenge | [`7-challenge.Rmd`](https://github.com/wlandau/targets-tutorial/blob/master/7-challenge.Rmd)

# Browser access

1. Sign up for a free account at <https://rstudio.cloud>.
1. Log into <https://rstudio.cloud/project/1699460> to access a free instance of RStudio Server in the cloud.
1. Proceed through the R notebooks in the syllabus in order.

# Local access

1. Install R from <https://www.r-project.org>.
1. Install RStudio Desktop from <https://rstudio.com/products/rstudio/download/#download>.
1. [Download or clone](https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/cloning-a-repository) the code at <https://github.com/wlandau/targets-tutorial>.
1. Open the tutorial as an [RStudio project](https://github.com/wlandau/targets-tutorial/blob/master/targets-tutorial.Rproj) in the [RStudio Desktop](https://rstudio.com/products/rstudio/download/#download).
1. Run the [setup script](https://github.com/wlandau/targets-tutorial/blob/master/setup/local.R) to install the required R and Python packages.

# Help

Post an issue to <https://github.com/wlandau/targets-tutorial> to ask for help. Be sure to follow the [code of conduct](https://github.com/wlandau/targets-tutorial/blob/master/CODE_OF_CONDUCT.md).

