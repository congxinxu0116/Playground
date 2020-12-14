# Webscraping the Apartment Price in Jersey City
# Congxin (David) Xu
# 12/14/2020

# %% Import Modules
import pandas
import requests
from bs4 import BeautifulSoup
# %% Define parameters
# Store the URL as a variable
url = 'https://www.equityapartments.com/new-york-city/jersey-city/70-greene-apartments'

# Create a headers with user agent string
headers = {'user-agent': 'David Xu Personal Use (cx2rx@virginia.edu)'}

# Get the URL page
r = requests.get(url, headers = headers)

# Check status
print(r)
# %%
# Parse the HTML with Beautiful Soup
books = BeautifulSoup(r.text, 'html.parser')