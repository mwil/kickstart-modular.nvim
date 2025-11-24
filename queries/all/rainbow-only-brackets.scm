; Only (), [], {} — in any node that directly contains them

((_) "(" @opening  ")" @closing) @container
((_) "[" @opening  "]" @closing) @container
((_) "{" @opening  "}" @closing) @container
