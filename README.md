# DMD Biomarkers

## Statistical analysis of biomarkers associated with Duchenne muscular dystrophy

This project explores the statistical relationship between
biomarkers associated with **Duchenne muscular dystrophy (DMD)**
and clinical and demographic variables.

The analysis was developed in **R** as part of a Master's programme
in Bioinformatics and focuses on exploratory data analysis,
statistical modelling, correlation analysis and regression.

---

## Overview

Duchenne muscular dystrophy (DMD) is an X-linked genetic disorder
characterised by progressive muscle degeneration caused by the
absence or severe deficiency of dystrophin.

This project analyses a dataset obtained from **Biostat** containing
measurements from women studied in the context of a screening
programme for relatives of individuals with DMD.

The main objective is to explore whether biochemical biomarkers
show relationships with age and carrier status and to identify
potential predictors of biomarker levels.

---

## Dataset

The dataset contains **209 observations and 10 variables**.

The main variables analysed are:

| Variable | Description |
|---|---|
| `age` | Age of the individual |
| `ck` | Creatine kinase level |
| `h` | Hemopexin level |
| `pk` | Pyruvate kinase level |
| `ld` | Lactate dehydrogenase level |
| `carrier` | Carrier status (0 = no, 1 = yes) |
| `hospid` | Hospital identifier |
| `sdate` | Sample collection date |
| `obsno` | Number of observations for the individual |

The dataset initially contains missing values. These observations
are identified and removed before performing the subsequent
statistical analyses.

---

## Objectives

The main objectives of the analysis are:

- Explore the structure and distribution of the dataset.
- Characterise the study population.
- Analyse the distribution of biochemical biomarkers.
- Compare biomarker levels between carriers and non-carriers.
- Explore correlations between biomarkers and demographic variables.
- Investigate the relationship between age and biomarker levels.
- Identify variables associated with hemopexin levels.
- Develop and evaluate linear regression models.
- Select a model containing the most informative predictors.

---

## Exploratory data analysis

The first stage of the analysis focuses on understanding the
structure and quality of the dataset.

This includes:

- Dataset dimensions.
- Variable identification.
- Missing-value detection.
- Descriptive statistics.
- Age distribution.
- Biomarker distributions.
- Comparison between carriers and non-carriers.

The dataset contains 209 observations and 10 variables, with
biochemical measurements including creatine kinase, hemopexin,
pyruvate kinase and lactate dehydrogenase.

---

## Biomarker analysis

The project focuses on four main biochemical biomarkers:

### Creatine kinase (CK)

Creatine kinase is a muscle-associated enzyme and an important
biochemical marker in the context of muscular disorders.

### Hemopexin (H)

Hemopexin is analysed as one of the main response variables in
the statistical modelling.

### Pyruvate kinase (PK)

Pyruvate kinase levels are explored as a potential variable
associated with other biomarkers and carrier status.

### Lactate dehydrogenase (LD)

LD levels are also incorporated into the correlation and regression
analyses.

---

## Carrier status

One of the main comparisons in the analysis is between:

- **Non-carriers**
- **Carriers**

The dataset contains 127 non-carrier observations and 67 carrier
observations after handling missing data.


---

## Correlation analysis

Pearson correlation coefficients are calculated to investigate
linear relationships between the variables.

The analysis identifies several relationships between biomarkers
and demographic variables.

In particular, hemopexin is selected for further investigation
because of its relationships with other variables.

The analysis examines the association between age and hemopexin
levels, as well as the relationship between hemopexin and carrier
status.

---

## Linear regression

A simple linear regression model is used to investigate the
relationship between age and hemopexin:

```r
lm(h ~ age)
```

The model identifies a statistically significant association
between age and hemopexin levels.

However, the coefficient of determination indicates that age alone
explains only a limited proportion of the variability in hemopexin
levels.

---

## Multiple linear regression

A multiple linear regression model is then constructed using
several potential predictors:

```r
age
CK
PK
LD
carrier status
sample date
observation number
```
The initial model is progressively simplified using model selection
based on AIC.

The resulting model retains:

```text
age
CK
LD
carrier status
```

as predictors of hemopexin levels.

The final model is:

```r
lm(h ~ age + ck + ld + carrier)
```

Among the predictors, carrier status shows the strongest statistical
association with hemopexin in the final model.

---

## Visualisation 

The analysis includes several graphical approaches for exploring
the data:

- Histograms and density plots.
- Boxplots comparing carriers and non-carriers.
- Scatter plots.
- Correlation matrices.
- Regression plots.
- Biomarker distribution visualisations.

These visualisations are used to complement the statistical analysis
and identify patterns that may not be apparent from numerical
summaries alone.

---

## Main findings

The analysis suggests several relevant patterns:

- The study population is predominantly composed of young women.
- Biomarker levels differ between carriers and non-carriers.
- Hemopexin shows relationships with several variables in the
dataset.
- Age is significantly associated with hemopexin in a simple linear
regression model, although its explanatory power is limited.
- A multiple regression model provides a better representation of
hemopexin variability.
- Carrier status remains an important predictor of hemopexin after
model selection.

These results should be interpreted as statistical associations
within the analysed dataset and not as evidence of clinical
causation.

---

## Methods

The analysis includes:

- Data cleaning
- Missing-value handling
- Descriptive statistics
- Distribution analysis
- Group comparisons
- Pearson correlation
- Simple linear regression
- Multiple linear regression
- Stepwise model selection using AIC
- Data visualisation

---

## Technologies

- **R**
- **RStudio**
- **ggplot2**
- Statistical modelling
- Data visualisation
- Exploratory data analysis

---

## Repository structure

```text

dmd-biomarcadores/
│
├── README.md
├── LICENSE
├── .gitignore
│
├── data/
│   └── dmd.csv
│
├── R/
│   ├── data_cleaning.R
│   ├── exploratory_analysis.R
│   ├── correlation_analysis.R
│   └── regression_models.R
│
├── figures/
│   ├── biomarker_distributions/
│   ├── carrier_comparisons/
│   └── regression/
│
└── analysis/
    └── dmd_biomarkers.Rmd

```

---

## Reproducibility

The analysis was originally developed as an R Markdown document.

To reproduce the analysis:

1. Download or clone the repository.
2. Open the R Markdown analysis.
3. Install the required R packages.
4. Run the analysis sequentially.

The main workflow includes data cleaning, exploratory analysis,
statistical modelling and visualisation.

---

## Scientific context

Duchenne muscular dystrophy is a severe X-linked muscular disorder
caused by mutations affecting the dystrophin gene.

The dataset analysed in this project comes from a screening context
involving women who are relatives of individuals with DMD.

The analysis therefore focuses on biochemical measurements that may
help characterise differences associated with carrier status.

---

## Academic context

This project was developed as part of a Master's programme in
Bioinformatics, within a statistical data analysis module.

The project combines statistical reasoning, biological interpretation
and computational analysis using R.

---

## Author

### Sara Álvarez

Master's Degree in Bioinformatics and Biostatistics | Bachelor's Degree in Genetics 

- GitHub: https://github.com/saraalv
- LinkedIn: www.linkedin.com/in/saraalvarezestevez 

---

## License

This project is intended for educational and portfolio purposes.
