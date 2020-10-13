# Reproducible computation at scale in R with [`targets`](https://github.com/wlandau/targets)

[![Launch RStudio Cloud](https://img.shields.io/badge/RStudio-Cloud-blue)](https://rstudio.cloud/project/1699460)

Data science can be slow. A single round of statistical computation can take several minutes, hours, or even days to complete. The [`targets`](https://github.com/wlandau/targets) R package keeps results up to date and reproducible while minimizing the number of expensive tasks that actually run. [`targets`](https://github.com/wlandau/targets) learns how your pipeline fits together, skips costly runtime for steps that are already up to date, runs the rest with optional implicit parallel computing, abstracts files as R objects, and shows tangible evidence that the output matches the underlying code and data. In other words, the package saves time while increasing our ability to trust the conclusions of the research. [`targets`](https://github.com/wlandau/targets) surpasses the most burdensome permanent limitations of its predecessor, [`drake`](https://github.com/ropensci/drake), to achieve greater efficiency and provide a safer, smoother, friendlier user experience. This hands-on workshop teaches targets using a realistic [case study](https://blogs.rstudio.com/ai/posts/2018-01-11-keras-customer-churn/). Participants begin with the R implementation of a machine learning project, convert the workflow into a [`targets`](https://github.com/wlandau/targets)-powered pipeline, and efficiently maintain the output as the code and data change.


# Browser access

1. Sign up for a free account at <https://rstudio.cloud>.
1. Log into <https://rstudio.cloud/project/1699460> to access a free instance of RStudio Server in the cloud.
1. Proceed through the R notebooks in the syllabus in order.

# Local access

1. Install R from <https://www.r-project.org>.
1. Install RStudio Desktop from <https://rstudio.com/products/rstudio/download/#download>.
1. [Download or clone](https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/cloning-a-repository) the code at <https://github.com/wlandau/targets-tutorial>.
1. Open the tutorial as an [RStudio project](https://github.com/wlandau/targets-tutorial/blob/main/targets-tutorial.Rproj) in the [RStudio Desktop](https://rstudio.com/products/rstudio/download/#download).
1. Run the [setup script](https://github.com/wlandau/targets-tutorial/blob/main/setup/local.R) to install the required R and Python packages.

# Help

Post an issue to <https://github.com/wlandau/targets-tutorial> to ask for help. Be sure to follow the [code of conduct](https://github.com/wlandau/targets-tutorial/blob/main/CODE_OF_CONDUCT.md).

# Syllabus

Topic | Materials
---|---
Intro | [slides](https://wlandau.github.io/targets-tutorial)
Functions | [`1-functions.Rmd`](https://github.com/wlandau/targets-tutorial/blob/main/1-functions.Rmd)
Pipelines | [`2-pipelines.Rmd`](https://github.com/wlandau/targets-tutorial/blob/main/2-pipelines.Rmd)
Changes | [`3-changes.Rmd`](https://github.com/wlandau/targets-tutorial/blob/main/3-changes.Rmd)
Files | [`4-files.Rmd`](https://github.com/wlandau/targets-tutorial/blob/main/4-files.Rmd)
Debugging | [`5-debugging.Rmd`](https://github.com/wlandau/targets-tutorial/blob/main/5-debugging.Rmd)
Branching | [`6-branching.Rmd`](https://github.com/wlandau/targets-tutorial/blob/main/6-branching.Rmd)
Challenge | [`7-challenge.Rmd`](https://github.com/wlandau/targets-tutorial/blob/main/7-challenge.Rmd)

# Schedule

This schedule budgets time for a 4-hour iteration of the workshop (8 AM to noon).

| Topic                        | Format     | [Breakout rooms](https://blog.zoom.us/using-zoom-breakout-rooms/) | Minutes | Start | End   | Materials                                                               |
|------------------------------|------------|----------------|---------|-------|-------|-------------------------------------------------------------------------|
| Intro presentation           | lecture    | no             | 20      | 8:00  | 8:20  | [slides](https://wlandau.github.io/targets-tutorial)                             |
| Q&A                          | discussion | no             | 10      | 8:20  | 8:30  | [slides](https://wlandau.github.io/targets-tutorial)                             |
| Functions for the case study | exercises  | yes            | 15      | 8:30  | 8:45  | [`1-functions.Rmd`](https://github.com/wlandau/targets-tutorial/blob/main/1-functions.Rmd) |
| Review functions             | lecture    | no             | 5       | 8:45  | 8:50  | [`1-functions.Rmd`](https://github.com/wlandau/targets-tutorial/blob/main/1-functions.Rmd) |
| Break                        | break      | no             | 10      | 8:50  | 9:00  |                                                                         |
| Build up a pipeline          | exercises  | yes            | 20      | 9:00  | 9:20  | [`2-pipelines.Rmd`](https://github.com/wlandau/targets-tutorial/blob/main/2-pipelines.Rmd) |
| Review building up a pipeline             | lecture    | no             | 5       | 9:20  | 9:25  | [`2-pipelines.Rmd`](https://github.com/wlandau/targets-tutorial/blob/main/2-pipelines.Rmd) |
| Iterate on changes           | exercises  | yes            | 20      | 9:25  | 9:45  | [`3-changes.Rmd`](https://github.com/wlandau/targets-tutorial/blob/main/3-changes.Rmd)   |
| Review iterating on changes               | lecture    | no             | 5       | 9:45  | 9:50  | [`3-changes.Rmd`](https://github.com/wlandau/targets-tutorial/blob/main/3-changes.Rmd)   |
| Break                        | break      | no             | 10      | 9:50  | 10:00 |                                                                         |
| External files               | exercises  | yes            | 20      | 10:00 | 10:20 | [`4-files.Rmd`](https://github.com/wlandau/targets-tutorial/blob/main/4-files.Rmd)     |
| Review external files                 | lecture    | no             | 5       | 10:20 | 10:25 | [`4-files.Rmd`](https://github.com/wlandau/targets-tutorial/blob/main/4-files.Rmd)     |
| Interactive debugging            | exercises  | yes            | 20      | 10:25 | 10:45 | [`5-debugging.Rmd`](https://github.com/wlandau/targets-tutorial/blob/main/5-debugging.Rmd) |
| Review interactive debugging             | lecture    | no             | 5       | 10:45 | 10:50 | [`5-debugging.Rmd`](https://github.com/wlandau/targets-tutorial/blob/main/5-debugging.Rmd) |
| Break                        | break      | no             | 10      | 10:50 | 11:00 |                                                                         |
| Dynamic branching        | exercises  | yes            | 20      | 11:00 | 11:20 | [`6-branching.Rmd`](https://github.com/wlandau/targets-tutorial/blob/main/6-branching.Rmd) |
| Review dynamic branching           | lecture    | no             | 5       | 11:20 | 11:25 | [`6-branching.Rmd`](https://github.com/wlandau/targets-tutorial/blob/main/6-branching.Rmd) |
| Challenge exercise           | exercises  | yes            | 20      | 11:25 | 11:45 | [`7-challenge.Rmd`](https://github.com/wlandau/targets-tutorial/blob/main/7-challenge.Rmd) |
| Review challenge exercise            | lecture    | no             | 5       | 11:45 | 11:50 | [`7-challenge.Rmd`](https://github.com/wlandau/targets-tutorial/blob/main/7-challenge.Rmd) |
| Q&A                          | discussion | no             | 10      | 11:50 | 12:00 |                                                                         |
