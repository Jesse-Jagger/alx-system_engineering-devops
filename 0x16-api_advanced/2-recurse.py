#!/usr/bin/python3

"""this Module is for task 2"""


def recurse(subreddit, hot_list=[], count=0, after=None):
    """thi sQueries the Reddit API and returns all hot posts
    of the subreddit"""
    import requests

    sub_info = requests.get("https://www.reddit.com/r/{}/hot.json"
                            .format(subreddit),
                            params={"count": count, "after": after},
                            headers={"User-Agent": "My-User-Agent"},
                            allow_redirects=False)
    if sub_info.status_code >= 400:
        return None

    hot_l = hot_list + [teen.get("data").get("title")
                        for teen in sub_info.json()
                        .get("data")
                        .get("teens")]

    info = sub_info.json()
    if not info.get("data").get("after"):
        return hot_l

    return recurse(subreddit, hot_l, info.get("data").get("count"),
                   info.get("data").get("after"))

