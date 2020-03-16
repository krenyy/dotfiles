#!/bin/python

import requests
import bs4


class CoronaTracker:
    url: str = "https://onemocneni-aktualne.mzcr.cz/covid-19"

    @classmethod
    def get(cls):
        resp = requests.get(cls.url)

        soup = bs4.BeautifulSoup(resp.content, 'lxml')
        p = [e for e in soup.findAll('p')]

        count_sick = [c.string for c in p if c.get('id') == 'count-sick'][0]
        count_recover = [c.string for c in p if c.get('id') == 'count-recover'][0]

        return {
            'sick': count_sick,
            'recovered': count_recover,
        }


if __name__ == "__main__":
    print(" {sick}   0   {recovered}".format(**CoronaTracker.get()))

