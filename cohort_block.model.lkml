connection: "thelook"
# Uses the common Ecommerce Views
include: "*.view"

explore: users {
  join: orders {
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship : one_to_many
  }

  join: order_items {
    fields: [-category_count]
    sql_on: ${order_items.order_id} = ${orders.id} ;;
    relationship : one_to_many
  }

  join: user_cohort_size {
    sql_on: ${user_cohort_size.created_month} = ${users.created_month} ;;
      relationship: many_to_one
  }
}
