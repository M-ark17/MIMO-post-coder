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
      <with|color|red|(<with|math-font-family|rm|%i>29) >
    <|unfolded-io>
      g(r,t):=lsum((k!/(k+t-r)!)*gen_laguerre(k,t-r,sigma)**2*sigma**(t-r)*exp(-sigma),k,[0,r-1])/r
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o29>)
      >>g<around*|(|r,t|)>\<assign\><frac|<math-up|lsum><around*|(|<frac|k!|<around*|(|k+t-r|)>!>*L<rsub|k><rsup|<around*|(|t-r|)>>*<around*|(|t-r,\<sigma\>|)><rsup|2>*\<sigma\><rsup|t-r>*exp
      <around*|(|-\<sigma\>|)>,k,<around*|[|0,r-1|]>|)>|r>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>30) >
    <|unfolded-io>
      lambda_cal(r,t):=integrate(((1/lambda)-(1/sigma))*g(r,t),sigma,lambda,inf);
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o30>)
      >><with|math-font-family|rm|lambda_cal><around*|(|r,t|)>\<assign\><math-up|integrate><around*|(|<around*|(|<frac|1|\<lambda\>>-<frac|1|\<sigma\>>|)>*g<around*|(|r,t|)>,\<sigma\>,\<lambda\>,\<infty\>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>31) >
    <|unfolded-io>
      lambda_cal(2,10)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o31>)
      >><frac|<around*|(|\<lambda\><rsup|9>+18*\<lambda\><rsup|7>+252*\<lambda\><rsup|6>+2268*\<lambda\><rsup|5>+15120*\<lambda\><rsup|4>+75600*\<lambda\><rsup|3>+272160*\<lambda\><rsup|2>+635040*\<lambda\>+725760|)>*\<mathe\><rsup|-\<lambda\>>|725760*\<lambda\>>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>32) >
    <|input>
      \;
    </input>
  </session>
</body>

<initial|<\collection>
</collection>>