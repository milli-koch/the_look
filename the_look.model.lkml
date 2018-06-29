connection: "thelook"

include: "*.view"

include: "*.dashboard"

datagroup: the_look_default_datagroup {
  sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "24 hours"
}

datagroup: four_hour_cache {
  max_cache_age: "4 hours"
}

persist_with: the_look_default_datagroup

explore: users {
  persist_with: four_hour_cache
   join: events {
    type: left_outer
    sql_on: ${events.user_id} = ${users.id} ;;
    relationship: one_to_many
  }

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
  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }
}

explore: order_items {
  fields: [users.detail*]
  join: inventory_items {
    type: left_outer
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
    relationship: many_to_one
  }

  join: orders {
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

explore: orders {
  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}
