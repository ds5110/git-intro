import pandas as pd

def read_csv(url_or_file):
    '''
    Use pandas to read CSV data from a url or local file
    '''
    print(f"reading data from {url_or_file}")

    return pd.read_csv(url_or_file)
