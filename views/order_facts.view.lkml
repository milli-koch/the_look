view: order_facts {
  derived_table: {
    explore_source: orders {
      column: max_date {}
      column: id {}
    }
  }
  dimension: max_date {
    type: number
  }
  dimension: id {
    type: number
  }
}
