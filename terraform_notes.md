# Terraform Notes

## Resource
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
## Data source
A data source is read-only information that is fetched from the provider.
It queries the provider api for data, then makes the data available to the rest of the Terraform code.
```
data "<PROVIDER>_<TYPE>" "<NAME>" {
  [CONFIG] ...
}
```

## State
Terraform records the information about all the infrastructure it created in a Terraform state file - terraform.state.
_Remote backends_ is the best way to manage shared-storage of state files.

### Backend
To change where Terraform will store the state file, configuration is made to Terraform itself within the terraformblock.
```
terraform {
  backend "<BACKEND_NAME>" {
    [CONFIG ...]
  }
}
```

## Workspaces
Terraform workspaces storage of Terraform state in multiple, seperate, names workspaces.
The default workspace is "default".

In the backend storage, an "env" folder is created containing a folder for each workspace. Inside that folder is the state file (terraform.tfstate) named '<workspace-name>/<key-specified-backend-configuration/terraform.tfstate'

Workspaces are best used for experiemnts (eg refactoring code) but dont want to affect the state of already deployed infrastructure.

To identify which workspace you are in
```terraform workspace show```

to create a workspace:
`terraform workspace new <workspace-name>`

to see all the workspaces:
`terraform workspace list`

to switch between workspaces:
`terraform workspace select <workspace-name>`
