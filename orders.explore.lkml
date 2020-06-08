#include: "*.view"

explore: orders {
  from: orders
  extension: required
  access_filter: {
    field: users.age
    user_attribute: age_advanced
  }

  sql_always_where: {% condition orders.date_filter %} ${created_raw} {% endcondition %}
    and {% condition orders.date_filter %} ${created_other_raw} {% endcondition %};;
#   persist_with: four_hour_cache
    join: users {
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
