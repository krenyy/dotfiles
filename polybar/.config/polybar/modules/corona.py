#!/bin/python

import sys
import requests
import bs4
from time import sleep


class CoronaTracker:
    url: str = "https://www.worldometers.info/coronavirus/"
    session: requests.Session

    country: str

    def __init__(self, country: str):
        self.session = requests.session()

        self.country = country

    def refresh(self):
        resp = self.session.get(self.url)
        soup = bs4.BeautifulSoup(resp.content, features="lxml")

        table = soup.find("table")

        cz = [c for c in table.tbody.findAll("tr") if self.country in c.text][0]

        details = cz.findAll("td")

        (
            country,
            total_cases,
            new_cases,
            total_deaths,
            new_deaths,
            total_recovered,
            active_cases,
            serious_critical,
            total_cases_per_million,
        ) = [x.text.strip() for x in details]

        return f" {active_cases or '0'} ({new_cases or '+0'})   {total_deaths or '0'}   {total_recovered or '0'}"

    @classmethod
    def is_valid_name(cls, name: str):
        return name in cls.get_country_names()

    @classmethod
    def get_country_names(cls):
        resp = requests.get(cls.url)
        soup = bs4.BeautifulSoup(resp.content, features="lxml")

        table = soup.find("table")

        return sorted([c.td.text.strip() for c in table.tbody.findAll("tr")])


def print_flush(message: str):
    sys.stdout.flush()
    print(message)


if __name__ == "__main__":
    tracker = CoronaTracker("Czechia")

    print_flush(tracker.refresh())
