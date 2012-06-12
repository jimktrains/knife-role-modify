# knife role modify ROLE JSONPath VALUE

Will replace the value at the config node speficied by JSONPath (see  http://goessner.net/articles/JsonPath/).

## Examples
Given a node:

{
  "name": "Windows_Base",
  "description": "",
  "json_class": "Chef::Role",
  "default_attributes": {
    "test": "testing"
  },
  "override_attributes": {
  },
  "chef_type": "role",
  "run_list": [
    "recipe[windows]",
    "recipe[iis]",
    "recipe[powershell]",
  ],
  "env_run_lists": {
  }
}

After we run:

    knife role modify Windows_Base '$.default_attributes..test' hola

The node is:

{
  "name": "Windows_Base",
  "description": "",
  "json_class": "Chef::Role",
  "default_attributes": {
    "test": "hola"
  },
  "override_attributes": {
  },
  "chef_type": "role",
  "run_list": [
    "recipe[windows]",
    "recipe[iis]",
    "recipe[powershell]",
  ],
  "env_run_lists": {
  }
}

## Dependencies

jsonpath gem
