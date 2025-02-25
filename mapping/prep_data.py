import pandas as pd
import duckdb as db

def get_df_from_db():
    """
    Read in the TSV file containing the feature data and return the 
    results of the query as a Pandas DataFrame
    """

    # Ingest local authority data
    lad_data = db.read_csv(
    "data/median_annual_pay.tsv", 
    header=True,
    sep="\t")

    # Query local authority data and output to DataFrame
    df = db.sql(
    """
    SELECT date AS year, 
    "local authority: district / unitary (as of April 2023)" AS lad, 
    TRY_CAST(value AS INTEGER) AS median_ann_pay
    FROM lad_data
    WHERE "value type"='number'
    """
    ).df()

    return df