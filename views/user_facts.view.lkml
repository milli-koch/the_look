# If necessary, uncomment the line below to include explore_source.
# include: "the_look.model.lkml"

view: user_facts {
  derived_table: {
    explore_source: orders {
      column: name { field: users.name }
      column: lifetime_value { field: products.total_retail }
#       column: most_recent_order_date {}
    }
  }
  dimension: name {}
  dimension: total_retail {
#     value_format: "$#,##0.00"
#     type: number
  }
  dimension: max_po_date_date {
#     label: "Orders Max Purchase Order Date Date"
#     description: "Maximum Purchase Order Date over dimensions selected"
    type: number
  }
}
