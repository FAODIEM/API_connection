# API_connection

## Running Environment 
R version 4.2.2 (2022-10-31 ucrt)
Platform: x86_64-w64-mingw32/x64 (64-bit)
Running under: Windows 10 x64 (build 17763)

Matrix products: default

locale:
[1] LC_COLLATE=English_United States.1256 
[2] LC_CTYPE=English_United States.1256   
[3] LC_MONETARY=English_United States.1256
[4] LC_NUMERIC=C                          
[5] LC_TIME=English_United States.1256    

attached base packages:
[1] stats     graphics  grDevices utils     datasets  methods  
[7] base     

other attached packages:
[1] dplyr_1.1.0   tidyr_1.3.0   hablar_0.3.2  purrr_1.0.1  
[5] readxl_1.4.2  haven_2.5.2   janitor_2.2.0 sofa_0.4.0   
[9] stringr_1.5.0

loaded via a namespace (and not attached):
 [1] zip_2.2.2        Rcpp_1.0.10      cellranger_1.1.0
 [4] compiler_4.2.2   pillar_1.8.1     forcats_1.0.0   
 [7] tools_4.2.2      lubridate_1.9.2  jsonlite_1.8.4  
[10] lifecycle_1.0.3  tibble_3.1.8     timechange_0.2.0
[13] pkgconfig_2.0.3  rlang_1.0.6      openxlsx_4.2.5.2
[16] cli_3.6.0        rstudioapi_0.14  crul_1.3        
[19] curl_5.0.0       xfun_0.37        generics_0.1.3  
[22] vctrs_0.5.2      hms_1.1.2        tidyselect_1.2.0
[25] snakecase_0.11.0 glue_1.6.2       httpcode_0.3.0  
[28] R6_2.5.1         fansi_1.0.4      pacman_0.5.1    
[31] magrittr_2.0.3   ellipsis_0.3.2   tinytex_0.44    
[34] utf8_1.2.3       stringi_1.7.12  


## Key parameters 
1. value: specify the country iso code
2. startkey: start date for data extraction within the data collection round in the format YYYY-MM-DD
3. endkey: end date for the data extraction in the format YYY-MM-DD
4. user / password: FAO account authentication keys

## How it works
the script will connect to Geopoll database through the API keys ( country ISO code + start date) to pull the data within the start date and end date in Json format 
After successful extraction your dataset should be exported in an excel file, you will be able to extract the cleaned version of the dataset aligned with the standard variable names 
