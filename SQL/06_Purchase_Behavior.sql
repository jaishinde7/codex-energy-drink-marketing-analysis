-- Purchase Behavior
-- a. Where do respondents prefer to purchase energy drinks?

SELECT
  Purchase_location,
  COUNT(*) AS PURCHASE_COUNT,
  ROUND(
    COUNT(*)
      / (SELECT COUNT(*) FROM `codex_analysis.fact_survey_responses_clean`)
      * 100,
    2) AS PCT
FROM `codex_analysis.fact_survey_responses_clean`
JOIN `codex_analysis.dim_respondents`
  USING (RESPONDENT_ID)
GROUP BY Purchase_location
ORDER BY PURCHASE_COUNT DESC;
# Supermarkets are the most preferred purchase location, selected by 3,214 respondents (44.98%), followed by online retailers with 1,792 (25.08%) and gyms and fitness centers with 1,056 (14.78%). Local stores and other locations account for smaller shares.

SELECT
  Purchase_location,
  COUNT(*) AS PURCHASE_COUNT,
  ROUND(
    COUNT(*)
      / (
        SELECT COUNT(*)
        FROM `codex_analysis.fact_survey_responses_clean`
        JOIN `codex_analysis.dim_respondents`
          USING (RESPONDENT_ID)
        WHERE Age IN ('15-18', '19-30')
      )
      * 100,
    2) AS PCT
FROM `codex_analysis.fact_survey_responses_clean`
JOIN `codex_analysis.dim_respondents`
  USING (RESPONDENT_ID)
WHERE Age IN ('15-18', '19-30')
GROUP BY Purchase_location
ORDER BY PURCHASE_COUNT DESC;
# Among respondents aged 15–30, supermarkets remain the most preferred purchase location at 2,251 respondents (44.93%), followed by online retailers at 1,256 (25.07%) and gyms and fitness centers at 752 (15.01%). The ranking is almost identical to the overall respondent group.

-- CONCLUSION
# Supermarkets are the dominant purchase location among both the overall respondent population and the youth segment, accounting for approximately 45% in both groups. Online retailers rank second at approximately 25%, while gyms and fitness centers rank third. This consistency suggests that the preferred purchase locations of the youth segment closely resemble those of the wider respondent population.

-- b. What are the typical consumption situations for energy drinks among respondents?
SELECT Typical_consumption_situations, COUNT(*) AS COUNT
FROM `codex_analysis.fact_survey_responses_clean`
GROUP BY Typical_consumption_situations
ORDER BY COUNT DESC;
# Sports and exercise is the most common consumption situation, reported by 3,198 respondents, followed by studying or working late with 2,318 respondents. Social outings/parties account for 1,052 responses, while driving/commuting and other situations are reported less frequently.

SELECT Typical_consumption_situations, COUNT(*) AS COUNT
FROM `codex_analysis.fact_survey_responses_clean`
JOIN `codex_analysis.dim_respondents`
  USING (RESPONDENT_ID)
WHERE Age IN ('15-18', '19-30')
GROUP BY Typical_consumption_situations
ORDER BY COUNT DESC;
# Among respondents aged 15–30, sports and exercise remains the leading consumption situation, with 2,242 respondents, followed by studying or working late with 1,652 and social outings/parties with 716. The ranking is consistent with the overall respondent population.

-- CONCLUSION
# Sports/exercise and studying/working late are the two most common consumption situations among both the overall and youth populations. These situations therefore represent the most prominent consumption occasions identified in the survey.

-- c. What factors influence respondents' purchase decisions, such as price range and limited edition packaging?
SELECT
  Price_range,
  COUNT(*) AS COUNT,
  COUNTIF(Limited_edition_packaging = 'Yes') AS Y_LIMITED_EDT_PACK,
  COUNTIF(Limited_edition_packaging = 'No') AS N_LIMITED_EDT_PACK
FROM `codex_analysis.fact_survey_responses_clean`
GROUP BY Price_range
ORDER BY COUNT DESC;
# The ₹50–99 price range is the most selected price range, with 3,051 respondents, followed by ₹100–150 with 2,225. Within the ₹50–99 group, 1,220 respondents selected "Yes" for limited-edition packaging compared with 1,199 selecting "No", showing a nearly even split. The ₹100–150 group also shows a similarly balanced response.

SELECT
  Price_range,
  COUNT(*) AS COUNT,
  COUNTIF(Limited_edition_packaging = 'Yes') AS Y_LIMITED_EDT_PACK,
  COUNTIF(Limited_edition_packaging = 'No') AS N_LIMITED_EDT_PACK
FROM `codex_analysis.fact_survey_responses_clean`
JOIN `codex_analysis.dim_respondents`
  USING (RESPONDENT_ID)
WHERE Age IN ('15-18', '19-30')
GROUP BY Price_range
ORDER BY COUNT DESC;
# Among respondents aged 15–30, ₹50–99 is again the most selected price range, with 2,578 respondents, followed by ₹100–150 with 1,230. In the ₹50–99 range, 1,046 respondents selected "Yes" for limited-edition packaging compared with 1,012 selecting "No", again showing a relatively balanced response.

-- CONCLUSION
# The ₹50–99 price range is the most commonly selected price range for both the overall respondent population and the youth segment. However, responses to limited-edition packaging are relatively balanced between "Yes" and "No" across the price ranges, suggesting that limited-edition packaging does not show a clear preference in this analysis.
