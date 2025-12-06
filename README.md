# Analysis of Job Advertisements in Italy and their Trends Between 2019 and 2023

## Introduction and Context

Over the past decade, we have been witnessing a radical transformation of the labor market, mainly driven by technological progress, globalization, demographic changes, and the ecological transition. These factors are reshaping production processes and imposing new modalities and characteristics on both labor demand and supply. The effects are evident: (i) labor demand and supply are increasingly disseminated through digital platforms and the web; (ii) new professional profiles are emerging, and the skill requirements for existing ones are changing (for example, there is a significant increase in digital skills even for occupations that are not directly technology-related); (iii) the speed at which these phenomena affect labor market dynamics requires continuous updating and the ability to capture distinctive factors in “real time,” in order to support decision-making for institutions, organizations, and individuals.

Labour Market Intelligence (LMI) As already happening in other contexts, Big Data and Artificial Intelligence are playing a key role in analyzing and understanding these changes, providing a unique opportunity to observe how skill and occupational demand is evolving. The main objective is to enhance the understanding of these phenomena and support stakeholders in using data to improve policy design and strategic decision-making.

This is the framework of the present exercise, focused on the analysis of Big Data related to the labor market. Specifically, we analyze the labor demand expressed through job postings published on the Web— also known as **online job advertisements (OJAs)** — in Italy for the years 2019 and 2023, with the aim of:

1.  Understanding the dynamics of labor demand in terms of occupations and skills at different levels of granularity, analyzing the changes between 2019 and 2023;
2.  Estimating the impact of skill requirements (digital, professional, and transversal/soft skills) in online labor demand, identifying the most important skills and their relevance;
3.  Estimating the degree of horizontal and vertical skill overlap across occupations;
4.  Estimating the degree of novelty — in terms of skill relevance — in Italian labor demand, by comparing the skills requested in 2019 with those in 2023;
5.  Comparing occupations based on their required skills.

Below are the internal and external stakeholders potentially interested in these analyses:

-   Workers

-   Analysts (private and public institutions)

-   Corporate HR departments

-   Public and private employment services

-   Head hunters

-   Educational institutions and vocational training organizations

-   Policy makers

For our analyses, we selected only job postings belonging to ESCO groups 1 to 4, which cover the majority of job offers and typically involve a broader variety of skills.

ESCO (the standard taxonomy of the European Community) groups occupations into 10 broad categories at what is known as the first classification level:

-   0: Armed Forces

-   1: Managers

-   2: Professionals

-   3: Technicians and Associate Professionals

-   4: Clerical Support Workers

-   5: Service and Sales Workers

-   6: Skilled Agricultural, Forestry and Fishery Workers

-   7: Craft and Related Trades Workers

-   8: Plant and Machine Operators and Assemblers

-   9: Elementary Occupations

## Part 1: Job Advertisement Trends

The data in the file **oja_trend.xlsx** come from a source containing job advertisements published in Italy in 2019 and 2023. Each posting is associated with an occupation classified according to ESCO (European Skills, Competences, Qualifications and Occupations), the official EU taxonomy for occupations, skills, and qualifications.

From these, only job postings corresponding to occupations with at least 1,000 total ads (combined across 2019 and 2023) were selected. In addition, as previously mentioned, only postings from ESCO groups 1, 2, 3, and 4 were included. In total, we selected approximately 1.49 million postings for 2019 and 1.57 million for 2023, while the occupations represented amount to 162 out of 421.

The file oja_trend.xlsx reports, for each of the 162 selected occupations, the number of postings published in 2019 and 2023.

Potential questions (and associated stakeholders):

1.  Which occupations experienced the largest increase (or decrease) in the number of postings?
2.  Which occupations registered the highest percentage growth (or decline)?

## Part 2: Skill Requirement Analysis

Each job posting is associated with required skills classified according to ESCO. The total number of distinct skills requested in Italy is 499 for 2019 and 538 for 2023. A selection of postings similar to Part 1 was performed.

As mentioned, for this analysis we selected only postings from ESCO groups 1 to 4. For each of the four groups, we selected the twelve occupations with the highest number of postings.

For each of these occupations, 100 random postings from 2019 and 100 from 2023 were selected. In the Excel file **oja_skills**, the data worksheet contains all 9,600 postings selected. For each posting, the following fields are available:

-   esco_level1: name of the first-level ESCO occupation group

-   esco_level4: name of the fourth-level ESCO occupation

-   general_id: unique posting ID

-   escoskill_level_3: name of the skill at ESCO level 3

-   idesco_level_4: ESCO level 4 occupation code

-   areaprof_aggregato: name of the related professional area

-   skill_type: type of skill

-   year: year of posting

## Potential questions

### First-level ESCO analysis

1.1. How are the four groups characterized in terms of transversal, professional, and digital skills? 1.2. What are the most requested skills for each of the four groups?

### Skill trends

2.1. Which skills showed the largest increase (or decrease) in the number of postings? 2.2. Which skills showed the highest percentage growth (or decline)?

### Fourth-level ESCO analysis

3.1. What are the top 3 most important skills for each occupation (fourth level)? Comment on the results.

### Single-occupation analysis

4.1. What are the most important skills for Statistical, finance and insurance clerks (ESCO level 4 code 4312)? Which skills changed the most between 2019 and 2023?

### Relevant skills

5.1. What are the most relevant skills for the occupations Statistical, finance and insurance clerks (ESCO 4312) and Finance managers (ESCO 1211)?
