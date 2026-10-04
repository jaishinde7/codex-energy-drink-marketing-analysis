# Primary Insights (Sample Sections / Questions)
# 1. Who prefers energy drink more?

SELECT DR.Gender, COUNT(*)
FROM `codex_analysis.fact_survey_responses_clean` AS FS
JOIN `codex_analysis.dim_respondents` AS DR
  ON FS.Respondent_ID = DR.Respondent_ID
WHERE FS.General_perception = 'Dangerous' AND FS.Consume_frequency = 'Rarely'
GROUP BY DR.Gender;
# PEOPLE WHOSE GENERAL PERCEPTION OF ENERGY DRINK IS DANGEROUS AND DRINK RARELY ARE JUST 150, 134, 17 CORRESPONDING TO MALE, FEMALE AND NON-BINARY RESPECTIVELY.

SELECT DR.Gender, COUNT(*)
FROM `codex_analysis.fact_survey_responses_clean` AS FS
JOIN `codex_analysis.dim_respondents` AS DR
  ON FS.Respondent_ID = DR.Respondent_ID
WHERE FS.General_perception = 'Dangerous' AND FS.Consume_frequency <> 'Rarely'
GROUP BY DR.Gender;
# PEOPLE WHOSE GENERAL PERCEPTION OF ENERGY DRINK IS DANGEROUS BUT DON'T DRINK RARELY ARE JUST 598, 630, 52 CORRESPONDING TO MALE, FEMALE AND NON-BINARY RESPECTIVELY.

SELECT DR.Gender, COUNT(*)
FROM `codex_analysis.fact_survey_responses_clean` AS FS
JOIN `codex_analysis.dim_respondents` AS DR
  ON FS.Respondent_ID = DR.Respondent_ID
WHERE FS.General_perception IN ('Effective', 'Healthy', 'Not sure')
GROUP BY DR.Gender;
# PEOPLE WHOSE GENERAL PERCEPTION OF ENERGY DRINK EITHER EFFECTIVE, HEALTHY OR NOT SURE ARE 3461, 1771, 332 CORRESPONDING TO MALE, FEMALE AND NON-BINARY RESPECTIVELY.

SELECT DISTINCT (General_perception)
FROM `codex_analysis.fact_survey_responses_clean`;
# PEOPLE'S GENERAL PERCEPTION CONCERNING THE ENERGY DRINK IS EITHER EFFECTIVE, HEALTHY, DANGEROUS OR NOT SURE.

SELECT DISTINCT (Consume_frequency)
FROM `codex_analysis.fact_survey_responses_clean`;
# PEOPLE CONSUME ENERGY DRINKS EITHER 2-3 TIMES A WEEK OR MONTH, ONCE A WEEK, DAILY OR RARELY.

# THUS, WE WILL COUNT THE RESPONDENT WHO DON'T THINK ENERGY DRINK DANGEROUS AND DO NOT DRINK IT RARELY TO DEMONSTRATE THE PREFERENCE BASED ON GENDER.
SELECT DR.Gender, COUNT(*) AS ENERGY_DRINK_PREFERENCE_COUNT
FROM `codex_analysis.fact_survey_responses_clean` AS FS
JOIN `codex_analysis.dim_respondents` AS DR
  ON FS.Respondent_ID = DR.Respondent_ID
WHERE
  FS.General_perception IN ('Effective', 'Healthy', 'Not sure')
  AND FS.Consume_frequency <> 'Rarely'
GROUP BY DR.Gender;
# 2851 MALES AND 1450 FEMALES PREFER ENERGY DRINK WHILE 276 NON-BINARY PEOPLE PREFER ENERGY DRINK. EVIDENTLY, MALES PREFERS ENERGY DRINK MORE THAN OTHERS.

SELECT
  DR.Gender,
  COUNT(*) AS total_respondents,
  COUNTIF(
    FS.General_perception IN ('Effective', 'Healthy', 'Not sure')
    AND FS.Consume_frequency <> 'Rarely') AS preference_count,
  ROUND(
    SAFE_DIVIDE(
      COUNTIF(
        FS.General_perception IN ('Effective', 'Healthy', 'Not sure')
        AND FS.Consume_frequency <> 'Rarely'),
      COUNT(*))
      * 100,
    2) AS preference_pct
FROM `codex_analysis.fact_survey_responses_clean` AS FS
JOIN `codex_analysis.dim_respondents` AS DR
  ON FS.Respondent_ID = DR.Respondent_ID
GROUP BY DR.Gender
ORDER BY preference_pct DESC;

# Non-binary respondents have the highest preference rate: 68.83%.
# Male respondents are very close at 67.22%.
# Female respondents have the lowest preference rate at 57.93%.
# In absolute numbers, males have the largest number of respondents meeting the preference definition (2,851), but this is partly because there are substantially more male respondents in the cleaned dataset.

-- Which age group prefers energy drinks more?
SELECT
  DR.Age,
  COUNT(*) AS total_respondents,
  COUNTIF(
    FS.General_perception IN ('Effective', 'Healthy', 'Not sure')
    AND FS.Consume_frequency <> 'Rarely') AS preference_count,
  ROUND(
    SAFE_DIVIDE(
      COUNTIF(
        FS.General_perception IN ('Effective', 'Healthy', 'Not sure')
        AND FS.Consume_frequency <> 'Rarely'),
      COUNT(*))
      * 100,
    2) AS preference_pct
FROM `codex_analysis.fact_survey_responses_clean` AS FS
JOIN `codex_analysis.dim_respondents` AS DR
  ON FS.Respondent_ID = DR.Respondent_ID
GROUP BY DR.Age
ORDER BY preference_pct DESC;
# 65+ has the highest preference rate (79.39%), but only 131 respondents, so we should be cautious about treating this as a major target segment.
# 15–18 follows very closely at 78.57%, with 1,064 respondents.
# 19–30 has 71.84%, and importantly, it has the largest respondent base (3,946).
# 31–45 and 46–65 show substantially lower preference rates.

SELECT DR.AGE, COUNT(*) AS PREFERENCE
FROM `codex_analysis.fact_survey_responses_clean` AS FS
JOIN `codex_analysis.dim_respondents` AS DR
  ON FS.Respondent_ID = DR.Respondent_ID
WHERE FS.General_perception = 'Dangerous' AND FS.Consume_frequency = 'Rarely'
GROUP BY DR.AGE;
# Respondents aged 31–45 have the highest number of people who perceive energy drinks as dangerous and consume them rarely (171), followed by the 19–30 group (92). The 65+ group has only 1 respondent in this category. This indicates that negative perception combined with low consumption is more prevalent among the 31–45 age group.

SELECT DR.AGE, COUNT(*) AS PREFERENCE
FROM `codex_analysis.fact_survey_responses_clean` AS FS
JOIN `codex_analysis.dim_respondents` AS DR
  ON FS.Respondent_ID = DR.Respondent_ID
WHERE FS.General_perception = 'Dangerous' AND FS.Consume_frequency <> 'Rarely'
GROUP BY DR.Age;
# The 31–45 age group has the highest number of respondents (721) who perceive energy drinks as dangerous but still consume them more frequently than rarely. This is followed by the 19–30 group (383). This suggests that a negative perception of energy drinks does not necessarily prevent consumption, particularly among the 31–45 and 19–30 groups.

SELECT DR.AGE, COUNT(*) AS PREFERENCE
FROM `codex_analysis.fact_survey_responses_clean` AS FS
JOIN `codex_analysis.dim_respondents` AS DR
  ON FS.Respondent_ID = DR.Respondent_ID
WHERE FS.General_perception IN ('Effective', 'Healthy', 'Not sure')
GROUP BY DR.AGE;
# The 19–30 age group has the highest number of respondents (3,471) who perceive energy drinks as effective, healthy, or are unsure about them, followed by the 15–18 group (1,002). Since these groups also have substantial respondent populations, they provide a large base of consumers with relatively favorable or non-negative perceptions of energy drinks.

-- INSIGHTS
# The 65+ age group has the highest preference rate (79.39%), closely followed by 15–18 (78.57%). However, 19–30 represents the largest high-preference segment, with 2,835 respondents and a preference rate of 71.84%. Therefore, 19–30 represents the largest potential consumer segment in the survey, while 15–18 is another important high-preference segment.

-- Which type of marketing reaches the most Youth (15-30)?
SELECT
  CASE
    WHEN DR.Age IN ('15-18', '19-30') THEN 'YOUTH'
    END AS YOUTH,
  COUNT(*) AS TOTAL,
  COUNT(
    CASE
      WHEN FS.Marketing_channels = 'TV commercials' THEN 1
      END) AS TV_COMMERCIALS,
  COUNT(
    CASE
      WHEN FS.Marketing_channels = 'Online ads' THEN 1
      END) AS Online_ads,
  COUNT(
    CASE
      WHEN FS.Marketing_channels = 'Outdoor billboards' THEN 1
      END) AS Outdoor_billboards,
  COUNT(
    CASE
      WHEN FS.Marketing_channels = 'Print media' THEN 1
      END) AS Print_media,
  COUNT(CASE WHEN FS.Marketing_channels = 'Other' THEN 1 END) AS Other
FROM `codex_analysis.fact_survey_responses_clean` AS FS
JOIN `codex_analysis.dim_respondents` AS DR
  USING (RESPONDENT_ID)
WHERE DR.Age IN ('15-18', '19-30')
GROUP BY YOUTH;
# Online ads are the most effective marketing channel for reaching Youth (15–30), reaching 2,324 out of 5,010 youth respondents. TV commercials are the second-largest channel with 1,433 respondents, while outdoor billboards, other channels, and print media reach considerably fewer respondents. This indicates that online advertising has the strongest reach among the surveyed youth audience.
