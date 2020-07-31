from io import StringIO   # StringIO behaves like a file object
from mpl_toolkits.mplot3d import Axes3D
from scipy.io import loadmat
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
data_size = 16
start_line = 0
power = [0, 3, 6, 10]
power = [10]
for j in power:
    titles = []
    x = np.empty([0,10])
    y = np.empty([0,10])
    for i in files:
        subs = 'rate_for_P'+str(j)
        if subs in i:
            print(i)
            l = scipy.loadtxt(i,comments="#", skiprows = 0, unpack=False, dtype = str)
            titl = i[0:10]+"_=_"+i[10:10+len(str(j))]+"_dB_"+i[10+len(str(j)):16+len(str(j))]+"_=_"+i[16+len(str(j))]+"_rx_ant_=_2"
            titl = titl.replace("_", " ")
            titles += list(titl.split(";"))
            print(titles)
            bits= (np.arange(1,15)*2).astype(np.float)
            bound = l[0,:].astype(np.float)
            actual_rate = l[1,:].astype(np.float)
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
            #ax.annotate(r"""Rate using channel \n
            #inversion for \n
            #$4\times 2$ system""", xy=(-0.1, 0.95), xycoords='axes fraction', xytext=(0, 0.95), textcoords='axes fraction',
            #            arrowprops=dict(facecolor='black', shrink=0.05, width=1),
            #            horizontalalignment='right', verticalalignment='top',)
            #ax.annotate(r"""Rate using channel \n
            #inversion for \n
            #$6\times 2$ system""", xy=(-0.1, 0.8), xycoords='axes fraction', xytext=(0, 0.8), textcoords='axes fraction',
            #            arrowprops=dict(facecolor='black', shrink=0.05, width=1),
            #            horizontalalignment='right', verticalalignment='top',)
            power_i = 0
            for i in range(0,x.shape[0]):
                #ax.contour(bits,x[i],np.ones(14)*power[power_i],label = titles[i])
                #ax.contour(bits,y[i],np.ones(14)*power[power_i])
                #plt.show()
                pylab.axis(xmin = min(bits),xmax = max(bits))
                pylab.grid(True)
                pylab.rc('text',usetex=True)
                pylab.rc('font',size=18)
                pylab.rc('legend',fontsize=20)
                pylab.rc('lines',linewidth=3)
                pylab.plot(bits,x[i])
                pylab.plot(bits,y[i],label= titles[i],marker='x')
                pylab.xlabel('bits',fontsize='medium')
                pylab.ylabel('Rate',fontsize='medium')
                pylab.legend()
                if((i+1)%3 == 0 and i != 0):
                    #pylab.show()
                    inversion_data_4 = scipy.loadtxt("rate_10_tx_4_rx_2_inv.txt" ,comments="#", skiprows = 0, unpack=False, dtype = str)
                    inversion_data_6 = scipy.loadtxt("rate_10_tx_6_rx_2_inv.txt" ,comments="#", skiprows = 0, unpack=False, dtype = str)
                    pylab.plot(bits,np.float32(inversion_data_4),'--')
                    pylab.plot(bits,np.float32(inversion_data_6),'--')
                    pylab.text(9,7.5028,r'rate using ZF precoding for $4\times2$ system')
                    pylab.text(9,9.11543,r'rate using ZF precoding for $6\times2$ system')
                    pylab.text(21,6.8144,r'capacity for $2\times2$ system')
                    pylab.text(21,8.6770,r'capacity for $4\times2$ system')
                    pylab.text(21,9.9721,r'capacity for $6\times2$ system')
                    fname = "BS_2_antenna_plots/power_"+str(j)+"dB_rate.pdf"
                    power_i +=1;
                    #pylab.savefig(fname)
                    #pylab.clf()
                    pylab.show()
                    
                    # pylab.savefig('single_cellusrs_2ant_1iter_2500fdng_0.000000.pdf')
