# CodeX Energy Drink Marketing Analysis

## Project Overview

CodeX is a German energy drink company that has launched its products in 10 cities across India. The company conducted a survey of 10,000 respondents to understand consumer demographics, preferences, purchasing behaviour, brand perception, competition and marketing opportunities.

This project uses Google BigQuery and SQL to analyze the survey data and generate business insights and recommendations for CodeX's marketing and product strategy.

## Business Objective

The objective of this analysis is to help CodeX understand:

- Which consumer segments show stronger interest in energy drinks
- Which marketing channels provide the strongest reach
- What consumers expect from energy drinks
- Which competitor brands are most commonly reported
- Why consumers choose competing brands
- How consumers purchase and consume energy drinks
- How CodeX can improve its product and marketing strategy
- Which audience CodeX should prioritize

## Tools & Technologies

- Google BigQuery
- SQL
- GitHub

## Dataset

The analysis is based on a survey of 10,000 respondents across 10 Indian cities.

The BigQuery dataset contains:

- `dim_respondents`
- `dim_cities`
- `fact_survey_responses`
- `fact_survey_responses_clean`

The raw survey data is not included in this repository. The SQL analysis was performed on the dataset hosted in Google BigQuery.

## Data Cleaning

During data validation, 2,855 responses were identified where respondents indicated that they had not heard of CodeX but had already tried the product.

Because this combination was considered ambiguous for the analysis, these records were excluded from the analytical dataset.

A cleaned table named `fact_survey_responses_clean` was created and used for the analysis.

Final analytical population: 7,145 respondents.

## Analysis Performed

### 1. Demographic Insights

Analyzed gender-wise and age-group insights using a defined preference proxy, along with marketing-channel reach among youth aged 15–30.

### 2. Consumer Preferences

Analyzed expected ingredients and packaging preferences. Caffeine was the most frequently expected ingredient, while compact portable cans were the most preferred packaging format.

### 3. Competition Analysis

Analyzed leading brands reported by respondents and reasons for choosing competing brands. Cola-Coka, Bepsi and Gangster were the three most frequently reported competing brands in the survey.

Brand reputation was the leading stated reason for choosing an energy-drink brand, followed by taste/flavor and availability.

These findings represent survey responses and should not be interpreted as actual market-share estimates.

### 4. Marketing Channels & Brand Awareness

Analyzed marketing-channel reach and strategic factors such as purchase location, price range and consumption situations.

Online advertising was the strongest communication channel overall and among youth respondents.

### 5. Brand Penetration

Analyzed CodeX brand perception, general perception of energy drinks, reasons for consuming CodeX, barriers to trial and city-level CodeX penetration within the survey sample.

The analysis measures penetration within the survey sample and does not represent actual city-level market share.

### 6. Purchase Behavior

Analyzed purchase locations, consumption situations, reasonable price ranges and limited-edition packaging preferences.

Supermarkets were the most common purchase location, sports/exercise was the most common consumption situation, and ₹50–99 was the strongest price preference.

### 7. Product Development

Analyzed reasons reported by CodeX users for choosing the brand, with particular focus on brand reputation, taste/flavor and availability.

### 8. Secondary Analysis & Business Recommendations

Translated the survey findings into recommendations covering immediate product improvements, price positioning, marketing campaigns and promotional strategies, potential brand ambassador and target audience.

These recommendations combine survey evidence with competitive research where required.

## Key Business Insights

- The 19–30 age group is the strongest core audience identified in the survey.
- Online advertising is the strongest marketing channel, particularly among youth.
- Caffeine is the most frequently expected ingredient.
- Compact portable cans are the most preferred packaging format.
- Cola-Coka, Bepsi and Gangster are the leading brands reported by survey respondents.
- Brand reputation is the leading stated reason for choosing an energy-drink brand.
- Supermarkets are the most common purchase location.
- Sports/exercise is the most common consumption situation.
- ₹50–99 is the most preferred price range.
- Reduced sugar and more natural ingredients are the two strongest requested product improvements.

## Recommended Strategic Direction

Based on the analysis, CodeX should consider positioning itself around:

- A strong caffeine proposition
- Reduced sugar
- More natural ingredients
- An accessible price point within the ₹50–99 range
- Compact and portable packaging
- Digital-first marketing
- Sports, fitness and active-lifestyle positioning
- A primary focus on consumers aged 19–30

The survey provides directional insights rather than definitive market forecasts. Further market research and market testing would be required before making final pricing, promotional or product-launch decisions.

## Repository Structure

```
codex-energy-drink-marketing-analysis/
│
├── SQL/
│   ├── 01_Demographic_Insights.sql
│   ├── 02_Consumer_Preferences.sql
│   ├── 03_Competition_Analysis.sql
│   ├── 04_Marketing_Channels_Brand_Awareness.sql
│   ├── 05_Brand_Penetration.sql
│   ├── 06_Purchase_Behavior.sql
│   ├── 07_Product_Development.sql
│   └── 08_Secondary_Analysis.sql
│
├── MetaData.txt
└── README.md
```

## Note

The analysis was performed using Google BigQuery. The SQL files contain the queries used for analysis, while `MetaData.txt` documents the dataset structure and relevant metadata.
