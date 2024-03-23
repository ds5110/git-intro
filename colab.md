
# Colab

http://colab.research.google.com 

Students should authenticate with their husky.neu.edu email.

https://colab.research.google.com/notebooks/ has some useful info. 

## Modify and save a notebook

Saving a colab notebook will save it as a Jupyter notebook in your google drive

* Make a change
* File > Save
  * If it works, you're good -- the notebook should be in your google drive.
  * If it doesn't work, you'll have other options/notifications, such as:
```
Save failed

The notebook has been changed outside of this session. Would you like to overwrite existing changes?
```

## Recover a previous version

* File > "Revision history"

## Share a notebook

* Open the notebook you want to share
* File > "Locate in Drive"
* Control-Click > "Share"
  * Add the person's email (their google account)
* Control-Click > "Get link"

## Collaborating

**WARNING:** You cannot edit synchronously without stepping on each other's toes!

* File > "Save a copy in Drive"
  * experiment on your own copy of the notebook
  * discuss your desired changes (e.g., using spoken words)
  * get agreement on the change you'd like to make
* Make a change to the master notebook
  * If it worked, you'll see "All changes saved" at the top of the page
  * If you see nothing, then your changes haven't been saved
  * If you wait a while without doing anything (10-20 seconds), the status message will change
  * If you see "Saving failed since XX:YY PM", then you're out of sync 
    * You may also see a pop-up in the lower left
    * `Automatic saving failed. this file was updated remotely or in another tab. Show diff`
* File > "Save" 
  * If it worked, you'll see "All changes saved"
  * If saving will create a conflict, you'll get a modal:
    ```
    Save failed
    The notebook has been changed outside of this session. Would you like to overwrite existing changes?
    Cancel   Yes
    ```
    * If you hit "Yes" then you'll overwrite the master
    * If it worked, you'll see "All changes saved"
    * Folks who are out of sync (e.g., because they're editing the file) will see "Saving failed since XX:YY PM"
    * Folks who are going along for the ride will see "All changes saved" or "Last saved at XX.YY PM"
* If you want your collaborators to see your changes
  * Advise your collaborators to refresh the page
  * Let them wait for 10-20 seconds

### Download matplotlib figure as PNG

```
import matplotlib.pyplot as plt
from google.colab import files

plt.savefig("flippers.png")
files.download("flippers.png")
```

## Remote file access

### Publicly accessible files

For example, use the `curl` command to load publicly accessible files into a Colab session.

    !curl -O https://raw.githubusercontent.com/allisonhorst/palmerpenguins/master/inst/extdata/penguins.csv
    !ls

Not sure what curl does? Then you can run this line: `!man curl`

### Compressed files

Use `curl` followed by appropriate unix commands to manipulate those files.  For example, 

    ! curl -Lo movie_data.csv.gz https://github.com/rasbt/python-machine-learning-book-3rd-edition/blob/master/ch08/movie_data.csv.gz?raw=true
    ! gunzip -f movie_data.csv.gz
    ! ls

Note: Github has a 50M file-size limit.

## Accessing your Google Drive

### A shared file in your Google Drive

If you choose the "Get shareable link" option for a file in your Google Drive,
that link contains a unique ID that will allow anyone can load the file into their Colab session.
For example, here's a shareable link (it is not a working example):

    https://drive.google.com/file/d/1C7Rw06hhv0HgyjN28nMie6iI77F7hewoL/view?usp=sharing

The unique ID is the string `1C7Rw06hhv0HgyjN28nMie6iI77F7hewoL` that appears between the two `/` characters.
Use it to construct a URL that you can use to download the file:

    https://drive.google.com/uc?export=download&id=1C7Rw06hhv0HgyjN28nMie6iI77F7hewoL

The download URL can be used to load the file into Colab without authentication.
For example, if the shared file is CSV, then you can load it with pandas (again, this is not a working example):

    import pandas as pd
    url = "https://drive.google.com/uc?export=download&id=1C7Rw06hhv0HgyjN28nMie6iI77F7hewoL"
    df = pd.read_csv(url)

There are file-size restrictions for this approach, but it works for files that exceed the github limits.

### Large files shared from your Google Drive

You can load large files from your google drive.
Google documentation at https://colab.research.google.com/notebooks/ has some useful info. 
[This notebook](https://colab.research.google.com/notebooks/io.ipynb) describes several methods
for getting data into colab from your google drive.
For larger files, you may need authentication
that can expose all the data in your folder, so be careful.
