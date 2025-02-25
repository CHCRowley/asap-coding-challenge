from flask import Flask, render_template
from mapping.folium_map import *

app = Flask(__name__)

@app.route("/")
def home():

    gdf = create_gdf()
    m = generate_map_from_gdf(gdf, w=800, h=600)

    m.get_root().width = "800px"
    m.get_root().height = "600px"
    iframe = m.get_root()._repr_html_()

    return render_template("home.html", iframe=iframe)