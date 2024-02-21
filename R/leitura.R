read_gansos <- function(url){
  x <- tempfile()
  googledrive::drive_download(file = url, path = x)
  readxl::read_xlsx(x)
}


clean_ganso <- function(df){
  df |> janitor::clean_names() |>
    mutate(nomes = str_remove(nomes, ";.*$")) |>
    mutate(across(-nomes, function(x){ifelse(is.na(x),0,1)}))

}
