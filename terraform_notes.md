
general resource syntax
```
resource "<PROVIDER>_<TYPE>" "<NAME>" {
  [CONFIG ...]
}
```

resource attribute reference
`<PROVIDER>_<TYPE>.<NAME>.<ATTRIBUTE>`

view dependancy graph
`terraform graph`
The output is in DOT - a graph description language. use Graphviz or [GraphvizOnline](http://dreampuf.github.io/GraphvizOnline)
