-- Consumer Preferences:
-- a. Who are the current market leaders?

-- OVERALL MARKET PRESENCE
SELECT Current_brands, COUNT(*) AS TOTAL
FROM `codex_analysis.fact_survey_responses_clean`
GROUP BY Current_brands
ORDER BY TOTAL DESC;
# Cola-Coka has the highest number of respondents reporting it as their current brand, followed by Bepsi and Gangster. CodeX ranks fifth among the listed brands, behind Blue Bull.

-- NON-NEGATIVE/ACTIVE CONSUMER
SELECT Current_brands, COUNT(*) AS TOTAL
FROM `codex_analysis.fact_survey_responses_clean`
WHERE General_perception <> 'Dangerous' AND Consume_frequency <> 'Rarely'
GROUP BY Current_brands
ORDER BY TOTAL DESC;
# Among respondents who do not perceive energy drinks as dangerous and consume them more frequently than rarely, Cola-Coka, Bepsi and Gangster remain the three leading brands. CodeX remains behind these three competitors and Blue Bull.

-- YOUTH SEGMENT
SELECT Current_brands, COUNT(*) AS YOUTH_PREFERENCE
FROM `codex_analysis.fact_survey_responses_clean`
JOIN `codex_analysis.dim_respondents`
  USING (RESPONDENT_ID)
WHERE
  General_perception <> 'Dangerous'
  AND Consume_frequency <> 'Rarely'
  AND Age IN ('15-18', '19-30')
GROUP BY Current_brands
ORDER BY YOUTH_PREFERENCE DESC;
# Within the youth segment (15–30), Cola-Coka, Bepsi and Gangster remain the leading brands, while CodeX ranks fifth. The consistency of the brand ranking across the overall, active/non-negative and youth segments suggests that CodeX faces the same major competitors across these groups.

-- CONCLUSION
# Among youth respondents (15–30) who do not perceive energy drinks as dangerous and consume them more frequently than rarely, Cola-Coka, Bepsi and Gangster have the highest reported brand presence. CodeX ranks fifth, indicating that these three brands represent the primary competitive set within the identified youth segment.

-- b. What are the primary reasons consumers prefer those brands over ours?

SELECT Reasons_for_choosing_brands, COUNT(*) AS PREFERRED_OVER_CODEX
FROM `codex_analysis.fact_survey_responses_clean`
WHERE Current_brands IN ('Cola-Coka', 'Bepsi', 'Gangster')
GROUP BY Reasons_for_choosing_brands
ORDER BY PREFERRED_OVER_CODEX DESC;
# Brand reputation is the leading reason respondents choose Cola-Coka, Bepsi and Gangster, followed by taste/flavor preference and availability.

SELECT Reasons_for_choosing_brands, COUNT(*) AS PREFERRED_OVER_CODEX
FROM `codex_analysis.fact_survey_responses_clean`
WHERE
  Current_brands IN ('Cola-Coka', 'Bepsi', 'Gangster')
  AND Brand_perception IN ('Positive', 'Neutral')
GROUP BY Reasons_for_choosing_brands
ORDER BY PREFERRED_OVER_CODEX DESC;
# Among respondents with positive or neutral brand perceptions, brand reputation remains the primary reason for choosing the three leading competitor brands, followed by taste/flavor and availability.

SELECT Reasons_for_choosing_brands, COUNT(*) AS PREFERRED_OVER_CODEX
FROM `codex_analysis.fact_survey_responses_clean`
JOIN `codex_analysis.dim_respondents`
  USING (RESPONDENT_ID)
WHERE
  Current_brands IN ('Cola-Coka', 'Bepsi', 'Gangster')
  AND Brand_perception IN ('Positive', 'Neutral')
  AND Age IN ('15-18', '19-30')
GROUP BY Reasons_for_choosing_brands
ORDER BY PREFERRED_OVER_CODEX DESC;
# Among youth respondents (15–30) with positive or neutral perceptions of the leading competitor brands, brand reputation is the primary reason for choosing Cola-Coka, Bepsi and Gangster, followed by taste/flavor preference and availability.

-- CONCLUSION
# Among respondents who selected these competitor brands, brand reputation was the most frequently reported reason for choosing them.
