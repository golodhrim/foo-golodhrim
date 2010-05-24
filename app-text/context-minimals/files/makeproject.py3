#!/usr/bin/env python3
import os.path
currentdir = os.curdir

print("Make ConTeXt project -- 2010-05-23")

level = ['environment', 'project', 'product', 'component']
prefix = ['env_', 'project_', 'prd_', 'c_']
suffix = '.tex'
inisuffix = '.ini'

def input_level(prompt1="What do you want to create? (Enter 1 for environment, 2 for project, 3 for product, 4 for component or 5 for all): "):
    while True:
        num_str = input(prompt1).strip()
        num_flag = True
        for c in num_str:
            if c not in '12345':
                num_flag = False
        if num_flag:
            break
    return int(num_str)
        
#what = input_level()
what = 5
proj = input("How should I name your Project? ")

def input_count(prompt2="How many components should I create? "):
    while True:
        num_str = input(prompt2).strip()
        num_flag = True
        for c in num_str:
            if c not in '0123456789':
                num_flag = False
        if len(num_str)>3:
            num_flag = False
        if num_flag:
            break
    return int(num_str)

#count = 1
#if what == 5 or what == 4:
#    count = input_count()
count = input_count()

if what == 5:
    for i in range(len(level)-1):
        print("Creating file ", level[i])
        filename = prefix[i] + proj + suffix
        f = open(filename, 'w')
        f.write('\\start' + level[i] + ' ' + prefix[i] + proj + '\n')
        if level[i] == level[0]:
            f.write('\n\\setuplayout[...]\n% all setups...\n\n')
        if level[i] == level[1]:
            f.write('\\' + level[0] + ' ' + prefix[0] + proj + '\n\n\\' + level[2] + ' ' + prefix[2] + proj + '\n\n\completetableofcontents\n\n')
        if level[i] == level[2]:
            f.write('\\' + level[1] + ' ' + prefix[1] + proj + '\n\n')
            for j in range(count):
                f.write('\\' + level[3] + ' ' + prefix[3] + proj + '-' + str(j) + '\n')
            f.write('\n%...\n\n')
        f.write('\stop' + level[i])
        f.close()
    print("Creating ", count, "file(s) ", level[3])
    for j in range(count):
        filename = prefix[3] + proj + '-' + str(j) + suffix
        f = open(filename,  'w')
        f.write('\\start' + level[3] + ' ' + prefix[3] + proj + '-' + str(j) + '\n\\' + level[2] + ' ' + prefix[2] + proj + '\n\\' + level[1] + ' ' + prefix[1] + proj + '\n\n\n\\stop' + level[3])
        f.close()

#if what != 5:
#    lev = what-1
#    filename = prefix[lev] + proj + suffixle
