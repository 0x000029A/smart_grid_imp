import numpy as np
from pylfsr import LFSR

state = [1,1,1,1,1,1,1,1,1,1]
fpoly = [10, 3]
L = LFSR(fpoly=fpoly,initstate =state, verbose=True)
print("============")
L.info()
print("============")
print('count \t state \t\toutbit \t seq')
print('-'*50)
print("============")
for _ in range(15):
    print(L.count,L.state,'',L.outbit,L.seq,sep='\t')
    L.next()
print('-'*50)
print('Output: ',L.seq)
print("============")
print(L.state[2])