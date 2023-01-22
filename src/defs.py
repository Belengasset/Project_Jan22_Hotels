'''It is a file where all the definitions are found so that the files where the code appears are cleaner''''

from IPython.display import Image
from geopy.geocoders import Nominatim

def insert_image (path):
    '''function to insert an image'''
    return Image(filename=path)



def add_coordinates(df, location_column):
    '''function to insert coordenates (latitude, longitude) in a dataframe'''
    geolocator = Nominatim(user_agent="geoapiExercises")
    for i, row in df.iterrows():
        if row[location_column] == 0:
            location = geolocator.geocode(row[location_column])
            df.at[i, 'latitude'] = location.latitude
            df.at[i, 'longitude'] = location.longitude
    return df


def hotel_type(x):
    '''function that clasifies the hotel in 3 categories acording to the number of rooms'''
    if x < 150:
         return "Small"
    elif x >= 150 and x <= 299:
        return "Medium"
    elif x >= 600:
        return "Mega"
    else:
         return "Big"
        
def siglo(y):
    '''function that creates a column to see what century the hotel was built in'''
    if y < 1600:
         return "16"
    elif y >= 1600 and y < 1700:
        return "17"
    elif y >= 1700 and y < 1800:
        return "18"
    elif y >= 1800 and y < 1900:
        return "19"
    elif y >= 1900 and y < 2000:
        return "20"
    else:
         return "21"