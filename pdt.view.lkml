# view: pdt {
# derived_table: {
#   sql: {% assign var1 = table_name._parameter_value | plus: 0 %}
# {% if var1 > 0 %}
# select * from demo_db.orders
# {% endif %}
# ;;
# datagroup_trigger: the_look_default_datagroup
#   indexes: ["id"]
# }

# dimension: id {}

# filter: id_filter {
#   type: number
# }

# }

# explore: pdt {}
