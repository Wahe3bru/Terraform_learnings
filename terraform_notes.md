
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

## variables in terraform
```
variable "<NAME>" {
  [CONFIG ...]
}
```
description, type, default are optional parameters.
description:
  used to document how a variable is used.
default:
  values can be passed in at the command line (`-var` option),
  via a file (`-var-file` option),
  or via environment variable (TF_VAR_<variable_name>).
  the default value if no value provided.
  if no default, Terraform will interactively prompt user.
type:
  allows enforce of type constraints.
  types include: string, number, bool, list, map, set, object, tuple and any.
  if no type is specified, Terraform assumes `any`
```
variable "number_example" {
  description = "number variable in Terraform"
  type        = number
  default     = 42
}
```
