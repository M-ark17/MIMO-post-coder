<TeXmacs|1.99.11>

<style|<tuple|generic|maxima>>

<\body>
  <\session|maxima|default>
    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|unfolded-io>
      g(l):= 2*l*sin(theta[l])^(2*l-1)*cos(theta[1])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o5>)
      >>g<around*|(|l|)>\<assign\>2*l*sin
      <around*|(|\<vartheta\><rsub|l>|)><rsup|2*l-1>*cos
      <around*|(|\<vartheta\><rsub|1>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|unfolded-io>
      g(10)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o6>)
      >>20*cos <around*|(|\<vartheta\><rsub|1>|)>*sin
      <around*|(|\<vartheta\><rsub|10>|)><rsup|19>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|input>
      integrate((2*l*sin(theta[l])^(2*l-1)*cos(theta[l]))^(1/3),theta[l],0,%pi/2)^3
    </input>

    <\unfolded-io>
      <math|<with|math-display|true|<text|Is >l+1<text|positive, negative or
      zero? >>>

      \;
    <|unfolded-io>
      positive
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o1>)
      >><frac|\<beta\><around*|(|<frac|2|3>,<frac|<frac|2*l-1|3>+1|2>|)><rsup|3>*l|4>>>
    </unfolded-io>

    <\folded-io>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|folded-io>
      \;
    <|folded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o7>)
      >>2<rsup|<frac|1|3>>*cos <around*|(|\<vartheta\><rsub|1>|)><rsup|<frac|1|3>>*l<rsup|<frac|1|3>>*<big|int><rsub|0><rsup|<frac|<math-up|pi>|2>>sin
      <around*|(|\<vartheta\><rsub|l>|)><rsup|<frac|2*l-1|3>>*<space|0.27em>\<mathd\>*<space|0.27em>\<vartheta\><rsub|l>>>
    </folded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|unfolded-io>
      fullratsimp(%o1)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o2>)
      >><frac|\<beta\><around*|(|<frac|2|3>,<frac|l+1|3>|)><rsup|3>*l|4>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|input>
      \;
    </input>
  </session>
</body>

<initial|<\collection>
</collection>>