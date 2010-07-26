# coding=utf-8

import random

comments = []

filename = u'总体印象.txt'
inf = open(filename, 'r')
ok_comments = inf.readlines()
for i in range(100):
    sentence1 = random.choice(ok_comments)
    sentence2 = random.choice(ok_comments)
    while sentence1 == sentence2:
        sentence2 = random.choice(ok_comments)
    sentence1 = sentence1[:-1]
    sentence2 = sentence2[:-1]
    comments.append(sentence1+sentence2)
    
filename = u'上课表现.txt'
inf = open(filename, 'r')
ok_comments = inf.readlines()
for i in range(100):
    sentence3 = random.choice(ok_comments)
    sentence4 = random.choice(ok_comments)
    while sentence4 == sentence3:
       sentence4 = random.choice(ok_comments)
    sentence3 = sentence3[:-1]
    sentence4 = sentence4[:-1]
    comments[i] = comments[i]+sentence3+sentence4
    
filename = u'作业情况.txt'
inf = open(filename, 'r')
ok_comments = inf.readlines()
for i in range(100):
    sentence3 = random.choice(ok_comments)
    sentence4 = random.choice(ok_comments)
    while sentence4 == sentence3:
       sentence4 = random.choice(ok_comments)
    sentence3 = sentence3[:-1]
    sentence4 = sentence4[:-1]
    comments[i] = comments[i]+sentence3+sentence4
    
filename = u'学习情况.txt'
inf = open(filename, 'r')
ok_comments = inf.readlines()
for i in range(100):
    sentence3 = random.choice(ok_comments)
    sentence4 = random.choice(ok_comments)
    while sentence4 == sentence3:
       sentence4 = random.choice(ok_comments)
    sentence3 = sentence3[:-1]
    sentence4 = sentence4[:-1]
    comments[i] = comments[i]+sentence3+sentence4

filename = u'班务.txt'
inf = open(filename, 'r')
ok_comments = inf.readlines()
for i in range(100):
    sentence3 = random.choice(ok_comments)
    sentence4 = random.choice(ok_comments)
    while sentence4 == sentence3:
       sentence4 = random.choice(ok_comments)
    sentence3 = sentence3[:-1]
    sentence4 = sentence4[:-1]
    comments[i] = comments[i]+sentence3+sentence4
    
filename = u'交际.txt'
inf = open(filename, 'r')
ok_comments = inf.readlines()
for i in range(100):
    sentence3 = random.choice(ok_comments)
    sentence4 = random.choice(ok_comments)
    while sentence4 == sentence3:
       sentence4 = random.choice(ok_comments)
    sentence3 = sentence3[:-1]
    sentence4 = sentence4[:-1]
    comments[i] = comments[i]+sentence3+sentence4
    
filename = u'特长.txt'
inf = open(filename, 'r')
ok_comments = inf.readlines()
for i in range(100):
    sentence3 = random.choice(ok_comments)
    sentence3 = sentence3[:-1]
    comments[i] = comments[i]+sentence3
    
filename = u'希望.txt'
inf = open(filename, 'r')
ok_comments = inf.readlines()
for i in range(100):
    sentence3 = random.choice(ok_comments)
    sentence3 = sentence3
    comments[i] = comments[i]+sentence3
    
ouf = open('output.txt', 'w')
for each in comments:
    ouf.write(each)
    ouf.write('\n')
ouf.close()
