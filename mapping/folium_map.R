
create_gdf <- function() {
    lad_df <- get_df_from_db()
    
    sf <- sf::read_sf("data/local_authority_district_boundaries.geojson")
    sf <- dplyr::rename(sf, lad = LAD24NM)
    
    gdf <- dplyr::left_join(x = sf, y = lad_df, by = "lad")
    
    return(gdf)
}

make_map <- function(gdf){
    basemap <- leaflet::leaflet() %>%
        # add different provider tiles
        leaflet::addProviderTiles(
            "OpenStreetMap",
            # give the layer a name
            group = "OpenStreetMap"
        ) %>%
        leaflet::addProviderTiles(
            "Stamen.Toner",
            group = "Stamen.Toner"
        ) %>%
        leaflet::addProviderTiles(
            "Stamen.Terrain",
            group = "Stamen.Terrain"
        ) %>%
        leaflet::addProviderTiles(
            "Esri.WorldStreetMap",
            group = "Esri.WorldStreetMap"
        ) %>%
        leaflet::addProviderTiles(
            "Wikimedia",
            group = "Wikimedia"
        ) %>%
        leaflet::addProviderTiles(
            "CartoDB.Positron",
            group = "CartoDB.Positron"
        ) %>%
        leaflet::addProviderTiles(
            "Esri.WorldImagery",
            group = "Esri.WorldImagery"
        ) %>%
        # add a layers control
        leaflet::addLayersControl(
            baseGroups = c(
                "OpenStreetMap", "Stamen.Toner",
                "Stamen.Terrain", "Esri.WorldStreetMap",
                "Wikimedia", "CartoDB.Positron", "Esri.WorldImagery"
            ),
            # position it on the topleft
            position = "topleft"
        )
}

# def generate_map_from_gdf(gdf, w, h):
#     """
#     Generate a folium map from the supplied GeoPandas DataFrame
#     """
# 
#     m = folium.Map(
#         location=[53.5,  -2.2],
#         width=w,
#         height=h,
#         zoom_start=6,
#         min_zoom=6,
#         tiles=None
#     )
# 
#     folium.Choropleth(
#         geo_data=gdf,
#         data=gdf,
#         columns=["lad", "median_ann_pay"],
#         key_on="properties.LAD24NM",
#         nan_fill_color="purple",
#         nan_fill_opacity=0.4,
#         fill_color="YlGn",
#         fill_opacity=0.7,
#         line_opacity=0.2,
#         legend_name="Median Gross Annual Pay (£)",
#         highlight=True
#     ).add_to(m)
# 
#     return m