# coding = utf-8

import feedparser, urllib2, base64
import sys

def fetchfeed(username, password):
    
    req = urllib2.Request('http://twitter.com/statuses/friends_timeline.rss')
    passstring = base64.encodestring('%s:%s' % (username, password))[:-1]
    req.add_header("Authorization", "Basic %s" % passstring)
    proxy_handler = urllib2.ProxyHandler({'http': '192.168.1.13:8580'})
    opener = urllib2.build_opener(proxy_handler)
    f = opener.open(req)
    d = feedparser.parse(f.read())

    return d

if __name__ == "__main__":

    tweets = fetchfeed(sys.argv[1], sys.argv[2])

    latest_guid = tweets.entries[-1].id

    for tweet in tweets.entries:
        print tweet.title

    while True:
        sleep(240)
        tweets = fetchfeed(sys.argv[1], sys.argv[2])
        for tweet in tweets.entries:
            if tweet.id == latest_guid:
                break
            else:
                latest_guid = tweet.id
            print tweet.title
