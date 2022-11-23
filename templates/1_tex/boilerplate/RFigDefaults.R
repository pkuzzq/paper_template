library(RColorBrewer); library(ggplot2); library(patchwork)
options(repr.plot.width=12, repr.plot.height=9, scipen=999,
        ggplot2.discrete.fill   = brewer.pal(9, "Set1"),
        ggplot2.discrete.colour = brewer.pal(9, "Set1"),
        ggplot2.continuous.fill = "viridis",
        ggplot2.continuous.colour = "viridis")
theme_set(lal_plot_theme()) # add _d() for dark
