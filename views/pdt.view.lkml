datagroup: datagroup_name {
  max_cache_age: "24 hours"
  sql_trigger: SELECT max(id) FROM my_tablename ;;
}

view: pdt {
derived_table: {
  # sql: SELECT {% parameter filter_name %} as select_field
  # FROM demo_db.orders;;
  sql: SELECT 1234567890987654321 as select_field ;;
  datagroup_trigger: datagroup_name
  indexes: ["select_field"]
  }


  dimension: select_field {
    type: number
    # value_format: "#############"
    sql: ${TABLE}.select_field ;;
    html: {{ value }} ;;
  }

  parameter: filter_name {
    type: unquoted
    allowed_value: {
      label: "Order ID"
      value: "id"
    }
    allowed_value: {
      label: "User ID"
      value: "user_id"
    }
  }




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

}

explore: pdt {}
