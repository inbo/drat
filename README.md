## INBO drat repository

A [drat](http://dirk.eddelbuettel.com/code/drat.html) repository is a way to make [R packages](https://www.r-project.org) more easily available to end users.

How to use it:

1. Make sure that you have the `drat` package installed
1. Add this repo to your current session `drat::addRepo("inbo")`
1. Use `install.packages()` or `update.packages()` to install or update the packages

Visit https://inbo.github.io/drat/ for an overview of the available packages.

## Issues for packages maintainers

- Use the `Authors@R` in the [DESCRIPTION](https://cran.r-project.org/doc/manuals/r-release/R-exts.html#The-DESCRIPTION-file). This is required to generate the package website with [`pkgdown`](http://pkgdown.r-lib.org/).
- Use a fixed date in the vignette preable. Setting the date to `Sys.Date()` cause the the vignette to update with easy run of the drat repository, resulting in unnecessary changes in the history of the drat repository.
- In case the vignette uses HTML widgets, make sure that the have stable id's. The reason for this is similar as the fixed dates. It takes only 3 simple steps:
    1. Add `htmlwidgets` to the `DESCRIPTION` under `Suggests`.
    1. Add `%\VignetteDepends{htmlwidgets}` to the vignette preamble.
    1. Add `library(htmlwidgets)` and `setWidgetIdSeed(my_fancy_number)` to the code of the vignette. `my_fancy_number` can be any integer to your liking.
