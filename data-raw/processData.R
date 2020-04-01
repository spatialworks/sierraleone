## Libraries
library(rgdal)
library(rgeos)
library(raster)

##
options(stringsAsFactors = FALSE)

##
link1 <- "https://data.humdata.org/dataset/a4816317-a913-4619-b1e9-d89e21c056b4/resource/b6225ff4-80e2-428f-be5e-db5d2f43a3d6/download/sle_admbnda_adm1_1m_gov_ocha_20161017.shp.zip"
link2 <- "https://data.humdata.org/dataset/a4816317-a913-4619-b1e9-d89e21c056b4/resource/b3963917-8550-478d-9363-736492bf209a/download/sle_admbnda_adm2_1m_gov_ocha.zip"
link3 <- "https://data.humdata.org/dataset/a4816317-a913-4619-b1e9-d89e21c056b4/resource/e2aa661d-af2f-42d8-bdea-c7e16a00bdb2/download/sle_admbnda_adm3_1m_gov_ocha_20161017.zip"
link4 <- "https://data.humdata.org/dataset/a4816317-a913-4619-b1e9-d89e21c056b4/resource/da852c80-d459-4514-a835-d1d0d457ef2a/download/sle_admbnda_adm4_1m_gov_ocha.zip"

## Province
temp <- tempfile()
download.file(url = link1, destfile = temp)

unzip(zipfile = temp, exdir = tempdir())

x <- list.files(tempdir())[stringr::str_detect(string = list.files(tempdir()), pattern = "adm1")]
layer <- stringr::str_remove(string = x[1], pattern = ".cpg|.dbf|.prj|.sbn|.sbx|.shp|.shp.xml|.shx")

province <- rgdal::readOGR(dsn = tempdir(), layer = layer)

usethis::use_data(province, compress = "xz", overwrite = TRUE)

unlink(temp, recursive = TRUE)


## Districts
temp <- tempfile()
download.file(url = link2, destfile = temp)
unzip(zipfile = temp, exdir = tempdir())

x <- list.files(tempdir())[stringr::str_detect(string = list.files(tempdir()), pattern = "adm2")]
layer <- stringr::str_remove(string = x[1], pattern = ".cpg|.dbf|.prj|.sbn|.sbx|.shp|.shp.xml|.shx")

district <- rgdal::readOGR(dsn = tempdir(), layer = layer)

usethis::use_data(district, compress = "xz", overwrite = TRUE)

unlink(temp, recursive = TRUE)


## Chiefdoms
temp <- tempfile()
download.file(url = link3, destfile = temp)
unzip(zipfile = temp, exdir = tempdir())

x <- list.files(tempdir())[stringr::str_detect(string = list.files(tempdir()), pattern = "adm3")]
layer <- stringr::str_remove(string = x[1], pattern = ".cpg|.dbf|.prj|.sbn|.sbx|.shp|.shp.xml|.shx")

chiefdom <- rgdal::readOGR(dsn = tempdir(), layer = layer)

usethis::use_data(chiefdom, compress = "xz", overwrite = TRUE)

unlink(temp, recursive = TRUE)


## Counties
temp <- tempfile()
download.file(url = link4, destfile = temp)
unzip(zipfile = temp, exdir = tempdir())

x <- list.files(tempdir())[stringr::str_detect(string = list.files(tempdir()), pattern = "adm4")]
layer <- stringr::str_remove(string = x[1], pattern = ".cpg|.dbf|.prj|.sbn|.sbx|.shp|.shp.xml|.shx")

county <- rgdal::readOGR(dsn = tempdir(), layer = layer)

usethis::use_data(county, compress = "xz", overwrite = TRUE)

unlink(temp, recursive = TRUE)



