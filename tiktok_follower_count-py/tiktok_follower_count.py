import requests
from bs4 import BeautifulSoup


# Define the URL of the website to scrape
url = 'https://www.tiktok.com/@iamamamcbrowngh'

# Send an HTTP GET request to the URL
response = requests.get(url)

# Check if the request was successful (status code 200)

if response.status_code == 200:
    # Parse the HTML content of the page
    soup = BeautifulSoup(response.text, 'html.parser')

    # Find the <strong> element with the specified attributes
    following_count_element = soup.find('strong', attrs={'title': 'Followers', 'data-e2e': 'followers-count'})

    # Extract and print the following count
    following_count = following_count_element.text if following_count_element else "Not found"
    print(f"Followers count: {following_count}")
else:
    print(f"Failed to retrieve the page. Status code: {response.status_code}")
