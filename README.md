# asap-coding-challenge
Repository for the ASAP February 2025 away day coding challenge.

## Instructions

1. Fork the repository to your personal account and clone the repository
   
2. Create a virtual environment for the project
   
3. Navigate to the top level project directory and install the requirements using `pip install -r requirements.txt`
   
4. From the top level of the project directory, run the app using `flask run`

5. Access the app from `http://127.0.0.1:5000/`

## Project structure

- `data` contains:
  - `local_authority_district_boundaries.geojson`: this contains the spatial data for each local authority.
  - `median_annual_pay.tsv`: this contains the median annual pay for each local authority where available, from 2004 to 2024.
  
- The `mapping` module is used to process the data:
  - `mapping.prep_data` is used to read and process the median annual pay data into a Pandas DataFrame.
  - `mapping.folium_map` is used to convert the spatial data into a GeoPandas DataFrame, which is then merged with the annual pay DataFrame. This merged dataset is then used to create a Folium Choropleth map.
  - `testing_notebook` is offered as a space to conduct exploratory data analysis and prototype Folium maps.
  
- `app.py` contains the Flask code. It calls functions from `mapping.folium_map` to generate a Folium Choropleth map, which is then rendered as an iframe inside `templates/home.html` and served when calling `flask run`.

## Submitting your challenge

When you have finished the challenge, push your changes and open up a merge request.

## Resources

### Flask

- [Flask quickstart guide](https://flask.palletsprojects.com/en/stable/quickstart/)
- [Flask application tutorial](https://flask.palletsprojects.com/en/stable/tutorial/)

### Folium

- [Using folium Choropleth](https://python-visualization.github.io/folium/latest/user_guide/geojson/choropleth.html)
- [Using folium with flask](https://python-visualization.github.io/folium/latest/advanced_guide/flask.html)

### GeoPandas

- [Introduction to GeoPandas](https://geopandas.org/en/stable/getting_started/introduction.html)

### DuckDB

- [Getting started with DuckDB](https://duckdb.org/docs/)