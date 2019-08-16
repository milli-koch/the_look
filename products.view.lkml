view: products {
  sql_table_name: demo_db.products ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }

  dimension: value {
    type: string
    hidden: yes
    sql: ${TABLE}.category ;;
  }

  dimension: task_type  {
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: unnested_value {
    type: string
    sql: ${TABLE}.item_name ;;
  }

  dimension: task_response_value_decimal {
    type: number
    sql: ${TABLE}.rank ;;
  }

  dimension: task_response_value {
    type: string
    sql: COALESCE(CAST(${task_response_value_decimal} AS CHAR), ${unnested_value}, ${value}) ;;
  }

  dimension: retail_price {
    type: number
    sql: ${TABLE}.retail_price ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }

  measure: count {
    type: count
    drill_fields: [id, inventory_items.count]
  }
  measure: task_response_value_measure {
    type: string
    sql: MAX(${task_response_value}) ;;
  }
}
