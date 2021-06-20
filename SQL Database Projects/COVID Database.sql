--SELECT *
--FROM COVID..['COVID deaths]
--ORDER BY 3,4

--SELECT *
--FROM COVID..['COVID Vaccinations]
--ORDER BY 3,4

--SELECT data for use

SELECT Location, date, total_cases, new_cases, total_deaths, population
FROM COVID..['COVID deaths]
ORDER BY 1,2

-- COVID in the UK
SELECT *, (total_deaths/total_cases)*100 as DeathPercentage, (total_cases/population)*100 as infection_rate_percentage
FROM COVID..['COVID deaths]
WHERE location like '%United Kingdom%'


-- Death rate per case (%)
-- Likelihood of death if contracted

SELECT Location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
FROM COVID..['COVID deaths]
Where location like '%united kingdom%'
ORDER BY 1,2


-- Looking at total cases vs population

SELECT Location, date, total_cases, population, (total_cases/population)*100 as infection_rate_percentage
FROM COVID..['COVID deaths]
Where location like '%united kingdom%'
ORDER BY 1,2


-- Countires with highest infection rate compared to population

SELECT Location, population, MAX(total_cases) as HighestInfectionCount, MAX((total_cases/population))*100 as PercentofPopInfected
FROM COVID..['COVID deaths]
GROUP BY Location, Population
ORDER BY PercentofPopInfected desc


-- Countries with highest death rate

SELECT Location, MAX(cast(total_deaths as int)) as TotalDeathCount
FROM COVID..['COVID deaths]
WHERE continent is not null
GROUP BY Location
ORDER BY TotalDeathCount desc


-- Continents with highest death rate

SELECT location, MAX(cast(total_deaths as int)) as TotalDeathCount
FROM COVID..['COVID deaths]
WHERE continent is null
GROUP BY location
ORDER BY TotalDeathCount desc


-- Global cases to-date
-- using 'new_cases' which sums up to the current total cases
-- Grouped by date

SELECT date, SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths,  SUM(cast(new_deaths as int))/SUM(new_cases)*100 as DeathPercentage
FROM COVID..['COVID deaths]
WHERE continent is not null
GROUP BY date
ORDER BY 1,2


-- Total cases (without date)

SELECT SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths,  SUM(cast(new_deaths as int))/SUM(new_cases)*100 as DeathPercentage
FROM COVID..['COVID deaths]
WHERE continent is not null
ORDER BY 1,2




-- Population vaccinated
-- Common Table Expression (CTE)
-- Total Vaccinations, Percentage of Population Vaccinated by country and continent

with PopvsVac (continent, location, date, population, new_vaccinations, TotalVaccinatedToDate)
as 
(
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
SUM(cast(vac.new_vaccinations as int)) OVER (Partition by dea.location ORDER BY dea.location, dea.date)
as TotalVaccinatedToDate
FROM COVID..['COVID deaths] dea
JOIN COVID..['COVID Vaccinations] vac
ON dea.location = vac.location
AND dea.date = vac.date
WHERE dea.continent is not null
)
SELECT *, (TotalVaccinatedToDate/Population)*100 as PercentageOfPop
FROM PopvsVac


-- Temp Table, (can edit - dropped if already exists and replaces)

DROP TABLE if exists #PercentPopulationVaccinated
CREATE TABLE #PercentPopulationVaccinated
(
Continent nvarchar(255),
location nvarchar(255),
date datetime,
population numeric,
new_vaccinations numeric,
TotalVaccinatedToDate numeric
)

INSERT INTO #PercentPopulationVaccinated
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
SUM(cast(vac.new_vaccinations as int)) OVER (Partition by dea.location ORDER BY dea.location, dea.date)
as TotalVaccinatedToDate
FROM COVID..['COVID deaths] dea
JOIN COVID..['COVID Vaccinations] vac
ON dea.location = vac.location
AND dea.date = vac.date
WHERE dea.continent is not null

SELECT *, (TotalVaccinatedToDate/Population)*100 as PercentageOfPop
FROM #PercentPopulationVaccinated



-- View created for later visualizations

CREATE VIEW PercentPopulationVaccinated as
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
SUM(cast(vac.new_vaccinations as int)) OVER (Partition by dea.location ORDER BY dea.location, dea.date)
as TotalVaccinatedToDate
FROM COVID..['COVID deaths] dea
JOIN COVID..['COVID Vaccinations] vac
ON dea.location = vac.location
AND dea.date = vac.date
WHERE dea.continent is not null