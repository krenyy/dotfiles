#!/bin/python

import requests


class CoronaTracker:
    url: str = "https://coronavirus-19-api.herokuapp.com/"

    @classmethod
    def get_all(cls):
        return requests.get(cls.url+"all").json()

    @classmethod
    def get_country(cls, country: str):
        ret = [c for c in requests.get(cls.url+"countries").json() if c['country'].lower() == country.lower()]
        if ret:
            return ret[0]
        return None


if __name__ == "__main__":
    print(" {active} (+{todayCases})   {deaths} (+{todayDeaths})   {recovered}".format(**CoronaTracker.get_country("Czechia")))

