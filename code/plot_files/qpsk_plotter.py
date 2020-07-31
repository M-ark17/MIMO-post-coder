from io import StringIO   # StringIO behaves like a file object
import scipy
import numpy as np
import pylab
import os
import sys
from matplotlib.ticker import StrMethodFormatter
def plotter(ip_file):
    d = scipy.loadtxt(ip_file,comments="#", skiprows = 0, unpack=False, dtype = str)
    xlen = d.shape[0]
    ylen = d.shape[1]
    for i in range(0,ylen):
        x= range(0,2*xlen,2) 
        y = d[:,i].astype(np.float)
        #pylab.gca().yaxis.set_major_formatter(StrMethodFormatter('{x:,.4f}')) # 2 decimal places
        pylab.axis(xmin = min(x),xmax = max(x))
        pylab.grid(True)
        pylab.rc('font', family='normal')
        pylab.rc('text',usetex=True)
        pylab.rc('font',size=20)
        pylab.rc('font', weight='bold')
        pylab.rc('legend',fontsize=25)
        pylab.tick_params('y',color='r',labelsize=20,pad=20,direction='inout')
        pylab.tick_params('x',color='r',labelsize=25,pad=2,direction='inout')
        tick_vals = scipy.arange(0,max(x)+2,2)
        pylab.xticks(tick_vals)
        #tick_vals = scipy.arange(min(min(y),min(z))+(max(max(y),max(z))-min(min(y),min(z)))/len(y),max(max(y),max(z))+(max(max(y),max(z))-min(min(y),min(z)))/len(y),2*(max(max(y),max(z))-min(min(y),min(z)))/len(y))
        tick_vals = scipy.arange(min(y)+np.mean(y)/len(y),max(y)+np.mean(y)/len(y),(2*max(y)-min(y))/len(y))
        pylab.yticks(tick_vals)
        pylab.semilogy(x,y,'+-',label="bits = "+str(i+1),linewidth=3)
        pylab.xlabel('SNR (dB)',fontsize='large')
        pylab.ylabel('BER',fontsize='large')
        pylab.legend()
        pylab.title("BER vs SNR for QPSK")
#    pylab.show()

plotter(sys.argv[1])
#plotter(sys.argv[2])
pylab.show()
