---
title: "DisperseR"
output: github_document
bibliography: bibliography.bib
nocite: '@*'
---



<!-- README.md is generated from README.Rmd. Please edit that file -->

<!-- badges: start -->
<!-- badges: end -->

# PLEASE NOTE:This package as well as this readme are still under development. 

# Welcome to disperseR

## Package Authors: 
- **Main author**: Lucas Henneman
- **Contributor**: Christine Choirat
- **Contributor**: Maja Garbulinska 


## What is disperseR?

`disperseR` is an R package designed based on the [hyspdisp package](https://github.com/lhenneman/hyspdisp) and the [SplitR package](https://rdrr.io/github/rich-iannone/SplitR/). It is very important to note that many functions in `disperseR` are just sightly redesigned functions from the two mentioned packages. 


`disperseR` runs the [HYSPLIT](https://www.ready.noaa.gov/HYSPLIT.php) many times and calculates the HYSPLIT Average Dispersion (or HyADS) exposure metric.
The results can then be aggregated to ZIP code level to create national estimates of exposure from various sources. `disperseR` includes functions that make it possible for the user to plot the results easily. 

Thanks to the [hyspdisp package](https://github.com/lhenneman/hyspdisp), for example, plumes from several power plants can be tracked for many days and cumulative impacts estimated. disperseR laverages [hyspdisp package](https://github.com/lhenneman/hyspdisp) and allows the user have a more friendly interaction with the package.

### What is improved? 

`disperseR` is a new version of the `hyspdisp` package. What has been improved?

- Input data manipulation is handled at the package level. The user only has to read the data in using the `disperseR::get_data()` function. We show how to do it in the main vignette. 

- We also created additional vignettes should the user want to see how the attached data was preprocessed. We show every single step of preprocessing starting from the step of data download. This is key for reproducible research. 

- Very clear project struture and automatization does not make the user lost in the maze of multiple folders. The `disperseR::create_dirs()` automatically creates the whole project structure either in the specified location or on the desktop. The function also assigns path to each folder to the R environment. These paths are then used by other `disperseR` functions. **Note** that the `disperseR::create_dirs()` function does not overwrite the project folders if they already exists in the specified location. 

- Until now the `units` data for different years was separated and only four years of data were available with the package. Now data for years 1995 to 2015 has been added and aggregated to one data file called `units` attached to `disperseR`.

- ZIP code linkage procedure requires a ZCTA-to-ZIP code crosswalk file. These crosswalk data has also been attached to the package. It not only provides the crosswalk between ZCTA and ZIP but also contains information about population sizes.

- Before the user could only run analysis for one year. `disperseR` allows to process all the needed years together. 

- Graph functions now have many automatic features. 


### Vignettes attached with the package 

We know it is sometimes difficult to start working with a new package, especially if you are not very familiar with R. We also believe in reproducible research. This is why we have included several vignettes to help you with the process. 

- [The main vignette for disperseR](http://htmlpreview.github.io/?https://github.com/garbulinskamaja/disperseR/blob/master/vignettesHTML/Vignette_Disperse.html)
- [Load data one by one](Vignette - Load Data One by One)
- [Crosswalk data preparation (optional)](vignettes/Vignette_Crosswalk_Preparation.html)
- [Planetary layers data preparation (optional)](vignettes/Vignette_Planetary_Layers_Data_Preparation.html)
- [ZIP Code coordinate data preparation (optional)](vignettes/Vignette_Zip_Code_Coordinate_Data_Preparation.html)
- [Vignette ZCTA shapefile preparation (optional)](vignettes/Vignette_ZCTA_Shapefile_Preparation.html)
- [Vignette units preparation (optional)](vignettes/Vignette_Units_Preparation.html)

### Data attached with the package 

Unfortunatelly, `disperseR` requires a lot of data to run the models. We could not include all the data sets with the package. For example the ZCTA shapefile is more than 140 MB. You can access it very simply with the help of the `disperseR::get_data()` function. Here however are the data that are attached: 

- **crosswalk**: ZIP code linkage procedure requires a ZCTA-to-ZIP code crosswalk file. ZCTAs are not exact geographic matches to ZIP codes, and multiple groups compile and maintain Crosswalk files. We used the Crosswalk maintained by [UDS Mapper]("https://www.udsmapper.org/zcta-crosswalk.cfm") and prepossessed it also including information about the population size. While not necessary for the HYSPLIT model or processing of its outputs, population-weighted exposure metrics allow for direct comparisons between power plants. If you would like to know more details about how this crosswalk was prepared, we have attached a vignette that explains it. You can see it by clicking [here](vignettes/Vignette_Crosswalk_Preparation/html).

- **PP.units.monthly1995_2017** : The `disperseR` package also includes monthly power plant emissions, load, and heat input data. (we currently do not have a vignette for these data due to server problems of the data owner). This will be updated as soon as possible. 

- **units**(data for 1995-2015):  This package contains annual emissions and stack height data from [EPA's Air Markets Program Data](https://ampd.epa.gov/ampd/) and the [Energy Information Agency](https://www.eia.gov/electricity/data/eia860/). Again, if you would like to know how these data were prepared please see the special vignette that we have attached to this package. You can see it by clicking [here](vignettes/Vignette_Units_Preparation.html). 

- **zipcode coordinate data**: The `disperseR` package contains a data set with coordinates of ZIP codes. This might be useful for plotting, but it is not necessary as it will be used automatically by our plotting functions where required. Please click [here](vignettes/Vignette_Zip_Code_Coordinate_Data_Preparation.html) for more information.

### Example output

<img width="676" alt="Screen Shot 2019-09-01 at 16 35 53" src="https://user-images.githubusercontent.com/43005886/64078059-9f592d00-ccd6-11e9-942a-e708d6e4e8ad.png">


## Instructions

### Download and installation. 

First, not having the `Rccp` package installed on your computer can lead to problems with `disperseR` installation (problems with version installation). We recommend you first type the following into your R console. 


```r
install.packages("Rccp")
```

If you are using a Windows machine and you want R to render the vignettes for you, you will need to download Rtools from [here](https://cran.rstudio.com/bin/windows/Rtools/). If you prefer to avoid this step you can go ahead and proceed with the instalation as we have added links to access already rendered vignettes on GitHub. 

Continue by typing the following in your R console. This will download the package from GitHub, install it and build the vignettes. This might take some minutes. 


```r
devtools::install_github("garbulinskamaja/disperseR", force = TRUE, build_vignettes = TRUE)
library(disperseR)
```

Load `disperseR` into your R session. 


```r
library(disperseR)
```

### See the vignettes

You should be able to see the main vignette like this. This will be opened by your RStudio.


```r
vignette("Vignette_DisperseR")
```

The rest of the vignettes can be accessed by typing the corresponding commands. 


```r
vignette("Vignette_Crosswalk_Preparation")
vignette("Vignette_Load_Data_One_by_One")
vignette("Vignette_Units_Preparation")
vignette("Vignette_Zip_Code_Coordinate_Data_Preparation")
vignette("Vignette_Planetary_Layers_Data_Preparation")
vignette("Vignette_ZCTA_Shapefile_Preparation")
```

** NOTE: IF THIS DOES NOT WORK:**

In case this does not work for you. We have rendered all the vignettes for you and you can access them from your browser by clicking at the corresponding hyperlinks in  **Vignettes attached with the package** section above. 

### Set up the project. 

The vignettes will instruct you to do so but you can already start by creating the project folder. Use `disperseR::create_dirs()` function to do so. Point `disperseR` to the location where you want your project to be created. For example the following code will create the project in the user's Dropbox. If you do not specify the location and just type `disperseR::create_dirs()` it will still work and the project will be created on your desktop. 



```r
disperseR::create_dirs(location="/Users/username/Dropbox")
```

This will set up is the following folders and paths to them :

* `main`: the main folder where the project will be located. 
  + `input`: the input that we need for calculations. 
    * `zcta_500k`: ZCTA (A Zip Code Tabulation Area) shape files
    * `hpbl`: monthly global planetary boundary layer files.
    * `meteo`: (reanalysis) meteorology files
  + `output`
    * `hysplit`: disperseR output (one file for each emissions event)
    * `ziplink`: files containing ZIP code linkages
    * `rdata`: RData files containing HyADS source-receptor matrices
    * `exp`: exposure per zipcode data 
    * `graph`: graphs saved here as pdf when running functions
  + `process`: temporary files that are created when the model is running and then deleted
  
Here is a screen shot of what it should look like: 

<img width="856" alt="Screen Shot 2019-09-01 at 16 43 58" src="https://user-images.githubusercontent.com/43005886/64078186-c2381100-ccd7-11e9-96e4-be8f6ef97875.png">

### Analysis

We suggest you have a look at our main vignette [here](vignettes/Vignette_Disperse.html) for details about the analysis. 

## Packages used 

- base [@base]
- data.table [@data.table]
- dplyr [@dplyr]
- ggmap [@ggmap]
- ggplot2 [@ggplot2]
- ggrepel [@ggrepel]
- ggsn [@ggsn]
- gridExtra [@gridExtra]
- lubridate [@lubridate]
- measurements [@measurements]
- ncdf4 [@ncdf4]
- parallel [@parallel]
- raster [@raster]
- readxl [@readxl]
- scales [@scales]
- sf [@sf]
- sp [@sp]
- tidyr [@tidyr]
- tidyverse [@tidyverse]
- viridis [@viridis]


## References / Resources Used

NCEP Reanalysis data provided by the NOAA/OAR/ESRL PSD, Boulder, Colorado, USA, from their Web site at https://www.esrl.noaa.gov/psd/ Mesinger, F., G. DiMego, E. Kalnay, K. Mitchell, P.C. Shafran, W. Ebisuzaki, D. Jović, J. Woollen, E. Rogers, E.H. Berbery, M.B. Ek, Y. Fan, R. Grumbine, W. Higgins, H. Li, Y. Lin, G. Manikin, D. Parrish, and W. Shi, 2006: North American Regional Reanalysis. Bull. Amer. Meteor. Soc., 87, 343–360, https://doi.org/10.1175/BAMS-87-3-343

[hyspdisp package](https://github.com/lhenneman/hyspdisp)

[SplitR package](https://rdrr.io/github/rich-iannone/SplitR/)




