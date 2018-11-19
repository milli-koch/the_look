view: order_items {
  sql_table_name: demo_db.order_items ;;

#   dimension: item_id {
#     primary_key: yes
#     type: number
#     sql: ${TABLE}.id ;;
#   }

  dimension: inventory_item_id {
    type: number
    sql: ${TABLE}.inventory_item_id ;;
  }


#   filter: id_filter {
#     sql: {% condition order_region %} order.region {% endcondition %}
#  ;;
# }

  filter: category_count_picker {
    description: "Use with the Category Count measure"
    type: string
  }

  measure: category_count {
    description: "Use with the Category Count Picker filter-only field"
    type: sum
    sql:
    CASE
      WHEN {% condition category_count_picker %} ${products.category} {% endcondition %}
      THEN 1
      ELSE 0
    END
  ;;
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
    value_format_name: usd
    html: <font color="green">{{rendered_value}}</font> ;;
  }

  measure: total_sale_price {
    type: sum
    sql: ${sale_price} ;;
  }

  measure: percent_of_total {
    type: percent_of_total
    sql: ${average_sale_price} ;;
    value_format: "0.00\%"
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
    drill_fields: [ inventory_items.id, orders.id]
  }

  parameter: metric_selector {
    type: string

    allowed_value: {
      label: "First-Time Shopper Revenue"
      value: "total_first_purchase_revenue"
    }
    allowed_value: {
      label: "Returning Shopper Revenue"
      value: "total_returning_shopper_revenue"
    }
  }

  filter: metric {
    type: number
    sql:
      CASE
        WHEN {% parameter metric_selector %} = 'total_first_purchase_revenue' THEN
          ${sale_price}
        WHEN {% parameter metric_selector %} = 'total_returning_shopper_revenue' THEN
          ${inventory_item_id}
        ELSE
          NULL
      END ;;
  }
}
