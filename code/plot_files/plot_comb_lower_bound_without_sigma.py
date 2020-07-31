import numpy as np

data = np.loadtxt('lower_bound_vb_power_allocation_new.data')
data1 = np.loadtxt('lower_bound_power_allocation_new.data')

import pylab

pylab.rc('text', usetex=True)
pylab.rc('font', size=30)
pylab.rc('axes', labelsize=30)
pylab.rc('legend', fontsize=25)

pylab.figure(figsize=(10,6))

#pylab.plot( data[:,0], data[:,1], '--', lw=5, label='Capacity at 10 dB')
pylab.plot( 2*np.r_[1:15], np.ones(14)*data[0,1], '--', lw=5, ms=15, label='Capacity at 10 dB')
pylab.plot( data[:,0], data[:,2], '-.o', lw=5, ms=15, label=r'Rate using variable bit quantized $\hat{\bf U}$')
pylab.plot( data1[:,0], data1[:,1], '-o', lw=5, ms=15, label=r'Rate using  quantized $\hat{\bf U}$')

pylab.grid(True)
pylab.xlabel(r'Number of bits for quantizing $\bf U$')
pylab.ylabel(r'Rate (bits/s/Hz)')
pylab.legend()
v = pylab.axis()
pylab.axis([data1[0,0], v[1], data1[0,1], v[3]])
pylab.show()
