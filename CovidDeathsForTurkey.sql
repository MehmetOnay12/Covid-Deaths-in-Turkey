--First look for data

Select *
From SQLProject..Covid

-- Selecting Turkey

Select *
From SQLProject..Covid
Where location  like '%Turkey%'


-- Sorting by date

Select *
From SQLProject..Covid
Where location  like '%Turkey%'
Order by date

-- Changing data type for don't get error

Alter Table SQLProject..Covid
Alter Column total_cases numeric;

Alter Table SQLProject..Covid
Alter Column total_deaths numeric;

-- Calculating Death percentage 

Select location,date,total_cases,total_deaths,(total_deaths/total_cases) *100 As Deathpercentage
From SQLProject..Covid
Where location  like '%Turkey%'
Order by date

-- Removing Nulls

Select location,date,total_cases,total_deaths,(total_deaths/total_cases) *100 As Deathpercentage
From SQLProject..Covid
Where location  like '%Turkey%' and total_deaths is not null
Order by date

-- Looking population

Select location,date,population
From SQLProject..Covid
Where location  like '%Turkey%' and total_cases is not null
Order by date

-- What percentage of the population got covid

Select location,date,total_cases,population,(total_cases/population) *100 As PercentageofInfected
From SQLProject..Covid
Where location  like '%Turkey%' and total_deaths is not null
Order by date

-- What date has the highest percentage of covid

Select location,date,total_cases ,population,(total_cases/population) *100 As PercentageofInfected
From SQLProject..Covid
Where location  like '%Turkey%' and total_deaths is not null
Group by location, date,total_cases, population
Order by PercentageofInfected desc






