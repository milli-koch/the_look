view: order_items {
  sql_table_name: demo_db.order_items ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: inventory_item_id {
    type: number
    hidden: yes
    sql: ${TABLE}.inventory_item_id ;;
  }

  dimension: order_id {
    type: number
    hidden: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension_group: returned {
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
    sql: ${TABLE}.returned_at ;;
  }

  measure: divide_test{
    type: number
    sql: ${returned_date}/${users.created_date} ;;
    drill_fields: [returned_date, users.created_date]
  }

  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;
  }

  measure: average_sale_price {
    type: average
    sql: ${sale_price} ;;
  }

  dimension: case{
    type: string
    sql: case when ${sale_price} between 1 and 5 then 'true'
    when ${sale_price} > 5 then 'false'
    else 'null' end;;
  }

  measure: count {
    type: count
    drill_fields: [id, inventory_items.id, orders.id]
  }
}
