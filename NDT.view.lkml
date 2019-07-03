view: NDT {
  derived_table: {
    explore_source: order_items {
      timezone: "UTC"
      column: number_of_orders_90_day {field: order_items.sale_price}
    }
  }

  dimension: number_of_orders_90_day {type: number}
}

# explore: NDT {}
