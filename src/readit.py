import pandas as pd

def csv(url_or_file="https://github.com/ds5110/rdata/raw/main/data/Wage.csv"):
    '''
    Use pandas to read CSV data from the url (default: ISL wage dataset in my rdata repo)
    '''
    print(f"reading data from {url_or_file}")

    return pd.read_csv(url_or_file)
