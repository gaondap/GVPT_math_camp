library(tidyverse)
library(gapminder)

filter(gapminder, country == "Australia", year > 2000)

filter(gapminder, continent %in% c("Asia", "Oceania"))

filter(gapminder, pop > 500000 & pop < 1000000)

filter(gapminder, pop > 500000 | pop < 1000000)

filter(gapminder, pop > 1e9)

filter(gapminder, continent %in% c("Oceania"))

filter(gapminder, continent %in% c("Asia", "Europe"))

filter(gapminder, lifeExp > 50 & lifeExp < 60)

filter(gapminder, lifeExp < 50 | lifeExp > 60)

arrange(gapminder, country, year)

arrange(gapminder, country, desc(year))

arrange(gapminder, lifeExp)

arrange(gapminder, desc(pop))

slice_min(gapminder, lifeExp)

slice_max(gapminder, pop)

select(gapminder, country, year, pop)

select(gapminder, country:pop)

select(gapminder, -(lifeExp:pop))

select(gapminder, country, year, lifeExp)

vars <- c("country", "year", "lifeExp")

select(gapminder, any_of(vars))

select(gapminder, starts_with("c"))

mutate(gapminder, gdp = gdpPercap * pop)

transmute(gapminder, country, year, gdp = gdpPercap * pop)

summarise(
  gapminder, avg_pop = mean(pop), avg_gdp_per_cap = mean(gdpPercap)
)

gapminder_continent <- group_by(gapminder, continent)

summarise(
  gapminder_continent, avg_pop = mean(pop), avg_gdp_per_cap = mean(gdpPercap)
)
)

mutate(gapminder, gdp = gdpPercap * pop)

gapminder_country <- group_by(gapminder, country)

gapminder_country_avg <- summarise(
  mutate(gapminder_country, gdp = pop * gdpPercap), avg_gdp = mean(gdp)
)

head(gapminder_country_avg)

gapminder |> 
  group_by(continent) |> 
  summarise(avg_pop = mean(pop), avg_gdp_per_cap = mean(gdpPercap)) |> 
  arrange(avg_gdp_per_cap)
gapminder |> 
  group_by(continent) |> 
  summarise(avg_pop = mean(pop), avg_gdp_per_cap = mean(gdpPercap)) |> 
  ggplot(aes(x = continent, y = avg_gdp_per_cap)) + 
  geom_col() + 
  theme_minimal()

gapminder |>
  filter (continent == "Americas", year > 2000) |>
  group_by (country) |>
  summarise(avg_gdp_per_cap = mean(gdpPercap)) |>
  ggplot (aes(x = avg_gdp_per_cap, y = country)) +
  geom_col() +
  theme_minimal()

  
