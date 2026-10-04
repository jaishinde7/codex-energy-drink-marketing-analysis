-- Product Development
-- a. Which area of business should we focus more on our product development? (Branding/taste/availability)
SELECT
  Reasons_for_choosing_brands,
  COUNT(*) AS TOTAL,
  ROUND(
    COUNT(*)
      / (
        SELECT COUNTIF(Current_brands = 'CodeX')
        FROM `codex_analysis.fact_survey_responses_clean`
      )
      * 100,
    2) AS PCT
FROM `codex_analysis.fact_survey_responses_clean`
WHERE Current_brands = 'CodeX'
GROUP BY Reasons_for_choosing_brands
ORDER BY TOTAL DESC;
# Among existing CodeX users, brand reputation is the most frequently reported reason for choosing a brand, with 146 respondents (30.10%), followed by taste/flavor preference (19.59%) and availability (19.18%). Among the three areas specified in the question, branding therefore has the highest reported importance.

SELECT
  Reasons_for_choosing_brands,
  COUNT(*) AS TOTAL,
  ROUND(
    COUNT(*)
      / (
        SELECT COUNTIF(Current_brands = 'CodeX')
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
WHERE Current_brands = 'CodeX' AND Age IN ('15-18', '19-30')
GROUP BY Reasons_for_choosing_brands
ORDER BY TOTAL DESC;
# Among CodeX users aged 15–30, the results are identical to the overall CodeX-user population. Brand reputation remains the leading factor at 30.10%, followed by taste/flavor preference at 19.59% and availability at 19.18%. This indicates that the relative importance of these three factors is consistent between the overall CodeX-user population and the identified youth segment.

-- CONCLUSION
# Brand reputation is the strongest of the three specified areas—branding, taste and availability—for both CodeX users overall and the 15–30 CodeX-user segment. Taste/flavor and availability are closely matched, with taste slightly ahead. The identical results across both groups indicate that the ranking of these factors is consistent across the surveyed CodeX users and the youth segment.
