<TeXmacs|1.99.11>

<style|<tuple|generic|maxima>>

<\body>
  <\session|maxima|default>
    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|unfolded-io>
      g(lambda) := ( 1 / 8! * gen_laguerre(0, 8, lambda)**2 * lambda**8 *
      exp(-lambda) + 1 / 9! * gen_laguerre(1, 8, lambda)**2 * lambda**8 *
      exp(-lambda));
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o1>)
      >>g<around*|(|\<lambda\>|)>\<assign\><frac|1|8!>*<with|math-font-family|rm|gen_laguerre><around*|(|0,8,\<lambda\>|)><rsup|2>*\<lambda\><rsup|8>*exp
      <around*|(|-\<lambda\>|)>+<frac|1|9!>*<with|math-font-family|rm|gen_laguerre><around*|(|1,8,\<lambda\>|)><rsup|2>*\<lambda\><rsup|8>*exp
      <around*|(|-\<lambda\>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|unfolded-io>
      g(3)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o2>)
      >><frac|729*\<mathe\><rsup|-3>|896>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|input>
      integrate(log(x**2/y)*g(x),x,y,inf);
    </input>

    <\input>
      <math|<with|math-display|true|<text|Is >y<text|positive or negative?
      >>>

      \;
    <|input>
      positive
    </input>

    <\input>
      <math|<with|math-display|true|<text|Is >y-1<text|positive, negative or
      zero? >>>

      \;
    <|input>
      positive
    </input>

    <\unfolded-io>
      <math|<with|math-display|true|<text|Is >y<text|positive, negative or
      zero? >>>

      \;
    <|unfolded-io>
      positive
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o3>)
      >><frac|y<rsup|10>*\<mathe\><rsup|-y>*log
      <around*|(|y|)>|362880>-<frac|y<rsup|9>*\<mathe\><rsup|-y>*log
      <around*|(|y|)>|45360>+<frac|y<rsup|8>*\<mathe\><rsup|-y>*log
      <around*|(|y|)>|20160>+<frac|y<rsup|7>*\<mathe\><rsup|-y>*log
      <around*|(|y|)>|2520>+<frac|y<rsup|6>*\<mathe\><rsup|-y>*log
      <around*|(|y|)>|360>+<frac|y<rsup|5>*\<mathe\><rsup|-y>*log
      <around*|(|y|)>|60>+<frac|y<rsup|4>*\<mathe\><rsup|-y>*log
      <around*|(|y|)>|12>+<frac|y<rsup|3>*\<mathe\><rsup|-y>*log
      <around*|(|y|)>|3>+y<rsup|2>*\<mathe\><rsup|-y>*log
      <around*|(|y|)>+2*y*\<mathe\><rsup|-y>*log
      <around*|(|y|)>+2*\<mathe\><rsup|-y>*log
      <around*|(|y|)>+<frac|\<mathe\><rsup|-y>*<around*|(|<around*|(|725760*\<Gamma\><around*|(|1,y|)>+725760*\<Gamma\><around*|(|0,y|)>|)>*\<mathe\><rsup|y>+y<rsup|9>+y<rsup|8>+26*y<rsup|7>+326*y<rsup|6>+2964*y<rsup|5>+20868*y<rsup|4>+113712*y<rsup|3>+462096*y<rsup|2>+1287072*y+1287072|)>|181440>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|unfolded-io>
      %o3,y=0.009987515605493134;
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o4>)
      >>17.9976269448217>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|unfolded-io>
      %o3,y =0.01109570041608876\ 
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o5>)
      >>17.78718332525489>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>13) >
    <|unfolded-io>
      %o3, y = 0.0124804992199688
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o13>)
      >>17.55196396452632>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>14) >
    <|unfolded-io>
      %o3,y = 0.01426024955436719
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o14>)
      >>17.28534686173038>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>20) >
    <|unfolded-io>
      %o3,y = 0.01663201663201636
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o20>)
      >>16.97763959089654>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>21) >
    <|unfolded-io>
      %o3,y = 0.01995012468827929
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o21>)
      >>16.61382790529813>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>22) >
    <|unfolded-io>
      %o3,y = 0.0249221183800623
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o22>)
      >>16.16878729694502>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>23) >
    <|unfolded-io>
      %o3,y = 0.03319502074688715
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o23>)
      >>15.59549891766635>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>24) >
    <|unfolded-io>
      %o3,y = 0.04968944099378882
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o24>)
      >>14.78871378065391>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>28) >
    <|unfolded-io>
      %o3,y = 0.09876543209876557
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o28>)
      >>13.41480336002992>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>29) >
    <|unfolded-io>
      %o3,y = 0.1095890410958908
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o29>)
      >>13.2068239329819>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>30) >
    <|unfolded-io>
      %o3,y = 0.1230769230769242
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o30>)
      >>12.97467959047661>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>36) >
    <|unfolded-io>
      %o3,y = 0.1632653061224688
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o36>)
      >>12.40954564690987>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>37) >
    <|unfolded-io>
      %o3,y = 0.2424242424251995
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o37>)
      >>11.61892017371096>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>38) >
    <|unfolded-io>
      %o3,y = 0.4705882358786325
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o38>)
      >>10.29233175484194>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>39) >
    <|unfolded-io>
      %o3,y = 0.8888891157313683
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o39>)
      >>9.020355022069757>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>35) >
    <|unfolded-io>
      \;
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o35>)
      >>12.97467959047661>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>36) >
    <|input>
      \;
    </input>
  </session>
</body>

<initial|<\collection>
</collection>>