-- Consumer Preferences
-- a. What are the preferred ingredients of energy drinks among respondents?

SELECT
  Ingredients_expected AS INGREDIENT_PREFERENCE, COUNT(*) AS PREFERENCE_COUNT
FROM `codex_analysis.fact_survey_responses_clean`
JOIN `codex_analysis.dim_respondents`
  USING (RESPONDENT_ID)
GROUP BY Ingredients_expected
ORDER BY PREFERENCE_COUNT DESC;
# Among the 7,145 clean respondents, caffeine is the most preferred/expected ingredient, with 2,787 respondents selecting it, followed by vitamins (1,822). Sugar (1,434) and guarana (1,102) are less preferred.

SELECT
  Ingredients_expected AS INGREDIENT_PREFERENCE, COUNT(*) AS PREFERENCE_COUNT
FROM `codex_analysis.fact_survey_responses_clean`
JOIN `codex_analysis.dim_respondents`
  USING (RESPONDENT_ID)
WHERE General_perception != 'Dangerous' AND Consume_frequency != "Rarely"
GROUP BY Ingredients_expected
ORDER BY PREFERENCE_COUNT DESC;
# Among respondents who do not perceive energy drinks as dangerous and consume them more frequently than rarely, caffeine remains the most expected ingredient, followed by vitamins, sugar, and guarana. The ranking is consistent with the overall respondent population.

SELECT
  Ingredients_expected AS INGREDIENT_PREFERENCE, COUNT(*) AS PREFERENCE_COUNT
FROM `codex_analysis.fact_survey_responses_clean`
JOIN `codex_analysis.dim_respondents`
  USING (RESPONDENT_ID)
WHERE General_perception = 'Dangerous' AND Consume_frequency = "Rarely"
GROUP BY Ingredients_expected
ORDER BY PREFERENCE_COUNT DESC;
# Even among respondents who perceive energy drinks as dangerous and consume them rarely, caffeine remains the most expected ingredient, followed by vitamins, sugar, and guarana. This suggests that caffeine's position as the leading expected ingredient is not limited to frequent or positively disposed consumers.

SELECT
  Ingredients_expected AS INGREDIENT_PREFERENCE, COUNT(*) AS PREFERENCE_COUNT
FROM `codex_analysis.fact_survey_responses_clean`
JOIN `codex_analysis.dim_respondents`
  USING (RESPONDENT_ID)
WHERE
  General_perception != 'Dangerous'
  AND Consume_frequency != "Rarely"
  AND AGE IN ('15-18', '19-30')
GROUP BY Ingredients_expected
ORDER BY PREFERENCE_COUNT DESC;
# Among the youth segment (15–18 and 19–30), caffeine is the most expected ingredient, followed by vitamins, sugar and guarana. The youth segment therefore shows a clear and consistent ingredient expectation, with caffeine leading across the segment.

# Both youth age groups (15–18 and 19–30) demonstrate high preference rates in the survey, making youth an important segment to investigate further when developing the product and marketing strategy.

-- 2. What packaging preferences do respondents have for energy drinks?
SELECT *
FROM `codex_analysis.fact_survey_responses_clean`
JOIN `codex_analysis.dim_respondents`
  USING (RESPONDENT_ID);

SELECT Packaging_preference, COUNT(*) AS PREFERENCE_COUNT
FROM `codex_analysis.fact_survey_responses_clean`
JOIN `codex_analysis.dim_respondents`
  USING (RESPONDENT_ID)
GROUP BY Packaging_preference
ORDER BY PREFERENCE_COUNT DESC;
# Compact and portable cans are the most preferred packaging option, selected by 2,877 respondents, followed by innovative bottle designs with 2,174. Collectible packaging, eco-friendly designs and other options received considerably fewer preferences.

SELECT Packaging_preference, COUNT(*) AS PREFERENCE_COUNT
FROM `codex_analysis.fact_survey_responses_clean`
JOIN `codex_analysis.dim_respondents`
  USING (RESPONDENT_ID)
WHERE AGE IN ('15-18', '19-30')
GROUP BY Packaging_preference
ORDER BY PREFERENCE_COUNT DESC;
# Among youth respondents aged 15–30, compact and portable cans remain the most preferred packaging option, followed by innovative bottle designs. The same ranking is observed in the overall respondent population, indicating that the packaging preference is consistent among youth and the wider respondent base.
