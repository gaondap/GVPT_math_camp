library(tidyverse)
library(skimr)
library(janitor)
library(countrycode)

gdp_raw <- read_csv(
  here::here("data-raw", "API_NY.GDP.MKTP.CD_DS2_en_csv_v2_3403845.csv"),
  skip = 4,
  col_select = 1:66
  )

gdp_raw

skim(gdp_raw)

gdp_df <- pivot_longer(
  data = gdp_raw,
  cols = '1960':'2021',
  names_to = "year",
  values_to = "gdp") |>
  clean_names() |>
  drop_na(region) |> 
  transmute(country_name, 
            country_code, 
            region = countrycode(country_name, "country.name", "region"), 
            year = as.integer(year), 
            gdp)

ggplot(gdp_df, aes(
  x = year, y = gdp, colour = region, group = country_name
)) +
  geom_line() +
  theme_minimal()

gdp_df |> 
  group_by(region, year) |> 
  summarise (avg_gdp = mean(gdp, na.rm = T)) |> 
  ggplot(aes(x = year, y = avg_gdp, color = region)) +
  geom_line() +
  theme_minimal()
  

