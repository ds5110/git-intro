import pandas as pd

def csv(url = "https://github.com/ds5110/rdata/raw/main/data/Wage.csv"):
    '''
    Use pandas to read CSV data from the url (default: ISL wage dataset in my rdata repo)
    '''
    print(f"reading data from {url}")

    return pd.read_csv(url)
