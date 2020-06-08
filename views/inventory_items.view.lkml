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

  measure: total_cost {
    type: sum
    sql: ${cost} ;;
    value_format_name: usd_0
  }

  measure: percent_of_total_cost {
    type: percent_of_total
    sql: ${total_cost} ;;
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

  dimension: sunday_start {
    type: number
    sql: case when ${created_day_of_week} = "Wednesday" then 4
        when ${created_day_of_week} = "Thursday" then 5
        when ${created_day_of_week} = "Friday" then 6
        when ${created_day_of_week} = "Saturday" then 7
        when ${created_day_of_week} = "Sunday" then 1
        when ${created_day_of_week} = "Monday" then 2
        when ${created_day_of_week} = "Tuesday" then 3
        else null end;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      date,
      raw,
      time,
      week,
      month,
      year,
      day_of_week
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: sunday {
    type: date_day_of_week
    order_by_field: sunday_start
    sql: ${created_raw} ;;
  }

#   dimension: created_date {
#     type: date
#     sql: ${TABLE}.created_at ;;
#   }

  dimension: product_id {
    type: number
#     hidden: yes
    sql: ${TABLE}.product_id ;;
#     order_by_field:
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
