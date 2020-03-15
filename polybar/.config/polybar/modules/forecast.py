#!/bin/python


import requests
import pathlib
import json


# Load configuration from '~/.config/forecast.json'
# Configuration file example:
# {
#     "api_key": "",          // Your OpenWeatherMap API key
#     "city": "",             // Your city name
#     "units": ""             // metric, imperial
# }
with open(pathlib.Path.home() / '.config' / 'forecast.json', 'r') as f:
    config = json.load(f)


icons = {  # Font Awesome 5 Pro
    '01d': '',  # Clear sky, day
    '01n': '',  # Clear sky, night
    '02d': '',  # Few clouds, day
    '02n': '',  # Few clouds, night
    '03d': '',  # Scattered clouds, day
    '03n': '',  # Scattered clouds, night
    '04d': '',  # Broken clouds, day
    '04n': '',  # Broken clouds, night
    '09d': '',  # Shower rain, day
    '09n': '',  # Shower rain, night
    '10d': '',  # Rain, day
    '10n': '',  # Rain, night
    '11d': '',  # Thunderstorm, day
    '11n': '',  # Thunderstorm, night
    '13d': '',  # Snow, day
    '13n': '',  # Snow, night
    '50d': '',  # Mist, day
    '50n': '',  # Mist, night
}

units = {
    'metric': 'C',
    'imperial': 'F',
}

def trend(curr, fore):
    if curr > fore:
        return ''
    elif curr < fore:
        return ''
    else:
        return ''

owapi = 'https://api.openweathermap.org/data/2.5/'

class OpenWeatherMap:
    api_key: str
    city_name: str
    units: str

    def __init__(self, api_key: str, city_name: str, units: str):
        self.api_key = api_key
        self.city_name = city_name
        self.units = units

    def get_current(self):
        params = {'q': self.city_name, 'appid': self.api_key, 'units': self.units}
        return requests.get(owapi + "weather", params=params).json()

    def get_forecast(self):
        params = {'q': self.city_name, 'appid': self.api_key, 'units': self.units}
        return requests.get(owapi + "forecast", params=params).json()


if __name__ == "__main__":
    weather = OpenWeatherMap(config['api_key'], config['city'], config['units'])

    curr = weather.get_current()
    fore = weather.get_forecast()

    print('{} {}°{}  {}  {} {}°{}'.format(
        icons[curr['weather'][0]['icon']],
        round(curr['main']['temp'], 1),
        units[weather.units],

        trend(curr['main']['temp'], fore['list'][0]['main']['temp']),

        icons[fore['list'][0]['weather'][0]['icon']],
        round(fore['list'][0]['main']['temp'], 1),
        units[weather.units],
    ))

