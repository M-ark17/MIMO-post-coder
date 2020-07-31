from io import StringIO   # StringIO behaves like a file object
from mpl_toolkits.mplot3d import Axes3D
import scipy
import numpy as np
import pylab
import matplotlib.pyplot as plt
import os
import sys
print ('Number of arguments:', len(sys.argv), 'arguments.')
print ('Argument List:', str(sys.argv))
if (len(sys.argv)==1):
    cwd = os.getcwd()
    files = os.listdir(cwd)
else:
    files = sys.argv[1]
x = np.empty([0,10])
y = np.empty([0,10])
titles = []
data_size = 16
start_line = 0
l = scipy.loadtxt(files,comments="#", skiprows = 0, unpack=False, dtype = str)
while(start_line < len(l)):
    if "output.txt" in files:
        string = ""
        string = string.join(list(l[start_line,:]))
        string = string.replace("_", " ")
        titles += list(string.split(";"))
        print(titles)
        bits= l[start_line+2:start_line+data_size,0].astype(np.float)
        bound = l[start_line+2:start_line+data_size,1].astype(np.float)
        actual_rate = l[start_line+2:start_line+data_size,2].astype(np.float)
        start_line += data_size
        x = np.append(x,bound)
        y = np.append(y,actual_rate)
xrange = 14
x = x.reshape(int(len(x)/xrange),xrange)
y = y.reshape(int(len(y)/xrange),xrange)
fig = plt.figure()
ax = fig.gca()
ax.set_xlabel('bits')
ax.set_ylabel('Rate')
#ax.set_zlabel('Power (dB)')
power = [0, 3, 6, 10]
power = 10
power_i = 0;
#ax.annotate(r"""Rate using channel \n
#inversion for \n
#$9\times 3$ system""", xy=(-0.1, 0.95), xycoords='axes fraction', xytext=(0, 0.95), textcoords='axes fraction', arrowprops=dict(facecolor='black', shrink=0.05, width=1), horizontalalignment='right', verticalalignment='top',)
#
#ax.annotate(r"""Rate using channel \n
#inversion for \n
#$6\times 3$ system""", xy=(-0.1, 0.8), xycoords='axes fraction', xytext=(0, 0.8), textcoords='axes fraction', arrowprops=dict(facecolor='black', shrink=0.05, width=1), horizontalalignment='right', verticalalignment='top',)

for i in range(0,x.shape[0]):
    #ax.contour(bits,x[i],np.ones(14)*power[power_i],label = titles[i])
    #ax.contour(bits,y[i],np.ones(14)*power[power_i])
#plt.show()
    
    pylab.axis(xmin = min(bits),xmax = max(bits))
    pylab.grid(True)
    pylab.rc('text',usetex=True)
    pylab.rc('font',size=18)
    pylab.rc('legend',fontsize=20)
    pylab.rc('lines',linewidth=3, markersize = 8)
    pylab.rc('axes', labelsize='100') 
    pylab.plot(bits,x[i],label= titles[i],marker='x')
    pylab.plot(bits,y[i])
    pylab.xlabel('bits',fontsize='medium')
    pylab.ylabel('Rate',fontsize='medium')
    pylab.legend()
    if((i+1)%3 == 0 and i != 0):
        inversion_data_6 = scipy.loadtxt("rate_10_tx_6_rx_3_inv.txt" ,comments="#", skiprows = 0, unpack=False, dtype = str)
        inversion_data_9 = scipy.loadtxt("rate_10_tx_9_rx_3_inv.txt" ,comments="#", skiprows = 0, unpack=False, dtype = str)
        pylab.plot(bits,np.float32(inversion_data_6),'--')
        pylab.plot(bits,np.float32(inversion_data_9),'--')
        pylab.text(30,10.8502,r'rate using ZF precoding for $6\times3$ system')
        pylab.text(30,13.4328,r'rate using ZF precoding for $9\times3$ system')
        pylab.text(60,8.8654,r'capacity for $3\times3$ system')
        pylab.text(60,12.2092,r'capacity for $6\times3$ system')
        pylab.text(60,14.2612,r'capacity for $9\times3$ system')
        pylab.show()
        #fname = "BS_3_antenna_plots/power_"+str(power)+"dB_rate.pdf"
        #power_i +=1;
        #pylab.savefig(fname)
        #pylab.clf()
#pylab.show()

# pylab.savefig('single_cellusrs_2ant_1iter_2500fdng_0.000000.pdf')
