library(magrittr)

get_df_from_db <- function() {
    df <- read.delim(file = "data/median_annual_pay.tsv", na.strings = "")
    
    df <- dplyr::select(df, date, local.authority..district...unitary..as.of.April.2023., value) |>
        dplyr::rename(year = date, lad = local.authority..district...unitary..as.of.April.2023., median_ann_pay = value) |>
        dplyr::filter(!grepl("[^0-9]", median_ann_pay), !is.na(median_ann_pay)) |>
        data.frame()
    
    df$median_ann_pay <- as.numeric(df$median_ann_pay)
    df$year <- as.numeric(year)
    return(df)
    
}
    