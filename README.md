# raintank_mariadb-cookbook

TODO: Enter the cookbook description here.

## Supported Platforms

TODO: List your supported platforms.

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['raintank_mariadb']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

## Usage

### raintank_mariadb::default

Include `raintank_mariadb` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[raintank_mariadb::default]"
  ]
}
```

## License and Authors

Author:: Raintank, Inc. (<cookbooks@raintank.io>)
