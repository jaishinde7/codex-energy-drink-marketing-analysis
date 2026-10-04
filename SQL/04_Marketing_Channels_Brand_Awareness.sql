-- Marketing Channels and Brand Awareness
-- a. Which marketing channel can be used to reach more customers?

SELECT
  Marketing_channels,
  COUNT(*) AS TOTAL_REACH,
  ROUND(
    COUNT(*)
      / (SELECT COUNT(*) FROM `codex_analysis.fact_survey_responses_clean`)
      * 100,
    2) AS TOTAL_REACH_PCT
FROM `codex_analysis.fact_survey_responses_clean` AS FS
JOIN `codex_analysis.dim_respondents` AS DR
  USING (RESPONDENT_ID)
GROUP BY Marketing_channels
ORDER BY TOTAL_REACH DESC;
# Online ads have the highest reported reach among the 7,145 clean respondents, with 2,838 respondents (39.72%) selecting it. TV commercials rank second with 2,139 respondents (29.94%), followed by outdoor billboards, other channels and print media.

SELECT
  Marketing_channels,
  COUNT(*) AS TOTAL_REACH,
  ROUND(
    COUNT(*)
      / (
        SELECT COUNT(*)
        FROM `codex_analysis.fact_survey_responses_clean`
        WHERE
          General_perception <> 'Dangerous' AND Consume_frequency <> 'Rarely'
      )
      * 100,
    2) AS TOTAL_REACH_PCT
FROM `codex_analysis.fact_survey_responses_clean` AS FS
JOIN `codex_analysis.dim_respondents` AS DR
  USING (RESPONDENT_ID)
WHERE General_perception <> 'Dangerous' AND Consume_frequency <> 'Rarely'
GROUP BY Marketing_channels
ORDER BY TOTAL_REACH DESC;
# Among respondents who do not perceive energy drinks as dangerous and consume them more frequently than rarely, online ads remain the highest-reach marketing channel, with 1,889 respondents (41.27%), followed by TV commercials at 1,406 (30.72%). The ranking remains unchanged from the overall population.

SELECT
  Marketing_channels,
  COUNT(*) AS TOTAL_REACH,
  ROUND(
    COUNT(*)
      / (
        SELECT COUNT(*)
        FROM `codex_analysis.fact_survey_responses_clean`
        JOIN `codex_analysis.dim_respondents` AS DR
          USING (RESPONDENT_ID)
        WHERE
          General_perception <> 'Dangerous'
          AND Consume_frequency <> 'Rarely'
          AND Age IN ('15-18', '19-30')
      )
      * 100,
    2) AS TOTAL_REACH_PCT
FROM `codex_analysis.fact_survey_responses_clean` AS FS
JOIN `codex_analysis.dim_respondents` AS DR
  USING (RESPONDENT_ID)
WHERE
  General_perception <> 'Dangerous'
  AND Consume_frequency <> 'Rarely'
  AND Age IN ('15-18', '19-30')
GROUP BY Marketing_channels
ORDER BY TOTAL_REACH DESC;
# Among youth respondents aged 15–30 who do not perceive energy drinks as dangerous and consume them more frequently than rarely, online ads have the highest reported reach, with 1,670 respondents (45.49%), followed by TV commercials at 1,099 (29.94%). Online ads therefore have an even higher share of reported reach within the identified youth segment.

-- CONCLUSION
# Online ads have the highest reported reach across all three respondent groups. Their share increases from 39.72% overall to 45.49% among the identified youth segment, making online advertising the most prominent channel for reaching the youth respondents in this survey.

-- b. How effective are different marketing strategies and channels in reaching our customers?

SELECT Packaging_preference, COUNT(*) AS COUNT
FROM `codex_analysis.fact_survey_responses_clean`
GROUP BY Packaging_preference
ORDER BY COUNT DESC;
# Compact and portable cans are the most preferred packaging option, with 2,877 respondents, followed by innovative bottle designs with 2,174. This indicates that portability and convenient packaging are important product characteristics to consider in marketing communication.

SELECT Purchase_location, COUNT(*) AS COUNT
FROM `codex_analysis.fact_survey_responses_clean`
GROUP BY Purchase_location
ORDER BY COUNT DESC;
# Supermarkets are the most preferred purchase location, with 3,214 respondents, followed by online retailers with 1,792. This suggests that supermarket availability and online retail presence could be important channels for converting consumer interest into purchases.

SELECT Price_range, COUNT(*) AS COUNT
FROM `codex_analysis.fact_survey_responses_clean`
GROUP BY Price_range
ORDER BY COUNT DESC;
# The ₹50–99 price range is the most preferred, with 3,051 respondents, followed by ₹100–150 with 2,225. This provides an indication of the price ranges that could be considered when developing pricing and promotional strategies.

SELECT Typical_consumption_situations, COUNT(*) AS COUNT
FROM `codex_analysis.fact_survey_responses_clean`
GROUP BY Typical_consumption_situations
ORDER BY COUNT DESC;
# Sports and exercise is the most common consumption situation, reported by 3,198 respondents, followed by studying or working late with 2,318. These situations provide potential contexts for marketing campaigns and product positioning.

SELECT Improvements_desired, COUNT(*) AS COUNT
FROM `codex_analysis.fact_survey_responses_clean`
GROUP BY Improvements_desired
ORDER BY COUNT DESC;
# Reduced sugar content is the most requested improvement, with 2,133 respondents, followed by more natural ingredients with 1,776 and a wider range of flavors with 1,459. These preferences can help shape product messaging and future product-development communication.

-- CONCLUSION
# The marketing strategy should combine online advertising with messaging centered on portability, sports/exercise and studying/working occasions, while highlighting reduced sugar and more natural ingredients. The ₹50–99 price range is the most preferred, and supermarkets followed by online retailers are the leading purchase locations.
