# R package name: sciRmdTheme
## Rmarkdown Themes for Scientific Writing

# Install and load

## Install from CRAN
` install.packages("sciRmdTheme") `

## Load after installation
` library("sciRmdTheme") `

# Demos where sciRmdTheme was used in Rmarkdown

## Demo 1 - Basic default settings

simplest default settings

```{r,echo=TRUE}

# simplest default settings
sciRmdTheme::set.theme()

```

View demo: https://coursewhiz.org/mainsite/samples/sample2.html

Download Rmd: https://coursewhiz.org/mainsite/samples/sample2.Rmd


## Demo 2 - Customize theme options

```{r,echo=TRUE}
sciRmdTheme::set.theme(
  theme = "default",
  color = "purple",
  header.sticky=TRUE,
  header.image="logo.png",
  list.group.icon = "arrow",
  font.family = "Arial",
  font.color = "black",
  header.color = "darkblue"
  )

```

View demo: https://coursewhiz.org/mainsite/samples/sample1.html

Download Rmd: https://coursewhiz.org/mainsite/samples/sample1.Rmd

## Demo 3 - No sciRmdTheme theme applied!

```{r,echo=TRUE}
# Before sciRmdTheme customizations
```

View demo: https://coursewhiz.org/mainsite/samples/sample3.html

Download Rmd: https://coursewhiz.org/mainsite/samples/sample3.Rmd


# More information coming soon after publishing to CRAN

![](https://coursewhiz.org/mainsite/logo2x.png)

ETA July
