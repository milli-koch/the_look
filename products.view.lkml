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
    type: string
    sql: ${TABLE}.category ;;
    html: <a href="https://localhost:9999/dashboards/4?f[products.brand]={{ products.brand._filterable_value }}">{{ value }}</a> ;;
    }

  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: item_name {
    type: string
    sql: ${TABLE}.item_name ;;
  }

  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;
  }

  dimension: retail_price {
    type: number
    sql: ${TABLE}.retail_price ;;
  }

  measure: average_retail_price {
    type: average
    sql: ${retail_price} ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }


  measure: count {
    type: count
    drill_fields: [id, item_name, inventory_items.count]
  }
}
