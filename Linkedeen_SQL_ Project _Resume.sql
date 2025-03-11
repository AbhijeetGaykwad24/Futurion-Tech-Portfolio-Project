CREATE DATABASE lung_cancer;
Use lung_cancer;

select * from  lung_cancer_analysis;

-- Basic Level Question & Answer

-- 1.Retrieve all records for individuals diagnosed with lung cancer
SELECT * FROM  lung_cancer_analysis
WHERE Lung_Cancer_Diagnosis = 'Yes';

-- 2.Count the number of smokers and non-smokers
SELECT Smoker, COUNT(*) AS Count
FROM  lung_cancer_analysis
GROUP BY Smoker;

-- 3.List all unique cancer stages present in the dataset
SELECT DISTINCT Cancer_Stage
FROM  lung_cancer_analysis;

-- 4. Retrieve the average number of cigarettes smoked per day by smokers
SELECT AVG(Cigarettes_per_Day) AS Avg_Cigarettes_Per_Day
FROM lung_cancer_analysis
WHERE Smoker = 'Yes';

-- 5.Count the number of people exposed to high air pollution
SELECT COUNT(*) AS Count
FROM lung_cancer_analysis
WHERE Air_Pollution_Exposure = 'High';


-- 6. Find the top 5 countries with the highest lung cancer deaths
SELECT Country, SUM(Annual_Lung_Cancer_Deaths) AS Total_Deaths
FROM lung_cancer_analysis
GROUP BY Country
ORDER BY Total_Deaths DESC
LIMIT 5;

-- 7.Count the number of people diagnosed with lung cancer by gender
SELECT Gender, COUNT(*) AS Count
FROM lung_cancer_analysis
WHERE Lung_Cancer_Diagnosis = 'Yes'
GROUP BY Gender;

-- 8.Retrieve records of individuals older than 60 who are diagnosed with lung cancer
SELECT * FROM lung_cancer_analysis  
WHERE Age > 60 AND Lung_Cancer_Diagnosis = 'Yes';


-- Intermediate Level Question & Answer

-- 1.Find the percentage of smokers who developed lung cancer
SELECT 
    (COUNT(CASE WHEN Lung_Cancer_Diagnosis = 'Yes' THEN 1 END) * 100.0 / COUNT(*)) AS Percentage_Smokers_Lung_Cancer
FROM lung_cancer_analysis
WHERE Smoker = 'Yes';

-- 2. Calculate the average survival years based on cancer stages
SELECT Cancer_Stage, AVG(Survival_Years) AS Avg_Survival_Years
FROM lung_cancer_analysis 
GROUP BY Cancer_Stage;

-- 3.Count the number of lung cancer patients based on passive smoking
SELECT Passive_Smoker, COUNT(*) AS Count
FROM lung_cancer_analysis
WHERE Lung_Cancer_Diagnosis = 'Yes'
GROUP BY Passive_Smoker;

-- 4. Find the country with the highest lung cancer prevalence rate
SELECT Country, MAX(Lung_Cancer_Prevalence_Rate) AS Max_Prevalence
FROM lung_cancer_analysis
GROUP BY Country;

-- 5.Identify the smoking years' impact on lung cancer
SELECT Years_of_Smoking, COUNT(*) AS Lung_Cancer_Count
FROM lung_cancer_analysis 
WHERE Lung_Cancer_Diagnosis = 'Yes'
GROUP BY Years_of_Smoking
ORDER BY Years_of_Smoking;

-- 6.Determine the mortality rate for patients with and without early detection
SELECT Early_Detection, AVG(Mortality_Rate) AS Avg_Mortality_Rate
FROM lung_cancer_analysis
GROUP BY Early_Detection;

-- 7.Group the lung cancer prevalence rate by developed vs. developing countries
SELECT Developed_or_Developing, AVG(Lung_Cancer_Prevalence_Rate) AS Avg_Prevalence_Rate
FROM lung_cancer_analysis   
GROUP BY Developed_or_Developing;


-- Advanced Level Question & Answer

-- 1.Identify the correlation between lung cancer prevalence and air pollution levels
SELECT Air_Pollution_Exposure, AVG(Lung_Cancer_Prevalence_Rate) AS Avg_Prevalence
FROM lung_cancer_analysis   
GROUP BY Air_Pollution_Exposure;

-- 2.Find the average age of lung cancer patients for each country
SELECT Country, AVG(Age) AS Avg_Age
FROM lung_cancer_analysis
WHERE Lung_Cancer_Diagnosis = 'Yes'
GROUP BY Country;

-- 3.Calculate the risk factor of lung cancer by smoker status, passive smoking, and family history
SELECT Smoker, Passive_Smoker, Family_History, COUNT(*) AS Risk_Factor
FROM lung_cancer_analysis
WHERE Lung_Cancer_Diagnosis = 'Yes'
GROUP BY Smoker, Passive_Smoker, Family_History;

-- 4. Rank countries based on their mortality rate
SELECT Country, AVG(Mortality_Rate) AS Avg_Mortality_Rate
FROM lung_cancer_analysis
GROUP BY Country
ORDER BY Avg_Mortality_Rate DESC;

-- 5.Determine if treatment type has a significant impact on survival years
SELECT Treatment_Type, AVG(Survival_Years) AS Avg_Survival_Years
FROM lung_cancer_analysis
GROUP BY Treatment_Type;

-- 6.Compare lung cancer prevalence in men vs. women across countries
SELECT Country, Gender, AVG(Lung_Cancer_Prevalence_Rate) AS Avg_Prevalence
FROM lung_cancer_analysis
WHERE Lung_Cancer_Diagnosis = 'Yes'
GROUP BY Country, Gender;

-- 7.Find how occupational exposure, smoking, and air pollution collectively impact lung cancer rates
SELECT Occupational_Exposure, Smoker, Air_Pollution_Exposure, COUNT(*) AS Lung_Cancer_Count
FROM lung_cancer_analysis 
WHERE Lung_Cancer_Diagnosis = 'Yes'
GROUP BY Occupational_Exposure, Smoker, Air_Pollution_Exposure;

-- 8.Analyze the impact of early detection on survival years
SELECT Early_Detection, AVG(Survival_Years) AS Avg_Survival_Years
FROM  lung_cancer_analysis
WHERE Lung_Cancer_Diagnosis = 'Yes'
GROUP BY Early_Detection;




 




