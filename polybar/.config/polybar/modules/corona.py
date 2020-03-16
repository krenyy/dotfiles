#!/bin/python

import requests


class CoronaTracker:
    url: str = "https://covid19.mathdro.id/api/"

    @classmethod
    def get_country(cls, country: str):
        return requests.get(cls.url+f"countries/{country}").json()


if __name__ == "__main__":
    resp = CoronaTracker.get_country("Czechia")
    print(" {}   {}   {}".format(*[
        s['value'] for s in [resp['confirmed'], resp['deaths'], resp['recovered']]
    ]))

