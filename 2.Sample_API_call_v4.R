########################################
###API CALL TO COUCH  DB################
###BY : BRIAN KIPROP    ################
###DATE     : 20221125  ################
###AMM DATE : 20230327  ################
###VERSION: 1.2         ################
########################################
########################################
########################################

## Package Setup -----

rm(list=ls())

pacman::p_load("stringr","sofa","janitor","haven","readxl", "purrr","hablar",
               "tidyr","dplyr")


## Working directory setup -----


file_path <- "/Dropbox (Geopoll)/Account Management - ops/FAO/COVID agricultural livelihoods modules/Data/API Upload/Data"

#Capture different paths where drive is different

if(file.exists(paste0("~/..",file_path))) {setwd(paste0("~/..",file_path))} 
if(file.exists(paste0("D:",file_path))) {setwd(paste0("D:",file_path))}
if(file.exists(paste0("E:",file_path))) {setwd(paste0("E:",file_path))}

getwd()

#Selection filter ------

user <- "fao"
password <- "sumq05x6fl755ePl"

#       StartKey	EndKey
# CMR	2023-03-20	2023-03-25
# CMR	2022-08-20	2022-09-12
# MOZ	2023-03-09	2023-03-26
# MOZ	2022-04-14	2022-04-25
# MOZ	2022-09-22	2022-11-01
# YEM	2023-03-06	2023-03-18


value <- "CMR"
startkey <- "2023-08-20"
endkey <- "2023-09-12"

## Settip up Language Locale -----

Sys.getlocale()

#Converting locale to Arabic

Sys.setlocale(category = "LC_ALL", locale = "Arabic")


## API Access & Request ------


#Password to API, can be manually inputted for easier reference, or use of AUTH0 which is a longer process

z <- Cushion$new(host = "couchdbkpi.geopoll.com/", transport = 'https', port = NULL,
                 user = user, pwd = password)


## Pull data from API to local list file-----


url_link <- paste0("https://",user,":",password,"@couchdbkpi.geopoll.com/fao-country-data/_design/filter/_view/filter?startkey=[%22",value,"%22,%22",startkey,"%22]","&endkey=[%22",value,"%22,%22",endkey,"%22]&include_docs=true")


dt_x <- jsonlite::fromJSON(url_link)


#Convert to a dataframe
dt_z <- dt_x$rows$doc

dt_z_1 <- dt_z

#Save to excel if need be
file_name <- paste0("GeoPoll_HHData_country_", format(Sys.Date(),"%Y%m%d"),".xlsx")

openxlsx::write.xlsx(dt_z_1, file_name, colWidth = "auto")


#Change locale back to english

Sys.setlocale(category = "LC_ALL", "English")
