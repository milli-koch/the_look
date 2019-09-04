view: inventory_items {
  sql_table_name: demo_db.inventory_items ;;
# derived_table: {
#   sql: select * from demo_db.inventory_items where
#   created_at = date_add(-3, ;;
# }

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }

  dimension: dummy2 {
    type: string
    sql: ${cost} ;;
  }

  parameter: days_ago {
    type: number
  }

  filter: date_filter {
    type: date
  }

  dimension_group: created {
    type: time
    timeframes: [
      date,
      raw,
      time,
      week,
      month,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

#   dimension: created_date {
#     type: date
#     sql: ${TABLE}.created_at ;;
#   }

  dimension: product_id {
    type: number
#     hidden: yes
    sql: ${TABLE}.product_id ;;
  }

  dimension_group: sold {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.sold_at ;;
  }

  measure: count {
    type: count
    drill_fields: [id, products.item_name, products.id, order_items.count]
  }

  measure: testing {
    type: sum
    sql: case when ${product_id} < 10 then 'yes' else null end ;;
  }
}
