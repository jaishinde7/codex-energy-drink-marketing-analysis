-- Brand Penetration:
-- a. What do people think about our brand? (overall rating)

SELECT Brand_perception, COUNT(*) AS TOTAL
FROM `codex_analysis.fact_survey_responses_clean`
WHERE Current_brands = 'CodeX'
GROUP BY Brand_perception
ORDER BY TOTAL DESC;
# Among the 706 respondents who currently use CodeX, Neutral perception is the most common, with 405 respondents (57.37%), followed by Positive perception with 170 (24.08%) and Negative perception with 131 (18.56%). This indicates that the majority of existing CodeX users have a neutral rather than strongly positive or negative perception of the brand.

SELECT General_perception, COUNT(*) AS TOTAL
FROM `codex_analysis.fact_survey_responses_clean`
WHERE Current_brands = 'CodeX'
GROUP BY General_perception
ORDER BY TOTAL DESC;
# Among CodeX users, Effective is the most common general perception of energy drinks, with 203 respondents, followed by Not sure (183) and Healthy (165). Dangerous was selected by 155 respondents. This shows that perceptions of the energy-drink category among CodeX users are mixed, although effectiveness is the most frequently reported perception.

SELECT Consume_reason, COUNT(*) AS TOTAL
FROM `codex_analysis.fact_survey_responses_clean`
WHERE Current_brands = 'CodeX'
GROUP BY Consume_reason
ORDER BY TOTAL DESC;
# Increased energy and focus is the leading consumption reason among CodeX users, reported by 254 respondents, followed by combating fatigue (161) and boosting performance (126). This indicates that energy and performance-related benefits are the primary consumption motivations among CodeX users.

SELECT Reasons_preventing_trying, COUNT(*) AS TOTAL
FROM `codex_analysis.fact_survey_responses_clean`
WHERE Current_brands = 'CodeX'
GROUP BY Reasons_preventing_trying
ORDER BY TOTAL DESC;
# Among CodeX users, health concerns are the most frequently reported barrier, with 173 respondents, followed closely by local availability (167). Other notable barriers include lack of interest in energy drinks (146) and unfamiliarity with the brand (141).

SELECT Reasons_for_choosing_brands, COUNT(*) AS TOTAL
FROM `codex_analysis.fact_survey_responses_clean`
WHERE Current_brands = 'CodeX'
GROUP BY Reasons_for_choosing_brands
ORDER BY TOTAL DESC;
# Brand reputation is the most frequently reported reason for choosing a brand among CodeX users, with 203 respondents, followed by availability (136), taste/flavor preference (133) and effectiveness (121). This suggests that brand reputation and availability are particularly important factors in brand choice within the CodeX-user group.

SELECT Improvements_desired, COUNT(*) AS TOTAL
FROM `codex_analysis.fact_survey_responses_clean`
WHERE Current_brands = 'CodeX'
GROUP BY Improvements_desired
ORDER BY TOTAL DESC;
# Reduced sugar content is the most requested improvement among CodeX users, with 204 respondents, followed by more natural ingredients (172) and a wider range of flavors (158). This indicates demand for healthier product characteristics alongside greater flavor variety.

SELECT Ingredients_expected, COUNT(*) AS TOTAL
FROM `codex_analysis.fact_survey_responses_clean`
WHERE Current_brands = 'CodeX'
GROUP BY Ingredients_expected
ORDER BY TOTAL DESC;
# Caffeine is the most frequently expected ingredient among CodeX users, with 261 respondents, followed by vitamins (175), sugar (161) and guarana (109). Caffeine therefore remains the most prominent ingredient expectation among existing CodeX users.

-- CONCLUSION
# CodeX users most commonly have a neutral perception of the brand. Their primary consumption motivation is increased energy and focus, while brand reputation and availability are important brand-choice factors. At the same time, reduced sugar content and more natural ingredients are the most frequently requested improvements, indicating opportunities to strengthen the product's perceived health profile and brand positioning.

-- b. Which cities do we need to focus more on?

SELECT City_ID, TIER, City, COUNT(Respondent_ID) AS COUNT
FROM `codex_analysis.dim_cities`
JOIN `codex_analysis.dim_respondents`
  USING (CITY_ID)
GROUP BY City_ID, TIER, City
ORDER BY COUNT DESC;
# Bangalore has the largest respondent base, with 2,828 respondents, followed by Hyderabad (1,833), Mumbai (1,510), Chennai (937) and Pune (906). These cities account for the largest concentrations of respondents in the survey.

SELECT City_ID, TIER, City, COUNT(Respondent_ID) AS COUNT
FROM `codex_analysis.dim_cities`
JOIN `codex_analysis.dim_respondents`
  USING (CITY_ID)
WHERE Age IN ('15-18', '19-30')
GROUP BY City_ID, TIER, City
ORDER BY COUNT DESC;
# Among respondents aged 15–30, Bangalore again has the largest respondent base, with 1,980 respondents, followed by Hyderabad (1,279), Mumbai (1,082), Chennai (661) and Pune (624). These cities therefore contain the largest numbers of respondents within the identified youth segment.

SELECT
  DC.City,
  DC.Tier,
  COUNTIF(FS.Current_brands = 'CodeX') AS CodeX_users,
  COUNT(*) AS Total_respondents,
  ROUND(
    SAFE_DIVIDE(
      COUNTIF(FS.Current_brands = 'CodeX'),
      COUNT(*))
      * 100,
    2) AS CodeX_penetration_pct
FROM `codex_analysis.fact_survey_responses_clean` AS FS
JOIN `codex_analysis.dim_respondents` AS DR
  USING (Respondent_ID)
JOIN `codex_analysis.dim_cities` AS DC
  USING (City_ID)
GROUP BY DC.City, DC.Tier
ORDER BY CodeX_penetration_pct DESC;
# CodeX has the highest share among surveyed respondents in Bangalore (10.71%), followed closely by Ahmedabad (10.50%), Mumbai and Pune (10.16% each). Hyderabad has a 9.76% CodeX share, while Lucknow has the lowest at 3.55%. This shows that CodeX's presence varies across cities, with Bangalore, Ahmedabad, Mumbai and Pune having the highest surveyed penetration.

SELECT
  City_ID,
  Tier,
  City,
  COUNTIF(Brand_perception IN ('Neutral', 'Positive'))
    AS POSI_NEUTRAL_PERCEPTION,
  COUNT(*) AS CODEX_USERS,
  ROUND(
    SAFE_DIVIDE(
      COUNTIF(Brand_perception IN ('Neutral', 'Positive')),
      COUNT(*))
      * 100,
    2) AS POSI_NEUTRAL_PCT
FROM `codex_analysis.fact_survey_responses_clean`
JOIN `codex_analysis.dim_respondents`
  USING (RESPONDENT_ID)
JOIN `codex_analysis.dim_cities`
  USING (CITY_ID)
WHERE Current_brands = 'CodeX'
GROUP BY City_ID, Tier, City
ORDER BY POSI_NEUTRAL_PCT DESC;
# Among existing CodeX users, Chennai has the highest proportion of positive or neutral perception (88.24%), followed by Kolkata (88.00%), Mumbai (85.81%), Bangalore (84.27%) and Hyderabad (82.86%). Ahmedabad has the lowest proportion at 57.89%, despite having one of the higher CodeX penetration rates.

-- COMCLUSION
# The cities do not all present the same opportunity. Bangalore and Mumbai combine substantial respondent volume, relatively high CodeX penetration and strong positive/neutral perception. Ahmedabad has high CodeX penetration but comparatively weaker perception, while Chennai has the strongest perception despite lower penetration. Pune also has relatively high penetration but a lower positive/neutral perception than the leading cities.
