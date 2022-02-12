install.packages("here")

library("here")
library("rvest")
update.packages(ask = FALSE, checkBuilt = TRUE)
tinytex::tlmgr_update()

##download the EVS page where there is the list of countries in which the survey has been conducted

download.file(url = "https://europeanvaluesstudy.eu/methodology-data-documentation/survey-2017/joint-evs-wvs-2017-2021-dataset/participating-countries-and-territories-joint-evs-wvs/",
              destfile=here::here("esvcountries.html"))

selector_css <- "td:nth-child(1)"

url <- "https://europeanvaluesstudy.eu/methodology-data-documentation/survey-2017/joint-evs-wvs-2017-2021-dataset/participating-countries-and-territories-joint-evs-wvs/"

# download the list of countries

country_list <- rvest::read_html(x = url)
rvest::html_elements(x = country_table, css = "td:nth-child(1)") %>%
  html_text()
