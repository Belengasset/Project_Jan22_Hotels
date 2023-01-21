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

