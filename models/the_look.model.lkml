connection: "thelook"

include: "/views/*.view"
# include: "../extending_view.view"
include: "/dashboards/*.dashboard.lookml"
include: "/other/products.explore.lkml"
include: "/views/order_facts/*.view"
# include: "/manifest.lkml"

datagroup: the_look_default_datagroup {
  sql_trigger:  SELECT MAX(id) FROM orders;;
  max_cache_age: "24 hours"
}


map_layer: us_canada {
  url: "https://github.com/milli-koch/the_look/blob/master/us_canada.topojson"

}

persist_with: the_look_default_datagroup

access_grant: user_fields {
  user_attribute: department
  allowed_values: ["dcl"]
}

explore: orders {
#   fields: [ALL_FIELDS*, -orders*]
#   sql_always_where: ${created_year} = extract(year from STR_TO_DATE(${fiscalyearmonth}))
#   and ${created_date} <=  ;;
#   always_filter: {
#     filters: {
#       field: users.user
#       value: "Milli"
#     }
#   }

#   sql_always_where:
#   {% condition order_items.date_filter %} ${orders.created_date} {% endcondition %}  OR
#   {% condition orders.date_input %} ${order_items.returned_date} {% endcondition %}
#   ;;

  # {% if orders.day_ago._parameter_value  == 1 %}
  # ${inventory_items.created_date} = date_add(${created_date}, interval -{% parameter inventory_items.days_ago %} day)
  # {% else %}
  # 1 = 1
  # {% endif %};;
    #   always_filter: {
    #     filters: {  {{ orders.filter_logic._parameter_value }}

    #       field: created_date
    #       value: "6 months"
    #     }
    #     filters: {
    #       field: is_cancelled
    #       value: "No"
    #     }
    #     filters: {
    #       field: products.category
    #       value: "clothing^_sets,Active"
    #     }
    #   }

    #   sql_always_where: {% condition orders.date_filter %} ${created_raw} {% endcondition %}
    #   and {% condition orders.date_filter %} ${created_other_raw} {% endcondition %};;
    #   persist_with: four_hour_cache
    #   sql_always_where:
    #   {% if orders.date_filter._is_filtered %}
    #   ${orders.created_date} between
    #   date_add({% parameter orders.date_filter %}, interval -3 day)
    #   and date_add({% parameter orders.date_filter %}, interval 3 day)
    #   {% else %}
    #   1=1
    #   {% endif %};;


    join: users {
#     fields: []
    sql_on: ${orders.user_id} = ${users.id} ;;
    type: left_outer
    relationship: many_to_one
  }

  join: order_items {
    sql_on: ${orders.id} = ${order_items.order_id} ;;
    type: left_outer
    relationship: one_to_many
  }

  join: inventory_items {
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
    type: left_outer
    relationship: one_to_one
  }

  join: products {
#     fields: [products.category, products.item_name, products.department, products.rank]
  sql_on: ${inventory_items.product_id} =  ${products.id} ;;
  relationship: many_to_one
}
}

explore: users {
  always_filter: {
    filters: {
      field: state_filter
      value: ""
    }
    filters: {
      field: filter_logic
      value: "OR"
    }
    filters: {
      field: age_filter
      value: ""
    }
  }
  sql_always_where: {% condition users.state_filter %} users.state {% endcondition %}
  {% parameter users.filter_logic %}
  {% condition users.age_filter %} users.age {% endcondition %};;
}

explore: sme_lookml {
  always_filter: {
    filters: {
      field: category_filter
    }
    filters: {
      field: date_filter
    }
    filters: {
      field: region
    }
  }
}

explore: order_facts_dynamic {}

explore: users_alias {
  from: users
}

# explore: products {
#   extends: [products_base]
#   hidden: no
#   join: inventory_items {
#     sql_on: ${inventory_items.product_id} =  ${products.id} ;;
#     relationship: one_to_many
#   }
# }

# explore: products {
#   sql_always_where: ${category} = {% parameter category_param %}
#   AND ${brand} = {% parameter brand_param %}     ;;
# }

explore: user {
  required_access_grants: [user_fields]
  view_name: users
#   view_label: "Users"
#   label: "User"
  from: users_ex
  join: orders {
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: accounts {
  extends: [user]
}


# explore: users {
#   fields: [ALL_FIELDS*, -created_raw]
#   persist_with: four_hour_cache
#
#   join: orders {
#     sql_on: ${users.id} = ${orders.user_id} ;;
#     relationship: one_to_many
#   }
#
#   join: user_data {
#     sql_on: ${user_data.user_id} = ${users.id} ;;
#     relationship: one_to_many
#   }
#
# }

explore: period_over_period {
  view_name: orders
  always_filter: {
    filters: {
      field: orders.time_period
      value: "MTD"
    }
  }
  sql_always_where:
  {% if orders.time_period_parameter_value == 'WTD' %} ${is_wtd}
  {% elsif orders.time_period._parameter_value == 'MTD' %} ${is_mtd}
  {% elsif orders.time_period._parameter_value == 'QTD' %} ${is_qtd}
  {% elsif orders.time_period._parameter_value == 'YTD' %} ${is_ytd}
  {% else %} 1=1
  {% endif %}
  ;;
}


explore: inventory_items {
#   label: "Explorename"
  join: products {
    type: inner
    sql_on: ${inventory_items.product_id} = ${products.id}
      and {% condition inventory_items.created_date %} ${inventory_items.created_date} {% endcondition %};;
    relationship: many_to_one
  }
}

explore: order_items {
  join: inventory_items {
    type: left_outer
    relationship: many_to_one
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
  }

  join: orders {
#     fields: [ordesrs.status]
  type: left_outer
  sql_on: ${order_items.order_id} = ${orders.id} ;;
  relationship: many_to_one
}

join: products {
  type: left_outer
  sql_on: ${inventory_items.product_id} = ${products.id} ;;
  relationship: many_to_one
}

join: users {
  type: left_outer
  sql_on: ${orders.user_id} = ${users.id} ;;
  relationship: many_to_one
}
}

explore: customer_facts {}

explore: csv_to_sql_query {}
