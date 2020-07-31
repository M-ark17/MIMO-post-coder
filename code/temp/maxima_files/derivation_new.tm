<TeXmacs|1.99.11>

<style|<tuple|generic|maxima>>

<\body>
  <\session|maxima|default>
    <\output>
      \;

      Maxima 5.41.0 http://maxima.sourceforge.net

      using Lisp GNU Common Lisp (GCL) GCL 2.6.12

      Distributed under the GNU Public License. See the file COPYING.

      Dedicated to the memory of William Schelter.

      The function bug_report() provides bug reporting information.
    </output>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|unfolded-io>
      D1:matrix([exp(%i*phi[1]),0,0],[0,exp(%i*phi[2]),0],[0,0,exp(%i*phi[3])]);
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o2>)
      >><matrix|<tformat|<table|<row|<cell|\<mathe\><rsup|\<mathi\>*\<varphi\><rsub|1>>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|\<mathe\><rsup|\<mathi\>*\<varphi\><rsub|2>>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|\<mathe\><rsup|\<mathi\>*\<varphi\><rsub|3>>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|unfolded-io>
      D2:matrix([1,0,0],[0,exp(%i*phi[4]),0],[0,0,exp(%i*phi[5])])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o3>)
      >><matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|\<mathe\><rsup|\<mathi\>*\<varphi\><rsub|4>>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|\<mathe\><rsup|\<mathi\>*\<varphi\><rsub|5>>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|unfolded-io>
      D3:matrix([1,0,0],[0,1,0],[0,0,exp(%i*phi[6])]);
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o4>)
      >><matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|\<mathe\><rsup|\<mathi\>*\<varphi\><rsub|6>>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|unfolded-io>
      G1:matrix([1,0,0],[0,cos(theta[1]),sin(theta[1])],[0,-sin(theta[1]),cos(theta[1])]);
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o5>)
      >><matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|cos
      <around*|(|\<vartheta\><rsub|1>|)>>|<cell|sin
      <around*|(|\<vartheta\><rsub|1>|)>>>|<row|<cell|0>|<cell|-sin
      <around*|(|\<vartheta\><rsub|1>|)>>|<cell|cos
      <around*|(|\<vartheta\><rsub|1>|)>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|unfolded-io>
      G2:matrix([cos(theta[2]),sin(theta[2]),0],[-sin(theta[2]),cos(theta[2]),0],[0,0,1]);
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o6>)
      >><matrix|<tformat|<table|<row|<cell|cos
      <around*|(|\<vartheta\><rsub|2>|)>>|<cell|sin
      <around*|(|\<vartheta\><rsub|2>|)>>|<cell|0>>|<row|<cell|-sin
      <around*|(|\<vartheta\><rsub|2>|)>>|<cell|cos
      <around*|(|\<vartheta\><rsub|2>|)>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>7) >
    <|unfolded-io>
      G3:matrix([1,0,0],[0,cos(theta[3]),sin(theta[3])],[0,-sin(theta[3]),cos(theta[3])]);
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o7>)
      >><matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|cos
      <around*|(|\<vartheta\><rsub|3>|)>>|<cell|sin
      <around*|(|\<vartheta\><rsub|3>|)>>>|<row|<cell|0>|<cell|-sin
      <around*|(|\<vartheta\><rsub|3>|)>>|<cell|cos
      <around*|(|\<vartheta\><rsub|3>|)>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>8) >
    <|unfolded-io>
      D1h:matrix([exp(-%i*alpha[1]),0,0],[0,exp(-%i*alpha[2]),0],[0,0,exp(-%i*alpha[3])]);
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o8>)
      >><matrix|<tformat|<table|<row|<cell|\<mathe\><rsup|-\<mathi\>*\<alpha\><rsub|1>>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|\<mathe\><rsup|-\<mathi\>*\<alpha\><rsub|2>>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|\<mathe\><rsup|-\<mathi\>*\<alpha\><rsub|3>>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>9) >
    <|unfolded-io>
      D2h:matrix([1,0,0],[0,exp(-%i*alpha[4]),0],[0,0,exp(-%i*alpha[5])])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o9>)
      >><matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|\<mathe\><rsup|-\<mathi\>*\<alpha\><rsub|4>>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|\<mathe\><rsup|-\<mathi\>*\<alpha\><rsub|5>>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>10) >
    <|unfolded-io>
      D3h:matrix([1,0,0],[0,1,0],[0,0,exp(-%i*alpha[6])]);
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o10>)
      >><matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|\<mathe\><rsup|-\<mathi\>*\<alpha\><rsub|6>>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>11) >
    <|unfolded-io>
      G1h:matrix([1,0,0],[0,cos(gamma[1]),-sin(gamma[1])],[0,sin(gamma[1]),cos(gamma[1])]);
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o11>)
      >><matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|cos
      <around*|(|\<gamma\><rsub|1>|)>>|<cell|-sin
      <around*|(|\<gamma\><rsub|1>|)>>>|<row|<cell|0>|<cell|sin
      <around*|(|\<gamma\><rsub|1>|)>>|<cell|cos
      <around*|(|\<gamma\><rsub|1>|)>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>12) >
    <|unfolded-io>
      G2h:matrix([cos(gamma[2]),-sin(gamma[2]),0],[sin(gamma[2]),cos(gamma[2]),0],[0,0,1]);
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o12>)
      >><matrix|<tformat|<table|<row|<cell|cos
      <around*|(|\<gamma\><rsub|2>|)>>|<cell|-sin
      <around*|(|\<gamma\><rsub|2>|)>>|<cell|0>>|<row|<cell|sin
      <around*|(|\<gamma\><rsub|2>|)>>|<cell|cos
      <around*|(|\<gamma\><rsub|2>|)>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>13) >
    <|unfolded-io>
      G3h:matrix([1,0,0],[0,cos(gamma[3]),-sin(gamma[3])],[0,sin(gamma[3]),cos(gamma[3])]);
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o13>)
      >><matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|cos
      <around*|(|\<gamma\><rsub|3>|)>>|<cell|-sin
      <around*|(|\<gamma\><rsub|3>|)>>>|<row|<cell|0>|<cell|sin
      <around*|(|\<gamma\><rsub|3>|)>>|<cell|cos
      <around*|(|\<gamma\><rsub|3>|)>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>14) >
    <|unfolded-io>
      D1h.D1
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o14>)
      >><matrix|<tformat|<table|<row|<cell|\<mathe\><rsup|\<mathi\>*\<varphi\><rsub|1>-\<mathi\>*\<alpha\><rsub|1>>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|\<mathe\><rsup|\<mathi\>*\<varphi\><rsub|2>-\<mathi\>*\<alpha\><rsub|2>>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|\<mathe\><rsup|\<mathi\>*\<varphi\><rsub|3>-\<mathi\>*\<alpha\><rsub|3>>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>15) >
    <|unfolded-io>
      g1hg1:trigreduce(G1h.G1)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o15>)
      >><matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|cos
      <around*|(|\<gamma\><rsub|1>-\<vartheta\><rsub|1>|)>>|<cell|-sin
      <around*|(|\<gamma\><rsub|1>-\<vartheta\><rsub|1>|)>>>|<row|<cell|0>|<cell|sin
      <around*|(|\<gamma\><rsub|1>-\<vartheta\><rsub|1>|)>>|<cell|cos
      <around*|(|\<gamma\><rsub|1>-\<vartheta\><rsub|1>|)>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>16) >
    <|unfolded-io>
      g1hg1s:matrix([1,0,0],[0,c,-s],[0,s,c])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o16>)
      >><matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|c>|<cell|-s>>|<row|<cell|0>|<cell|s>|<cell|c>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>17) >
    <|unfolded-io>
      g2hg2:G2h.g1hg1s.G2
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o17>)
      >><matrix|<tformat|<table|<row|<cell|sin
      <around*|(|\<vartheta\><rsub|2>|)>*sin
      <around*|(|\<gamma\><rsub|2>|)>*c+cos
      <around*|(|\<vartheta\><rsub|2>|)>*cos
      <around*|(|\<gamma\><rsub|2>|)>>|<cell|sin
      <around*|(|\<vartheta\><rsub|2>|)>*cos
      <around*|(|\<gamma\><rsub|2>|)>-cos
      <around*|(|\<vartheta\><rsub|2>|)>*sin
      <around*|(|\<gamma\><rsub|2>|)>*c>|<cell|sin
      <around*|(|\<gamma\><rsub|2>|)>*s>>|<row|<cell|cos
      <around*|(|\<vartheta\><rsub|2>|)>*sin
      <around*|(|\<gamma\><rsub|2>|)>-sin
      <around*|(|\<vartheta\><rsub|2>|)>*cos
      <around*|(|\<gamma\><rsub|2>|)>*c>|<cell|cos
      <around*|(|\<vartheta\><rsub|2>|)>*cos
      <around*|(|\<gamma\><rsub|2>|)>*c+sin
      <around*|(|\<vartheta\><rsub|2>|)>*sin
      <around*|(|\<gamma\><rsub|2>|)>>|<cell|-cos
      <around*|(|\<gamma\><rsub|2>|)>*s>>|<row|<cell|-sin
      <around*|(|\<vartheta\><rsub|2>|)>*s>|<cell|cos
      <around*|(|\<vartheta\><rsub|2>|)>*s>|<cell|c>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>18) >
    <|unfolded-io>
      d2hd2:D2h.g2hg2.D2
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o18>)
      >><matrix|<tformat|<table|<row|<cell|sin
      <around*|(|\<vartheta\><rsub|2>|)>*sin
      <around*|(|\<gamma\><rsub|2>|)>*c+cos
      <around*|(|\<vartheta\><rsub|2>|)>*cos
      <around*|(|\<gamma\><rsub|2>|)>>|<cell|\<mathe\><rsup|\<mathi\>*\<varphi\><rsub|4>>*<around*|(|sin
      <around*|(|\<vartheta\><rsub|2>|)>*cos
      <around*|(|\<gamma\><rsub|2>|)>-cos
      <around*|(|\<vartheta\><rsub|2>|)>*sin
      <around*|(|\<gamma\><rsub|2>|)>*c|)>>|<cell|\<mathe\><rsup|\<mathi\>*\<varphi\><rsub|5>>*sin
      <around*|(|\<gamma\><rsub|2>|)>*s>>|<row|<cell|\<mathe\><rsup|-\<mathi\>*\<alpha\><rsub|4>>*<around*|(|cos
      <around*|(|\<vartheta\><rsub|2>|)>*sin
      <around*|(|\<gamma\><rsub|2>|)>-sin
      <around*|(|\<vartheta\><rsub|2>|)>*cos
      <around*|(|\<gamma\><rsub|2>|)>*c|)>>|<cell|\<mathe\><rsup|\<mathi\>*\<varphi\><rsub|4>-\<mathi\>*\<alpha\><rsub|4>>*<around*|(|cos
      <around*|(|\<vartheta\><rsub|2>|)>*cos
      <around*|(|\<gamma\><rsub|2>|)>*c+sin
      <around*|(|\<vartheta\><rsub|2>|)>*sin
      <around*|(|\<gamma\><rsub|2>|)>|)>>|<cell|-\<mathe\><rsup|\<mathi\>*\<varphi\><rsub|5>-\<mathi\>*\<alpha\><rsub|4>>*cos
      <around*|(|\<gamma\><rsub|2>|)>*s>>|<row|<cell|-\<mathe\><rsup|-\<mathi\>*\<alpha\><rsub|5>>*sin
      <around*|(|\<vartheta\><rsub|2>|)>*s>|<cell|\<mathe\><rsup|\<mathi\>*\<varphi\><rsub|4>-\<mathi\>*\<alpha\><rsub|5>>*cos
      <around*|(|\<vartheta\><rsub|2>|)>*s>|<cell|\<mathe\><rsup|\<mathi\>*\<varphi\><rsub|5>-\<mathi\>*\<alpha\><rsub|5>>*c>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>19) >
    <|unfolded-io>
      d2hd2s:matrix([c.sin(theta[2]).sin(gamma[2]),0,0],[0,sinc(2^-b).(sin(gamma[2]).sin(theta[2])+c.cos(\\theta[2]).cos(gamma[2])),sinc(2^-b).s.cos(gamma[2])],[0,sinc(2^-b).s,sinc(2^-b).c])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o19>)
      >><matrix|<tformat|<table|<row|<cell|sin
      <around*|(|\<gamma\><rsub|2>|)>*c\<cdot\>sin
      <around*|(|\<vartheta\><rsub|2>|)>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|<math-up|sinc><around*|(|<frac|1|2<rsup|b>>|)>\<cdot\><around*|(|cos
      <around*|(|\<gamma\><rsub|2>|)>*c\<cdot\>cos
      <around*|(|\<vartheta\><rsub|2>|)>+sin
      <around*|(|\<vartheta\><rsub|2>|)>*sin
      <around*|(|\<gamma\><rsub|2>|)>|)>>|<cell|cos
      <around*|(|\<gamma\><rsub|2>|)>*<math-up|sinc><around*|(|<frac|1|2<rsup|b>>|)>\<cdot\>s>>|<row|<cell|0>|<cell|<math-up|sinc><around*|(|<frac|1|2<rsup|b>>|)>\<cdot\>s>|<cell|<math-up|sinc><around*|(|<frac|1|2<rsup|b>>|)>\<cdot\>c>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>20) >
    <|unfolded-io>
      d2hd2ss:matrix([c*s22,0,0],sinc(2^-b)*[0,(c22*c+s22),cos(gamma[2])*s],sinc(2^-b)*[0,s,c])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o20>)
      >><matrix|<tformat|<table|<row|<cell|c*<with|math-font-family|rm|s22>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|<math-up|sinc><around*|(|<frac|1|2<rsup|b>>|)>*<around*|(|<with|math-font-family|rm|s22>+c*<with|math-font-family|rm|c22>|)>>|<cell|cos
      <around*|(|\<gamma\><rsub|2>|)>*<math-up|sinc><around*|(|<frac|1|2<rsup|b>>|)>*s>>|<row|<cell|0>|<cell|<math-up|sinc><around*|(|<frac|1|2<rsup|b>>|)>*s>|<cell|<math-up|sinc><around*|(|<frac|1|2<rsup|b>>|)>*c>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>21) >
    <|unfolded-io>
      g3hg3:G3h.d2hd2ss.G3
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o21>)
      >><matrix|<tformat|<table|<row|<cell|c*<with|math-font-family|rm|s22>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|cos
      <around*|(|\<gamma\><rsub|3>|)>*<around*|(|cos
      <around*|(|\<vartheta\><rsub|3>|)>*<math-up|sinc><around*|(|<frac|1|2<rsup|b>>|)>*<around*|(|<with|math-font-family|rm|s22>+c*<with|math-font-family|rm|c22>|)>-cos
      <around*|(|\<gamma\><rsub|2>|)>*sin
      <around*|(|\<vartheta\><rsub|3>|)>*<math-up|sinc><around*|(|<frac|1|2<rsup|b>>|)>*s|)>-sin
      <around*|(|\<gamma\><rsub|3>|)>*<around*|(|cos
      <around*|(|\<vartheta\><rsub|3>|)>*<math-up|sinc><around*|(|<frac|1|2<rsup|b>>|)>*s-sin
      <around*|(|\<vartheta\><rsub|3>|)>*<math-up|sinc><around*|(|<frac|1|2<rsup|b>>|)>*c|)>>|<cell|cos
      <around*|(|\<gamma\><rsub|3>|)>*<around*|(|sin
      <around*|(|\<vartheta\><rsub|3>|)>*<math-up|sinc><around*|(|<frac|1|2<rsup|b>>|)>*<around*|(|<with|math-font-family|rm|s22>+c*<with|math-font-family|rm|c22>|)>+cos
      <around*|(|\<gamma\><rsub|2>|)>*cos
      <around*|(|\<vartheta\><rsub|3>|)>*<math-up|sinc><around*|(|<frac|1|2<rsup|b>>|)>*s|)>-sin
      <around*|(|\<gamma\><rsub|3>|)>*<around*|(|sin
      <around*|(|\<vartheta\><rsub|3>|)>*<math-up|sinc><around*|(|<frac|1|2<rsup|b>>|)>*s+cos
      <around*|(|\<vartheta\><rsub|3>|)>*<math-up|sinc><around*|(|<frac|1|2<rsup|b>>|)>*c|)>>>|<row|<cell|0>|<cell|sin
      <around*|(|\<gamma\><rsub|3>|)>*<around*|(|cos
      <around*|(|\<vartheta\><rsub|3>|)>*<math-up|sinc><around*|(|<frac|1|2<rsup|b>>|)>*<around*|(|<with|math-font-family|rm|s22>+c*<with|math-font-family|rm|c22>|)>-cos
      <around*|(|\<gamma\><rsub|2>|)>*sin
      <around*|(|\<vartheta\><rsub|3>|)>*<math-up|sinc><around*|(|<frac|1|2<rsup|b>>|)>*s|)>+cos
      <around*|(|\<gamma\><rsub|3>|)>*<around*|(|cos
      <around*|(|\<vartheta\><rsub|3>|)>*<math-up|sinc><around*|(|<frac|1|2<rsup|b>>|)>*s-sin
      <around*|(|\<vartheta\><rsub|3>|)>*<math-up|sinc><around*|(|<frac|1|2<rsup|b>>|)>*c|)>>|<cell|sin
      <around*|(|\<gamma\><rsub|3>|)>*<around*|(|sin
      <around*|(|\<vartheta\><rsub|3>|)>*<math-up|sinc><around*|(|<frac|1|2<rsup|b>>|)>*<around*|(|<with|math-font-family|rm|s22>+c*<with|math-font-family|rm|c22>|)>+cos
      <around*|(|\<gamma\><rsub|2>|)>*cos
      <around*|(|\<vartheta\><rsub|3>|)>*<math-up|sinc><around*|(|<frac|1|2<rsup|b>>|)>*s|)>+cos
      <around*|(|\<gamma\><rsub|3>|)>*<around*|(|sin
      <around*|(|\<vartheta\><rsub|3>|)>*<math-up|sinc><around*|(|<frac|1|2<rsup|b>>|)>*s+cos
      <around*|(|\<vartheta\><rsub|3>|)>*<math-up|sinc><around*|(|<frac|1|2<rsup|b>>|)>*c|)>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>22) >
    <|unfolded-io>
      uhatu:D3h.g3hg3.D3
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o22>)
      >><matrix|<tformat|<table|<row|<cell|c*<with|math-font-family|rm|s22>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|cos
      <around*|(|\<gamma\><rsub|3>|)>*<around*|(|cos
      <around*|(|\<vartheta\><rsub|3>|)>*<math-up|sinc><around*|(|<frac|1|2<rsup|b>>|)>*<around*|(|<with|math-font-family|rm|s22>+c*<with|math-font-family|rm|c22>|)>-cos
      <around*|(|\<gamma\><rsub|2>|)>*sin
      <around*|(|\<vartheta\><rsub|3>|)>*<math-up|sinc><around*|(|<frac|1|2<rsup|b>>|)>*s|)>-sin
      <around*|(|\<gamma\><rsub|3>|)>*<around*|(|cos
      <around*|(|\<vartheta\><rsub|3>|)>*<math-up|sinc><around*|(|<frac|1|2<rsup|b>>|)>*s-sin
      <around*|(|\<vartheta\><rsub|3>|)>*<math-up|sinc><around*|(|<frac|1|2<rsup|b>>|)>*c|)>>|<cell|\<mathe\><rsup|\<mathi\>*\<varphi\><rsub|6>>*<around*|(|cos
      <around*|(|\<gamma\><rsub|3>|)>*<around*|(|sin
      <around*|(|\<vartheta\><rsub|3>|)>*<math-up|sinc><around*|(|<frac|1|2<rsup|b>>|)>*<around*|(|<with|math-font-family|rm|s22>+c*<with|math-font-family|rm|c22>|)>+cos
      <around*|(|\<gamma\><rsub|2>|)>*cos
      <around*|(|\<vartheta\><rsub|3>|)>*<math-up|sinc><around*|(|<frac|1|2<rsup|b>>|)>*s|)>-sin
      <around*|(|\<gamma\><rsub|3>|)>*<around*|(|sin
      <around*|(|\<vartheta\><rsub|3>|)>*<math-up|sinc><around*|(|<frac|1|2<rsup|b>>|)>*s+cos
      <around*|(|\<vartheta\><rsub|3>|)>*<math-up|sinc><around*|(|<frac|1|2<rsup|b>>|)>*c|)>|)>>>|<row|<cell|0>|<cell|\<mathe\><rsup|-\<mathi\>*\<alpha\><rsub|6>>*<around*|(|sin
      <around*|(|\<gamma\><rsub|3>|)>*<around*|(|cos
      <around*|(|\<vartheta\><rsub|3>|)>*<math-up|sinc><around*|(|<frac|1|2<rsup|b>>|)>*<around*|(|<with|math-font-family|rm|s22>+c*<with|math-font-family|rm|c22>|)>-cos
      <around*|(|\<gamma\><rsub|2>|)>*sin
      <around*|(|\<vartheta\><rsub|3>|)>*<math-up|sinc><around*|(|<frac|1|2<rsup|b>>|)>*s|)>+cos
      <around*|(|\<gamma\><rsub|3>|)>*<around*|(|cos
      <around*|(|\<vartheta\><rsub|3>|)>*<math-up|sinc><around*|(|<frac|1|2<rsup|b>>|)>*s-sin
      <around*|(|\<vartheta\><rsub|3>|)>*<math-up|sinc><around*|(|<frac|1|2<rsup|b>>|)>*c|)>|)>>|<cell|\<mathe\><rsup|\<mathi\>*\<varphi\><rsub|6>-\<mathi\>*\<alpha\><rsub|6>>*<around*|(|sin
      <around*|(|\<gamma\><rsub|3>|)>*<around*|(|sin
      <around*|(|\<vartheta\><rsub|3>|)>*<math-up|sinc><around*|(|<frac|1|2<rsup|b>>|)>*<around*|(|<with|math-font-family|rm|s22>+c*<with|math-font-family|rm|c22>|)>+cos
      <around*|(|\<gamma\><rsub|2>|)>*cos
      <around*|(|\<vartheta\><rsub|3>|)>*<math-up|sinc><around*|(|<frac|1|2<rsup|b>>|)>*s|)>+cos
      <around*|(|\<gamma\><rsub|3>|)>*<around*|(|sin
      <around*|(|\<vartheta\><rsub|3>|)>*<math-up|sinc><around*|(|<frac|1|2<rsup|b>>|)>*s+cos
      <around*|(|\<vartheta\><rsub|3>|)>*<math-up|sinc><around*|(|<frac|1|2<rsup|b>>|)>*c|)>|)>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>23) >
    <|unfolded-io>
      uhatu*matrix([1,0,0],[0,1,0],[0,0,1])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o23>)
      >><matrix|<tformat|<table|<row|<cell|c*<with|math-font-family|rm|s22>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|cos
      <around*|(|\<gamma\><rsub|3>|)>*<around*|(|cos
      <around*|(|\<vartheta\><rsub|3>|)>*<math-up|sinc><around*|(|<frac|1|2<rsup|b>>|)>*<around*|(|<with|math-font-family|rm|s22>+c*<with|math-font-family|rm|c22>|)>-cos
      <around*|(|\<gamma\><rsub|2>|)>*sin
      <around*|(|\<vartheta\><rsub|3>|)>*<math-up|sinc><around*|(|<frac|1|2<rsup|b>>|)>*s|)>-sin
      <around*|(|\<gamma\><rsub|3>|)>*<around*|(|cos
      <around*|(|\<vartheta\><rsub|3>|)>*<math-up|sinc><around*|(|<frac|1|2<rsup|b>>|)>*s-sin
      <around*|(|\<vartheta\><rsub|3>|)>*<math-up|sinc><around*|(|<frac|1|2<rsup|b>>|)>*c|)>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|\<mathe\><rsup|\<mathi\>*\<varphi\><rsub|6>-\<mathi\>*\<alpha\><rsub|6>>*<around*|(|sin
      <around*|(|\<gamma\><rsub|3>|)>*<around*|(|sin
      <around*|(|\<vartheta\><rsub|3>|)>*<math-up|sinc><around*|(|<frac|1|2<rsup|b>>|)>*<around*|(|<with|math-font-family|rm|s22>+c*<with|math-font-family|rm|c22>|)>+cos
      <around*|(|\<gamma\><rsub|2>|)>*cos
      <around*|(|\<vartheta\><rsub|3>|)>*<math-up|sinc><around*|(|<frac|1|2<rsup|b>>|)>*s|)>+cos
      <around*|(|\<gamma\><rsub|3>|)>*<around*|(|sin
      <around*|(|\<vartheta\><rsub|3>|)>*<math-up|sinc><around*|(|<frac|1|2<rsup|b>>|)>*s+cos
      <around*|(|\<vartheta\><rsub|3>|)>*<math-up|sinc><around*|(|<frac|1|2<rsup|b>>|)>*c|)>|)>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>24) >
    <|unfolded-io>
      uhatus:matrix([c*s22,0,0],sinc(2^-b)*[0,c33*s22+c*c22*c33-cos(gamma[2])*cos(gamma[3])*sin(theta[3])-s*sin(gamma[3])*cos(gamma[3])-s33*c,0],sinc(2^-b)^2*[0,0,s33*(s22+c*c22)+c33*c+s*sin(theta[3])*cos(gamma[3])+sin(gamma[3])*cos(theta[3])*cos(gamma[2])])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o24>)
      >><matrix|<tformat|<table|<row|<cell|c*<with|math-font-family|rm|s22>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|<math-up|sinc><around*|(|<frac|1|2<rsup|b>>|)>*<around*|(|-c*<with|math-font-family|rm|s33>+<with|math-font-family|rm|c33>*<with|math-font-family|rm|s22>-cos
      <around*|(|\<gamma\><rsub|3>|)>*sin
      <around*|(|\<gamma\><rsub|3>|)>*s+c*<with|math-font-family|rm|c22>*<with|math-font-family|rm|c33>-cos
      <around*|(|\<gamma\><rsub|2>|)>*sin
      <around*|(|\<vartheta\><rsub|3>|)>*cos
      <around*|(|\<gamma\><rsub|3>|)>|)>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|<math-up|sinc><around*|(|<frac|1|2<rsup|b>>|)><rsup|2>*<around*|(|<around*|(|<with|math-font-family|rm|s22>+c*<with|math-font-family|rm|c22>|)>*<with|math-font-family|rm|s33>+sin
      <around*|(|\<vartheta\><rsub|3>|)>*cos
      <around*|(|\<gamma\><rsub|3>|)>*s+c*<with|math-font-family|rm|c33>+cos
      <around*|(|\<gamma\><rsub|2>|)>*cos
      <around*|(|\<vartheta\><rsub|3>|)>*sin
      <around*|(|\<gamma\><rsub|3>|)>|)>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>25) >
    <|unfolded-io>
      s22:sin(theta[2])*sin(gamma[2])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o25>)
      >>sin <around*|(|\<vartheta\><rsub|2>|)>*sin
      <around*|(|\<gamma\><rsub|2>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>26) >
    <|unfolded-io>
      s33:sin(theta[3])*sin(gamma[3])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o26>)
      >>sin <around*|(|\<vartheta\><rsub|3>|)>*sin
      <around*|(|\<gamma\><rsub|3>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>27) >
    <|unfolded-io>
      c:cos(theta[1]-gamma[1])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o27>)
      >>cos <around*|(|\<gamma\><rsub|1>-\<vartheta\><rsub|1>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>28) >
    <|unfolded-io>
      s:sin(theta[1]-gamma[1])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o28>)
      >>-sin <around*|(|\<gamma\><rsub|1>-\<vartheta\><rsub|1>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>29) >
    <|unfolded-io>
      c22:cos(theta[2])*sin(gamma[2])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o29>)
      >>cos <around*|(|\<vartheta\><rsub|2>|)>*sin
      <around*|(|\<gamma\><rsub|2>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>30) >
    <|unfolded-io>
      c33:cos(theta[3])*sin(gamma[3])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o30>)
      >>cos <around*|(|\<vartheta\><rsub|3>|)>*sin
      <around*|(|\<gamma\><rsub|3>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>31) >
    <|unfolded-io>
      matrix([c*s22,0,0],sinc(2^-b)*[0,c33*s22+c*c22*c33-cos(gamma[2])*cos(gamma[3])*sin(theta[3])-s*sin(gamma[3])*cos(gamma[3])-s33*c,0],sinc(2^-b)^2*[0,0,s33*(s22+c*c22)+c33*c+s*sin(theta[3])*cos(gamma[3])+sin(gamma[3])*cos(theta[3])*cos(gamma[2])])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o31>)
      >><matrix|<tformat|<table|<row|<cell|cos
      <around*|(|\<gamma\><rsub|1>-\<vartheta\><rsub|1>|)>*sin
      <around*|(|\<vartheta\><rsub|2>|)>*sin
      <around*|(|\<gamma\><rsub|2>|)>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|<around*|(|sin
      <around*|(|\<gamma\><rsub|1>-\<vartheta\><rsub|1>|)>*cos
      <around*|(|\<gamma\><rsub|3>|)>*sin <around*|(|\<gamma\><rsub|3>|)>-cos
      <around*|(|\<gamma\><rsub|1>-\<vartheta\><rsub|1>|)>*sin
      <around*|(|\<vartheta\><rsub|3>|)>*sin
      <around*|(|\<gamma\><rsub|3>|)>+sin
      <around*|(|\<vartheta\><rsub|2>|)>*sin
      <around*|(|\<gamma\><rsub|2>|)>*cos
      <around*|(|\<vartheta\><rsub|3>|)>*sin
      <around*|(|\<gamma\><rsub|3>|)>+cos
      <around*|(|\<gamma\><rsub|1>-\<vartheta\><rsub|1>|)>*cos
      <around*|(|\<vartheta\><rsub|2>|)>*sin
      <around*|(|\<gamma\><rsub|2>|)>*cos
      <around*|(|\<vartheta\><rsub|3>|)>*sin
      <around*|(|\<gamma\><rsub|3>|)>-cos <around*|(|\<gamma\><rsub|2>|)>*sin
      <around*|(|\<vartheta\><rsub|3>|)>*cos
      <around*|(|\<gamma\><rsub|3>|)>|)>*<math-up|sinc><around*|(|<frac|1|2<rsup|b>>|)>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|<around*|(|<around*|(|sin
      <around*|(|\<vartheta\><rsub|2>|)>*sin
      <around*|(|\<gamma\><rsub|2>|)>+cos
      <around*|(|\<gamma\><rsub|1>-\<vartheta\><rsub|1>|)>*cos
      <around*|(|\<vartheta\><rsub|2>|)>*sin
      <around*|(|\<gamma\><rsub|2>|)>|)>*sin
      <around*|(|\<vartheta\><rsub|3>|)>*sin
      <around*|(|\<gamma\><rsub|3>|)>+cos <around*|(|\<gamma\><rsub|2>|)>*cos
      <around*|(|\<vartheta\><rsub|3>|)>*sin
      <around*|(|\<gamma\><rsub|3>|)>+cos
      <around*|(|\<gamma\><rsub|1>-\<vartheta\><rsub|1>|)>*cos
      <around*|(|\<vartheta\><rsub|3>|)>*sin
      <around*|(|\<gamma\><rsub|3>|)>-sin
      <around*|(|\<gamma\><rsub|1>-\<vartheta\><rsub|1>|)>*sin
      <around*|(|\<vartheta\><rsub|3>|)>*cos
      <around*|(|\<gamma\><rsub|3>|)>|)>*<math-up|sinc><around*|(|<frac|1|2<rsup|b>>|)><rsup|2>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>32) >
    <|unfolded-io>
      uhu:matrix([c*s22,0,0],sinc(2^-b)*[0,c33*s22+c*c22*c33-s*sin(gamma[3])*<extended|>cos(gamma[3])-s33*c,0],sinc(2^-b)^2*[0,0,s33*(s22+c*c22)+c33*c+s*sin(theta[3])*cos(gamma[3])])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o32>)
      >><matrix|<tformat|<table|<row|<cell|cos
      <around*|(|\<gamma\><rsub|1>-\<vartheta\><rsub|1>|)>*sin
      <around*|(|\<vartheta\><rsub|2>|)>*sin
      <around*|(|\<gamma\><rsub|2>|)>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|<around*|(|sin
      <around*|(|\<gamma\><rsub|1>-\<vartheta\><rsub|1>|)>*cos
      <around*|(|\<gamma\><rsub|3>|)>*sin <around*|(|\<gamma\><rsub|3>|)>-cos
      <around*|(|\<gamma\><rsub|1>-\<vartheta\><rsub|1>|)>*sin
      <around*|(|\<vartheta\><rsub|3>|)>*sin
      <around*|(|\<gamma\><rsub|3>|)>+sin
      <around*|(|\<vartheta\><rsub|2>|)>*sin
      <around*|(|\<gamma\><rsub|2>|)>*cos
      <around*|(|\<vartheta\><rsub|3>|)>*sin
      <around*|(|\<gamma\><rsub|3>|)>+cos
      <around*|(|\<gamma\><rsub|1>-\<vartheta\><rsub|1>|)>*cos
      <around*|(|\<vartheta\><rsub|2>|)>*sin
      <around*|(|\<gamma\><rsub|2>|)>*cos
      <around*|(|\<vartheta\><rsub|3>|)>*sin
      <around*|(|\<gamma\><rsub|3>|)>|)>*<math-up|sinc><around*|(|<frac|1|2<rsup|b>>|)>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|<around*|(|<around*|(|sin
      <around*|(|\<vartheta\><rsub|2>|)>*sin
      <around*|(|\<gamma\><rsub|2>|)>+cos
      <around*|(|\<gamma\><rsub|1>-\<vartheta\><rsub|1>|)>*cos
      <around*|(|\<vartheta\><rsub|2>|)>*sin
      <around*|(|\<gamma\><rsub|2>|)>|)>*sin
      <around*|(|\<vartheta\><rsub|3>|)>*sin
      <around*|(|\<gamma\><rsub|3>|)>+cos
      <around*|(|\<gamma\><rsub|1>-\<vartheta\><rsub|1>|)>*cos
      <around*|(|\<vartheta\><rsub|3>|)>*sin
      <around*|(|\<gamma\><rsub|3>|)>-sin
      <around*|(|\<gamma\><rsub|1>-\<vartheta\><rsub|1>|)>*sin
      <around*|(|\<vartheta\><rsub|3>|)>*cos
      <around*|(|\<gamma\><rsub|3>|)>|)>*<math-up|sinc><around*|(|<frac|1|2<rsup|b>>|)><rsup|2>>>>>>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>34) >
    <|input>
      \;
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>35) >
    <|unfolded-io>
      %o32[1][1];
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o35>)
      >>cos <around*|(|\<gamma\><rsub|1>-\<vartheta\><rsub|1>|)>*sin
      <around*|(|\<vartheta\><rsub|2>|)>*sin
      <around*|(|\<gamma\><rsub|2>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>36) >
    <|unfolded-io>
      %o32[2][2];
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o36>)
      >><around*|(|sin <around*|(|\<gamma\><rsub|1>-\<vartheta\><rsub|1>|)>*cos
      <around*|(|\<gamma\><rsub|3>|)>*sin <around*|(|\<gamma\><rsub|3>|)>-cos
      <around*|(|\<gamma\><rsub|1>-\<vartheta\><rsub|1>|)>*sin
      <around*|(|\<vartheta\><rsub|3>|)>*sin
      <around*|(|\<gamma\><rsub|3>|)>+sin
      <around*|(|\<vartheta\><rsub|2>|)>*sin
      <around*|(|\<gamma\><rsub|2>|)>*cos
      <around*|(|\<vartheta\><rsub|3>|)>*sin
      <around*|(|\<gamma\><rsub|3>|)>+cos
      <around*|(|\<gamma\><rsub|1>-\<vartheta\><rsub|1>|)>*cos
      <around*|(|\<vartheta\><rsub|2>|)>*sin
      <around*|(|\<gamma\><rsub|2>|)>*cos
      <around*|(|\<vartheta\><rsub|3>|)>*sin
      <around*|(|\<gamma\><rsub|3>|)>|)>*<math-up|sinc><around*|(|<frac|1|2<rsup|b>>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>37) >
    <|unfolded-io>
      %o32[3][3];
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o37>)
      >><around*|(|<around*|(|sin <around*|(|\<vartheta\><rsub|2>|)>*sin
      <around*|(|\<gamma\><rsub|2>|)>+cos
      <around*|(|\<gamma\><rsub|1>-\<vartheta\><rsub|1>|)>*cos
      <around*|(|\<vartheta\><rsub|2>|)>*sin
      <around*|(|\<gamma\><rsub|2>|)>|)>*sin
      <around*|(|\<vartheta\><rsub|3>|)>*sin
      <around*|(|\<gamma\><rsub|3>|)>+cos
      <around*|(|\<gamma\><rsub|1>-\<vartheta\><rsub|1>|)>*cos
      <around*|(|\<vartheta\><rsub|3>|)>*sin
      <around*|(|\<gamma\><rsub|3>|)>-sin
      <around*|(|\<gamma\><rsub|1>-\<vartheta\><rsub|1>|)>*sin
      <around*|(|\<vartheta\><rsub|3>|)>*cos
      <around*|(|\<gamma\><rsub|3>|)>|)>*<math-up|sinc><around*|(|<frac|1|2<rsup|b>>|)><rsup|2>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>38) >
    <|unfolded-io>
      %o31;
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o38>)
      >><matrix|<tformat|<table|<row|<cell|cos
      <around*|(|\<gamma\><rsub|1>-\<vartheta\><rsub|1>|)>*sin
      <around*|(|\<vartheta\><rsub|2>|)>*sin
      <around*|(|\<gamma\><rsub|2>|)>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|<around*|(|sin
      <around*|(|\<gamma\><rsub|1>-\<vartheta\><rsub|1>|)>*cos
      <around*|(|\<gamma\><rsub|3>|)>*sin <around*|(|\<gamma\><rsub|3>|)>-cos
      <around*|(|\<gamma\><rsub|1>-\<vartheta\><rsub|1>|)>*sin
      <around*|(|\<vartheta\><rsub|3>|)>*sin
      <around*|(|\<gamma\><rsub|3>|)>+sin
      <around*|(|\<vartheta\><rsub|2>|)>*sin
      <around*|(|\<gamma\><rsub|2>|)>*cos
      <around*|(|\<vartheta\><rsub|3>|)>*sin
      <around*|(|\<gamma\><rsub|3>|)>+cos
      <around*|(|\<gamma\><rsub|1>-\<vartheta\><rsub|1>|)>*cos
      <around*|(|\<vartheta\><rsub|2>|)>*sin
      <around*|(|\<gamma\><rsub|2>|)>*cos
      <around*|(|\<vartheta\><rsub|3>|)>*sin
      <around*|(|\<gamma\><rsub|3>|)>-cos <around*|(|\<gamma\><rsub|2>|)>*sin
      <around*|(|\<vartheta\><rsub|3>|)>*cos
      <around*|(|\<gamma\><rsub|3>|)>|)>*<math-up|sinc><around*|(|<frac|1|2<rsup|b>>|)>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|<around*|(|<around*|(|sin
      <around*|(|\<vartheta\><rsub|2>|)>*sin
      <around*|(|\<gamma\><rsub|2>|)>+cos
      <around*|(|\<gamma\><rsub|1>-\<vartheta\><rsub|1>|)>*cos
      <around*|(|\<vartheta\><rsub|2>|)>*sin
      <around*|(|\<gamma\><rsub|2>|)>|)>*sin
      <around*|(|\<vartheta\><rsub|3>|)>*sin
      <around*|(|\<gamma\><rsub|3>|)>+cos <around*|(|\<gamma\><rsub|2>|)>*cos
      <around*|(|\<vartheta\><rsub|3>|)>*sin
      <around*|(|\<gamma\><rsub|3>|)>+cos
      <around*|(|\<gamma\><rsub|1>-\<vartheta\><rsub|1>|)>*cos
      <around*|(|\<vartheta\><rsub|3>|)>*sin
      <around*|(|\<gamma\><rsub|3>|)>-sin
      <around*|(|\<gamma\><rsub|1>-\<vartheta\><rsub|1>|)>*sin
      <around*|(|\<vartheta\><rsub|3>|)>*cos
      <around*|(|\<gamma\><rsub|3>|)>|)>*<math-up|sinc><around*|(|<frac|1|2<rsup|b>>|)><rsup|2>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>41) >
    <|unfolded-io>
      %o31[1][1];
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o41>)
      >>cos <around*|(|\<gamma\><rsub|1>-\<vartheta\><rsub|1>|)>*sin
      <around*|(|\<vartheta\><rsub|2>|)>*sin
      <around*|(|\<gamma\><rsub|2>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>44) >
    <|unfolded-io>
      integrate(sin(x)**2 * 2 * sin(x) * cos(x), x, 0, %pi/2);
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o44>)
      >><frac|1|2>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>45) >
    <|input>
      \;
    </input>
  </session>
</body>

<initial|<\collection>
</collection>>