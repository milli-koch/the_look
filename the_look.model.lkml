connection: "thelook"

include: "*.view"

datagroup: the_look_default_datagroup {
  sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "24 hours"
}


datagroup: four_hour_cache {
  max_cache_age: "4 hours"
}

persist_with: the_look_default_datagroup

explore: orders {
  persist_with: four_hour_cache
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
    sql_on: ${inventory_items.product_id} =  ${products.id} ;;
    relationship: many_to_one
  }
}

explore: users {
  fields: [ALL_FIELDS*, -created_raw]
  persist_with: four_hour_cache

  join: orders {
    sql_on: ${users.id} = ${orders.user_id} ;;
    relationship: one_to_many
  }

  join: user_data {
    sql_on: ${user_data.user_id} = ${users.id} ;;
    relationship: one_to_many
  }

}

explore: inventory_items {
  label: "Explorename"
  join: products {
    type: inner
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
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
