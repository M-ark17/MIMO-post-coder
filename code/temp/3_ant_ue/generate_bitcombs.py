import itertools
import csv
for i in range(16,20):
    a = list(filter(lambda x : x[0] > 0 and x[1] > 0 and x[2] > 0 and x[3] > 0 and x[0] + x[1] + x[2] + x[3] == i, (itertools.product(range(i), range(i), range(i), range(i)))))
    with open('bits/bitsum'+str(i)+'.csv', 'w', newline='') as file:
        writer = csv.writer(file)
        writer.writerows(a)
        
