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
    html: <a href="/explore/the_look/orders?f[products.category]={{ filterable_value }}">{{ value }}</a> ;;
#     url: "https://looker.farfetch.net/dashboards/934?Experiment%20Name={{ experiment_name._value | url_encode }}&Metric={{metric_dashboard_name._filterable_value}}&Deep%20Dive%20Dimension={{dashboard_deep_dive_dimension._filterable_value}}&Deep%20Dive%20Value={{deep_dive_value._filterable_value}}"
  }

  dimension: category {
#     label: "red"
#     group_label: "apples"
    type: string
    sql: ${TABLE}.category ;;
#     html: <a href="https://localhost:9999/dashboards/4?f[products.brand]={{ products.brand._filterable_value }}">{{ value }}</a> ;;
    }

  dimension: department {
#     label: "green"
#     group_label: "apples"
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: item_name {
    label: "red"
    group_label: "tomatoes"
    type: string
    sql: ${TABLE}.item_name ;;
  }

  dimension: rank {
    label: "green"
    group_label: "tomatoes"
    type: number
    sql: ${TABLE}.rank ;;
  }

  dimension: retail_price {
    type: number
    sql: ${TABLE}.retail_price ;;
  }

  dimension: currency {
    type: string
    sql: case when ${retail_price} < 10 then '€' else '$' end ;;
  }

  measure: dollars {
    type: average
    sql: ${retail_price} ;;
    value_format_name: usd
  }

  measure: euros {
    type: average
    sql: ${retail_price} ;;
    value_format_name: eur
  }
  measure: average_retail_price {
    type: average
    sql: ${retail_price} ;;
    value_format_name: decimal_0
    drill_fields: [department, category, average_retail_price]
    link: {
      label: "drill"
      url: "{{link}}&pivots=products.department&row_total=right&sorts=products.average_retail_price+desc+2,products.department+0"
    }
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }


  measure: count {
    type: count
    drill_fields: [id, item_name, inventory_items.count]
    value_format_name: decimal_0
  }
}
